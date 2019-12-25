package com.tickets.service;

import com.tickets.entity.Movie;
import com.tickets.entity.Slice;

import java.util.List;

/**
 * 购票service接口
 */
public interface SaleService {

    //页面电影信息
    Movie showMovie(String name);

    //页面排片信息
    List<Slice> showSlice(String name);

}
