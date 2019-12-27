package com.tickets.service.impl;

import com.tickets.Utils.UuidUtil;
import com.tickets.dao.UserDao;
import com.tickets.entity.Order;
import com.tickets.entity.PageBean;
import com.tickets.entity.User;
import com.tickets.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    public Integer selectByUsername(String username) {
        return userDao.selectByUsername(username);
    }

    @Override
    public void doInsert(User user) {
        userDao.doInsert(user);
    }

    @Override
    public void doResetPassword(User user) {
        userDao.doResetPassword(user);
    }

    @Override
    public User userLogin(User user) {
        return userDao.userLogin(user);
    }

    @Override
    public PageBean<User> doPage(User user, Integer currentPage, Integer pageCount) {
        //查询总记录数
        Integer totalCount = userDao.findTotalCount(user);
        //查询一页的对象数
        Integer start = (currentPage - 1) * pageCount;
        Map<String, Object> map = new HashMap<>();
        map.put("start", start);
        map.put("pageCount", pageCount);
        map.put("user", user);
        List<User> users = userDao.findAllByPage(map);
        //求出总页数
        Integer totalPage = (totalCount % pageCount == 0) ? (totalCount / pageCount) : (totalCount / pageCount) + 1;
        PageBean<User> pageBean = new PageBean<User>();
        pageBean.setCurrentPage(currentPage);
        pageBean.setPageCount(pageCount);
        pageBean.setTotalCount(totalCount);
        pageBean.setTotalPage(totalPage);
        pageBean.setList(users);
        return pageBean;
    }

    @Override
    public Integer findTotalCount(User user) {
        return userDao.findTotalCount(user);
    }

    @Override
    public void userDel(Integer uid) {
        userDao.userDel(uid);
    }

    @Override
    public User findByIdForUpdate(Integer uid) {
        return userDao.findByIdForUpdate(uid);
    }

    @Override
    public void userUpdate(User user) {
        userDao.userUpdate(user);
    }

    @Override
    public void userUpdateById(User user) {
        userDao.userUpdateById(user);
    }

    @Override
    public void updateMoney(User user) {
        userDao.updateMoney(user);
    }

    @Override
    public Double findMoney(Integer uid) {
        return userDao.findMoney(uid);
    }

    @Override
    public void payTicket(Double price, Integer uid) {
        Map<String, Object> map = new HashMap<>();
        map.put("price", price);
        map.put("uid", uid);
        userDao.payTicket(map);
    }

    @Override
    public void addOrder(Integer uid, Integer sid) {
        String uuid = UuidUtil.getUuid();
        Order order = new Order();
        order.setOid(uuid);
        order.setUid(uid);
        order.setSid(sid);
        userDao.addOrder(order);
    }

}
