package com.tickets.dao;

import com.tickets.entity.Hall;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface HallDao {
    //校验影厅名
    Integer checkHallName(Map<String, Object> map);

    //增加影厅
    void hallAdd(Hall hall);

    //根据影院id删除影厅
    void hallDelByCinemaId(Integer cid);

    //根据影院显示所有影厅
    List<Hall> showHalls(Integer cid);

    //更新影厅
    void hallUpdate(Hall hall);

    //删除影厅
    void hallDel(Integer hid);

    //根据影厅id查找影厅
    String findHallById(int parseInt);
}
