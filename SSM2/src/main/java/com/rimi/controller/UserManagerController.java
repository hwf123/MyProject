package com.rimi.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rimi.bean.JobstateBean;
import com.rimi.bean.PageBean;
import com.rimi.bean.ParameterBean;
import com.rimi.bean.SexBean;
import com.rimi.bean.StateBean;
import com.rimi.bean.UserBean;
import com.rimi.bean.UserJobBean;
import com.rimi.bean.UserRoleBean;
import com.rimi.service.UserManagerService;

import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;
import jxl.write.biff.RowsExceededException;

@Controller
public class UserManagerController {

	@Autowired
	private UserManagerService userMs;
	
	//添加用户
	@RequestMapping("/addUser.do")
	public String addUser(HttpServletRequest request,Model model,HttpSession session) {
		int userId = userMs.maxId()+1;
		String userLoginName = request.getParameter("userLoginName");
		String userName = request.getParameter("userName");
		String userPs = request.getParameter("userPs");
		String userSex1=request.getParameter("userSex");
		String userAge1=request.getParameter("userAge");
		String userState1=request.getParameter("userState");
		String userRole1=request.getParameter("userRole");
		String userJob1=request.getParameter("userJob");	
		String userJobState1=request.getParameter("userJobState");
		String userEmail = request.getParameter("userEamil");
		String userQq = request.getParameter("userQq");
		String userPhone = request.getParameter("userPhone");
		String userTel = request.getParameter("userTel");
		
		//性别集合
		List<SexBean> sexList = userMs.selectSex();
		model.addAttribute("addSex",sexList);
		//状态集合
		List<StateBean> stateList = userMs.selectState();
		model.addAttribute("addState", stateList);		
		//职业集合
		List<UserJobBean> jobList = userMs.selectJob();
		model.addAttribute("addJob",jobList);
		//角色集合
		List<UserRoleBean> roleList = userMs.selectRole();
		model.addAttribute("addRole", roleList);
		//工作状态集合
		List<JobstateBean> jobStateList = userMs.selectJobState();
		model.addAttribute("addJobState", jobStateList);
		//根据登录存储的Id以查询用户
		UserBean ub2 =(UserBean)session.getAttribute("loginUb");
		if(ub2!=null) {
			int userId1 = ub2.getUserId();
			UserBean ub3 = userMs.getInfoById(userId1);
			model.addAttribute("addUb", ub3);
		}
		UserBean ub1 = userMs.checkLoginName(userLoginName);
		if(ub1!= null) {
			model.addAttribute("checkLoginName", ub1.getUserLoginName());
			model.addAttribute("checkIsok", "用户名已存在");
			return "user/add";
		}else {
			int userSex = 0;
			int userAge = 0;
			int userState = 0;
			int userRole = 0;
			int userJob = 0;
			int userJobState = 0;
			if(userSex1 !=null && !"".equals(userSex1)) {
				userSex = Integer.parseInt(userSex1);
			}
			if(userAge1 !=null && !"".equals(userAge1)) {
				userAge = Integer.parseInt(userAge1);
			}
			if(userState1 !=null && !"".equals(userState1)) {
				userState = Integer.parseInt(userState1);
			}
			if(userRole1 !=null && !"".equals(userRole1)) {
				userRole = Integer.parseInt(userRole1);
			}
			if(userJob1 !=null && !"".equals(userJob1)) {
				userJob = Integer.parseInt(userJob1);
			}
			if(userJobState1 !=null && !"".equals(userJobState1)) {
				userJobState = Integer.parseInt(userJobState1);
			}
			UserBean ub = null;
			if(userSex>0 && userAge>=0 && userState>0 && userRole>0 && userJob>0 && userJobState>0) {
				ub= new UserBean(userId, userLoginName, userName, userPs, userSex, userAge, userState, userRole, userJob, userJobState, userEmail, userTel, userPhone, userQq);
			}
			if(ub != null) {
				boolean isok = userMs.addUser(ub);
				if(isok) {
					return "redirect:/queryUser.do?isok=clean";
				}else{
					return "user/add";
				}
			}
			//return "user/add";
		}
		return "user/add";
	}
	
