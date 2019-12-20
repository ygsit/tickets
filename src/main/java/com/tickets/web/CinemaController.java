package com.tickets.web;

import com.alibaba.fastjson.JSONObject;
import com.tickets.entity.Cinema;
import com.tickets.entity.PageBean;
import com.tickets.service.CinemaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/cinema")
public class CinemaController {

    @Autowired
    private CinemaService cinemaService;

    /**
     * 分页
     */
    @RequestMapping("/findCinemaByPage")
    public ModelAndView findAllByPage(Cinema cinema, Integer currentPage, Integer pageCount) {
        // 如果每页显示的条数为空，赋初值，每页显示5条
        if (pageCount == null || "null".equals(pageCount)) {
            pageCount = 5;
        }
        // 如果传入的页数为空或小于0，赋初值，从第一页开始
        if (currentPage == null || "null".equals(currentPage) || currentPage <= 0) {
            currentPage = 1;
        }
        Integer totalCount = cinemaService.findTotalCount(cinema);
        Integer maxPage = (totalCount % pageCount == 0) ? (totalCount / pageCount) : (totalCount / pageCount) + 1;
        // 如果传入的页数大于最大页数，则等于最大页数
        if (currentPage > maxPage && maxPage != 0) {
            currentPage = maxPage;
        }
        PageBean<Cinema> pageBean = cinemaService.doPage(cinema, currentPage, pageCount);
        ModelAndView modelAndView = new ModelAndView();
        // 存值
        modelAndView.addObject("pageBean", pageBean);
        modelAndView.addObject("selectName", cinema.getName());
        // 跳转页面
        modelAndView.setViewName("cinemaList");
        return modelAndView;
    }

    /**
     * 校验影院名是否存在
     */
    @RequestMapping("/checkname")
    public void checkname(String name, HttpServletResponse response) {
        try {
            Integer integer = cinemaService.selectByName(name);
            if (integer == 0) {
                response.getWriter().write("false");
            } else {
                response.getWriter().write("true");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 增加影院
     */
    @RequestMapping("/cinemaAdd")
    public String cinemaAdd(Cinema cinema) {
        cinemaService.cinemaAdd(cinema);
        return "redirect:/cinema/findCinemaByPage";
    }

    //删除电影
    @RequestMapping("/cinemaDel")
    public String cinemaDel(Integer cid) {
        cinemaService.cinemaDel(cid);
        return "redirect:/cinema/findCinemaByPage";
    }

    //查询所有影院
    @RequestMapping("/findAllCinemas")
    public void findAllCinemas(HttpServletResponse response) {
        try {
            List<Cinema> findCinemas = cinemaService.findAllCinemas();
            String cinemas = JSONObject.toJSONString(findCinemas);
            response.setContentType("application/json;charset=utf-8");
            response.getWriter().write(cinemas);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
