package com.rimi.bean;

public class ParameterBean {

	private String userLoginName;
	private String userRole;
	private String userState;
	private String userJob;
	private String userJobState;
	public String getUserLoginName() {
		return userLoginName;
	}
	public void setUserLoginName(String userLoginName) {
		this.userLoginName = userLoginName;
	}
	public String getUserRole() {
		return userRole;
	}
	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}
	public String getUserState() {
		return userState;
	}
	public void setUserState(String userState) {
		this.userState = userState;
	}
	public String getUserJob() {
		return userJob;
	}
	public void setUserJob(String userJob) {
		this.userJob = userJob;
	}
	public String getUserJobState() {
		return userJobState;
	}
	public void setUserJobState(String userJobState) {
		this.userJobState = userJobState;
	}
	public ParameterBean(String userLoginName, String userRole, String userState, String userJob, String userJobState) {
		super();
		this.userLoginName = userLoginName;
		this.userRole = userRole;
		this.userState = userState;
		this.userJob = userJob;
		this.userJobState = userJobState;
	}
	public ParameterBean() {
		super();
	}
}
