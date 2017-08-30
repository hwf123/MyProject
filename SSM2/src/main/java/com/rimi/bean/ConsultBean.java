package com.rimi.bean;

import java.util.Date;

public class ConsultBean {
    private Integer consultId;

    private Integer stuId;

    private Integer offlineId;

    private Integer onlineId;

    private Integer consultCategory;

    private Integer consultWay;

    private String consultDate;

    private Integer consultTime;

    private String visitTime;

    private Integer sourcesId;

    private String consultFocus;

    private String consultKeywords;

    private Integer consultPriority;

    private String consultRemark;

    private Date createTime;

	public Integer getConsultId() {
		return consultId;
	}

	public void setConsultId(Integer consultId) {
		this.consultId = consultId;
	}

	public Integer getStuId() {
		return stuId;
	}

	public void setStuId(Integer stuId) {
		this.stuId = stuId;
	}

	public Integer getOfflineId() {
		return offlineId;
	}

	public void setOfflineId(Integer offlineId) {
		this.offlineId = offlineId;
	}

	public Integer getOnlineId() {
		return onlineId;
	}

	public void setOnlineId(Integer onlineId) {
		this.onlineId = onlineId;
	}

	public Integer getConsultCategory() {
		return consultCategory;
	}

	public void setConsultCategory(Integer consultCategory) {
		this.consultCategory = consultCategory;
	}

	public Integer getConsultWay() {
		return consultWay;
	}

	public void setConsultWay(Integer consultWay) {
		this.consultWay = consultWay;
	}

	public String getConsultDate() {
		return consultDate;
	}

	public void setConsultDate(String consultDate) {
		this.consultDate = consultDate;
	}

	public Integer getConsultTime() {
		return consultTime;
	}

	public void setConsultTime(Integer consultTime) {
		this.consultTime = consultTime;
	}

	public String getVisitTime() {
		return visitTime;
	}

	public void setVisitTime(String visitTime) {
		this.visitTime = visitTime;
	}

	public Integer getSourcesId() {
		return sourcesId;
	}

	public void setSourcesId(Integer sourcesId) {
		this.sourcesId = sourcesId;
	}

	public String getConsultFocus() {
		return consultFocus;
	}

	public void setConsultFocus(String consultFocus) {
		this.consultFocus = consultFocus;
	}

	public String getConsultKeywords() {
		return consultKeywords;
	}

	public void setConsultKeywords(String consultKeywords) {
		this.consultKeywords = consultKeywords;
	}

	public Integer getConsultPriority() {
		return consultPriority;
	}

	public void setConsultPriority(Integer consultPriority) {
		this.consultPriority = consultPriority;
	}

	public String getConsultRemark() {
		return consultRemark;
	}

	public void setConsultRemark(String consultRemark) {
		this.consultRemark = consultRemark;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public ConsultBean(Integer consultId, Integer stuId, Integer offlineId, Integer onlineId, Integer consultCategory,
			Integer consultWay, String consultDate, Integer consultTime, String visitTime, Integer sourcesId,
			String consultFocus, String consultKeywords, Integer consultPriority, String consultRemark,
			Date createTime) {
		super();
		this.consultId = consultId;
		this.stuId = stuId;
		this.offlineId = offlineId;
		this.onlineId = onlineId;
		this.consultCategory = consultCategory;
		this.consultWay = consultWay;
		this.consultDate = consultDate;
		this.consultTime = consultTime;
		this.visitTime = visitTime;
		this.sourcesId = sourcesId;
		this.consultFocus = consultFocus;
		this.consultKeywords = consultKeywords;
		this.consultPriority = consultPriority;
		this.consultRemark = consultRemark;
		this.createTime = createTime;
	}

	public ConsultBean() {
		super();
		// TODO Auto-generated constructor stub
	}

    
}