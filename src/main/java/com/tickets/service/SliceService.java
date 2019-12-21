package com.tickets.service;

import com.tickets.entity.PageBean;
import com.tickets.entity.Slice;

public interface SliceService {
    //查询总数量
    Integer findTotalCount(Slice slice);

    //分页
    PageBean<Slice> doPage(Slice slice, Integer currentPage, Integer pageCount);
}
