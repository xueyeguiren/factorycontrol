package com.bodawb.factorycontrol.jijia.pojo;

import java.util.Date;

public class Excel {
    private Integer id;

    private String excelname;

    private Integer userId;

    private Date insertdate;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getExcelname() {
        return excelname;
    }

    public void setExcelname(String excelname) {
        this.excelname = excelname == null ? null : excelname.trim();
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Date getInsertdate() {
        return insertdate;
    }

    public void setInsertdate(Date insertdate) {
        this.insertdate = insertdate;
    }
}