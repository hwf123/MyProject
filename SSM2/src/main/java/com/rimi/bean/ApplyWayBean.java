package com.rimi.bean;

public class ApplyWayBean {
    private Integer applyWayId;

    private String applyWayName;

    public Integer getApplyWayId() {
        return applyWayId;
    }

    public void setApplyWayId(Integer applyWayId) {
        this.applyWayId = applyWayId;
    }

    public String getApplyWayName() {
        return applyWayName;
    }

    public void setApplyWayName(String applyWayName) {
        this.applyWayName = applyWayName == null ? null : applyWayName.trim();
    }
}