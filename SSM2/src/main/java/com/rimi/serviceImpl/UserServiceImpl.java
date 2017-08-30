package com.rimi.serviceImpl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.javassist.compiler.ast.Symbol;
import org.springframework.beans.factory.annotation.Autowired;

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
import com.rimi.dao.UserDao;
import com.rimi.service.UserService;

public class UserServiceImpl implements UserService {
	
	
	UserDao ud;
	@Override
	public UserBean login(String userLoginName, String userPs) {
		return ud.login(userLoginName, userPs);
	}
	
	public List<StudentInfoBean> getInfoListByUserId(int userid,int userjob,PageBean pb,ParamBean param){
		
		Map pMap = new HashMap(); 
		
		if(param!=null) {
			if(param.getStuName()!=null&&!"".equals(param.getStuName())) {
				pMap.put("stuName",param.getStuName());
			}
			
			if(param.getStuTel()!=null&&!"".equals(param.getStuTel())) {
				pMap.put("stuTel",param.getStuTel());
			}
			
			if(param.getStuQq()!=null&&!"".equals(param.getStuQq())) {
				pMap.put("stuQq",param.getStuQq());
			}
			
			if(param.getConsultWay()!=null&&!"".equals(param.getConsultWay())&&!param.getConsultWay().equals("0")) {
				System.out.println(param.getConsultWay());

				pMap.put("consultWay",param.getConsultWay());
			}
			
			if(param.getIsApply()!=null&&!"".equals(param.getIsApply())&&!param.getIsApply().equals("0")) {
				pMap.put("isApply",param.getIsApply());
			}
			
			if(param.getConsultPriority()!=null&&!"".equals(param.getConsultPriority())&&!param.getConsultPriority().equals("0")) {
				pMap.put("consultPriority",param.getConsultPriority());
			}
			
			if(param.getTimeway()!=null&&!"".equals(param.getTimeway())) {
				System.out.println(param.getTimeway()+"何种方式");
				pMap.put("timeway",param.getTimeway());
			}
			if(param.getDate1()!=null&&!"".equals(param.getDate1())) {
				pMap.put("Date1",param.getDate1());
			}
			if(param.getDate2()!=null&&!"".equals(param.getDate2())) {
				pMap.put("Date2",param.getDate2());
			}
			
		}
		
		if(pb!=null) {
		
			int num=(Integer.parseInt(pb.getNowPage())-1)*(Integer.parseInt(pb.getPageSize()));
		
			pMap.put("num", num);
			
			int size=Integer.parseInt(pb.getPageSize());
			
			pMap.put("size", size);
		}
		pMap.put("userid", userid);
		pMap.put("userjob",userjob);
		return ud.getInfoListByUserId(pMap);
	}

	
	
	
	public UserDao getUd() {
		return ud;
	}
	public void setUd(UserDao ud) {
		this.ud = ud;
	}

	@Override
	public List<ConsultWayBean> getConsultWayByUserId() {
		// TODO Auto-generated method stub
		return ud.getConsultWayByUserId();
	}

	@Override
	public List<ApplyWayBean> getApplyWayBean() {
		// TODO Auto-generated method stub
		return ud.getApplyWayBean();
	}

	@Override
	public void enterList(ApplyBean ab) {
			ud.enterList(ab);
		
	}

	@Override
	public ApplyBean getApplyBeanByStuId(int stuid) {
		// TODO Auto-generated method stub
		return ud.getApplyBeanByStuId(stuid);
	}

	@Override
	public StuBean getStuBeanByStuId(int stuid) {
		// TODO Auto-generated method stub
		return ud.getStuBeanByStuId(stuid);
	}

	@Override
	public List<EducationBean> getEducationList() {
		// TODO Auto-generated method stub
		return ud.getEducationList();
	}

	@Override
	public EducationBean getEducationByStuId(int stuid) {
		// TODO Auto-generated method stub
		return ud.getEducationByStuId(stuid);
	}

	@Override
	public List<UserBean> getOnlineTeachers() {
		// TODO Auto-generated method stub
		return ud.getOnlineTeachers();
	}

	@Override
	public List<UserBean> getOfflineTeachers() {
		// TODO Auto-generated method stub
		return ud.getOfflineTeachers();
	}

	@Override
	public ApplyWayBean getApplyWayBeanByApplyId(int applyId) {
		// TODO Auto-generated method stub
		return ud.getApplyWayBeanByApplyId(applyId);
	}

	@Override
	public UserBean getOfflineTeacher(int stuid) {
		// TODO Auto-generated method stub
		return ud.getOfflineTeacher(stuid);
	}

	@Override
	public UserBean getOnlineTeacher(int stuid) {
		// TODO Auto-generated method stub
		return ud.getOnlineTeacher(stuid);
	}

	@Override
	public List<ConsultCategoryBean> getConsultCategorys() {
		// TODO Auto-generated method stub
		return ud.getConsultCategorys();
	}

	@Override
	public ConsultCategoryBean getConsultCategory(int stuid) {
		// TODO Auto-generated method stub
		return ud.getConsultCategory(stuid);
	}

	@Override
	public ConsultWayBean getConsultWay(int stuid) {
		// TODO Auto-generated method stub
		return ud.getConsultWay(stuid);
	}

