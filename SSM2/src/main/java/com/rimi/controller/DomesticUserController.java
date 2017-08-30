package com.rimi.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;
import jxl.write.biff.RowsExceededException;

@Controller
public class DomesticUserController {

	@Autowired
	UserService us;

	// index.do功能为学员跟进，属于展示页面，功能有分页、查询。
	@RequestMapping("index.do")
	public String toIndex(Model model, String nowpage, HttpSession session) {
		System.out.println("+++++++++++++++++++进入");
		UserBean ub = (UserBean) session.getAttribute("ub");
		System.out.println("=========================="+ub);
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
		return "stu/index";

	}

	@RequestMapping("enlist.do")
	public String enlist(String stuid, String applytime, String applyWay) {
		System.out.println("!!!!!!!!!!!!!!!!!");
		System.out.println("id" + stuid);
		System.out.println(applytime);
		System.out.println(applyWay);
		int applyId = us.getApplyBeanByStuId(Integer.parseInt(stuid)).getApplyId();
		ApplyBean ab = new ApplyBean(applyId, Integer.parseInt(stuid), 1, applytime, applyWay);
		us.enterList(ab);

		return "redirect:searchStudent.do";

	}

	@RequestMapping("addStudent.do")
	public String addStudent() {
		
		

		return "/stu/Student-add";

	}
	
