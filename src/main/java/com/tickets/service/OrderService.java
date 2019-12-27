package com.tickets.service;

import com.tickets.entity.PageBean;
import com.tickets.entity.Slice;

public interface OrderService {
    //查询订单
    PageBean<Slice> selectOrders(Integer uid, Integer currentPage, Integer pageCount);

    //查询总数
    Integer findTotalCount(Integer uid);
}
