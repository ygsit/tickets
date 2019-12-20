package com.tickets.service;

import com.tickets.entity.Movie;
import com.tickets.entity.PageBean;

public interface MovieService {

    //查询总电影数
    Integer findTotalCount(Movie movie);

    //分页操作
    PageBean<Movie> doPage(Movie movie, Integer currentPage, Integer pageCount);

    //添加电影
    void movieAdd(Movie movie);

    //删除电影
    void movieDel(Integer mid);

    // 根据id查找
    Movie findByIdForUpdate(Integer mid);

    //电影更新
    void movieUpdate(Movie movie);
}
