package com.tickets.web;

import com.alibaba.fastjson.JSONObject;
import com.tickets.entity.Movie;
import com.tickets.entity.PageBean;
import com.tickets.service.MovieService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
@RequestMapping("/movie")
public class MovieController {

    @Autowired
    private MovieService movieService;

    /**
     * 分页
     */
    @RequestMapping("/findMovieByPage")
    public ModelAndView findAllByPage(Movie movie, Integer currentPage, Integer pageCount) {
        // 如果每页显示的条数为空，赋初值，每页显示5条
        if (pageCount == null || "null".equals(pageCount)) {
            pageCount = 5;
        }
        // 如果传入的页数为空或小于0，赋初值，从第一页开始
        if (currentPage == null || "null".equals(currentPage) || currentPage <= 0) {
            currentPage = 1;
        }
        Integer totalCount = movieService.findTotalCount(movie);
        Integer maxPage = (totalCount % pageCount == 0) ? (totalCount / pageCount) : (totalCount / pageCount) + 1;
        // 如果传入的页数大于最大页数，则等于最大页数
        if (currentPage > maxPage && maxPage != 0) {
            currentPage = maxPage;
        }
        PageBean<Movie> pageBean = movieService.doPage(movie, currentPage, pageCount);
        ModelAndView modelAndView = new ModelAndView();
        // 存值
        modelAndView.addObject("pageBean", pageBean);
        modelAndView.addObject("selectName", movie.getName());
        // 跳转页面
        modelAndView.setViewName("movieList");
        return modelAndView;
    }

    //添加电影
    @RequestMapping("/movieAdd")
    public String movieAdd(Movie movie){
        movieService.movieAdd(movie);
        return "redirect:/movie/findMovieByPage";
    }

    //删除电影
    @RequestMapping("/movieDel")
    public String movieDel(Integer mid){
        movieService.movieDel(mid);
        return "redirect:/movie/findMovieByPage";
    }

    // 根据id查找
    @RequestMapping("/findByIdForUpdate")
    public void findByIdForUpdate(Integer mid, HttpServletResponse response){
        try {
            Movie selectMovie = movieService.findByIdForUpdate(mid);
            String movie = JSONObject.toJSONString(selectMovie);
            response.setContentType("application/json;charset=utf-8");
            response.getWriter().write(movie);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // 电影更新
    @RequestMapping("/movieUpdate")
    public String movieUpdate(Movie movie){
        movieService.movieUpdate(movie);
        return "redirect:/movie/findMovieByPage";
    }
}
