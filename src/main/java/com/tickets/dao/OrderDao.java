package com.tickets.dao;

import com.tickets.entity.Slice;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface OrderDao {
    //查询订单
    List<Slice> selectOrders(Map<String, Object> map);

    //查询总数
    Integer findTotalCount(Integer uid);
}
