package com.tickets.service.impl;

import com.tickets.dao.SaleDao;
import com.tickets.entity.Movie;
import com.tickets.entity.Slice;
import com.tickets.service.SaleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 购票接口的实现类
 */
@Service
public class SaleServiceImpl implements SaleService {

    @Autowired
    private SaleDao saleDao;


    @Override
    public Movie showMovie(String name) {
        return saleDao.showMovie(name);
    }

    @Override
    public List<Slice> showSlice(String name) {
        return saleDao.showSlice(name);
    }
}
