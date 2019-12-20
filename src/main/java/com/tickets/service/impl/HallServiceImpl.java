package com.tickets.service.impl;

import com.tickets.dao.HallDao;
import com.tickets.service.HallService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class HallServiceImpl implements HallService {
    @Autowired
    private HallDao hallDao;

    @Override
    public Integer checkHallName(String name, Integer cinemaId) {
        Map<String, Object> map = new HashMap<>();
        map.put("name", name);
        map.put("cinemaId", cinemaId);
        return hallDao.checkHallName(map);
    }
}
