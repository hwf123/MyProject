package com.rimi.bean;

import java.util.Date;

public class NewrecordBean {
    private Integer newrecordId;

    private Integer stuId;

    private String newrecordTime;

    private String newrecordExplain;

	public Integer getNewrecordId() {
		return newrecordId;
	}

	public void setNewrecordId(Integer newrecordId) {
		this.newrecordId = newrecordId;
	}

	public Integer getStuId() {
		return stuId;
	}

	public void setStuId(Integer stuId) {
		this.stuId = stuId;
	}

	public String getNewrecordTime() {
		return newrecordTime;
	}

	public void setNewrecordTime(String newrecordTime) {
		this.newrecordTime = newrecordTime;
	}

	public String getNewrecordExplain() {
		return newrecordExplain;
	}

	public void setNewrecordExplain(String newrecordExplain) {
		this.newrecordExplain = newrecordExplain;
	}

	public NewrecordBean(Integer newrecordId, Integer stuId, String newrecordTime, String newrecordExplain) {
		super();
		this.newrecordId = newrecordId;
		this.stuId = stuId;
		this.newrecordTime = newrecordTime;
		this.newrecordExplain = newrecordExplain;
	}

	public NewrecordBean() {
		super();
		// TODO Auto-generated constructor stub
	}

   
}