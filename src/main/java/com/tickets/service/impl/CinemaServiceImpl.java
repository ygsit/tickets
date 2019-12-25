package com.tickets.service.impl;

import com.tickets.dao.CinemaDao;
import com.tickets.entity.Cinema;
import com.tickets.entity.PageBean;
import com.tickets.service.CinemaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CinemaServiceImpl implements CinemaService {
    @Autowired
    private CinemaDao cinemaDao;

    @Override
    public Integer findTotalCount(Cinema cinema) {
        return cinemaDao.findTotalCount(cinema);
    }

    @Override
    public PageBean<Cinema> doPage(Cinema cinema, Integer currentPage, Integer pageCount) {
        //查询总记录数
        Integer totalCount = cinemaDao.findTotalCount(cinema);
        //查询一页的对象数
        Integer start = (currentPage - 1) * pageCount;
        Map<String, Object> map = new HashMap<>();
        map.put("start", start);
        map.put("pageCount", pageCount);
        map.put("cinema", cinema);
        List<Cinema> cinemas = cinemaDao.findCinemaByPage(map);
        //求出总页数
        Integer totalPage = (totalCount % pageCount == 0) ? (totalCount / pageCount) : (totalCount / pageCount) + 1;
        PageBean<Cinema> pageBean = new PageBean<Cinema>();
        pageBean.setCurrentPage(currentPage);
        pageBean.setPageCount(pageCount);
        pageBean.setTotalCount(totalCount);
        pageBean.setTotalPage(totalPage);
        pageBean.setList(cinemas);
        return pageBean;
    }

    @Override
    public Integer selectByName(String name) {
        return cinemaDao.selectByName(name);
    }

    @Override
    public void cinemaAdd(Cinema cinema) {
        cinemaDao.cinemaAdd(cinema);
    }

    @Override
    public void cinemaDel(Integer cid) {
        cinemaDao.cinemaDel(cid);
    }

    @Override
    public List<Cinema> findAllCinemas() {
        return cinemaDao.findAllCinemas();
    }

    @Override
    public void cinemaUpdate(Cinema cinema) {
        cinemaDao.cinemaUpdate(cinema);
    }

    @Override
    public String findAddress(String cname) {
        return cinemaDao.findAddress(cname);
    }
}
