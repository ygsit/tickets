package com.tickets.service;

import com.tickets.entity.Cinema;
import com.tickets.entity.Movie;
import com.tickets.entity.PageBean;

import java.util.List;

/**
 * 影院service层
 */
public interface CinemaService {

    //查找总的电影院
    Integer findTotalCount(Cinema cinema);

    //分页操作
    PageBean<Cinema> doPage(Cinema cinema, Integer currentPage, Integer pageCount);

    //校验影院名是否存在
    Integer selectByName(String name);

    //增加电影院
    void cinemaAdd(Cinema cinema);

    //删除电影
    void cinemaDel(Integer cid);

    //查询所有影院
    List<Cinema> findAllCinemas();
}
