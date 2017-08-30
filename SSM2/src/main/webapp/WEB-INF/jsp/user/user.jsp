<%@page import="java.util.List,com.rimi.bean.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%   
String path = request.getContextPath();   
String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Rimi | 我的资料</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <!-- VENDOR CSS -->
    <link rel="stylesheet" href="<%=basePath%>RXF/assets/vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=basePath%>RXF/assets/vendor/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="<%=basePath%>RXF/assets/vendor/linearicons/style.css">
    <!-- MAIN CSS -->
    <link rel="stylesheet" href="<%=basePath%>RXF/assets/css/main.css">
    <!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
    <link rel="stylesheet" href="<%=basePath%>RXF/assets/css/demo.css">
    <link rel="stylesheet" href="<%=basePath%>RXF/assets/css/common.css"/>
    <!-- GOOGLE FONTS -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
    <!-- ICONS -->
    <link rel="apple-touch-icon" sizes="76x76" href="<%=basePath%>RXF/assets/img/apple-icon.png">
    <link rel="icon" type="image/png" sizes="96x96" href="<%=basePath%>RXF/assets/img/favicon.png">
    <script src="<%=basePath%>RXF/assets/vendor/jquery/jquery.min.js"></script>
    <script src="<%=basePath%>RXF/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="<%=basePath%>RXF/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
    <script src="<%=basePath%>RXF/assets/scripts/klorofil-common.js"></script>
    <script type="text/javascript">
    var w,h,className;
    function getSrceenWH(){
    	w = $(window).width();
    	h = $(window).height();
    	$('#dialogBg').width(w).height(h);
    }

    window.onresize = function(){  
    	getSrceenWH();
    }  
    $(window).resize();  

    $(function(){
    	getSrceenWH();
    	
    	$('.bounceInDown').click(function(){
    		className = $(this).attr('class');
    		$('#dialogBg').fadeIn(300);
    		$('#dialog').removeAttr('class').addClass('animated '+className+'').fadeIn();
    	});
    	
    	$('.claseDialogBtn').click(function(){
    		$('#dialogBg').fadeOut(300,function(){
    			$('#dialog').addClass('bounceOutUp').fadeOut();
    		});
    	});
    });
    
    function logout(){
		 var bool = window.confirm("确定注销登录吗");
		 if(bool){//确定
			 window.location.href="logout.do";
		 }else{//取消
		 	
		 }
	}
    </script>
</head>

