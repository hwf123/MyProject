package com.rimi.bean;

public class JobstateBean {
    private Integer jobstateId;

    private String jobstateName;

    public Integer getJobstateId() {
        return jobstateId;
    }

    public void setJobstateId(Integer jobstateId) {
        this.jobstateId = jobstateId;
    }

    public String getJobstateName() {
        return jobstateName;
    }

    public void setJobstateName(String jobstateName) {
        this.jobstateName = jobstateName == null ? null : jobstateName.trim();
    }
}