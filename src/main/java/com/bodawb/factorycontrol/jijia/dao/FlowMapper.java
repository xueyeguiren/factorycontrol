package com.bodawb.factorycontrol.jijia.dao;

import com.bodawb.factorycontrol.jijia.pojo.Flow;

public interface FlowMapper {
    int deleteByPrimaryKey(String id);

    int insert(Flow record);

    int insertSelective(Flow record);

    Flow selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Flow record);

    int updateByPrimaryKey(Flow record);
}