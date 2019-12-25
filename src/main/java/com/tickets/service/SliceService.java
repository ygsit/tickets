package com.tickets.service;

import com.tickets.entity.PageBean;
import com.tickets.entity.Slice;

public interface SliceService {
    //查询总数量
    Integer findTotalCount(Slice slice);

    //分页
    PageBean<Slice> doPage(Slice slice, Integer currentPage, Integer pageCount);

    //增加排片
    void sliceAdd(Slice slice);

    //修改排片
    void sliceUpdate(Slice slice);

    //删除排片
    void sliceDel(Integer sid);
}
