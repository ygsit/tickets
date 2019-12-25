package com.tickets.service.impl;

import com.tickets.dao.HallDao;
import com.tickets.entity.Hall;
import com.tickets.service.HallService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
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

    @Override
    public void hallAdd(Hall hall) {
        hallDao.hallAdd(hall);
    }

    @Override
    public void hallDelByCinemaId(Integer cid) {
        hallDao.hallDelByCinemaId(cid);
    }

    @Override
    public List<Hall> showHalls(Integer cid) {
        return hallDao.showHalls(cid);
    }

    @Override
    public void hallUpdate(Hall hall) {
        hallDao.hallUpdate(hall);
    }

    @Override
    public void hallDel(Integer hid) {
        hallDao.hallDel(hid);
    }

    @Override
    public String findHallById(int parseInt) {
        return hallDao.findHallById(parseInt);
    }
}
