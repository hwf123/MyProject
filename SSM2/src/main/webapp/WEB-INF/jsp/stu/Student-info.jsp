<%@page import="org.springframework.http.HttpRequest"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<title>Dashboard | Klorofil - Free Bootstrap Dashboard Template</title>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<!-- VENDOR CSS -->
<link rel="stylesheet"
	href="<%=basePath%>RXF/assets/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=basePath%>RXF/assets/vendor/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
	href="<%=basePath%>RXF/assets/vendor/linearicons/style.css">
<link rel="stylesheet"
	href="<%=basePath%>RXF/assets/vendor/chartist/css/chartist-custom.css">
<!-- MAIN CSS -->
<link rel="stylesheet" href="<%=basePath%>RXF/assets/css/main.css">
<!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
<link rel="stylesheet" href="<%=basePath%>RXF/assets/css/demo.css">
<!-- GOOGLE FONTS -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700"
	rel="stylesheet">
<!-- ICONS -->

<script src="<%=basePath%>RXF/assets/vendor/jquery/jquery.min.js"></script>
<script
	src="<%=basePath%>RXF/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
<script
	src="<%=basePath%>RXF/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<script
	src="<%=basePath%>RXF/assets/vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
<script src="<%=basePath%>RXF/assets/vendor/chartist/js/chartist.min.js"></script>
<script src="<%=basePath%>RXF/assets/scripts/klorofil-common.js"></script>
<script type="text/javascript">
    $(function () {
    	$('#radio1').ready(function(){

    		if(${sb.stuSex}==document.getElementById('radio1').value){
    	    document.getElementById('radio1').checked=true;
    	    }else if(${sb.stuSex}==document.getElementById('radio2').value){
        	    document.getElementById('radio2').checked=true;
    	    }
    	});
    });
    
    $(function () {
    	$('#radio3').ready(function(){

    		if(${sb.stuJobstate}==document.getElementById('radio3').value){
    	    document.getElementById('radio3').checked=true;
    	    }else if(${sb.stuJobstate}==document.getElementById('radio4').value){
        	    document.getElementById('radio4').checked=true;
    	    }else if(${sb.stuJobstate}==document.getElementById('radio5').value){
        	    document.getElementById('radio5').checked=true;
    	    }
    	});
    });
    
    $(function () {
    	$('#radio6').ready(function(){
    		if(${stu_ab.isApply}==document.getElementById('radio6').value){
    	    document.getElementById('radio6').checked=true;
    	    }else if(${stu_ab.isApply}==document.getElementById('radio7').value){
        	    document.getElementById('radio7').checked=true;
    	    }
    	});
    });
        
    </script>


</head>

