package com.rimi.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
import com.rimi.service.UserService;

@Controller
public class StuManagerController {

	@Autowired
	UserService us;
	
	@RequestMapping("userIndex.do")
	public String toIndex(Model model, String nowpage, HttpSession session) {
		UserBean ub = (UserBean) session.getAttribute("ub");
		int count = us.getInfoListByUserId(ub.getUserId(), ub.getUserJob(), null, null).size();
		// 得到每页的条数
		int pageSize = 3;
		// 得到总页数
		int total = (count % pageSize == 0 ? count / pageSize : count / pageSize + 1);
		// 得到当前页
		int NowPage = 1;
		if (nowpage != null) {
			NowPage = Integer.parseInt(nowpage);
			if (NowPage > total) {
				NowPage = total;
			}
			if (NowPage < 1) {
				NowPage = 1;
			}
		}

		PageBean pb = new PageBean(NowPage + "", count + "", pageSize + "", total + "");
		// 得到所有的信息
		List<StudentInfoBean> lis = us.getInfoListByUserId(ub.getUserId(), ub.getUserJob(), pb, null);
		model.addAttribute("stus", lis);
		model.addAttribute("pb", pb);
		session.removeAttribute("param");
		return "user/Student-index";

	}
	
	@RequestMapping("/userStudent.do")
	public String searchStudent(String nowpage, Model model, HttpSession session, ParamBean param1, String isok) {

		UserBean ub = (UserBean) session.getAttribute("ub");
		ParamBean p = (ParamBean) session.getAttribute("param");

		int count = us.getInfoListByUserId(ub.getUserId(), ub.getUserJob(), null, param1).size();
		int pageSize = 3;
		PageBean pb;
		List<StudentInfoBean> lis;
		// 得到每页的条数
		// 得到总页数
		// 得到当前页

		if (!"1".equals(isok)) {
			System.out.println("搜索條件姓名;" + param1.getStuName());
			System.out.println("搜索條件咨询方式；" + param1.getConsultWay());
			System.out.println("搜索條件是否报名：" + param1.getIsApply());
			System.out.println("搜索條件商情优先级：" + param1.getConsultPriority());
			System.out.println("搜索以何种方式：" + param1.getTimeway());
			System.out.println("搜索條件咨询日期前：" + param1.getDate1());
			System.out.println("搜索條件咨询日期后：" + param1.getDate2());
			count = us.getInfoListByUserId(ub.getUserId(), ub.getUserJob(), null, param1).size();
			int total = (count % pageSize == 0 ? count / pageSize : count / pageSize + 1);

			int NowPage = 1;
			if (nowpage != null) {
				NowPage = Integer.parseInt(nowpage);
				if (NowPage > total) {
					NowPage = total;
				}
				if (NowPage < 1) {
					NowPage = 1;
				}
			}
			pb = new PageBean(NowPage + "", count + "", pageSize + "", total + "");
			lis = us.getInfoListByUserId(ub.getUserId(), ub.getUserJob(), pb, param1);
			session.setAttribute("param", param1);

		} else {

			count = us.getInfoListByUserId(ub.getUserId(), ub.getUserJob(), null, p).size();

			int total = (count % pageSize == 0 ? count / pageSize : count / pageSize + 1);

			int NowPage = 1;
			if (nowpage != null) {
				NowPage = Integer.parseInt(nowpage);
				if (NowPage > total) {
					NowPage = total;
				}
				if (NowPage < 1) {
					NowPage = 1;
				}
			}

			pb = new PageBean(NowPage + "", count + "", pageSize + "", total + "");
			lis = us.getInfoListByUserId(ub.getUserId(), ub.getUserJob(), pb, p);
		}

		model.addAttribute("stus", lis);
		model.addAttribute("pb", pb);
		return "user/Student-index";
	}
	
