package com.rimi.bean;

public class StuBean {
    private Integer stuId;

    private String stuName;

    private Integer stuSex;

    private Integer stuAge;

    private String stuTel;

    private String stuQq;

    private String stuWechat;

    private Integer stuJobstate;

    private String stuRegion;

    private Integer stuEducation;

    private String stuSchool;

    private String stuMajor;

	public Integer getStuId() {
		return stuId;
	}

	public void setStuId(Integer stuId) {
		this.stuId = stuId;
	}

	public String getStuName() {
		return stuName;
	}

	public void setStuName(String stuName) {
		this.stuName = stuName;
	}

	public Integer getStuSex() {
		return stuSex;
	}

	public void setStuSex(Integer stuSex) {
		this.stuSex = stuSex;
	}

	public Integer getStuAge() {
		return stuAge;
	}

	public void setStuAge(Integer stuAge) {
		this.stuAge = stuAge;
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

	public Integer getStuJobstate() {
		return stuJobstate;
	}

	public void setStuJobstate(Integer stuJobstate) {
		this.stuJobstate = stuJobstate;
	}

	public String getStuRegion() {
		return stuRegion;
	}

	public void setStuRegion(String stuRegion) {
		this.stuRegion = stuRegion;
	}

	public Integer getStuEducation() {
		return stuEducation;
	}

	public void setStuEducation(Integer stuEducation) {
		this.stuEducation = stuEducation;
	}

	public String getStuSchool() {
		return stuSchool;
	}

	public void setStuSchool(String stuSchool) {
		this.stuSchool = stuSchool;
	}

	public String getStuMajor() {
		return stuMajor;
	}

	public void setStuMajor(String stuMajor) {
		this.stuMajor = stuMajor;
	}

	public StuBean(Integer stuId, String stuName, Integer stuSex, Integer stuAge, String stuTel, String stuQq,
			String stuWechat, Integer stuJobstate, String stuRegion, Integer stuEducation, String stuSchool,
			String stuMajor) {
		super();
		this.stuId = stuId;
		this.stuName = stuName;
		this.stuSex = stuSex;
		this.stuAge = stuAge;
		this.stuTel = stuTel;
		this.stuQq = stuQq;
		this.stuWechat = stuWechat;
		this.stuJobstate = stuJobstate;
		this.stuRegion = stuRegion;
		this.stuEducation = stuEducation;
		this.stuSchool = stuSchool;
		this.stuMajor = stuMajor;
	}

	public StuBean() {
		super();
		// TODO Auto-generated constructor stub
	}

   
}