package com.tickets.web;

import com.alibaba.fastjson.JSONObject;
import com.tickets.entity.PageBean;
import com.tickets.entity.User;
import com.tickets.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    /**
     * 校验用户名是否存在
     */
    @RequestMapping("/checkUsername")
    public void checkUsername(String username, HttpServletResponse response) {
        try {
            Integer integer = userService.selectByUsername(username);
            if (integer == 0) {
                response.getWriter().write("false");
            } else {
                response.getWriter().write("true");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 用户注册
     */
    @RequestMapping("/userRegister")
    public void userRegister(User user) {
        userService.doInsert(user);
    }

    /**
     * 重置用户密码
     */
    @RequestMapping("/userReset")
    public void userResetByUsername(User user) {
        userService.doResetPassword(user);
    }


    /**
     * 用户登录
     */
    @RequestMapping("/userLogin")
    public ModelAndView userLogin(User user, String checkCode, HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        //从session中取出验证码
        String checkcode_server = (String) request.getSession().getAttribute("CHECKCODE_SERVER");
        request.getSession().removeAttribute("CHECKCODE_SERVER");//保证验证码的一次性
        if (!checkcode_server.equalsIgnoreCase(checkCode)) {
            //验证码不匹配
            modelAndView.addObject("error_message", "验证码错误");
            //跳转到当前登录页面
            modelAndView.setViewName("login");
        } else {
            User returnUser = userService.userLogin(user);
            if (returnUser == null) {
                modelAndView.addObject("error_message", "用户名或密码错误");
                modelAndView.setViewName("login");
            } else {
                request.getSession().setAttribute("uid", returnUser.getUid());
                request.getSession().setAttribute("name", returnUser.getName());
                request.getSession().setAttribute("permission", returnUser.getPermission());
                modelAndView.setViewName("index");
            }
        }
        return modelAndView;
    }

    /**
     * 跳转到登录页面
     *
     * @return
     */
    @RequestMapping("/toLogin")
    public String toLogin() {
        return "login";
    }

    /**
     * 分页
     */
    @RequestMapping("/findAllByPage")
    public ModelAndView findAllByPage(User user, Integer currentPage, Integer pageCount) {
        // 如果每页显示的条数为空，赋初值，每页显示5条
        if (pageCount == null || "null".equals(pageCount)) {
            pageCount = 5;
        }
        // 如果传入的页数为空或小于0，赋初值，从第一页开始
        if (currentPage == null || "null".equals(currentPage) || currentPage <= 0) {
            currentPage = 1;
        }
        Integer totalCount = userService.findTotalCount(user);
        Integer maxPage = (totalCount % pageCount == 0) ? (totalCount / pageCount) : (totalCount / pageCount) + 1;
        // 如果传入的页数大于最大页数，则等于最大页数
        if (currentPage > maxPage && maxPage != 0) {
            currentPage = maxPage;
        }
        PageBean<User> pageBean = userService.doPage(user, currentPage, pageCount);
        ModelAndView modelAndView = new ModelAndView();
        // 存值
        modelAndView.addObject("pageBean", pageBean);
        modelAndView.addObject("selectName", user.getName());
        modelAndView.addObject("selectGender", user.getGender());
        // 跳转页面
        modelAndView.setViewName("userList");
        return modelAndView;
    }

    /**
     * 调到首页
     *
     * @return
     */
    @RequestMapping("/forwardIndex")
    public String forwordIndex() {
        return "index";
    }

    /**
     * 调到注册页面
     *
     * @return
     */
    @RequestMapping("/forwardAdd")
    public String forwardAdd() {
        return "userAdd";
    }

    /**
     * 用户添加
     */
    @RequestMapping("/userAdd")
    public String userAdd(User user) {
        userService.doInsert(user);
        //跳转到用户管理页面
        return "redirect:/user/findAllByPage";
    }

    /**
     * 删除用户
     *
     * @return
     */
    @RequestMapping("/userDel")
    public String userDel(Integer uid) {
        userService.userDel(uid);
        return "redirect:/user/findAllByPage";
    }

    /**
     * 根据id查找
     */
    @RequestMapping("/findByIdForUpdate")
    public void findByIdForUpdate(Integer uid, HttpServletResponse response) {
        try {
            User selectUser = userService.findByIdForUpdate(uid);
            String user = JSONObject.toJSONString(selectUser);
            response.setContentType("application/json;charset=utf-8");
            response.getWriter().write(user);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 用户信息修改
     */
    @RequestMapping("/userUpdate")
    public String userUpdate(User user) {
        userService.userUpdate(user);
        return "redirect:/user/findAllByPage";
    }

    /**
     * 个人中心
     */
    @RequestMapping("/userPersonal")
    public String userPersonal(Integer uid, Model model) {
        User findUser = userService.findByIdForUpdate(uid);
        model.addAttribute("findUser", findUser);
        return "userPersonal";
    }

    /**
     * 个人信息修改
     */
    @RequestMapping("/userPersonalUpdate")
    public String userPersonalUpdate(User user) {
        userService.userUpdateById(user);
        return "redirect:/user/userPersonal?uid=" + user.getUid() + "";
    }

    /**
     * 充值功能
     */
    @RequestMapping("/userMoneyUpdate")
    public String userMoneyUpdate(User user) {
        userService.updateMoney(user);
        return "redirect:/user/userPersonal?uid=" + user.getUid() + "";
    }
}