	@RequestMapping("userEnlist.do")
	public String enlist(String stuid, String applytime, String applyWay) {
		System.out.println("!!!!!!!!!!!!!!!!!");
		System.out.println("id" + stuid);
		System.out.println(applytime);
		System.out.println(applyWay);
		int applyId = us.getApplyBeanByStuId(Integer.parseInt(stuid)).getApplyId();
		ApplyBean ab = new ApplyBean(applyId, Integer.parseInt(stuid), 1, applytime, applyWay);
		us.enterList(ab);

		return "redirect:userStudent.do";

	}

	@RequestMapping("userAddStudent.do")
	public String addStudent() {
		return "/user/Student-add";

	}
	
	@RequestMapping("userAddStu.do")
	public String addS(StuBean sb,ConsultBean cb,NewrecordBean nb) {
		System.out.println("学生姓名"+sb.getStuName());
		System.out.println("学生年龄"+sb.getStuAge());
		System.out.println("学生性别"+sb.getStuSex());
		System.out.println("学校微信"+sb.getStuWechat());
		System.out.println("学生电话"+sb.getStuTel());
		System.out.println("学生QQ"+sb.getStuQq());
		System.out.println("学生区域"+sb.getStuRegion());
		System.out.println("学生学历"+sb.getStuEducation());
		System.out.println("学生学校"+sb.getStuSchool());
		System.out.println("学生专业"+sb.getStuMajor());
		System.out.println("学生工作状态"+sb.getStuJobstate());
		System.out.println("线上咨询师"+cb.getOnlineId());
		System.out.println("线下咨询师"+cb.getOfflineId());
		System.out.println("咨询类别"+cb.getConsultCategory());
		System.out.println("咨询方式"+cb.getConsultWay());
		System.out.println("咨询日期"+cb.getConsultDate());
		System.out.println("咨询时间段"+cb.getConsultTime());
		System.out.println("平台来远近"+cb.getSourcesId());
		System.out.println("优先级"+cb.getConsultPriority());
		System.out.println("到访时间"+cb.getVisitTime());
		System.out.println("备注"+cb.getConsultRemark());
		System.out.println("跟进时间"+nb.getNewrecordTime());
		System.out.println("跟进记录"+nb.getNewrecordExplain());
		us.addStudent(sb, cb, nb);
		return "redirect:userIndex.do";

	}

	@RequestMapping("userEditStu.do")
	public String editStudent() {
		return "/user/Student-edit";

	}

	@RequestMapping("userInfoStu.do")
	public String infoStudent(String stuid, Model model) {

		int stuId=Integer.parseInt(stuid);
		
		StuBean sb = us.getStuBeanByStuId(stuId);
		
		EducationBean eb = us.getEducationByStuId(stuId);
		
		ApplyBean stu_ab = us.getApplyBeanByStuId(stuId);
		
		ApplyWayBean stu_abw = us.getApplyWayBeanByApplyId(stu_ab.getApplyId());
		
		UserBean online = us.getOnlineTeacher(stuId);
		
		UserBean offline = us.getOfflineTeacher(stuId);
		
		ConsultCategoryBean ccb = us.getConsultCategory(stuId);
		
		ConsultWayBean cwb = us.getConsultWay(stuId);
		
		String consultDate = us.getConsultDate(stuId);
		
		String visitTime = us.getVisitTime(stuId);
		
		ConsultTimeBean ctb = us.getConsultTime(stuId);
		
		SourcesBean sour=us.getSource(stuId);
		
		List<NewrecordBean> nbs=us.getNewRecord(stuId);
		model.addAttribute("nbs", nbs);
		
		int pri=us.getPriority(stuId);
		String remark=us.getRemark(stuId);
		
		model.addAttribute("stu_abw", stu_abw);
		model.addAttribute("stu_ab", stu_ab);
		model.addAttribute("sb", sb);
		model.addAttribute("eb", eb);
		model.addAttribute("online", online);
		model.addAttribute("offline", offline);
		model.addAttribute("ccb", ccb);
		model.addAttribute("cwb", cwb);
		model.addAttribute("csd", consultDate);
		model.addAttribute("vt", visitTime);
		model.addAttribute("ctb", ctb);
		model.addAttribute("sour",sour);
		model.addAttribute("pri",pri);
		model.addAttribute("remark",remark);
		return "/user/Student-info";

	}

}
