<%@page import="java.util.List,com.rimi.bean.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%   
String path = request.getContextPath();   
String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <title>Rimi | 用户查询</title>
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
	<link rel="apple-touch-icon" sizes="76x76" href="<%=basePath%>RXF/assets/img/apple-icon.png">
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
	            for (var i = 0; i < alls.length; i++) {
	                if (alls[i].checked) {
	                	var id = alls[i].value;
						if(delStr ==""){//第一个编号
							delStr = id;
						}else{
							delStr = delStr+","+id;	
						}
	                }
	            }
	            if (delStr !="") {
	            	if (confirm("确认操作?")) {
	                	window.location.href="delAllUser.do?delIds="+delStr;
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

       		var userRole1 = $("#selRole").val();
       		$("#selUserRole").val(userRole1);
       		
       		var userState1 = $("#selState").val();
       		$("#selUserState").val(userState1);
       		
       		var userJob1 = $("#selJob").val();
       		$("#selUserJob").val(userJob1);
       		
       		var userJobState1 = $("#selJobState").val();
       		$("#selUserJobState").val(userJobState1);
    	});
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
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="<%=basePath%>RXF/assets/img/user1.png" class="img-circle" alt="Avatar"> <span>您好,${queryUb.userName}</span> <i class="icon-submenu lnr lnr-chevron-down"></i></a>
                            <ul class="dropdown-menu">
                                <li><a href="lookInfo.do?InfoUserId=${queryUb.userId}"><i class="lnr lnr-user"></i> <span>我的信息</span></a></li>
                                <li><a href="javascript:;" class="bounceInDown"><i class="lnr lnr-cog"></i> <span>修改密码</span></a></li>
                                <li><a href=""><i class="lnr lnr-exit"></i> <span>退出登录</span></a></li>
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
                                    <li><a href="stuindex.html" class="">学员跟进</a></li>
                                    <li><a href="Student-add.html" class="">添加学员</a></li>
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
                                    <li><a href="lookInfo.do?InfoUserId=${queryUb.userId}" class="">我的资料</a></li>
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
                    <div class="right">
                        <button type="button" class="btn-toggle-collapse"><i class="lnr lnr-chevron-up"></i></button>
                    </div>
                </div>
                <div class="panel-body no-padding">
                    <form action="queryUser.do" method="post" class="definewidth m20">
                        <table class="table table-striped table-hover definewidth m20">
                            <tr>
                                <td width="10%" class="tableleft">用户名称：</td>
                                <td width="23%"><input type="text" name="userLoginName" value="${userLoginName1}" placeholder="请输入用户名称"/></td>

                                <td width="10%" class="tableleft">用户角色：</td>
                                <td width="23%">
                                	<input type="hidden" id="selRole" value="${userRole1}"/>
                                    <select name="userRole" id="selUserRole">
						        		<option value="">--请选择--</option>
						        		<c:forEach var="role" items="${queryRole}">
						    				<option value="${role.roleId}">${role.roleName}</option>
						    			</c:forEach>
						        		<!-- <option value="1">管理员</option>
						        		<option value="2">普通用户</option>-->
						        	</select>
                                </td>

                                <td width="10%" class="tableleft">用户状态：</td>
                                <td width="23%">
                                	<input type="hidden" id="selState" value="${userState1}"/>
                                    <select name="userState" id="selUserState">
						        		<option value="">--请选择--</option>
						        		<c:forEach var="state" items="${queryState}">
						    				<option value="${state.stateId}">${state.stateName}</option>
						    			</c:forEach>
						        		<!--<option value="1">启用</option>
						        		<option value="2">禁用</option>  -->
						        	</select>
                                </td> 
                            </tr>
                            <tr>
                            	<td width="10%" class="tableleft">用户职业：</td>
                                <td width="23%">
                                	<input type="hidden" id="selJob" value="${userJob1}"/>
                                    <select name="userJob" id="selUserJob">
						        		<option value="">--请选择--</option>
						        		<c:forEach var="job" items="${queryJob}">
						    				<option value="${job.jobId}">${job.jobName}</option>
						    			</c:forEach>
						        		<!--<option value="1">线上咨询师</option>
						        		<option value="2">线下咨询师</option>
						        		<option value="3">无</option>  -->
						        	</select>
                                </td>
                            
                                <td width="10%" class="tableleft">工作状态：</td>
                                <td width="23%">
                                	<input type="hidden" id="selJobState" value="${userJobState1}"/>
                                    <select name="userJobState" id="selUserJobState">
						        		<option value="">--请选择--</option>
						        		<c:forEach var="JobState" items="${queryJobState}">
						    				<option value="${JobState.jobstateId}">${JobState.jobstateName}</option>
						    			</c:forEach>
						        		<!-- <option value="1">在职</option>
						        		<option value="2">休假</option>
						        		<option value="3">离职</option> -->
						        	</select>
                                </td>
                                <td colspan="2">
                                    <div class="col-md-12 text-right">
                                        <button type="submit" class="btn btn-primary" type="button">查询</button>
                                        <button type="button" class="btn btn-primary" type="button" id="clean">清空</button>
                                        <script type="text/javascript">
	                                        $("#clean").click(function() {                                
	                                        	window.location.href="queryUser.do?isok=clean";
	                                        });
                                    	</script>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
            <div class="panel">
                <div class="panel-heading">
                    <h3 class="panel-title">用户信息</h3>
                    <div class="right">
                        <button type="button" class="btn-toggle-collapse"><i class="lnr lnr-chevron-up"></i></button>
                    </div>
                </div>
                <div class="panel-body no-padding">
                    <table class="table table-bordered table-hover definewidth m10">
                        <thead>
                            <tr>
                                <th width="4%"><input type="checkbox" id="checkall" onChange="checkall();"></th>
                                <th width="4%"  style="text-align:center;">序号</th>
                                <th width="10%" style="text-align:center;">用户账户</th>
                                <th width="10%" style="text-align:center;">真实姓名</th>
                                <th width="10%" style="text-align:center;">用户性别</th>
                                <th width="10%" style="text-align:center;">用户职业</th>
                                <th width="10%" style="text-align:center;">工作状态</th>
                                <th width="10%" style="text-align:center;">用户角色</th>
                                <th width="10%" style="text-align:center;">用户状态</th>
                                <th width="10%" style="text-align:center;">用户电话</th>
                                <th width="12%" style="text-align:center;">用户操作</th>
                            </tr>
                        </thead>
                        <%
                        	int pageSize = Integer.parseInt((String) request.getAttribute("pageSize"));
                        	int nowPage =  Integer.parseInt((String) request.getAttribute("nowPage"));
                        	int a =pageSize*(nowPage-1)+1;
                        %>
                        <c:forEach var="users" items="${users}">
                        <tr>
                            <td style="vertical-align:middle;"><input type="checkbox" name="check" value="${users.userId}"></td>
                            <td style="text-align:center;"><%= a++ %></td>
                            <td style="text-align:center;">${users.userLoginName}</td>
                            <td style="text-align:center;">${users.userName}</td>
                            <td style="text-align:center;">${users.sex.sexName}</td>
                            <td style="text-align:center;">${users.uj.jobName}</td>
                            <td style="text-align:center;">${users.js.jobstateName}</td>
                            <td style="text-align:center;">${users.ur.roleName}</td>
                            <td style="text-align:center;">${users.us.stateName}</td>
                            <td style="text-align:center;">${users.userPhone}</td>
                            <td style="text-align:center;">
                                <a href='userInfo.do?userId=${users.userId}'><span class="label label-primary">详情</span></a>
                                <a href='editUser1.do?userId=${users.userId}'><span class="label label-info">编辑</span></a>
                                <c:if test="${users.ur.roleName == '管理员'}">
                                	<a href='#' title="管理员不可删除" ><span class="label label-danger">禁删</span></a>
                                </c:if>
                                <c:if test="${users.ur.roleName == '普通用户'}">
                                	<a href='delUserById.do?userId=${users.userId}'><span class="label label-danger">删除</span></a>
                                </c:if>
                            </td>
                        </tr>
                        </c:forEach>
                        <tr>
                            <td colspan="16">
                                <div class="col-md-6 text-left inline pull-left page">
                                	<a href="queryUser.do?nowPage=1" class="page1">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="queryUser.do?nowPage=${nowPage-1}" class="page1">上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="queryUser.do?nowPage=${nowPage+1}" class="page1">下一页</a>&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="queryUser.do?nowPage=${totalPage}" class="page1">尾页</a>&nbsp;&nbsp;&nbsp;&nbsp;
                                    <span class='current'>共${count}条记录</span>
                                    <span class='current'> 第${nowPage}/${totalPage }页</span>&nbsp;&nbsp;
                                    <input type="text" placeholder="${nowPage}" id="forword" value="" />
                                    <script type="text/javascript">
                                        $("#forword").keydown(function() {                                
                                            if (event.keyCode == "13") {
                                            	var choosePage = $("#forword").val();
                                            	//alert(choosePage);
                                            	window.location.href = "queryUser.do?nowPage="+choosePage;                           
                                            }
                                        });
                                    </script>
                                </div>
                                <div class=" col-md-6 text-right">
                                    <button type="submit" class="btn btn-primary" type="button" id="proDel">删除</button>
                                    <button type="submit" class="btn btn-primary" type="button" id="proExcel">导出</button>
                                    <script type="text/javascript">
								     $(function () {
								    		$("#example_top").popover({placement:'top'});
								    								    	 
								    	 	var delStr ="";
								    	 	var str=sessionStorage.getItem("proIds");
								    	 	if(str == null){
								    	 		str="";
								    	 	}
								    	 	
											//获得页
											var pages = document.getElementsByClassName("page1");
											//循环遍历										
											for(var i = 0; i <pages.length; i++){
												pages[i].addEventListener("click",function(){
													var checks=document.getElementsByName("check");
													for (var i = 0; i <checks.length; i++) {
														//每次循环拿到一个多选框
														var c = checks[i];
														//判断多选框是否被选中												
														if(c.checked == true){
															var id = c.value;
															if(str ==""){//第一个编号
																str = id;
															}else{
																str = str+","+id;	
															}
														}
													}
													sessionStorage.setItem("proIds",str);
												});
											}											
									    	$('#proExcel').click(function(){
										    		var checks=document.getElementsByName("check");
													for (var i = 0; i <checks.length; i++) {
														//每次循环拿到一个多选框
														var c = checks[i];
														//判断多选框是否被选中												
														if(c.checked == true){
															var id = c.value;
															if(str ==""){//第一个编号
																str = id;
															}else{
																str = str+","+id;	
															}
														}
													}
													if(str ==""){
														alert("没有选中项，请选择");
													}else{
														window.location.href="OutExcel.do?ids="+str;
													}	
											 	});
									    	
									    	$('#proDel').click(function(){
									    	 	var alls=document.getElementsByName("check");
												var ids=new Array();
												for(var i=0;i<alls.length;i++){
													if(alls[i].checked){
														ids.push(alls[i].value);
													}		
												}
												if(ids.length>0){
													if(confirm("删除后不可恢复，确定删除?")){
														delStr = ids.join(',');
														window.location.href="delAllUser.do?delIds="+delStr;
													}else{
														window.location.href="queryUser.do?isok=clean";
													}
												}else{
													alert("请选中要操作的项");
												}
									     	});
									     });								     							     
								 	</script>
                                </div>
                            </td>
                        </tr>
                    </table>
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