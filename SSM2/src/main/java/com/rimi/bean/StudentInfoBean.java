package com.rimi.bean;

import java.text.SimpleDateFormat;
import java.util.Date;


//创建这个类的目的是为了更好的呈现学员信息
public class StudentInfoBean {
	//学生信息属性
	private String stuId;//学生ID
    private String stuName;//学员姓名
    private Date consultDate;//咨询日期
    private String onlineId;//线上咨询师ID
    private String offlineId;//线下咨询师ID
    private String  stuTel;//联系电话
    private String stuQq;//QQ
    private String stuWechat;//微信
    private int stuAge;//年龄
    private String stuSex;//性别
    private String consultWay;//咨询方式
    private int consultPriority;//商情优先级
    private int isApply;//是否报名
    private Date  recentRecordTime;//最近更新时间
    
	public String getStuId() {
		return stuId;
	}
	public void setStuId(String stuId) {
		this.stuId = stuId;
	}
	public String getStuName() {
		return stuName;
	}
	public void setStuName(String stuName) {
		this.stuName = stuName;
	}
	public String getConsultDate() {
		 SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		 String dateString = formatter.format(consultDate);
		 return dateString;
	}
	public void setConsultDate(Date consultDate) {
		this.consultDate = consultDate;
		
	}
	public String getOnlineId() {
		return onlineId;
	}
	public void setOnlineId(String onlineId) {
		this.onlineId = onlineId;
	}
	public String getOfflineId() {
		return offlineId;
	}
	public void setOfflineId(String offlineId) {
		this.offlineId = offlineId;
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
	public String getStuWechat() {
		return stuWechat;
	}
	public void setStuWechat(String stuWechat) {
		this.stuWechat = stuWechat;
	}
	public int getStuAge() {
		return stuAge;
	}
	public void setStuAge(int stuAge) {
		this.stuAge = stuAge;
	}
	public String getStuSex() {
		return stuSex;
	}
	public void setStuSex(String stuSex) {
		this.stuSex = stuSex;
	}
	public String getConsultWay() {
		return consultWay;
	}
	public void setConsultWay(String consultWay) {
		this.consultWay = consultWay;
	}
	public int getConsultPriority() {
		return consultPriority;
	}
	public void setConsultPriority(int consultPriority) {
		this.consultPriority = consultPriority;
	}
	public int getIsApply() {
		return isApply;
	}
	public void setIsApply(int isApply) {
		this.isApply = isApply;
	}
	public String getRecentRecordTime() {
		 SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		 String dateString = formatter.format(recentRecordTime);
		 return dateString;
	}
	public void setRecentRecordTime(Date recentRecordTime) {
		this.recentRecordTime = recentRecordTime;
	
	}
	public StudentInfoBean(String stuId, String stuName, Date consultDate, String onlineId, String offlineId,
			String stuTel, String stuQq, String stuWechat, int stuAge, String stuSex, String consultWay,
			int consultPriority, int isApply, Date recentRecordTime) {
		super();
		this.stuId = stuId;
		this.stuName = stuName;
		this.consultDate = consultDate;
		this.onlineId = onlineId;
		this.offlineId = offlineId;
		this.stuTel = stuTel;
		this.stuQq = stuQq;
		this.stuWechat = stuWechat;
		this.stuAge = stuAge;
		this.stuSex = stuSex;
		this.consultWay = consultWay;
		this.consultPriority = consultPriority;
		this.isApply = isApply;
		this.recentRecordTime = recentRecordTime;
	}
	public StudentInfoBean() {
		super();
		// TODO Auto-generated constructor stub
	}
    


}
	