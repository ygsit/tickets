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

    //增加排片
    void sliceAdd(Slice slice);

    //修改排片
    void sliceUpdate(Slice slice);

    //删除排片
    void sliceDel(Integer sid);
}