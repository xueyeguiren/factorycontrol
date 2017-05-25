package com.bodawb.factorycontrol.jijia.pojo;

public class Assemble {
    private Integer id;

    private String postarray;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPostarray() {
        return postarray;
    }

    public void setPostarray(String postarray) {
        this.postarray = postarray == null ? null : postarray.trim();
    }
}