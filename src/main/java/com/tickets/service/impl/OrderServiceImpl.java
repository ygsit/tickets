package com.tickets.service.impl;

import com.tickets.dao.OrderDao;
import com.tickets.entity.Movie;
import com.tickets.entity.PageBean;
import com.tickets.entity.Slice;
import com.tickets.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    private OrderDao orderDao;

    @Override
    public PageBean<Slice> selectOrders(Integer uid, Integer currentPage, Integer pageCount) {
        //查询总记录数
        Integer totalCount = orderDao.findTotalCount(uid);
        //查询一页的对象数
        Integer start = (currentPage - 1) * pageCount;
        Map<String, Object> map = new HashMap<>();
        map.put("start", start);
        map.put("pageCount", pageCount);
        map.put("uid", uid);
        List<Slice> slices = orderDao.selectOrders(map);
        //求出总页数
        Integer totalPage = (totalCount % pageCount == 0) ? (totalCount / pageCount) : (totalCount / pageCount) + 1;
        PageBean<Slice> pageBean = new PageBean<Slice>();
        pageBean.setCurrentPage(currentPage);
        pageBean.setPageCount(pageCount);
        pageBean.setTotalCount(totalCount);
        pageBean.setTotalPage(totalPage);
        pageBean.setList(slices);
        return pageBean;
    }

    @Override
    public Integer findTotalCount(Integer uid) {
        return orderDao.findTotalCount(uid);
    }
}
