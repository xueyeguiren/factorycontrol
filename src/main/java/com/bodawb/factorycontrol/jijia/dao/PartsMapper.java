package com.bodawb.factorycontrol.jijia.dao;

import com.bodawb.factorycontrol.jijia.pojo.Parts;

public interface PartsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Parts record);

    int insertSelective(Parts record);

    Parts selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Parts record);

    int updateByPrimaryKey(Parts record);
}