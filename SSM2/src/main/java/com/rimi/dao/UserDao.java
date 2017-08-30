package com.rimi.dao;


import java.util.List;
import java.util.Map;

import com.rimi.bean.ApplyBean;
import com.rimi.bean.ApplyWayBean;
import com.rimi.bean.ConsultBean;
import com.rimi.bean.ConsultCategoryBean;
import com.rimi.bean.ConsultTimeBean;
import com.rimi.bean.ConsultWayBean;
import com.rimi.bean.EducationBean;
import com.rimi.bean.NewrecordBean;
import com.rimi.bean.PageBean;
import com.rimi.bean.ParamBean;
import com.rimi.bean.SourcesBean;
import com.rimi.bean.StuBean;
import com.rimi.bean.StudentInfoBean;
import com.rimi.bean.UserBean;

public interface UserDao {
	public UserBean login(String userLoginName,String userPs);
	//zyc-------------通过普通用户获取学生信息类
	public StuBean getStuBeanByStuId(int stuid);
	//通过id查询咨询表
	public ConsultBean getConsultBean(int stuid);
	
	public List<StudentInfoBean> getInfoListByUserId(Map pMap);
	public StudentInfoBean getInfoByUserId(int stuid);
	//咨询方式
	public List<ConsultWayBean> getConsultWayByUserId();
	public ConsultWayBean getConsultWay(int stuid);
	//支付方式
	public List<ApplyWayBean> getApplyWayBean();
	public ApplyWayBean getApplyWayBeanByApplyId(int applyId);
	public ApplyBean getApplyBeanByStuId(int stuid);
	//报名
	public void enterList(ApplyBean ab);
	//学历
	public List<EducationBean> getEducationList();
	public EducationBean getEducationByStuId(int stuid);
	//线上线下咨询师
	public List<UserBean> getOnlineTeachers();
	public List<UserBean> getOfflineTeachers();
	public UserBean getOfflineTeacher(int stuid);
	public UserBean getOnlineTeacher(int stuid);
	//咨询类别
	public List<ConsultCategoryBean> getConsultCategorys();
	public ConsultCategoryBean getConsultCategory(int stuid);
	//咨询日期
	public String getConsultDate(int stuid);
	//到访时间
	public String getVisitTime(int stuid);
	//咨询时段
	public  List<ConsultTimeBean> getConsultTimes();
	public  ConsultTimeBean getConsultTime(int stuid);
	//平台来源
	public List<SourcesBean> getSources();
	public SourcesBean getSource(int stuid);
	//优先级
	public int getPriority(int stuid);
	//备注
	public String getRemark(int stuid);
	//跟进记录
	public List<NewrecordBean> getNewRecord(int stuid);
	//添加学生
	public void addStuBean(StuBean sb);
	//添加咨询表
	public void addConsultBean(Map m);
	//添加跟进记录
	public void addNRBean(Map m);
	//添加报名
	public void addApplyBean(Map m);
	//更改学生类
	public void editStuBean(StuBean sb);
	//更改咨询类
	public void editConsultBean(Map m);
	//更改报名类
	public void editApplyBean(Map m);
	//删除跟进信息
	public void deleteAllNR(int stuid);
	

}

