package com.tickets.web;

import com.tickets.entity.Cinema;
import com.tickets.entity.PageBean;
import com.tickets.entity.Slice;
import com.tickets.service.CinemaService;
import com.tickets.service.HallService;
import com.tickets.service.SliceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/slice")
public class SliceController {
    @Autowired
    private SliceService sliceService;

    @Autowired
    private CinemaService cinemaService;

    @Autowired
    private HallService hallService;

    /**
     * 分页
     */
    @RequestMapping("/findSliceByPage")
    public ModelAndView findSliceByPage(Slice slice, Integer currentPage, Integer pageCount) {
        // 如果每页显示的条数为空，赋初值，每页显示5条
        if (pageCount == null || "null".equals(pageCount)) {
            pageCount = 5;
        }
        // 如果传入的页数为空或小于0，赋初值，从第一页开始
        if (currentPage == null || "null".equals(currentPage) || currentPage <= 0) {
            currentPage = 1;
        }
        Integer totalCount = sliceService.findTotalCount(slice);
        Integer maxPage = (totalCount % pageCount == 0) ? (totalCount / pageCount) : (totalCount / pageCount) + 1;
        // 如果传入的页数大于最大页数，则等于最大页数
        if (currentPage > maxPage && maxPage != 0) {
            currentPage = maxPage;
        }
        PageBean<Slice> pageBean = sliceService.doPage(slice, currentPage, pageCount);
        ModelAndView modelAndView = new ModelAndView();
        // 存值
        modelAndView.addObject("pageBean", pageBean);
        modelAndView.addObject("selectCName", slice.getCname());
        modelAndView.addObject("selectMName", slice.getMname());
        // 跳转页面
        modelAndView.setViewName("sliceList");
        return modelAndView;
    }

    /**
     * 增加排片
     */
    @RequestMapping("/sliceAdd")
    public String sliceAdd(Slice slice,String yearMonth,String dayMinutes){
        String playTime = yearMonth + " " + dayMinutes;
        slice.setPlayTime(playTime);
        //根据影院id查找影院
        String cname = cinemaService.findCinemaById(Integer.parseInt(slice.getCname()));
        //根据影厅id查找影厅
        String hname = hallService.findHallById(Integer.parseInt(slice.getHname()));
        slice.setCname(cname);
        slice.setHname(hname);
        sliceService.sliceAdd(slice);
        return "redirect:/slice/findSliceByPage";
    }

    /**
     * 修改排片
     */
    @RequestMapping("/sliceUpdate")
    public String sliceUpdate(Slice slice,String yearMonth,String dayMinutes){
        String playTime = yearMonth + " " + dayMinutes;
        slice.setPlayTime(playTime);
        //根据影院id查找影院
        String cname = cinemaService.findCinemaById(Integer.parseInt(slice.getCname()));
        //根据影厅id查找影厅
        String hname = hallService.findHallById(Integer.parseInt(slice.getHname()));
        slice.setCname(cname);
        slice.setHname(hname);
        sliceService.sliceUpdate(slice);
        return "redirect:/slice/findSliceByPage";
    }

    /**
     * 删除排片
     */
    @RequestMapping("sliceDel")
    public String sliceDel(Integer sid){
        sliceService.sliceDel(sid);
        return "redirect:/slice/findSliceByPage";
    }
}
