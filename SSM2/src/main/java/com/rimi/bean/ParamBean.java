package com.rimi.bean;

import java.util.Date;

public class ParamBean {
	private String stuName;
	private String  stuTel;//联系电话
	private String stuQq;
	private String consultWay;
	private String consultPriority;//商情优先级
	private String isApply;//是否报名
	private String timeway;
	private String Date1;//咨询日期前
	private String Date2;//咨询日期后
	public ParamBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ParamBean(String stuName, String stuTel, String stuQq, String consultWay, String consultPriority,
			String isApply, String timeway, String date1, String date2) {
		super();
		this.stuName = stuName;
		this.stuTel = stuTel;
		this.stuQq = stuQq;
		this.consultWay = consultWay;
		this.consultPriority = consultPriority;
		this.isApply = isApply;
		this.timeway = timeway;
		Date1 = date1;
		Date2 = date2;
	}
	public String getTimeway() {
		return timeway;
	}
	public void setTimeway(String timeway) {
		this.timeway = timeway;
	}
	
	public String getStuName() {
		return stuName;
	}
	public void setStuName(String stuName) {
		this.stuName = stuName;
	}
	public String getStuTel() {
		return stuTel;
	}
	public void setStuTel(String stuTel) {
		this.stuTel = stuTel;
	}
	public String getStuQq() {
		return stuQq;
	}
	public void setStuQq(String stuQq) {
		this.stuQq = stuQq;
	}
	public String getConsultWay() {
		return consultWay;
	}
	public void setConsultWay(String consultWay) {
		this.consultWay = consultWay;
	}
	public String getConsultPriority() {
		return consultPriority;
	}
	public void setConsultPriority(String consultPriority) {
		this.consultPriority = consultPriority;
	}
	public String getIsApply() {
		return isApply;
	}
	public void setIsApply(String isApply) {
		this.isApply = isApply;
	}
	public String getDate1() {
		return Date1;
	}
	public void setDate1(String date1) {
		Date1 = date1;
	}
	public String getDate2() {
		return Date2;
	}
	public void setDate2(String date2) {
		Date2 = date2;
	}
	
	
	
	

}
