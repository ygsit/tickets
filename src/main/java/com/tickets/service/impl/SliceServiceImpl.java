package com.tickets.service.impl;

import com.tickets.dao.SliceDao;
import com.tickets.entity.PageBean;
import com.tickets.entity.Slice;
import com.tickets.service.SliceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class SliceServiceImpl implements SliceService {
    
    @Autowired
    private SliceDao sliceDao;
    
    @Override
    public Integer findTotalCount(Slice slice) {
        return sliceDao.findTotalCount(slice);
    }

    @Override
    public PageBean<Slice> doPage(Slice slice, Integer currentPage, Integer pageCount) {
        //查询总记录数
        Integer totalCount = sliceDao.findTotalCount(slice);
        //查询一页的对象数
        Integer start = (currentPage - 1) * pageCount;
        Map<String, Object> map = new HashMap<>();
        map.put("start", start);
        map.put("pageCount", pageCount);
        map.put("slice", slice);
        List<Slice> slices = sliceDao.findSliceByPage(map);
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
}
