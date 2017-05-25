package com.bodawb.factorycontrol.jijia.dao;

import com.bodawb.factorycontrol.jijia.pojo.Link;

public interface LinkMapper {
    int deleteByPrimaryKey(Integer linkId);

    int insert(Link record);

    int insertSelective(Link record);

    Link selectByPrimaryKey(Integer linkId);

    int updateByPrimaryKeySelective(Link record);

    int updateByPrimaryKey(Link record);
}