package com.tickets.service.impl;

import com.tickets.dao.MovieDao;
import com.tickets.entity.Movie;
import com.tickets.entity.PageBean;
import com.tickets.service.MovieService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class MovieServiceImpl implements MovieService {

    @Autowired
    private MovieDao movieDao;

    @Override
    public Integer findTotalCount(Movie movie) {
        return movieDao.findTotalCount(movie);
    }

    @Override
    public PageBean<Movie> doPage(Movie movie, Integer currentPage, Integer pageCount) {
        //查询总记录数
        Integer totalCount = movieDao.findTotalCount(movie);
        //查询一页的对象数
        Integer start = (currentPage - 1) * pageCount;
        Map<String, Object> map = new HashMap<>();
        map.put("start", start);
        map.put("pageCount", pageCount);
        map.put("movie", movie);
        List<Movie> movies = movieDao.findMovieByPage(map);
        //求出总页数
        Integer totalPage = (totalCount % pageCount == 0) ? (totalCount / pageCount) : (totalCount / pageCount) + 1;
        PageBean<Movie> pageBean = new PageBean<Movie>();
        pageBean.setCurrentPage(currentPage);
        pageBean.setPageCount(pageCount);
        pageBean.setTotalCount(totalCount);
        pageBean.setTotalPage(totalPage);
        pageBean.setList(movies);
        return pageBean;
    }

    @Override
    public void movieAdd(Movie movie) {
        movieDao.movieAdd(movie);
    }

    @Override
    public void movieDel(Integer mid) {
        movieDao.movieDel(mid);
    }

    @Override
    public Movie findByIdForUpdate(Integer mid) {
        return movieDao.findByIdForUpdate(mid);
    }

    @Override
    public void movieUpdate(Movie movie) {
        movieDao.movieUpdate(movie);
    }
}
