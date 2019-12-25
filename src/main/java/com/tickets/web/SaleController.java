package com.tickets.web;

import com.tickets.entity.Cinema;
import com.tickets.entity.Movie;
import com.tickets.entity.Slice;
import com.tickets.entity.SliceDto;
import com.tickets.service.CinemaService;
import com.tickets.service.SaleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

/**
 * 购票controller
 */
@Controller
@RequestMapping("/sale")
public class SaleController {

    @Autowired
    private SaleService saleService;

    @Autowired
    private CinemaService cinemaService;

    @RequestMapping("/showTicketView")
    public ModelAndView showTicketView(String name){
        ModelAndView modelAndView = new ModelAndView();
        //获得电影信息
        Movie movie = saleService.showMovie(name);
        //获得排片信息
        List<Slice> slist = saleService.showSlice(name);
        List<SliceDto> list = new ArrayList<>();
        for (int i = 0; i < slist.size(); i++) {
            Slice slice = slist.get(i);
            //获得影院的地址
            String address = cinemaService.findAddress(slice.getCname());
            SliceDto sliceDto = new SliceDto();
            sliceDto.setSid(slice.getSid());
            sliceDto.setCname(slice.getCname());
            sliceDto.setHname(slice.getHname());
            sliceDto.setAddress(address);
            sliceDto.setMname(slice.getMname());
            sliceDto.setPrice(slice.getPrice());
            sliceDto.setPlayTime(slice.getPlayTime());
            list.add(sliceDto);
        }
        //存值
        modelAndView.addObject("movie", movie);
        modelAndView.addObject("list", list);
        //跳转页面
        modelAndView.setViewName("buy");
        return modelAndView;
    }

}
