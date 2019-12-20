package com.tickets.dao;

import com.tickets.entity.User;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * 用户dao层
 */
@Repository
public interface UserDao {
    //根据用户名查询用户是否存在
    Integer selectByUsername(String username);

    //添加用户
    void doInsert(User user);

    //密码重置
    void doResetPassword(User user);

    //用户登录
    User userLogin(User user);

    /*分页辅助操作*/
    //查看一页的用户信息
    List<User> findAllByPage(Map<String, Object> map);

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
}