	@Override
	public String getConsultDate(int stuid) {
		// TODO Auto-generated method stub
		return ud.getConsultDate(stuid);
	}

	@Override
	public String getVisitTime(int stuid) {
		// TODO Auto-generated method stub
		return ud.getVisitTime(stuid);
	}

	@Override
	public List<ConsultTimeBean> getConsultTimes() {
		// TODO Auto-generated method stub
		return ud.getConsultTimes();
	}

	@Override
	public ConsultTimeBean getConsultTime(int stuid) {
		// TODO Auto-generated method stub
		return ud.getConsultTime(stuid);
	}

	@Override
	public List<SourcesBean> getSources() {
		// TODO Auto-generated method stub
		return ud.getSources();
	}

	@Override
	public SourcesBean getSource(int stuid) {
		// TODO Auto-generated method stub
		return ud.getSource(stuid);
	}

	@Override
	public int getPriority(int stuid) {
		// TODO Auto-generated method stub
		return ud.getPriority(stuid);
	}

	@Override
	public String getRemark(int stuid) {
		// TODO Auto-generated method stub
		return ud.getRemark(stuid);
	}

	@Override
	public List<NewrecordBean> getNewRecord(int stuid) {
		// TODO Auto-generated method stub
		return ud.getNewRecord(stuid);
	}

	@Override
	public void addStudent(StuBean sb, ConsultBean cb, NewrecordBean nb) {
	
		if(sb.getStuEducation()==0) {
			sb.setStuEducation(null);
		}
		    ud.addStuBean(sb);
		    Map m1=new HashMap<>();
		    if(cb.getOnlineId()!=0) {
		    m1.put("online", cb.getOnlineId());
		    }
		    if(cb.getOfflineId()!=0) {
		    m1.put("offline",cb.getOfflineId());
		    }
		    if(cb.getConsultCategory()!=0) {
		    m1.put("cc", cb.getConsultCategory());
		    }
		    if(cb.getConsultWay()!=0) {
		    m1.put("cw", cb.getConsultWay());
		    }
		  
			    m1.put("cd", cb.getConsultDate());

		   
		    
		    if(cb.getConsultTime()!=0) {
		    	m1.put("ct",cb.getConsultTime());
		    }
		    if(cb.getSourcesId()!=0) {
		    	m1.put("sour", cb.getSourcesId());
		    }
		    if(cb.getConsultPriority()!=0){
		    	m1.put("cp",cb.getConsultPriority());
		    }
			    m1.put("vt", cb.getVisitTime());

		 
		 
		    m1.put("remark",cb.getConsultRemark());
		    m1.put("stuid",sb.getStuId());
		    m1.put("nt",nb.getNewrecordTime() );
		    m1.put("ne",nb.getNewrecordExplain());
		   
			ud.addConsultBean(m1);
			ud.addNRBean(m1);
			ud.addApplyBean(m1);
	}

	

	//通过id查询咨询表
		public ConsultBean getConsultBean(int stuid) {
			
			return ud.getConsultBean(stuid);
		}
	//更改学生信息
		public void editStudent(StuBean sb,ConsultBean cb,ApplyBean ab,List nrt,List nre) {
			if(sb.getStuEducation()==0) {
				sb.setStuEducation(null);
			}
			Map m1=new HashMap<>();
		    if(cb.getOnlineId()!=0) {
		    m1.put("online", cb.getOnlineId());
		    }
		    if(cb.getOfflineId()!=0) {
		    m1.put("offline",cb.getOfflineId());
		    }
		    if(cb.getConsultCategory()!=0) {
		    m1.put("cc", cb.getConsultCategory());
		    }
		    if(cb.getConsultWay()!=0) {
		    m1.put("cw", cb.getConsultWay());
		    }
		  
			    m1.put("cd", cb.getConsultDate());

		   
		    
		    if(cb.getConsultTime()!=0) {
		    	m1.put("ct",cb.getConsultTime());
		    }
		    if(cb.getSourcesId()!=0) {
		    	m1.put("sour", cb.getSourcesId());
		    }
		    if(cb.getConsultPriority()!=0){
		    	m1.put("cp",cb.getConsultPriority());
		    }
			    m1.put("vt", cb.getVisitTime());
			    m1.put("remark",cb.getConsultRemark());
			    m1.put("stuid",sb.getStuId());
			   
			if("0".equals(ab.getApplyWay())) {
				m1.put("aw",ab.getApplyWay());
			}   
			if(ab.getIsApply()!=0) {
				m1.put("ia",ab.getIsApply());
			}
			m1.put("at", ab.getApplyTime());
			ud.editStuBean(sb);
			ud.editConsultBean(m1);
			ud.editApplyBean(m1);
			if(nrt!=null&&nre!=null) {
				ud.deleteAllNR(sb.getStuId());
				for (int i = 1; i < nrt.size(); i++) {
					Map m2=new HashMap<>();
					m2.put("nt", nrt.get(i));
					m2.put("ne", nre.get(i));
					m2.put("stuid", sb.getStuId());
					ud.addNRBean(m2);
				}
			}
			
			
		}

		@Override
		public StudentInfoBean getInfoByUserId(int stuid) {
			// TODO Auto-generated method stub
			return ud.getInfoByUserId(stuid);
		}


	
	

}
