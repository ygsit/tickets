package com.tickets.service;

import com.tickets.entity.PageBean;
import com.tickets.entity.User;

public interface UserService {
    //根据用户名查询用户是否存在
    Integer selectByUsername(String username);

    //添加用户
    void doInsert(User user);

    //密码重置
    void doResetPassword(User user);

    //用户登录
    User userLogin(User user);

    //分页
    PageBean<User> doPage(User user, Integer currentPage, Integer pageCount);

    //查询总记录数
    Integer findTotalCount(User user);

    //删除用户
    void userDel(Integer uid);

    //根据id查找
    User findByIdForUpdate(Integer uid);

    //用户信息修改
    void userUpdate(User user);

    //根据id修改用户信息
    void userUpdateById(User user);

    //充值功能
    void updateMoney(User user);

    //查钱
    Double findMoney(Integer uid);

    //付钱
    void payTicket(Double price, Integer uid);

    //添加订单
    void addOrder(Integer uid, Integer sid);
}
