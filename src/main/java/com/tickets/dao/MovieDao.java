package com.tickets.dao;

import com.tickets.entity.Movie;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * 电影dao层
 */
@Repository
public interface MovieDao {

    //查询总电影数
    Integer findTotalCount(Movie movie);

    //分页查询
    List<Movie> findMovieByPage(Map map);

    //添加电影
    void movieAdd(Movie movie);

    //删除电影
    void movieDel(Integer mid);

    // 根据id查找
    Movie findByIdForUpdate(Integer mid);

    //电影更新
    void movieUpdate(Movie movie);
}
