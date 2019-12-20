package com.tickets.service;

public interface HallService {
    //校验影厅名
    Integer checkHallName(String name, Integer cinemaId);
}
