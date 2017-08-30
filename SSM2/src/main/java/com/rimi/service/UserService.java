package com.rimi.service;

import java.util.List;

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

public interface UserService {

	public UserBean login(String userLoginName, String userPs);

	public List<StudentInfoBean> getInfoListByUserId(int userid, int userjob, PageBean pb, ParamBean param);

	public List<ConsultWayBean> getConsultWayByUserId();

	public ConsultWayBean getConsultWay(int stuid);

	public List<ApplyWayBean> getApplyWayBean();

	public ApplyBean getApplyBeanByStuId(int stuid);

	public void enterList(ApplyBean ab);

	public StuBean getStuBeanByStuId(int stuid);

	public List<EducationBean> getEducationList();

	public EducationBean getEducationByStuId(int stuid);

	public List<UserBean> getOnlineTeachers();

	public List<UserBean> getOfflineTeachers();

	public ApplyWayBean getApplyWayBeanByApplyId(int applyId);

	public UserBean getOfflineTeacher(int stuid);

	public UserBean getOnlineTeacher(int stuid);

	public List<ConsultCategoryBean> getConsultCategorys();

	public ConsultCategoryBean getConsultCategory(int stuid);

	// 咨询日期
	public String getConsultDate(int stuid);

	// 到访时间
	public String getVisitTime(int stuid);

	// 咨询时段
	public List<ConsultTimeBean> getConsultTimes();

	public ConsultTimeBean getConsultTime(int stuid);

	// 平台来源
	public List<SourcesBean> getSources();

	public SourcesBean getSource(int stuid);
	
	//优先级
	public int getPriority(int stuid);
		//备注
	public String getRemark(int stuid);
	//跟进记录
	public List<NewrecordBean> getNewRecord(int stuid);
	//添加学生
	public void addStudent(StuBean sb,ConsultBean cb,NewrecordBean nb);
	//通过id查询咨询表
	public ConsultBean getConsultBean(int stuid);
	//修改学生信息
	public void editStudent(StuBean sb,ConsultBean cb,ApplyBean ab,List nrt,List nre);
	//查询学生展示信息
	public StudentInfoBean getInfoByUserId(int stuid);


}
