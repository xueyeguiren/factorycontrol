package com.bodawb.factorycontrol.jijia.dao;

import com.bodawb.factorycontrol.jijia.pojo.User;

public interface UserMapper {
    int deleteByPrimaryKey(Integer userId);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer userId);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    //根据email获取user对象
    User selectByEmail(String email);
}