<body>

    <!-- WRAPPER -->
    <div id="wrapper">
        <!-- NAVBAR -->
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="brand">
                <a href="#"><span style="font-size: 35px;padding-top:20px;">Rimi</span></a>
            </div>
            <div class="container-fluid">
                <div class="navbar-btn">
                    <button type="button" class="btn-toggle-fullwidth"><i class="lnr lnr-arrow-left-circle"></i></button>
                </div>
                <div id="navbar-menu">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="<%=basePath%>RXF/assets/img/user1.png" class="img-circle" alt="Avatar"> <span>您好,${InfoUb.userName}</span> <i class="icon-submenu lnr lnr-chevron-down"></i></a>
                            <ul class="dropdown-menu">
                                <li><a href="lookInfo.do?InfoUserId=${InfoUb.userId}"><i class="lnr lnr-user"></i> <span>我的信息</span></a></li>
                                <li><a href="javascript:;" class="bounceInDown"><i class="lnr lnr-cog"></i> <span>修改密码</span></a></li>
                                <li><a href="javascript:logout()"><i class="lnr lnr-exit"></i> <span>退出登录</span></a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- LEFT SIDEBAR -->
        <div id="sidebar-nav" class="sidebar">
            <div class="sidebar-scroll">
                <nav>
                    <ul class="nav">
                        <li>
                            <a href="#subPages1" data-toggle="collapse" class="collapsed">
                                <i class="lnr lnr-home"></i> <span>学员信息</span>
                                <i class="icon-submenu lnr lnr-chevron-left"></i>
                            </a>
                            <div id="subPages1" class="collapse">
                                <ul class="nav">
                                    <li><a href="userIndex.do" class="">学员跟进</a></li>
                                    <li><a href="userAddStudent.do" class="">添加学员</a></li>
                                </ul>
                            </div>
                        </li>
                        <li>
                            <a href="#subPages" data-toggle="collapse" class="collapsed">
                                <i class="lnr lnr-user"></i> <span>用户管理</span>
                                <i class="icon-submenu lnr lnr-chevron-left"></i>
                            </a>
                            <div id="subPages" class="collapse ">
                                <ul class="nav">
                                    <li><a href="queryUser.do?isok=clean" class="">用户查询</a></li>
                                    <li><a href="addUser.do" class="">添加用户</a></li>
                                </ul>
                            </div>
                        </li>
                        <li>
                            <a href="#subPages2" data-toggle="collapse" class="collapsed">
                                <i class="glyphicon glyphicon-user"></i> <span>个人信息</span>
                                <i class="icon-submenu lnr  lnr-chevron-left"></i>
                            </a>
                            <div id="subPages2" class="collapse">
                                <ul class="nav">
                                    <li><a href="lookInfo.do?InfoUserId=${InfoUb.userId}" class="">我的资料</a></li>
                                    <li><a href="javascript:;" class="bounceInDown">更改密码</a></li>
                                </ul>
                            </div>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
        <div class="main">
            <!-- MAIN CONTENT -->
            <div class="main-content">
                <div class="container-fluid">
                    <div class="panel panel-profile">
                        <div class="clearfix">
                            <!-- LEFT COLUMN -->
                            <div class="profile-left">
                                <!-- PROFILE HEADER -->
                                <div class="profile-header">
                                    <div class="overlay"></div>
                                    <div class="profile-main">
                                        <img src="<%=basePath%>RXF/assets/img/user1.png" class="img-circle" alt="Avatar">
                                        <h3 class="name">${InfoUb.userName}</h3>
                                        <!-- <span class="online-status status-available">Available</span> -->
                                    </div>
                                    <div class="profile-stat">
                                        <div class="row">
                                            <div class="col-md-4 stat-item">
                                                age <span>${InfoUb.userAge}</span>
                                            </div>
                                            <div class="col-md-4 stat-item">
                                                phone <span>${InfoUb.userPhone}</span>
                                            </div>
                                            <div class="col-md-4 stat-item">
                                                                                                                       角色 <span>${InfoUb.ur.roleName}</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- END PROFILE HEADER -->
                                <!-- PROFILE DETAIL -->
                                <div class="profile-detail">
                                    <div class="profile-info">
                                        <h3 class="heading">基本信息</h3>
                                         <ul class="list-unstyled list-justify" style="font-size:17px;">
                                            <li><i class="glyphicon glyphicon-user"></i>&nbsp;&nbsp;登录名 <span>${InfoUb.userLoginName}</span></li>
                                            <li><i class="glyphicon glyphicon-pencil"></i>&nbsp;&nbsp;姓名 <span>${InfoUb.userName}</span></li>
                                            <li><i class="glyphicon glyphicon-heart"></i>&nbsp;&nbsp;性别 <span>${InfoUb.sex.sexName}</span></li>
                                            <li><i class="glyphicon glyphicon-calendar"></i>&nbsp;&nbsp;年龄 <span>${InfoUb.userAge}</span></li>
                                            <li><i class="glyphicon glyphicon-flag"></i>&nbsp;&nbsp;角色 <span>${InfoUb.ur.roleName}</span></li>
                                            <li><i class="glyphicon glyphicon-star"></i>&nbsp;&nbsp;状态<span>${InfoUb.us.stateName}</span></li>
                                            <li><i class="glyphicon glyphicon-th-large"></i>&nbsp;&nbsp;职位 <span>${InfoUb.uj.jobName}</span></li>
                                            <li><i class="glyphicon glyphicon-pushpin"></i>&nbsp;&nbsp;工作状态 <span>${InfoUb.js.jobstateName}</span></li>
                                            <li><i class="glyphicon glyphicon-envelope"></i>&nbsp;&nbsp;邮箱 <span>${InfoUb.userEmail}</span></li>
                                            <li><i class="glyphicon glyphicon-earphone"></i>&nbsp;&nbsp;手机号码 <span>${InfoUb.userPhone}</span></li>
                                            <c:if test="${not empty InfoUb.userQq}">
                                            	<li><i class="glyphicon glyphicon-bell"></i>&nbsp;&nbsp;Q&nbsp;&nbsp;Q <span>${InfoUb.userQq}</span></li>
                                            </c:if>
                                            <c:if test="${not empty InfoUb.userTel}">
                                            	<li><i class="glyphicon glyphicon-phone-alt"></i>&nbsp;&nbsp;电话号码<span>${InfoUb.userTel}</span></li>
                                            </c:if>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <!-- END LEFT COLUMN -->
                            <!-- RIGHT COLUMN -->
                            <div class="profile-right">
                                <h4 class="heading">你的目标</h4>
                                <!-- AWARDS -->
                                <div class="awards">
                                    <div class="row">
                                        <div class="col-md-3 col-sm-6">
                                            <div class="award-item">
                                                <div class="hexagon">
                                                    <span class="lnr lnr-sun award-icon"></span>
                                                </div>
                                                <span>绝妙的点子</span>
                                            </div>
                                        </div>
                                        <div class="col-md-3 col-sm-6">
                                            <div class="award-item">
                                                <div class="hexagon">
                                                    <span class="lnr lnr-clock award-icon"></span>
                                                </div>
                                                <span>珍惜时间</span>
                                            </div>
                                        </div>
                                        <div class="col-md-3 col-sm-6">
                                            <div class="award-item">
                                                <div class="hexagon">
                                                    <span class="lnr lnr-magic-wand award-icon"></span>
                                                </div>
                                                <span>无惧挑战</span>
                                            </div>
                                        </div>
                                        <div class="col-md-3 col-sm-6">
                                            <div class="award-item">
                                                <div class="hexagon">
                                                    <span class="lnr lnr-heart award-icon"></span>
                                                </div>
                                                <span>爱你所爱</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- END AWARDS -->
                                <!-- TABBED CONTENT -->
                                <a role="tab" data-toggle="tab">更改你的用户信息</a>
                                <div class="tab-content">
                                    <div class="tab-pane fade in active" id="tab-bottom-left1">
                                    	<form action="updateUser.do" method="post">
	                                        <table class="table">
	                                            <tr>
	                                                <td>
	                                                    <input type="text" class="form-control" placeholder="请输入姓名..." name="userName" value="">
	                                                </td>
	                                            </tr>
	                                            <tr>
	                                                <td>
	                                                    <input type="text" class="form-control" placeholder="请输入年龄..." name="userAge" value="">
	                                                </td>
	                                            </tr>
	                                            <tr>
	                                            	<td>
	                                            		<%  List<SexBean> sex = (List)request.getAttribute("infoSex"); 
					                     					for(SexBean sex1:sex){
					                     				%>
					                     						<input type="radio" name="userSex" value="<%= sex1.getSexId()%>"/> <%= sex1.getSexName()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					                     				<% }
	                     								%>
	                                            	</td>
	                                            </tr>
	                                            <tr>
	                                                <td>
	                                                    <input type="text" class="form-control" placeholder="请输入邮箱..." name="userEamil" value="">
	                                                </td>
	                                            </tr>
	                                            <tr>
	                                                <td>
	                                                    <input type="text" class="form-control" placeholder="请输入手机..." name="userPhone" value="">
	                                                </td>
	                                            </tr>
	                                            <tr>
	                                                <td>
	                                                    <input type="text" class="form-control" placeholder="请输入QQ..." name="userQq" value="">
	                                                </td>
	                                            </tr>
	                                            <tr>
	                                                <td>
	                                                    <input type="text" class="form-control" placeholder="请输入电话..." name="userTel" value="">
	                                                </td>
	                                            </tr>	
	                                        </table>
                                        	<div class="margin-top-30 text-center">
                                        		<button type="submit" class="btn btn-primary" type="button">更新</button> 
                                        	</div>
                                        </form>
                                    </div>

                                </div>
                                <!-- END TABBED CONTENT -->
                            </div>
                            <!-- END RIGHT COLUMN -->
                        </div>
                    </div>
                </div>
            </div>
            <!-- END MAIN CONTENT -->
        </div>
        <!-- END LEFT SIDEBAR -->
        <div class="clearfix"></div>
		<footer>
	        <div class="container-fluid">
	            <p class="copyright">&copy; 2017 <a href="http://www.rimiedu.com/" title="睿峰培训" target="_blank">睿峰培训</a></p>
	        </div>
    	</footer>
    </div>
    <!-- END WRAPPER -->  
     <div>
		<div id="dialogBg"></div>
		<div id="dialog" class="animated">
			<img class="dialogIco" width="50" height="50" src="<%=basePath%>RXF/assets/img/ico.png" alt="" />
			<div class="dialogTop">
				<a href="javascript:;" class="claseDialogBtn">关闭</a>
			</div>
			<iframe src="password.do" frameborder="0" scrolling="no" style="width: 300px; height: 300px;">
			</iframe>
		</div>
	</div>
</body>

</html>
	