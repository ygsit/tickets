package com.tickets.dao;

import com.tickets.entity.Cinema;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * 影院dao层
 */
@Repository
public interface CinemaDao {
    //查询总数
    Integer findTotalCount(Cinema cinema);

    //分页查询
    List<Cinema> findCinemaByPage(Map<String, Object> map);

    //校验影院名是否存在
    Integer selectByName(String name);

    //增加电影院
    void cinemaAdd(Cinema cinema);

    //删除电影
    void cinemaDel(Integer cid);

    //查询所有影院
    List<Cinema> findAllCinemas();

    //修改影院
    void cinemaUpdate(Cinema cinema);

    //查询影院地址
    String findAddress(String cname);

    //根据影院id查找影院
    String findCinemaById(int parseInt);
}
