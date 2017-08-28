package com.rimi.serviceImpl;


import com.rimi.bean.UserBean;
import com.rimi.dao.UserDao;
import com.rimi.service.UserService;

public class UserServiceImpl implements UserService {
	
	
	UserDao ud;
	
	@Override
	public UserBean login(String userLoginName, String userPs) {
		return ud.login(userLoginName, userPs);
	}
	public UserDao getUd() {
		return ud;
	}
	public void setUd(UserDao ud) {
		this.ud = ud;
	}
	

}