	//查询用户
	@RequestMapping("/queryUser.do")
	public String queryUser(HttpServletRequest request,Model model,HttpSession session) {
		//获得模糊查询参数
		String userLoginName = request.getParameter("userLoginName");
		String userRole = request.getParameter("userRole");
		String userState = request.getParameter("userState");
		String userJob = request.getParameter("userJob");
		String userJobState = request.getParameter("userJobState");
		
		//状态集合
		List<StateBean> stateList = userMs.selectState();
		model.addAttribute("queryState", stateList);		
		//职业集合
		List<UserJobBean> jobList = userMs.selectJob();
		model.addAttribute("queryJob",jobList);
		//角色集合
		List<UserRoleBean> roleList = userMs.selectRole();
		model.addAttribute("queryRole", roleList);
		//工作状态集合
		List<JobstateBean> jobStateList = userMs.selectJobState();
		model.addAttribute("queryJobState", jobStateList);
		//根据登录存储的Id以查询用户
		UserBean ub2 =(UserBean)session.getAttribute("loginUb");
		if(ub2!=null) {
			int userId1 = ub2.getUserId();
			UserBean ub3 = userMs.getInfoById(userId1);
			model.addAttribute("queryUb", ub3);
		}
		//清空查询条件
		String isok = request.getParameter("isok");
		if("clean".equals(isok)) {
			session.removeAttribute("userLoginName1");
			session.removeAttribute("userRole1");
			session.removeAttribute("userState1");
			session.removeAttribute("userJob1");
			session.removeAttribute("userJobState1");
		}
		
		//用session保存查询条件
		if(userLoginName ==null || "".equals(userLoginName)){
			userLoginName = (String) session.getAttribute("userLoginName1");
		}
		if(userRole ==null || "".equals(userRole)){
			userRole = (String)session.getAttribute("userRole1");
		}
		if(userState == null || "".equals(userState)){
			userState = (String) session.getAttribute("userState1");
		}
		if(userJob ==null || "".equals(userJob)){
			userJob =(String) session.getAttribute("userJob1");
		}
		if(userJobState ==null || "".equals(userJobState)){
			userJobState =(String) session.getAttribute("userJobState1");
		}
		
		PageBean pb = new PageBean();
		ParameterBean pm = new ParameterBean();//封装模糊查询参数
		pm.setUserLoginName(userLoginName);
		pm.setUserRole(userRole);
		pm.setUserState(userState);
		pm.setUserJob(userJob);
		pm.setUserJobState(userJobState);
		
		String num = request.getParameter("nowPage");
		//计算总记录数  分页以后一共有多少页
		int count = userMs.queryUser(null,pm).size();//总记录数
		pb.setNowPage("1");
		pb.setPageSize("4");
		int pageSize = Integer.parseInt(pb.getPageSize());//每页显示条数
		int totalPage2 = count%pageSize==0?count/pageSize:count/pageSize+1;//最大页数（总页数）
		pb.setPageSize(pageSize+"");
		pb.setTotalPage(totalPage2+"");
		pb.setCount(count+"");
		
		int nowPage=1;
		if(num !=null && !"".equals(num)){
			nowPage =Integer.parseInt(num);
		}
		if(nowPage <1){
			nowPage=1;
		}
		//最后一页
		int totalPage=0;
		if(pb.getTotalPage()!=null && !"".equals(pb.getTotalPage())){//总页数不为null
			 totalPage =Integer.parseInt(pb.getTotalPage());
		}
		if(nowPage > totalPage){
			//nowPage = 1;跳到第一页
			nowPage = totalPage;
		}
		//封装对象
		pb.setNowPage(nowPage+"");

		List<UserBean> users = userMs.queryUser(pb, pm);
		if(users!=null) {
			model.addAttribute("count", pb.getCount());
			model.addAttribute("totalPage",pb.getTotalPage());
			model.addAttribute("nowPage", pb.getNowPage());
			model.addAttribute("pageSize",pb.getPageSize());
			model.addAttribute("users", users);
			session.setAttribute("userLoginName1", userLoginName);
			session.setAttribute("userRole1", userRole);
			session.setAttribute("userState1", userState);
			session.setAttribute("userJob1", userJob);
			session.setAttribute("userJobState1", userJobState);
			return "user/index";
		}
		return "user/index";
	}
	
	//通过Id获取用户详细信息
	@RequestMapping("/userInfo.do")
	public String userInfo(String userId,Model model,HttpSession session) {
		//根据登录存储的Id以查询用户
		UserBean ub2 =(UserBean)session.getAttribute("loginUb");
		if(ub2!=null) {
			int userId1 = ub2.getUserId();
			UserBean ub3 = userMs.getInfoById(userId1);
			model.addAttribute("lookUb", ub3);
		}
		int userId1 =0;
		if(userId !=null && !"".equals(userId)) {
			userId1 = Integer.parseInt(userId);
		}
		UserBean ub = userMs.getInfoById(userId1);
		if(ub!=null) {
			model.addAttribute("ub", ub);
			return "user/look";
		}
		return "redirect:/queryUser.do?isok=clean";
	}
	
