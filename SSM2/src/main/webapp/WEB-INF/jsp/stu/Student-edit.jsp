<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%   
String path = request.getContextPath();   
String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <title>Dashboard | Klorofil - Free Bootstrap Dashboard Template</title>
    <meta charset="utf-8">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
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
    <!-- GOOGLE FONTS -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
    <!-- ICONS -->

    <script src="<%=basePath%>RXF/assets/vendor/jquery/jquery.min.js"></script>
    <script src="<%=basePath%>RXF/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="<%=basePath%>RXF/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
    <script src="<%=basePath%>RXF/assets/vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
    <script src="<%=basePath%>RXF/assets/vendor/chartist/js/chartist.min.js"></script>
    <script src="<%=basePath%>RXF/assets/scripts/klorofil-common.js"></script>
    <script type="text/javascript">
        var i = 1;

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

        function addlow() {

            var sourceNode = document.getElementById("low-" + 0); // 获得被克隆的节点对象 
            i++;
            var clonedNode = sourceNode.cloneNode(true);
            // 克隆节点 

           
            clonedNode.setAttribute("id", "low-" + i);// 修改一下id 值，避免id 重复 
       	
            clonedNode.style.display='block';
            clonedNode.getElementsByTagName("div")[0].innerHTML =  "+.";
            clonedNode.getElementsByTagName("a")[0].setAttribute("id", "d-" + i);
            sourceNode.parentNode.appendChild(clonedNode); // 在父节点插入克隆的节点 

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

        function inter() {
            var inter = document.getElementById("inner");
        }

        function dele(obj) {
        	 if (confirm("确认操作?")) {
                 var x = document.getElementById("papa").removeChild(obj.parentElement);

             }
            
        }
        
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
        	$('#radio11').ready(function(){

        		if(${ab.isApply}==document.getElementById('radio11').value){
        	    document.getElementById('radio11').checked=true;
        	    }else if(${ab.isApply}==document.getElementById('radio12').value){
            	    document.getElementById('radio12').checked=true;
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
        	$('#education').ready(function(){
        		$('#education').val(${sb.stuEducation});        		
        	});
        });
        $(function () {
        	$('#priority').ready(function(){
        		$('#priority').val(${cb.consultPriority});        		
        	});
        });
        $(function () {
        	$('#radio12').click(function(){
					$('#formGroupInputLarge').val("");
					$('#applyway').val(0);

        	});
        });
        $(function(){
            $("#addb").click(function(){
            	
            	var nrts=document.getElementsByName("nrt");
            	var nres=document.getElementsByName("nre");
            	
                /* var t = $("input[name='nrt']").val().trim();
                var e= $("input[name='nre']").val().trim(); */
				for (var i = 0; i < nrts.length; i++) {
					var nrt = nrts[i];
					 if(nrt.value == ""){
		                	alert("请填写完整的跟进时间")
							return false;
				}
				}
                
					 for (var i = 0; i < nres.length; i++) {
							var nre = nres[i];
							 if(nre.value == ""){
				                	alert("请填写完整的跟进记录")
									return false;
						}
					 }
            });
            
                
        });
        
        function fh(obj) {
        	if (confirm("确认返回?")) {
            	window.location.href="index.do"; 
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
                            <a href="index.do" class="dropdown-toggle" data-toggle="dropdown"><img src="<%=basePath%>RXF/assets/img/user1.png" class="img-circle" alt="Avatar"> <span>${ub.userName}</span> <i class="icon-submenu lnr lnr-chevron-down"></i></a>
                            <ul class="dropdown-menu">
                                <li><a href="#"><i class="lnr lnr-user"></i> <span>我的信息</span></a></li>
                                <li><a href="#"><i class="lnr lnr-envelope"></i> <span>Message(未实现)</span></a></li>
                                <li><a href="#"><i class="lnr lnr-cog"></i> <span>修改密码</span></a></li>
                                <li><a href="#"><i class="lnr lnr-exit"></i> <span>登出</span></a></li>
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
               <ul class="nav">
                        <li>
                            <a href="#subPages1" data-toggle="collapse" class="collapsed">
                                <i class="lnr lnr-home"></i> <span>学员信息</span>
                                <i class="icon-submenu lnr lnr-chevron-left"></i>
                            </a>
                            <div id="subPages1" class="collapse">
                                <ul class="nav">
                                    <li><a href="myindex.do" class="">学员跟进</a></li>
                                    <li><a href="addStudent.do" class="">添加学员</a></li>
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
                                    <li><a href="user.html" class="">我的信息</a></li>
                                    <li><a href="Student-add.html" class="">更改密码</a></li>
                                </ul>
                            </div>
                        </li>
                    </ul>
                </nav>

            </div>
        </div>
        <!-- END LEFT SIDEBAR -->
        <div class="main">
            <!-- MAIN CONTENT -->
            <div class="main-content">
                <div class="container-fluid">
                    <h3 class="page-title">更改学员信息</h3>
                    <form class="form-horizontal" action="editStu.do" method="post">
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
											<input type="hidden" name="stuId" value="${sb.stuId}">
											<input class="form-control" type="text" 
												value="${sb.stuName}" name="stuName">
										</div>
										<br> <label class="col-md-2 control-label"
											for="formGroupInputLarge"
											style="position: relative; right: 45px;">学员年龄:</label> <input
											type="text" class="form-control"
											style="width: 30%; position: relative; right: 45px;"
										 value=${sb.stuAge} name="stuAge"> <br> <label
											class="fancy-radio"> <input name="stuSex" value="1"
											type="radio" id="radio1" > <span><i></i>男</span>
										</label> <label class="fancy-radio"> <input name="stuSex"
											value="2" type="radio" id="radio2" >
											<span><i></i>女</span>
										</label> <br> <label class="col-md-2 control-label"
											for="formGroupInputLarge"
											style="position: relative; right: 45px;">学员电话:</label> <input
											type="text" class="form-control"
											style="width: 70%; position: relative; right: 45px;"
											 value="${sb.stuTel}" name="stuTel"> <br> <label
											class="col-md-2 control-label" for="formGroupInputLarge"
											style="position: relative; right: 45px;">学员微信:</label> <input
											type="text" class="form-control"
											style="width: 70%; position: relative; right: 45px;"
											 value="${sb.stuWechat}" name="stuWechat"> <br>
										<label class="col-md-2 control-label"
											for="formGroupInputLarge"
											style="position: relative; right: 45px;">学员QQ:</label> <input
											type="text" class="form-control"
											style="width: 70%; position: relative; right: 45px;"
											 value="${sb.stuQq}" name="stuQq"> <br> <label
											class="col-md-2 control-label" for="formGroupInputLarge"
											style="position: relative; right: 45px;">学员地址:</label> <input
											type="text" class="form-control"
											style="width: 70%; position: relative; right: 45px;"
											 value="${sb.stuRegion}" name="stuRegion"> <br>
										<label class="col-md-2 control-label"
											for="formGroupInputLarge"
											style="position: relative; right: 45px;">学历:</label> 
											<select class="form-control" style="width: 70%; position: relative; right: 45px;" name="stuEducation" id="education" >
											<option value="0">学历</option>
                                        <c:forEach var="eb" items="${ebs}" >
                                     		<option value="${eb.educationId}">${eb.educationName}</option>
                                        </c:forEach>
										</select>
										<br>
										<label class="col-md-2 control-label"
											for="formGroupInputLarge"
											style="position: relative; right: 45px;">毕业学校:</label> <input
											type="text" class="form-control"
											style="width: 70%; position: relative; right: 45px;"
											 value="${sb.stuSchool}" name="stuSchool"> <br>

										<label class="col-md-2 control-label"
											for="formGroupInputLarge"
											style="position: relative; right: 45px;">专业:</label> <input
											type="text" class="form-control"
											style="width: 70%; position: relative; right: 45px;"
											 value="${sb.stuMajor}" name="stuMajor"> <br> <br>
										<div>
											<div style="float: left">工作状态:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
											<label class="fancy-checkbox" style="float: left"> <input
												type="radio" name="stuJobstate"  id="radio3"
												value="1"> <span>在职&nbsp;&nbsp;&nbsp;</span>
											</label> <label class="fancy-checkbox" style="float: left"> <input
												type="radio" name="stuJobstate"  id="radio4"
												value="2"> <span>休假&nbsp;&nbsp;&nbsp;</span>
											</label> <label class="fancy-checkbox" style="float: left"> <input
												type="radio" name="stuJobstate"  id="radio5"
												value="3"> <span>离职</span>
											</label>
										</div>
									</div>
								</div>
                                <!-- END INPUTS -->
                                <!-- INPUT SIZING -->
                                <div class="panel">
                                    <div class="panel-heading">
                                        <h3 class="panel-title" style="float:left">报名记录</h3>
                                        <br>

                                        <br> &nbsp;
                                        <label class="fancy-radio">
										<input name="isApply" value="1" type="radio" id="radio11">
										<span><i></i>已报名</span>
									    </label>
                                        <label class="fancy-radio">
										<input name="isApply" value="2" type="radio" id="radio12">
										<span><i></i>未报名</span>
									    </label>
                                        <br>
                                         <div class="form-group form-group-md" style="position: relative;bottom:90px;left:300px;">
                                            <label class="col-md-2 control-label" for="formGroupInputLarge" style="position: relative;right: 5px;"> 学员报名时间:</label>
                                            <div class="col-md-10">
                                                <input class="form-control"  type="date" id="formGroupInputLarge" style="width:30%" value="${ab.applyTime}" name="applyTime">
                                            </div>
                                           
                                            <label class="col-md-2 control-label" for="formGroupInputLarge" style="position: relative;right: 5px;"> 学员付费方式:</label>
                                            <div class="col-md-10">
                                               <select class="form-control input-md" name="applyWay" id="applyway" style="width:30%">
							        		<option value="0" >--请选择--</option>
							        		<c:forEach var="way" items="${awb}">
							        		<c:if test="${ab.applyWay==way.applyWayId}">
							        		<option value="${way.applyWayId}" selected="selected">${way.applyWayName}</option>
							        		</c:if>
							        		<c:if test="${ab.applyWay!=way.applyWayId}">
							        		<option value="${way.applyWayId}">${way.applyWayName}</option>
							        		</c:if>
							        		</c:forEach>
							        		</select>
                                            </div>
                                        </div>
                                    </div>
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


                                        <select class="form-control" name="onlineId" value="${cb.onlineId}">
										<option value="0">线上咨询师</option>
										 <c:forEach var="on" items="${online}">
										 <c:if test="${cb.onlineId == on.userId}">
                                     		<option value="${on.userId}" selected="selected">${on.userName}</option>
                                     	</c:if>
                                     	<c:if test="${cb.onlineId != on.userId}">
                                     		<option value="${on.userId}" >${on.userName}</option>
                                     	</c:if>
                                        </c:forEach>
									</select>
                                        <br>
                                        <select class="form-control" name="offlineId" value="${cb.offlineId}">
										<option value="0">线下咨询师</option>
										 <c:forEach var="off" items="${offline}">
										 	<c:if test="${cb.offlineId == off.userId}">
	                                     		<option value="${off.userId}" selected="selected">${off.userName}</option>
										 	</c:if>
										 	<c:if test="${cb.offlineId != off.userId}">
	                                     		<option value="${off.userId}" >${off.userName}</option>
										 	</c:if>
                                        </c:forEach>
									</select>
                                        <br>
                                        <select class="form-control" name="consultCategory">
										<option value="0">咨询类别</option>
										 <c:forEach var="ccb" items="${ccbs}">
										 <c:if test="${cb.consultCategory==ccb.csCategoryId}">
                                     		<option value="${ccb.csCategoryId}" selected="selected">${ccb.csCategoryName}</option>
                                     	</c:if>
                                     	<c:if test="${cb.consultCategory!=ccb.csCategoryId}">
                                     		<option value="${ccb.csCategoryId}" >${ccb.csCategoryName}</option>
                                     	</c:if>
                                        </c:forEach>
									</select>
                                        <br>
                                        <select class="form-control" name="consultWay">
										<option value="0">咨询方式</option>
										<c:forEach var="cw" items="${cwb}">
										 <c:if test="${cb.consultWay==cw.csWayId}">
                                     		<option value="${cw.csWayId}" selected="selected">${cw.csWayName}</option>
                                     	</c:if>
                                     	<c:if test="${cb.consultWay!=cw.csWayId}">
                                     		<option value="${cw.csWayId}">${cw.csWayName}</option>
                                     	</c:if>
                                        </c:forEach>
									</select>
                                        <br>
                                        <div class="form-group form-group-md">
                                            <label class="col-md-2 control-label" for="formGroupInputLarge">学员咨询日期</label>
                                            <div class="col-md-10">
                                                <input class="form-control" type="date" id="formGroupInputLarge"  name="consultDate" value="${cb.consultDate}">
                                            </div>
                                        </div>
                                        <select class="form-control" name="consultTime">
										<option value="0">咨询时段</option>
										<c:forEach var="ctb" items="${ctbs}">
											<c:if test="${cb.consultTime==ctb.csTimeId}">
                                     		<option value="${ctb.csTimeId}" selected="selected">${ctb.csTimeName}</option>
                                     		</c:if>
                                     		<c:if test="${cb.consultTime!=ctb.csTimeId}">
                                     		<option value="${ctb.csTimeId}" >${ctb.csTimeName}</option>
                                     		</c:if>
                                        </c:forEach>
									</select>
                                        <br>
                                        <select class="form-control" name="sourcesId">
										<option value="0">平台来源</option>
										<c:forEach var="sour" items="${sours}">
										<c:if test="${cb.sourcesId==sour.sourcesId}">
                                     		<option value="${sour.sourcesId}" selected="selected">${sour.sourcesName}</option>
                                     		</c:if>
                                     		<c:if test="${cb.sourcesId!=sour.sourcesId}">
                                     		<option value="${sour.sourcesId}" >${sour.sourcesName}</option>
                                     		</c:if>
                                        </c:forEach>

									</select>
                                        <br>
                                        <select class="form-control" name="consultPriority" id="priority">
										<option value="0">商情优先级</option>
										<option value="1">★</option>
										<option value="2">★★</option>
										<option value="3">★★★</option>
				                        <option value="4">★★★★</option>
				                        <option value="5">★★★★★</option>

									</select>
                                        <br>
                                        <div class="form-group form-group-md">
                                            <label class="col-md-2 control-label" for="formGroupInputLarge">学员到访时间</label>
                                            <div class="col-md-10">
                                                <input class="form-control" type="date" id="formGroupInputLarge"  name="visitTime" value="${cb.visitTime}">
                                            </div>
                                        </div>

                                        <textarea class="form-control" placeholder="备注" rows="4" style="resize:none" name="consultRemark" >${cb.consultRemark}</textarea>



                                    </div>
                                </div>
                                <div class="panel">
                                    <div class="panel-heading">
                                        <h3 class="panel-title" style="float:left">跟进记录</h3>
                                        <a href="#" style="float:left;position: relative;top: 2px;left: 4px;" onclick="addlow()"><i class="fa fa-plus-square" ></i></a>


                                    </div>
                                    <br>
                                    <div class="panel-body" id="papa">
                                     <c:forEach var="nb" items="${nbs}" varStatus="status"> 
										<div id="low-${status.index+1}">
											<div style="float: left" class="control-label">${status.index+1}.</div>
											<div style="float: left" class="control-label">跟进时间:&nbsp;&nbsp;&nbsp;&nbsp;</div>
											<input type="date" class="form-control input-sm" name="nrt"
												style="width: 20%; float: left" value="${nb.newrecordTime}" name="nrt" >
											<div style="float: left">&nbsp;&nbsp;&nbsp;</div>
											<input class="form-control input-sm" placeholder="请输入跟进记录"
												type="text" style="width: 58%; float: left" value="${nb.newrecordExplain}"  name="nre"> 
												<div style="float:left">&nbsp;&nbsp;</div>
                                            <a href="#" style="float:left;position: relative;top: 7px;" onclick="dele(this)" id="d-${nb.newrecordId}"><span class="label label-danger" class="control-label">删除</span></a>
												<br>
											<br>
										</div>
									</c:forEach> 
									<div id="low-0" style="display: none">
                                            <div style="float:left" class="control-label">1.</div>
                                            <div style="float:left" class="control-label">跟进时间:&nbsp;&nbsp;&nbsp;&nbsp;</div>
                                            <input type="date" class="form-control input-sm"  style="width:20%;float:left" name="nrt">
                                            <div style="float:left">&nbsp;&nbsp;&nbsp;</div>
                                            <input class="form-control input-sm" placeholder="请输入跟进记录" type="text" style="width:58%;float:left" name="nre">
                                            <div style="float:left">&nbsp;&nbsp;</div>
                                            <a href="#" style="float:left;position: relative;top:8px;" onclick="dele(this)"><span class="label label-danger" class="control-label">删除</span></a>
                                            <br>
                                            <br>
                                        </div>
                                        






                                    </div>

                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <button type="submit" class="btn btn-primary btn-lg btn-block"  id="addb">修改</button>
                                    </div>
                                    <div class="col-md-6">
                                        <button type="button" class="btn btn-danger btn-lg btn-block" onclick="fh()">返回</button>
                                    </div>
                                </div>
                                <!-- END LABELS -->
                                <!-- PROGRESS BARS -->



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
            <p class="copyright">&copy; 2017 <a href="http://www.rimiedu.com/" title="睿峰培训" target="_blank">睿峰培训</a></p>
        </div>
    </footer>
    <!-- END WRAPPER -->
    <!-- Javascript -->

</body>

</html>
