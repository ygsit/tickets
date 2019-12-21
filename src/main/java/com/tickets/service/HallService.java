package com.tickets.service;

import com.tickets.entity.Hall;

public interface HallService {
    //校验影厅名
    Integer checkHallName(String name, Integer cinemaId);

    //增加影厅
    void hallAdd(Hall hall);

    //根据影院id删除影厅
    void hallDelByCinemaId(Integer cid);
}
