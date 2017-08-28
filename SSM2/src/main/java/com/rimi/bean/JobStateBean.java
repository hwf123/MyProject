package com.rimi.bean;

public class JobStateBean {
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

	public JobStateBean(Integer jobstateId, String jobstateName) {
		super();
		this.jobstateId = jobstateId;
		this.jobstateName = jobstateName;
	}

	public JobStateBean() {
		super();
	}   
}