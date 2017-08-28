package com.rimi.dao;


import com.rimi.bean.UserBean;

public interface UserDao {
	public UserBean login(String userLoginName,String userPs);
}

