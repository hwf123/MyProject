package com.rimi.bean;

public class ConsultTimeBean {
    private Integer csTimeId;

    private String csTimeName;

    private Integer csTimeState;

    public Integer getCsTimeId() {
        return csTimeId;
    }

    public void setCsTimeId(Integer csTimeId) {
        this.csTimeId = csTimeId;
    }

    public String getCsTimeName() {
        return csTimeName;
    }

    public void setCsTimeName(String csTimeName) {
        this.csTimeName = csTimeName == null ? null : csTimeName.trim();
    }

    public Integer getCsTimeState() {
        return csTimeState;
    }

    public void setCsTimeState(Integer csTimeState) {
        this.csTimeState = csTimeState;
    }
}