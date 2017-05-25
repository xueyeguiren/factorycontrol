package com.bodawb.factorycontrol.jijia.service;

import com.bodawb.factorycontrol.jijia.dao.UserMapper;
import com.bodawb.factorycontrol.jijia.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by root on 5/22/17.
 */
@Service
public class RegisterAndLoginImpl implements RegisterAndLoginI {
    private UserMapper userMapper;

    public UserMapper getUserMapper() {
        return userMapper;
    }
@Autowired
    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    public User getUserByEmail(String email) {
        User user = new User();
        user=userMapper.selectByEmail(email);
        if(user==null){
            return null;
        }
        return userMapper.selectByEmail(email);
    }
}