	//修改用户前显示用户详情
	@RequestMapping("/editUser1.do")
	public String edit(String userId,HttpSession session,Model model) {
		//根据登录存储的Id以查询用户
		UserBean ub2 =(UserBean)session.getAttribute("loginUb");
		if(ub2!=null) {
			int userId1 = ub2.getUserId();
			UserBean ub3 = userMs.getInfoById(userId1);
			model.addAttribute("editUb", ub3);
		}
		int userId1 =0;
		if(userId !=null && !"".equals(userId)) {
			userId1 = Integer.parseInt(userId);
		}
		UserBean ub = userMs.getInfoById(userId1);
		if(ub!=null) {
			//性别集合
			List<SexBean> sexList = userMs.selectSex();
			model.addAttribute("editSex",sexList);
			//状态集合
			List<StateBean> stateList = userMs.selectState();
			model.addAttribute("editState", stateList);		
			//职业集合
			List<UserJobBean> jobList = userMs.selectJob();
			model.addAttribute("editJob",jobList);
			//角色集合
			List<UserRoleBean> roleList = userMs.selectRole();
			model.addAttribute("editRole", roleList);
			//工作状态集合
			List<JobstateBean> jobStateList = userMs.selectJobState();
			model.addAttribute("editJobState", jobStateList);
			session.setAttribute("ub1", ub);
			return "user/edit";
		}
		return "redirect:/queryUser.do?isok=clean";
	}
	
	//修改用户
	@RequestMapping("/editUser.do")
	public String editUser(HttpServletRequest request,Model model,HttpSession session) {
			UserBean ub = (UserBean) session.getAttribute("ub1");
			int userId = ub.getUserId();
			String userLoginName = request.getParameter("userLoginName");
			String userName = request.getParameter("userName");
			String userPs1 = request.getParameter("userPs");
			String userSex1=request.getParameter("userSex");
			String userAge1=request.getParameter("userAge");
			String userState1=request.getParameter("userState");
			String userRole1=request.getParameter("userRole");
			String userJob1=request.getParameter("userJob");	
			String userJobState1=request.getParameter("userJobState");
			String userEmail = request.getParameter("userEamil");
			String userQq = request.getParameter("userQq");
			String userPhone = request.getParameter("userPhone");
			String userTel = request.getParameter("userTel");
			String userPs = "";
			int userSex = 0;
			int userAge = 0;
			int userState = 0;
			int userRole = 0;
			int userJob = 0;
			int userJobState = 0;
			if(userSex1 !=null && !"".equals(userSex1)) {
				userSex = Integer.parseInt(userSex1);
			}
			if(userAge1 !=null && !"".equals(userAge1)) {
				userAge = Integer.parseInt(userAge1);
			}
			if(userState1 !=null && !"".equals(userState1)) {
				userState = Integer.parseInt(userState1);
			}
			if(userRole1 !=null && !"".equals(userRole1)) {
				userRole = Integer.parseInt(userRole1);
			}
			if(userJob1 !=null && !"".equals(userJob1)) {
				userJob = Integer.parseInt(userJob1);
			}
			if(userJobState1 !=null && !"".equals(userJobState1)) {
				userJobState = Integer.parseInt(userJobState1);
			}
			if(userPs1 != null && !"".equals(userPs1)) {	
				userPs = userPs1;
			}else {
				userPs = ub.getUserPs();
			}
			
			UserBean ub1  =null;
			if(userSex>0 && userAge>=0 && userState>0 && userRole>0 && userJob>0 && userJobState>0) {
				ub1= new UserBean(userId, userLoginName, userName, userPs, userSex, userAge, userState, userRole, userJob, userJobState, userEmail, userTel, userPhone, userQq);
			}
			if(ub1 != null) {
				boolean isok1 = userMs.editUser(ub1);
				if(isok1) {
					return "redirect:/queryUser.do?isok=clean";
				}else{
					return "user/edit";
				}
			}
			return "redirect:/queryUser.do?isok=clean";
	}
	