	@RequestMapping("addStu.do")
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
		return "redirect:index.do";

	}

	@RequestMapping("editStudent.do")
	public String editStudent(String stuid,Model model) {
		
		int stuId=Integer.parseInt(stuid);
		
		StuBean sb = us.getStuBeanByStuId(stuId);
		ConsultBean cb=us.getConsultBean(stuId);
		ApplyBean stu_ab = us.getApplyBeanByStuId(stuId);
		List<NewrecordBean> nbs=us.getNewRecord(stuId);
		model.addAttribute("nbs", nbs);
		model.addAttribute("sb", sb);
		model.addAttribute("cb",cb);
		model.addAttribute("ab",stu_ab);
		return "/stu/Student-edit";


	}
	
	@RequestMapping("editStu.do")
	public String editStu(StuBean sb,ConsultBean cb,ApplyBean ab,@RequestParam List nrt,@RequestParam List nre) {
		us.editStudent(sb, cb, ab, nrt, nre);
	
		
		
		
		return "redirect:index.do";


	}
	
	@RequestMapping("excel.do")
	public void  excelStudent(String Str,HttpServletResponse response,HttpSession session) throws IOException {
		
		
		OutputStream out=response.getOutputStream();
		WritableWorkbook book=Workbook.createWorkbook(out);
		WritableSheet sheet=book.createSheet("学员信息", 0);

		Label idLabel=new Label(0,0,"序号");
		Label nameLabel=new Label(1,0,"学员姓名");
		Label consultDateLabel=new Label(2,0,"咨询日期");
		Label onlineLabel=new Label(3,0,"线上咨询师");
		Label offlineLabel=new Label(4,0,"线下咨询师");
		Label telLabel=new Label(5,0,"电话");
		Label qqLabel=new Label(6,0,"QQ");
		Label wechatLabel=new Label(7,0,"微信");
		Label ageLabel=new Label(8,0,"年龄");
		Label sexLabel=new Label(9,0,"性别");
		Label consultWayLabel=new Label(10, 0, "咨询方式");
		Label priorityLabel=new Label(11, 0, "咨询优先级");
		Label isApplyLabel=new Label(12,0,"是否报名");
		Label newRecordDateLabel=new Label(13, 0, "最新跟进日期");
		

		try {
			sheet.addCell(idLabel);
			sheet.addCell(nameLabel);
			sheet.addCell(consultDateLabel);
			sheet.addCell(onlineLabel);
			sheet.addCell(offlineLabel);
			sheet.addCell(telLabel);
			sheet.addCell(qqLabel);
			sheet.addCell(wechatLabel);
			sheet.addCell(ageLabel);
			sheet.addCell(sexLabel);
			sheet.addCell(consultWayLabel);
			sheet.addCell(priorityLabel);
			sheet.addCell(isApplyLabel);
			sheet.addCell(newRecordDateLabel);


			
		} catch (RowsExceededException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (WriteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//全部导出
		if(Str.equals("all")) {
			UserBean ub = (UserBean) session.getAttribute("ub");
			List<StudentInfoBean> lis= us.getInfoListByUserId(ub.getUserId(), ub.getUserJob(), null, null);
			for(int i=0;i<lis.size();i++) {
				String star="";
				StudentInfoBean sib=lis.get(i);
				Label Label1=new Label(0,i+1,i+1+"");
				Label Label2=new Label(1,i+1,sib.getStuName());
				Label Label3=new Label(2,i+1,sib.getConsultDate());
				Label Label4=new Label(3,i+1,sib.getOfflineId());
				Label Label5=new Label(4,i+1,sib.getOnlineId());
				Label Label6=new Label(5,i+1,sib.getStuTel());
				Label Label7=new Label(6,i+1,sib.getStuQq());
				Label Label8=new Label(7,i+1,sib.getStuWechat());
				Label Label9=new Label(8,i+1,sib.getStuAge()+"");
				Label Label10=new Label(9,i+1,sib.getStuSex()+"");
				Label Label11=new Label(10,i+1,sib.getConsultWay());
				for (int j = 0; j < sib.getConsultPriority(); j++) {
					star=star+"★";
				}
				Label Label13=null;
				Label Label12=new Label(11,i+1,star);
				if(sib.getIsApply()==1) {
				 Label13=new Label(12,i+1,"已报名");
				}
				if(sib.getIsApply()!=1) {
				 Label13=new Label(12,i+1,"未报名");
				}
				Label Label14=new Label(13,i+1,sib.getRecentRecordTime());
				try {

					sheet.addCell(Label1);
					sheet.addCell(Label2);
					sheet.addCell(Label3);
					sheet.addCell(Label4);
					sheet.addCell(Label5);
					sheet.addCell(Label6);
					sheet.addCell(Label7);
					sheet.addCell(Label8);
					sheet.addCell(Label9);
					sheet.addCell(Label10);
					sheet.addCell(Label11);
					sheet.addCell(Label12);
					sheet.addCell(Label13);
					sheet.addCell(Label14);


				} catch (RowsExceededException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (WriteException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
			
			
			}else {
				//选中导出
				String[] Strs=Str.split(",");
				for (int i = 0; i <Strs.length; i++) {
					String star="";
					int id=Integer.parseInt(Strs[i]);
					StudentInfoBean sib=us.getInfoByUserId(id);
					Label Label1=new Label(0,i+1,i+1+"");
					Label Label2=new Label(1,i+1,sib.getStuName());
					Label Label3=new Label(2,i+1,sib.getConsultDate());
					Label Label4=new Label(3,i+1,sib.getOfflineId());
					Label Label5=new Label(4,i+1,sib.getOnlineId());
					Label Label6=new Label(5,i+1,sib.getStuTel());
					Label Label7=new Label(6,i+1,sib.getStuQq());
					Label Label8=new Label(7,i+1,sib.getStuWechat());
					Label Label9=new Label(8,i+1,sib.getStuAge()+"");
					Label Label10=new Label(9,i+1,sib.getStuSex()+"");
					Label Label11=new Label(10,i+1,sib.getConsultWay());
					for (int j = 0; j < sib.getConsultPriority(); j++) {
						star=star+"★";
					}
					Label Label13=null;
					Label Label12=new Label(11,i+1,star);
					if(sib.getIsApply()==1) {
					 Label13=new Label(12,i+1,"已报名");
					}
					if(sib.getIsApply()!=1) {
					 Label13=new Label(12,i+1,"未报名");
					}
					Label Label14=new Label(13,i+1,sib.getRecentRecordTime());
					try {

						sheet.addCell(Label1);
						sheet.addCell(Label2);
						sheet.addCell(Label3);
						sheet.addCell(Label4);
						sheet.addCell(Label5);
						sheet.addCell(Label6);
						sheet.addCell(Label7);
						sheet.addCell(Label8);
						sheet.addCell(Label9);
						sheet.addCell(Label10);
						sheet.addCell(Label11);
						sheet.addCell(Label12);
						sheet.addCell(Label13);
						sheet.addCell(Label14);


					} catch (RowsExceededException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (WriteException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
				}
				
			}
	
      
		response.addHeader("Content-Disposition","attachment;filename="+new String(("学员信息.xls").getBytes("GB2312"),"iso8859-1"));
		book.write();
			try {
				book.close();
			} catch (WriteException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		out.flush();
		out.close();
		
	}
	
	

	@RequestMapping("infoStudent.do")
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
		return "/stu/Student-info";

	}

	@RequestMapping("/searchStudent.do")
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
		return "stu/index";

	}

}
