package com.rimi.bean;

public class IsapplyBean {
    private Integer isapplyId;

    private String isapplyName;

    public Integer getIsapplyId() {
        return isapplyId;
    }

    public void setIsapplyId(Integer isapplyId) {
        this.isapplyId = isapplyId;
    }

    public String getIsapplyName() {
        return isapplyName;
    }

    public void setIsapplyName(String isapplyName) {
        this.isapplyName = isapplyName == null ? null : isapplyName.trim();
    }
}