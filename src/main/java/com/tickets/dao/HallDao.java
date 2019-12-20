package com.tickets.dao;

import org.springframework.stereotype.Repository;

import java.util.Map;

@Repository
public interface HallDao {
    //校验影厅名
    Integer checkHallName(Map<String, Object> map);
}