	//导出excel
	@RequestMapping("/OutExcel.do")
	public String OutExcel(HttpServletRequest request,HttpServletResponse response) {
		String ids = request.getParameter("ids");
		//进行截取
		String[] id = ids.split(",");
		//用set是避免重复
		Set<String> idSet = new HashSet<String>(Arrays.asList(id)); 
		List list = new ArrayList();
		for(String str:idSet) {
			//到数据库 根据id查询数据
			UserBean ub = userMs.getInfoById(Integer.parseInt(str));
			list.add(ub);
		}

		//获得输出流
		OutputStream out = null;
		//创建工作薄
		WritableWorkbook work =null;
		try {
			out=response.getOutputStream();
			work = Workbook.createWorkbook(out);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//第一个sheet页
		WritableSheet sheet=work.createSheet("图书信息", 0);
		//头信息
		Label nameLabel1 = new Label(0,0,"序号");
		Label nameLabel2 = new Label(1,0,"用户账号");
		Label nameLabel3 = new Label(2,0,"用户姓名");
		Label nameLabel4 = new Label(3,0,"用户性别");
		Label nameLabel5 = new Label(4,0,"用户年龄");
		Label nameLabel6 = new Label(5,0,"用户状态");
		Label nameLabel7 = new Label(6,0,"用户角色");
		Label nameLabel8 = new Label(7,0,"用户职业");
		Label nameLabel9 = new Label(8,0,"工作状态");
		Label nameLabel10 = new Label(9,0,"手机号码");
		Label nameLabel11 = new Label(10,0,"电话号码");
		Label nameLabel12 = new Label(11,0,"用户邮箱");
		Label nameLabel13 = new Label(12,0,"用户QQ");
		//将第一行添加到sheet页中
		try {
			sheet.addCell(nameLabel1);
			sheet.addCell(nameLabel2);
			sheet.addCell(nameLabel3);
			sheet.addCell(nameLabel4);
			sheet.addCell(nameLabel5);
			sheet.addCell(nameLabel6);
			sheet.addCell(nameLabel7);
			sheet.addCell(nameLabel8);
			sheet.addCell(nameLabel9);
			sheet.addCell(nameLabel10);
			sheet.addCell(nameLabel11);
			sheet.addCell(nameLabel12);
			sheet.addCell(nameLabel13);
			//循环集合 添加数据
			for (int i = 0; i < list.size(); i++) {
				UserBean ub = (UserBean) list.get(i);
				Label valueLabel1 = new Label(0,i+1,i+1+"");
				Label valueLabel2 = new Label(1,i+1,ub.getUserLoginName());
				Label valueLabel3 = new Label(2,i+1,ub.getUserName());
				Label valueLabel4 = new Label(3,i+1,ub.getSex().getSexName());
				Label valueLabel5 = new Label(4,i+1,ub.getUserAge()+"");
				Label valueLabel6 = new Label(5,i+1,ub.getUs().getStateName());
				Label valueLabel7 = new Label(6,i+1,ub.getUr().getRoleName());
				Label valueLabel8 = new Label(7,i+1,ub.getUj().getJobName());
				Label valueLabel9 = new Label(8,i+1,ub.getJs().getJobstateName());
				Label valueLabel10 = new Label(9,i+1,ub.getUserPhone());
				Label valueLabel11 = new Label(10,i+1,ub.getUserTel());
				Label valueLabel12 = new Label(11,i+1,ub.getUserEmail());
				Label valueLabel13 = new Label(12,i+1,ub.getUserQq());
				//添加到sheet页中
				sheet.addCell(valueLabel1);
				sheet.addCell(valueLabel2);
				sheet.addCell(valueLabel3);
				sheet.addCell(valueLabel4);
				sheet.addCell(valueLabel5);
				sheet.addCell(valueLabel6);
				sheet.addCell(valueLabel7);
				sheet.addCell(valueLabel8);
				sheet.addCell(valueLabel9);
				sheet.addCell(valueLabel10);
				sheet.addCell(valueLabel11);
				sheet.addCell(valueLabel12);
				sheet.addCell(valueLabel13);
			}
		} catch (RowsExceededException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (WriteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//设置下载名称
		try {
			response.addHeader("Content-Disposition", "attachment;filename=\""+URLEncoder.encode("用户信息.xls","utf-8"));
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}	
		try {
			work.write();
			work.close();
			out.flush();
			out.close();
		} catch (WriteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return "redirect:/queryUser.do?isok=clean";		
	}
	
	//通过Id删除用户
	@RequestMapping("/delUserById.do")
	public String delUserById(String userId,Model model) {
		int userId1 =0;
		if(userId !=null && !"".equals(userId)) {
			userId1 = Integer.parseInt(userId);
		}
		boolean isok = userMs.delUserById(userId1);
		if(isok) {
			return "redirect:/queryUser.do?isok=clean";	
		}else {
			return "redirect:/queryUser.do?isok=clean";
		}	
	}
	
	//批量删除用户
	@RequestMapping("/delAllUser.do")
	public String delAllUser(HttpServletRequest request) {
		String delIds = request.getParameter("delIds");
		//进行截取
		String[] id = delIds.split(",");
		//用set是避免重复
		Set<String> idSet = new HashSet<String>(Arrays.asList(id));
		boolean isok = userMs.delAllUser(idSet);
		if(isok) {
			return "redirect:/queryUser.do?isok=clean";		
		}
		return "redirect:/queryUser.do?isok=clean";			
	}
	
	//查看个人资料
	@RequestMapping("/lookInfo.do")
	public String lookInfo(String InfoUserId,Model model,HttpSession session) {
		//性别集合
		List<SexBean> sexList = userMs.selectSex();
		model.addAttribute("infoSex",sexList);
		int userId =0;
		if(InfoUserId !=null && !"".equals(InfoUserId)) {
			userId = Integer.parseInt(InfoUserId);
		}
		UserBean ub = userMs.getInfoById(userId);
		if(ub!=null) {
			session.setAttribute("InfoUb", ub);
			return "user/user";
		}
		return "user/user";
	}
	
	//修改个人资料
	@RequestMapping("/updateUser.do")
	public String updateUser(HttpServletRequest request,HttpSession session) {
		String userName = request.getParameter("userName");
		String userSex1 = request.getParameter("userSex");
		String userAge1 = request.getParameter("userAge");
		String userEmail = request.getParameter("userEamil");
		String userPhone = request.getParameter("userPhone");
		String userTel = request.getParameter("userTel");
		String userQq = request.getParameter("userQq");
		UserBean ub =(UserBean)session.getAttribute("InfoUb");
		//int userId = 0;
		//if(ub!=null) {
			int userId = ub.getUserId();
			int userSex = 0;
			int userAge = 0;
			if(userSex1 !=null && !"".equals(userSex1)) {
				userSex = Integer.parseInt(userSex1);
			}
			if(userAge1 !=null && !"".equals(userAge1)) {
				userAge = Integer.parseInt(userAge1);
			}else {
				userAge = ub.getUserAge();
			}
			UserBean ub1  = new UserBean();
			ub1.setUserId(userId);
			if(userName !=null && !"".equals(userName)) {
				ub1.setUserName(userName);
			}
			if(userSex>0) {
				ub1.setUserSex(userSex);
			}
			if(userAge>=0 ) {
				ub1.setUserAge(userAge);
			}
			if(userEmail !=null && !"".equals(userEmail)) {
				ub1.setUserEmail(userEmail);
			}
			if(userPhone !=null && !"".equals(userPhone)) {
				ub1.setUserPhone(userPhone);
			}
			if(userTel !=null && !"".equals(userTel)) {
				ub1.setUserTel(userTel);
			}
			if(userQq !=null && !"".equals(userQq)) {
				ub1.setUserQq(userQq);
			}
			boolean isok = userMs.updateUserById(ub1);
			if(isok) {
				return "redirect:/lookInfo.do?InfoUserId="+userId;
			}else {
				return "redirect:/lookInfo.do?InfoUserId="+userId;
			}
//		}
//		return "redirect:/lookInfo.do?InfoUserId="+userId;
	}
	
	@RequestMapping("/password.do")
	public String password(HttpServletRequest request,HttpSession session,Model model) {
		//根据登录存储的Id以查询用户密码
		UserBean ub =(UserBean)session.getAttribute("loginUb");
		if(ub!=null) {
			int userId = ub.getUserId();
			String userPs = ub.getUserPs();
			String oldPs = request.getParameter("userOldPs");
			if(userPs !=null && !"".equals(userPs) && oldPs !=null && !"".equals(oldPs)) {
				if(userPs.equals(oldPs)) {
					String newPs = request.getParameter("userNewPs");
					if(newPs !=null && !"".equals(newPs)) {
						boolean isok = userMs.editPassword(newPs, userId+"");
						if(isok) {
							model.addAttribute("IsokEdit", "修改成功");
							return "user/password";
						}else {
							model.addAttribute("IsokEdit", "修改失败");
							return "user/password";
						} 
					}   
				}
				else {
					model.addAttribute("IsOldPs", "密码错误");
					return "user/password";
				}
			}
			
		}
		return "user/password";
	}

}
