package com.bodawb.factorycontrol.jijia.dao;

import com.bodawb.factorycontrol.jijia.pojo.Excel;

public interface ExcelMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Excel record);

    int insertSelective(Excel record);

    Excel selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Excel record);

    int updateByPrimaryKey(Excel record);
}