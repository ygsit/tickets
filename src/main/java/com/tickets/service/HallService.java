package com.tickets.service;

import com.tickets.entity.Hall;

import java.util.List;

public interface HallService {
    //校验影厅名
    Integer checkHallName(String name, Integer cinemaId);

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
}
