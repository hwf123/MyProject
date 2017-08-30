package com.rimi.bean;

import java.io.Serializable;

public class UserBean implements Serializable {
	private int userId;				//用户ID
	private String userLoginName;	//用户登录名（唯一）
	private String userName;		//用户姓名
	private String userPs;			//用户密码
	private int userSex;			//用户性别（1：男  2：女）
	private int userAge;			//用户年龄
	private int userState;			//用户状态（1：启用  2：禁用）
	private int userRole;			//用户角色（1:管理员 2：普通用户）
	private int userJob;			//用户职位（1:线上咨询师  2：线下咨询师）
	private int userJobState;		//用户工作状态（1：在职 2：休假 3：离职）
	private String userEmail;		//用户邮箱
	private String userTel;			//用户电话号码（座机）
	private String userPhone;		//用户手机号码
	private String userQq;			//用户QQ
	private UserJobBean uj;			//职业类
	private JobstateBean js;		//工作状态类
	private UserRoleBean ur;		//用户角色类
	private StateBean us;			//用户状态类
	private SexBean sex;			//性别类
	
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUserLoginName() {
		return userLoginName;
	}
	public void setUserLoginName(String userLoginName) {
		this.userLoginName = userLoginName;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPs() {
		return userPs;
	}
	public void setUserPs(String userPs) {
		this.userPs = userPs;
	}
	public int getUserSex() {
		return userSex;
	}
	public void setUserSex(int userSex) {
		this.userSex = userSex;
	}
	public int getUserAge() {
		return userAge;
	}
	public void setUserAge(int userAge) {
		this.userAge = userAge;
	}
	public int getUserState() {
		return userState;
	}
	public void setUserState(int userState) {
		this.userState = userState;
	}
	public int getUserRole() {
		return userRole;
	}
	public void setUserRole(int userRole) {
		this.userRole = userRole;
	}
	public int getUserJob() {
		return userJob;
	}
	public void setUserJob(int userJob) {
		this.userJob = userJob;
	}
	public int getUserJobState() {
		return userJobState;
	}
	public void setUserJobState(int userJobState) {
		this.userJobState = userJobState;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserTel() {
		return userTel;
	}
	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserQq() {
		return userQq;
	}
	public void setUserQq(String userQq) {
		this.userQq = userQq;
	}
	
	public UserJobBean getUj() {
		return uj;
	}
	public void setUj(UserJobBean uj) {
		this.uj = uj;
	}
	public JobstateBean getJs() {
		return js;
	}
	public void setJs(JobstateBean js) {
		this.js = js;
	}
	public UserRoleBean getUr() {
		return ur;
	}
	public void setUr(UserRoleBean ur) {
		this.ur = ur;
	}
	public StateBean getUs() {
		return us;
	}
	public void setUs(StateBean us) {
		this.us = us;
	}
	public SexBean getSex() {
		return sex;
	}
	public void setSex(SexBean sex) {
		this.sex = sex;
	}
	public UserBean(int userId, String userLoginName, String userName, String userPs, int userSex, int userAge,
			int userState, int userRole, int userJob, int userJobState, String userEmail, String userTel,
			String userPhone, String userQq) {
		super();
		this.userId = userId;
		this.userLoginName = userLoginName;
		this.userName = userName;
		this.userPs = userPs;
		this.userSex = userSex;
		this.userAge = userAge;
		this.userState = userState;
		this.userRole = userRole;
		this.userJob = userJob;
		this.userJobState = userJobState;
		this.userEmail = userEmail;
		this.userTel = userTel;
		this.userPhone = userPhone;
		this.userQq = userQq;
	}
	public UserBean() {
		super();
	}
}
