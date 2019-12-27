package com.tickets.web;

import com.alibaba.fastjson.JSONObject;
import com.tickets.entity.Cinema;
import com.tickets.entity.Movie;
import com.tickets.entity.Slice;
import com.tickets.entity.SliceDto;
import com.tickets.service.CinemaService;
import com.tickets.service.HallService;
import com.tickets.service.SaleService;
import com.tickets.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
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

    @Autowired
    private HallService hallService;

    @Autowired
    private UserService userService;

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
            //获得影厅的大小
            Integer capacity = hallService.findCapacity(slice.getHname(), slice.getCname());
            SliceDto sliceDto = new SliceDto();
            sliceDto.setSid(slice.getSid());
            sliceDto.setCname(slice.getCname());
            sliceDto.setHname(slice.getHname());
            sliceDto.setAddress(address);
            sliceDto.setMname(slice.getMname());
            sliceDto.setPrice(slice.getPrice());
            sliceDto.setPlayTime(slice.getPlayTime());
            sliceDto.setCapacity(capacity);
            list.add(sliceDto);
        }
        //存值
        modelAndView.addObject("movie", movie);
        modelAndView.addObject("list", list);
        //跳转页面
        modelAndView.setViewName("buy");
        return modelAndView;
    }

    /**
     * 付钱
     */
    @RequestMapping("/payTicket")
    public void payTicket(Double price, Integer uid, Integer sid, HttpServletResponse response){
        try {
            //查询余额
            Double money = userService.findMoney(uid);
            if(money < price){
                response.getWriter().write(JSONObject.toJSONString(0));
            }else{
                userService.payTicket(price, uid);
                //添加订单
                userService.addOrder(uid, sid);
                response.getWriter().write(JSONObject.toJSONString(1));
            }

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
