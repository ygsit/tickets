package com.tickets.web;

import com.alibaba.fastjson.JSONObject;
import com.tickets.service.HallService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.SortedMap;

@Controller
@RequestMapping("/hall")
public class HallController {

    @Autowired
    private HallService hallService;

    /**
     * 校验影厅名
     */
    @RequestMapping("/checkHallName")
    public void checkHallName(String name, Integer cinemaId, HttpServletResponse response){
        try {
            System.out.println(cinemaId);
            Integer result = hallService.checkHallName(name, cinemaId);
            String json = JSONObject.toJSONString(result);
            response.setContentType("application/json;charset=utf-8");
            response.getWriter().write(json);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 增加影厅
     */
    @RequestMapping("/hallAdd")
    public void hallAdd(){

    }
}
