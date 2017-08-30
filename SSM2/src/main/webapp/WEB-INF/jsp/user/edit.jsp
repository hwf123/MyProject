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
 	<title>Rimi | 修改用户</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <!-- VENDOR CSS -->
    <link rel="stylesheet" href="<%=basePath%>RXF/assets/vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=basePath%>RXF/assets/vendor/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="<%=basePath%>RXF/assets/vendor/linearicons/style.css">
    <link rel="stylesheet" href="<%=basePath%>RXF/assets/vendor/chartist/css/chartist-custom.css">
    <!-- MAIN CSS -->
    <link rel="stylesheet" href="<%=basePath%>RXF/assets/css/main.css">
    <!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
    <link rel="stylesheet" href="<%=basePath%>RXF/assets/css/demo.css">
    <link rel="stylesheet" href="<%=basePath%>RXF/assets/css/common.css"/>
    <!-- GOOGLE FONTS -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">

    <script src="<%=basePath%>RXF/assets/vendor/jquery/jquery.min.js"></script>
    <script src="<%=basePath%>RXF/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="<%=basePath%>RXF/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
    <script src="<%=basePath%>RXF/assets/vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
    <script src="<%=basePath%>RXF/assets/vendor/chartist/js/chartist.min.js"></script>
    <script src="<%=basePath%>RXF/assets/scripts/klorofil-common.js"></script>
    <script type="text/javascript">
        function checkall() {
            var alls = document.getElementsByName("check");
            var ch = document.getElementById("checkall");
            if (ch.checked) {
                for (var i = 0; i < alls.length; i++) {
                    alls[i].checked = true;
                }
            } else {
                for (var i = 0; i < alls.length; i++) {
                    alls[i].checked = false;
                }
            }
        }

        function delAll() {
            var alls = document.getElementsByName("check");
            var ids = new Array();
            for (var i = 0; i < alls.length; i++) {
                if (alls[i].checked) {
                    ids.push(alls[i].value);
                }
            }
            if (ids.length > 0) {
                if (confirm("确认操作?")) {
                    alert("成功!");
                }
            } else {
                alert("请选中要操作的项");
            }
        }

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
	     	
            $('#backid').click(function() {
                window.location.href = "queryUser.do?isok=clean";
            });
            
            $("#userPs1").change(function(){
	        	$("#sp1").html("<font color='red'>√</font>");
	        });
	        $("#userPs2").change(function(){
	        	var userPs1 =$.trim($("#userPs1").val());
		        var userPs2 = $.trim($("#userPs2").val());
	        	if(equals(userPs1,userPs2) != true){
	        		$("#sp2").html("<font color='red'>两次密码不一致</font>");
		        }else{
		        	$("#sp2").html("<font color='red'>√</font>");
		        }
	        });
	        
	        var userSex1 =$("#userSex").val();
	        var userState1 =$("#userState").val();
	        $("input:radio[name='userSex'][value="+userSex1+"]").attr('checked','true');	
	        $("input:radio[name='userState'][value="+userState1+"]").attr('checked','true');
	        
	        var userRole1 = $("#selRole").val();
       		$("#selUserRole").val(userRole1);
       		
       		var userJob1 = $("#selJob").val();
       		$("#selUserJob").val(userJob1);
       		
       		var userJobState1 = $("#selJobState").val();
       		$("#selUserJobState").val(userJobState1);
	        
        });
        
        function equals(str1,str2) {
			if(str1 == str2){
				return true;
			}
				return false;
		}
        
        function logout(){
			 var bool = window.confirm("确定注销登录吗");
			 if(bool){//确定
				 window.location.href="logout.do";
			 }else{//取消
			 	
			 }
		}
    </script>
    <style type="text/css">
        .tableleft {
            background-color: #f5f5f5;
        }
    </style>
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
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="<%=basePath%>RXF/assets/img/user1.png" class="img-circle" alt="Avatar"> <span>您好,${editUb.userName}</span> <i class="icon-submenu lnr lnr-chevron-down"></i></a>
                            <ul class="dropdown-menu">
                                <li><a href="lookInfo.do?InfoUserId=${editUb.userId}"><i class="lnr lnr-user"></i> <span>我的信息</span></a></li>
                                <li><a href="javascript:;" class="bounceInDown"><i class="lnr lnr-cog"></i> <span>修改密码</span></a></li>
                                <li><a href="javascript:logout()"><i class="lnr lnr-exit"></i> <span>退出登录</span></a></li>
                            </ul>
                        </li>
                    </ul>
                </div>

            </div>
        </nav>
        <!-- END NAVBAR -->
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
                                    <li><a href="lookInfo.do?InfoUserId=${editUb.userId}" class="">我的资料</a></li>
                                    <li><a href="javascript:;" class="bounceInDown">更改密码</a></li>
                                </ul>
                            </div>
                        </li>
                   </ul>
                </nav>
            </div>
        </div>
        <!-- END LEFT SIDEBAR -->
        <div class="main">
            <div class="panel">
                <div class="panel-heading">
                    <h3 class="panel-title">修改用户</h3>
                    <div class="right">
                        <button type="button" class="btn-toggle-collapse"><i class="lnr lnr-chevron-up"></i></button>
                    </div>
                </div>
                <div class="panel-body no-padding">
                    <form action="editUser.do" method="post" class="definewidth m20">
                        <table class="table table-bordered table-hover definewidth m10">
                            <tr>
                                <td width="10%" class="tableleft">
                                    <center><i class="glyphicon glyphicon-user"></i>&nbsp;&nbsp;用户账号</center></td>
                                <td width="40%"><input type="email" name="userLoginName" value="${ub1.userLoginName}" readonly="readonly"/></td>
                                <td width="10%" class="tableleft">
                                    <center><i class="glyphicon glyphicon-pencil"></i>&nbsp;&nbsp;用户姓名</center></td>
                                <td width="40%"><input type="text" name="userName" value="${ub1.userName}" /></td>
                            </tr>
                            <tr>
                                <td width="10%" class="tableleft">
                                    <center><i class="glyphicon glyphicon-lock"></i>&nbsp;&nbsp;输入密码</center></td>
                                <td width="40%">
                                	<input type="password" name="" value="" id="userPs1"/>
                                	<span id="sp1"></span>
                                </td>
                                <td width="10%" class="tableleft">
                                    <center><i class="glyphicon glyphicon-lock"></i>&nbsp;&nbsp;确认密码</center></td>
                                <td width="40%">
                                	<input type="password" name="userPs" value="" id="userPs2"/>
                                	<span id="sp2"></span>
                                </td>
                            </tr>
                            <tr>
                                <td width="10%" class="tableleft">
                                    <center><i class="glyphicon glyphicon-heart"></i>&nbsp;&nbsp;用户性别</center></td>
                                <td width="40%">
                                	<input type="hidden" id="userSex" value="${ub1.userSex}"/>
                                	<%  List<SexBean> sex = (List)request.getAttribute("editSex"); 
                     					for(SexBean sex1:sex){
                     				%>
                     						<input type="radio" name="userSex" value="<%= sex1.getSexId()%>"/> <%= sex1.getSexName()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     				<% }
                     				%>
                                    <!-- <input type="radio" name="userSex" value="1"/> 男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="radio" name="userSex" value="2" /> 女-->
                                </td>
                                <td width="10%" class="tableleft">
                                    <center><i class="glyphicon glyphicon-calendar"></i>&nbsp;&nbsp;用户年龄</center></td>
                                <td width="40%"><input type="text" name="userAge" value="${ub1.userAge}" /></td>
                            </tr>
                            <tr>
                                <td width="10%" class="tableleft">
                                     <center><i class="glyphicon glyphicon-star"></i>&nbsp;&nbsp;用户状态</center></td>
                                <td width="40%">
                                	<input type="hidden" id="userState" value="${ub1.userState}"/>
                                	<%  List<StateBean> state = (List)request.getAttribute("editState"); 
                     					for(StateBean state1:state){
                     				%>
                     						<input type="radio" name="userState" value="<%= state1.getStateId()%>"/> <%= state1.getStateName()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     				<%
                     					}
                     				%>
                                    <!-- <input type="radio" name="userState" value="1"/> 启用&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="radio" name="userState" value="2" /> 禁用 -->
                                </td>
                                <td width="10%" class="tableleft">
                                     <center><i class="glyphicon glyphicon-flag"></i>&nbsp;&nbsp;用户角色</center></td>
                                <td width="40%">
                                	<input type="hidden" id="selRole" value="${ub1.userRole}"/>
                                    <select name="userRole" id="selUserRole">
						        		<option value="">--请选择--</option>
						        		<c:forEach var="role" items="${editRole}">
						    				<option value="${role.roleId}">${role.roleName}</option>
						    			</c:forEach>
						        		<!-- <option value="1">管理员</option>
						        		<option value="2">普通用户</option>-->
						        	</select>
                                </td>
                            </tr>
                            <tr>
                                <td width="10%" class="tableleft">
                                    <center><i class="glyphicon glyphicon-th-large"></i>&nbsp;&nbsp;用户职位</center></td>
                                <td width="40%">
                                	<input type="hidden" id="selJob" value="${ub1.userJob}"/>
                                    <select name="userJob" id="selUserJob">
						        		<option value="">--请选择--</option>
						        		<c:forEach var="job" items="${editJob}">
						    				<option value="${job.jobId}">${job.jobName}</option>
						    			</c:forEach>
						        		<!-- <option value="1">线上咨询师</option>
						        		<option value="2">线下咨询师</option>
						        		<option value="3">无</option>-->
						        	</select>
                                </td>
                                <td width="10%" class="tableleft">
                                    <center><i class="glyphicon glyphicon-pushpin"></i>&nbsp;&nbsp;工作状态</center></td>
                                <td width="40%">
                                	<input type="hidden" id="selJobState" value="${ub1.userJobState}"/>
                                    <select name="userJobState" id="selUserJobState">
                                    	<option value="">--请选择--</option>
                                    	<c:forEach var="JobState" items="${editJobState}">
						    				<option value="${JobState.jobstateId}">${JobState.jobstateName}</option>
						    			</c:forEach>
						        		<!--<option value="1">在职</option>
						        		<option value="2">休假</option>
						        		<option value="3">离职</option>-->
						        	</select>
                                </td>
                            </tr>
                            <tr>
                                <td width="10%" class="tableleft">
                                     <center><i class="glyphicon glyphicon-envelope"></i>&nbsp;&nbsp;用户邮箱</center></td>
                                <td width="40%"><input type="email"  name="userEamil" value="${ub1.userEmail}" /></td>
                                <td width="10%" class="tableleft">
                                    <center><i class="glyphicon glyphicon-bell"></i>&nbsp;&nbsp;用&nbsp;户&nbsp;Q&nbsp;Q</center></td>
                                <td width="40%"><input type="text" name="userQq" value="${ub1.userQq}" /></td>
                            </tr>
                            <tr>
                                <td width="10%" class="tableleft">
                                    <center><i class="glyphicon glyphicon-earphone"></i>&nbsp;&nbsp;手机号码</center></td>
                                <td width="40%"><input type="text" name="userPhone" value="${ub1.userPhone}" /></td>
                                <td width="10%" class="tableleft">
                                     <center><i class="glyphicon glyphicon-phone-alt"></i>&nbsp;&nbsp;电话号码</center></td>
                                <td width="40%"><input type="text" name="userTel" value="${ub1.userTel}" /></td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <center>
                                        <button type="submit" class="btn btn-primary" type="button">更新</button> &nbsp;&nbsp;
                                        <button type="button" class="btn btn-danger" name="backid" id="backid">返回列表</button>
                                    </center>
                                </td>
                            </tr>
                        </table>
                    </form>

                </div>

            </div>
        </div>
    </div>
    <footer>
        <div class="container-fluid">
            <p class="copyright">&copy; 2017 <a href="http://www.rimiedu.com/" title="睿峰培训" target="_blank">睿峰培训</a></p>
        </div>
    </footer>
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
