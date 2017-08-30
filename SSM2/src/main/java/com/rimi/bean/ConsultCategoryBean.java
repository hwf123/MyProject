package com.rimi.bean;

public class ConsultCategoryBean {
    private Integer csCategoryId;

    private String csCategoryName;

    private Integer csCategoryState;

    public Integer getCsCategoryId() {
        return csCategoryId;
    }

    public void setCsCategoryId(Integer csCategoryId) {
        this.csCategoryId = csCategoryId;
    }

    public String getCsCategoryName() {
        return csCategoryName;
    }

    public void setCsCategoryName(String csCategoryName) {
        this.csCategoryName = csCategoryName == null ? null : csCategoryName.trim();
    }

    public Integer getCsCategoryState() {
        return csCategoryState;
    }

    public void setCsCategoryState(Integer csCategoryState) {
        this.csCategoryState = csCategoryState;
    }
}