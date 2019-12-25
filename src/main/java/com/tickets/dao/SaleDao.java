package com.tickets.dao;

import com.tickets.entity.Movie;
import com.tickets.entity.Slice;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 购票dao
 */
@Repository
public interface SaleDao {

    //页面电影信息
    Movie showMovie(String name);

    //页面排片信息
    List<Slice> showSlice(String name);

}
