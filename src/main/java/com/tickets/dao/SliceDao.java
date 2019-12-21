package com.tickets.dao;

import com.tickets.entity.Slice;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface SliceDao {
    //查询总数量
    Integer findTotalCount(Slice slice);

    //分页查询
    List<Slice> findSliceByPage(Map<String, Object> map);
}