<body>
	<!-- WRAPPER -->
	<div id="wrapper">
		<!-- NAVBAR -->
		<nav class="navbar navbar-default navbar-fixed-top">
		<div class="brand">
			<a href="#"><span style="font-size: 35px; padding-top: 20px;">Rimi</span></a>
		</div>
		<div class="container-fluid">
			<div class="navbar-btn">
				<button type="button" class="btn-toggle-fullwidth">
					<i class="lnr lnr-arrow-left-circle"></i>
				</button>
			</div>
			<div id="navbar-menu">
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a href="index.do" class="dropdown-toggle"
						data-toggle="dropdown"><img
							src="<%=basePath%>RXF/assets/img/user1.png" class="img-circle"
							alt="Avatar"> <span>${ub.userName}</span> <i
							class="icon-submenu lnr lnr-chevron-down"></i></a>
						<ul class="dropdown-menu">
							<li><a href="#"><i class="lnr lnr-user"></i> <span>我的信息</span></a></li>
							<li><a href="#"><i class="lnr lnr-envelope"></i> <span>Message(未实现)</span></a></li>
							<li><a href="#"><i class="lnr lnr-cog"></i> <span>修改密码</span></a></li>
							<li><a href="#"><i class="lnr lnr-exit"></i> <span>登出</span></a></li>
						</ul></li>
				</ul>
			</div>

		</div>
		</nav>
		<!-- END NAVBAR -->
		<!-- LEFT SIDEBAR -->
		<div id="sidebar-nav" class="sidebar">
			<div class="sidebar-scroll">
				<ul class="nav">
					<li><a href="#subPages1" data-toggle="collapse"
						class="collapsed"> <i class="lnr lnr-home"></i> <span>学员信息</span>
							<i class="icon-submenu lnr lnr-chevron-left"></i>
					</a>
						<div id="subPages1" class="collapse">
							<ul class="nav">
								<li><a href="myindex.do" class="">学员跟进</a></li>
								<li><a href="addStudent.do" class="">添加学员</a></li>
							</ul>
						</div></li>
					<li><a href="#subPages2" data-toggle="collapse"
						class="collapsed"> <i class="glyphicon glyphicon-user"></i> <span>个人信息</span>
							<i class="icon-submenu lnr  lnr-chevron-left"></i>
					</a>
						<div id="subPages2" class="collapse">
							<ul class="nav">
								<li><a href="user.html" class="">我的信息</a></li>
								<li><a href="Student-add.html" class="">更改密码</a></li>
							</ul>
						</div></li>
				</ul>
				</nav>

			</div>
		</div>
		<!-- END LEFT SIDEBAR -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<h3 class="page-title">学员详情</h3>
					<form class="form-horizontal" action="main" method="post">
						<div class="row">
							<div class="col-md-6">
								<!-- BUTTONS -->

								<!-- END BUTTONS -->
								<!-- INPUTS -->
								<div class="panel">
									<div class="panel-heading">
										<h3 class="panel-title">学员基本信息</h3>
									</div>

									<div class="panel-body">
										<label class="col-md-2 control-label"
											for="formGroupInputLarge"
											style="position: relative; right: 45px;">学员姓名:</label>
										<div class="input-group"
											style="width: 30%; position: relative; right: 45px;">
											<span class="input-group-addon"><i class="fa fa-user"></i></span>

											<input class="form-control" type="text" disabled="disabled"
												value=${sb.stuName} >
										</div>
										<br> <label class="col-md-2 control-label"
											for="formGroupInputLarge"
											style="position: relative; right: 45px;">学员年龄:</label> <input
											type="text" class="form-control"
											style="width: 30%; position: relative; right: 45px;"
											disabled="disabled" value=${sb.stuAge}> <br> <label
											class="fancy-radio"> <input name="gender" value="1"
											type="radio" id="radio1" disabled="disabled"> <span><i></i>男</span>
										</label> <label class="fancy-radio"> <input name="gender"
											value="2" type="radio" id="radio2" disabled="disabled">
											<span><i></i>女</span>
										</label> <br> <label class="col-md-2 control-label"
											for="formGroupInputLarge"
											style="position: relative; right: 45px;">学员电话:</label> <input
											type="text" class="form-control"
											style="width: 70%; position: relative; right: 45px;"
											disabled="disabled" value=${sb.stuTel}> <br> <label
											class="col-md-2 control-label" for="formGroupInputLarge"
											style="position: relative; right: 45px;">学员微信:</label> <input
											type="text" class="form-control"
											style="width: 70%; position: relative; right: 45px;"
											disabled="disabled" value=${sb.stuWechat}> <br>
										<label class="col-md-2 control-label"
											for="formGroupInputLarge"
											style="position: relative; right: 45px;">学员QQ:</label> <input
											type="text" class="form-control"
											style="width: 70%; position: relative; right: 45px;"
											disabled="disabled" value=${sb.stuQq}> <br> <label
											class="col-md-2 control-label" for="formGroupInputLarge"
											style="position: relative; right: 45px;">学员地址:</label> <input
											type="text" class="form-control"
											style="width: 70%; position: relative; right: 45px;"
											disabled="disabled" value=${sb.stuRegion}> <br>
										<label class="col-md-2 control-label"
											for="formGroupInputLarge"
											style="position: relative; right: 45px;">学历:</label> <input
											type="text" class="form-control"
											style="width: 70%; position: relative; right: 45px;"
											disabled="disabled" value=${eb.educationName}> <br>

										<label class="col-md-2 control-label"
											for="formGroupInputLarge"
											style="position: relative; right: 45px;">毕业学校:</label> <input
											type="text" class="form-control"
											style="width: 70%; position: relative; right: 45px;"
											disabled="disabled" value=${sb.stuSchool}> <br>

										<label class="col-md-2 control-label"
											for="formGroupInputLarge"
											style="position: relative; right: 45px;">专业:</label> <input
											type="text" class="form-control"
											style="width: 70%; position: relative; right: 45px;"
											disabled="disabled" value=${sb.stuMajor}> <br> <br>
										<div>
											<div style="float: left">工作状态:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
											<label class="fancy-checkbox" style="float: left"> <input
												type="radio" name="job" disabled="disabled" id="radio3"
												value="1"> <span>在职&nbsp;&nbsp;&nbsp;</span>
											</label> <label class="fancy-checkbox" style="float: left"> <input
												type="radio" name="job" disabled="disabled" id="radio4"
												value="2"> <span>休假&nbsp;&nbsp;&nbsp;</span>
											</label> <label class="fancy-checkbox" style="float: left"> <input
												type="radio" name="job" disabled="disabled" id="radio5"
												value="3"> <span>离职</span>
											</label>
										</div>
									</div>
								</div>
								<!-- END INPUTS -->
								<!-- INPUT SIZING -->

								<div class="panel">
									<div class="panel-heading">
										<h3 class="panel-title" style="float: left">报名记录</h3>
										<br> <br> &nbsp; <label class="fancy-radio">
											<input type="radio" value="1" id="radio6" disabled="disabled"
											name="enlist"> <span><i></i>已报名</span>
										</label> <label class="fancy-radio"> <input type="radio"
											value="2" id="radio7" disabled="disabled" name="enlist">
											<span><i></i>未报名</span>
										</label> <br>
										<div class="form-group form-group-md">
											<label class="col-md-2 control-label"
												for="formGroupInputLarge"
												style="position: relative; right: 5px;">学员报名时间:</label>
											<div class="col-md-10">
												<input class="form-control" type="date"
													id="formGroupInputLarge" placeholder="Large input"
													style="width: 30%" value="${stu_ab.applyTime}"
													disabled="disabled">
											</div>
											<br> <br> <label class="col-md-2 control-label"
												for="formGroupInputLarge"
												style="position: relative; right: 5px;">学员付费方式:</label>
											<div class="col-md-10">
												<input type="text" class="form-control"
													style="width: 30%; float: left" disabled="disabled"
													value=${stu_abw.applyWayName}>



											</div>
										</div>
										<br>

									</div>
									<br>
								</div>

								<!-- END INPUT SIZING -->
							</div>
							<div class="col-md-6">
								<!-- LABELS -->
								<div class="panel">
									<div class="panel-heading">
										<h3 class="panel-title">咨询概要</h3>
									</div>

									<div class="panel-body">


										<label class="col-md-2 control-label"
											for="formGroupInputLarge">线上咨询师:</label> <input type="text"
											class="form-control" style="width: 65%;" disabled="disabled"
											value=${online.userName}> <br> <label
											class="col-md-2 control-label" for="formGroupInputLarge">线下咨询师:</label>
										<input type="text" class="form-control" style="width: 65%;"
											disabled="disabled" value=${offline.userName}> <br>
										<label class="col-md-2 control-label"
											for="formGroupInputLarge">咨询类别:</label> <input type="text"
											class="form-control" style="width: 65%;" disabled="disabled"
											value=${ccb.csCategoryName}> <br> <label
											class="col-md-2 control-label" for="formGroupInputLarge">咨询方式:</label>
										<input type="text" class="form-control" style="width: 65%;"
											disabled="disabled" value=${cwb.csWayName}> <br>


										<label class="col-md-2 control-label"
											for="formGroupInputLarge">学员咨询日期:</label> <input
											class="form-control" type="text" id="formGroupInputLarge"
											disabled="disabled" value="${csd}" style="width: 65%;"><br>

										<label class="col-md-2 control-label"
											for="formGroupInputLarge">学员咨询时段:</label> <input
											class="form-control" type="text" id="formGroupInputLarge"
											disabled="disabled" value="${ctb.csTimeName}"
											style="width: 65%;"> <br> <label
											class="col-md-2 control-label" for="formGroupInputLarge">平台来源</label>
										<input class="form-control" type="text"
											id="formGroupInputLarge" disabled="disabled"
											value="${sour.sourcesName}" style="width: 65%;"> 
											<br>
											<label
											class="col-md-2 control-label" for="formGroupInputLarge">商情优先级</label>
											<% 
											   String star="";
											   int num=(int)request.getAttribute("pri");
											   for(int i=0;i<num;i++){
												   star=star+"★";
											   }
											%>
										<input class="form-control" type="text"
											id="formGroupInputLarge" disabled="disabled"
											value=<%=star %> style="width: 65%;" > <br>
										<label class="col-md-2 control-label"
											for="formGroupInputLarge">学员到访时间</label> <input
											class="form-control" type="text" id="formGroupInputLarge"
											value="${vt}" disabled="disabled" style="width: 65%;">
										<br>

										<textarea class="form-control" placeholder="备注" rows="4"
											style="resize: none" disabled="disabled" >${remark}</textarea>



									</div>

								</div>

								<!-- END LABELS -->
								<!-- PROGRESS BARS -->
								<div class="panel">
									<div class="panel-heading">
										<h3 class="panel-title" style="float: left">跟进记录</h3>


									</div>
									<br>
									<div class="panel-body" id="papa">
									 <c:forEach var="nb" items="${nbs}" varStatus="status"> 
										<div id="low-1-${status.index+1}">
											<div style="float: left" class="control-label">${status.index+1}.</div>
											<div style="float: left" class="control-label">跟进时间:&nbsp;&nbsp;&nbsp;&nbsp;</div>
											<input type="date" class="form-control input-sm" name="times"
												style="width: 20%; float: left" value="${nb.newrecordTime}" disabled="disabled">
											<div style="float: left">&nbsp;&nbsp;&nbsp;</div>
											<input class="form-control input-sm" placeholder="请输入跟进记录"
												type="text" style="width: 58%; float: left" value="${nb.newrecordExplain}" disabled="disabled"> <br>
											<br>
										</div>
									</c:forEach> 
									
		



									</div>

								</div>
								<button type="submit" class="btn btn-primary btn-lg btn-block">返回
								</button>


							</div>
						</div>
					</form>
				</div>
			</div>
			<!-- END MAIN CONTENT -->
		</div>
		<!-- END MAIN CONTENT -->
	</div>
	<!-- END MAIN -->
	<div class="clearfix"></div>
	<footer>
	<div class="container-fluid">
		<p class="copyright">
			&copy; 2017 <a href="http://www.rimiedu.com/" title="睿峰培训"
				target="_blank">睿峰培训</a>
		</p>
	</div>
	</footer>
	<!-- END WRAPPER -->
	<!-- Javascript -->

</body>

</html>