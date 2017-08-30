package com.rimi.bean;

import java.util.Date;

public class ApplyBean {
    private int applyId;

    private int stuId;

    private int isApply;

    private String applyTime;

    private String applyWay;

	public int getApplyId() {
		return applyId;
	}

	public void setApplyId(int applyId) {
		this.applyId = applyId;
	}

	public int getStuId() {
		return stuId;
	}

	public void setStuId(int stuId) {
		this.stuId = stuId;
	}

	public int getIsApply() {
		return isApply;
	}

	public void setIsApply(int isApply) {
		this.isApply = isApply;
	}

	public String getApplyTime() {
		return applyTime;
	}

	public void setApplyTime(String applyTime) {
		this.applyTime = applyTime;
	}

	public String getApplyWay() {
		return applyWay;
	}

	public void setApplyWay(String applyWay) {
		this.applyWay = applyWay;
	}

	public ApplyBean(int applyId, int stuId, int isApply, String applyTime, String applyWay) {
		super();
		this.applyId = applyId;
		this.stuId = stuId;
		this.isApply = isApply;
		this.applyTime = applyTime;
		this.applyWay = applyWay;
	}

	public ApplyBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	


    
}