package com.rimi.serviceImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.rimi.bean.PageBean;
import com.rimi.bean.ParameterBean;
import com.rimi.bean.UserBean;
import com.rimi.dao.UserManagerDao;
import com.rimi.service.UserManagerService;

public class UserManagerServiceImpl implements UserManagerService{

	private UserManagerDao userMd;
	
	public UserManagerDao getUserMd() {
		return userMd;
	}

	public void setUserMd(UserManagerDao userMd) {
		this.userMd = userMd;
	}

	//查询最大Id
	@Override
	public int maxId() {
		return userMd.maxId();
	}
	
	//验证登录名是否唯一
	@Override
	public UserBean checkLoginName(String userLoginName) {
		return userMd.checkLoginName(userLoginName);
	}
	
	//添加用户
	@Override
	public boolean addUser(UserBean ub) {
		return userMd.addUser(ub);
	}

	//查询用户
	@Override
	public List queryUser(PageBean pb, ParameterBean pm) {
		Map map = new HashMap();
		if(pm!=null) {
			if(pm.getUserLoginName() != null && !"".equals(pm.getUserLoginName())){
				map.put("userLoginName", "%"+pm.getUserLoginName()+"%");
			}
			if(pm.getUserState() != null && !"".equals(pm.getUserState())) {
				map.put("userState", pm.getUserState());
			}
			if(pm.getUserRole() != null && !"".equals(pm.getUserRole())){
				map.put("userRole",pm.getUserRole() );
			}
			if(pm.getUserJob() != null && !"".equals(pm.getUserJob())){
				map.put("userJob",pm.getUserJob());
			}
			if(pm.getUserJobState() != null && !"".equals(pm.getUserJobState())){
				map.put("userJobState",pm.getUserJobState());
			}
		}
		if(pb!=null) {
			if(pb.getNowPage() != null && !"".equals(pb.getNowPage())){
				//（当前页-1）*pagesize  4
				int now = Integer.parseInt(pb.getNowPage());
				if(now <1){
					now = 1;
				}
				int total = 0;
				if(pb.getTotalPage() != null && !"".equals(pb.getTotalPage())){
					total = Integer.parseInt(pb.getTotalPage());
				}
				if(now >= total){
					now = total;
				}
				int pageSize = 0 ;
				if(pb.getPageSize()!= null && !"".equals(pb.getPageSize())){
					pageSize = Integer.parseInt(pb.getPageSize());
				}
				map.put("pageSize", pageSize);
				int beginIndex =(now-1)*pageSize;
				if(beginIndex >= 0) {
					map.put("beginIndex",beginIndex);
				}else {
					map.put("beginIndex",0);
				}
			}
		}
		return userMd.queryUser(map);
	}

	//通过Id查看用户详情
	@Override
	public UserBean getInfoById(int userId) {
		return userMd.getInfoById(userId);
	}

	//通过Id修改用户信息
	@Override
	public boolean editUser(UserBean ub) {
		return userMd.editUser(ub);
	}

	//通过Id删除用户
	@Override
	public boolean delUserById(int userId) {
		return userMd.delUserById(userId);
	}

	//删除多个用户
	@Override
	public boolean delAllUser(Set set) {
		return userMd.delAllUser(set);
	}

	//查询性别表
	@Override
	public List selectSex() {
		return userMd.selectSex();
	}
	
	//查询状态表
	@Override
	public List selectState() {
		return userMd.selectState();	
	}
	
	//查询职业表
	public List selectJob() {
		return userMd.selectJob();
	}
	
	//查询角色表
	public List selectRole() {
		return userMd.selectRole();
	}
	
	//查询工作状态表
	public List selectJobState() {
		return userMd.selectJobState();	
	}

	@Override
	public boolean updateUserById(UserBean ub) {
		Map map = new HashMap();
		if(ub!=null) {
			if(ub.getUserId() > 0) {
				map.put("userId", ub.getUserId());
			}
			if(ub.getUserName() !=null && !"".equals(ub.getUserName())) {
				map.put("userName",ub.getUserName());
			}
			if(ub.getUserSex() > 0 ) {
				map.put("userSex",ub.getUserSex());
			}
			if(ub.getUserAge() >= 0 ) {
				map.put("userAge", ub.getUserAge());
			}
			if(ub.getUserEmail() !=null && !"".equals(ub.getUserEmail())) {
				map.put("userEmail", ub.getUserEmail());
			}
			if(ub.getUserPhone() !=null && !"".equals(ub.getUserPhone())) {
				map.put("userPhone", ub.getUserPhone());
			}
			if(ub.getUserTel() != null && !"".equals(ub.getUserTel())) {
				map.put("userTel",ub.getUserTel());
			}
			if(ub.getUserQq() != null && !"".equals(ub.getUserQq())) {
				map.put("userQq", ub.getUserQq());
			}
		}
		return userMd.updateUserById(map);
	}

	//修改密码
	@Override
	public boolean editPassword(String userPs, String userId) {
		Map map = new HashMap();
		if(userPs!=null && !"".equals(userPs)) {
			map.put("userPs",userPs);
		}
		if(userId!=null && !"".equals(userId)) {
			map.put("userId", userId);
		}
		return userMd.editPassword(map);
	}
}
