package com.bodawb.factorycontrol.jijia.service;

import com.bodawb.factorycontrol.jijia.pojo.User;

/**
 * Created by root on 5/22/17.
 * 处理注册登陆业务
 */
public interface RegisterAndLoginI {
    //根据用户的email查询User对象
    User getUserByEmail(String email);
}
