<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%   
String path = request.getContextPath();   
String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <title>Rimi | 学员跟进</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <!-- VENDOR CSS -->
    <link rel="stylesheet" href="<%=basePath%>RXF/assets/vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=basePath%>RXF/assets/vendor/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="<%=basePath%>RXF/assets/vendor/linearicons/style.css">
    <link rel="stylesheet" href="<%=basePath%>RXF/assets/vendor/chartist/css/chartist-custom.css">
    <link rel="stylesheet" type="text/css" media="all" href="<%=basePath%>RXF/enterlist/style.css">

    <!-- MAIN CSS -->
    <link rel="stylesheet" href="<%=basePath%>RXF/assets/css/main.css">
    <!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
    <link rel="stylesheet" href="<%=basePath%>RXF/assets/css/demo.css">
    <link rel="stylesheet" href="<%=basePath%>RXF/assets/css/common.css"/>
    <!-- GOOGLE FONTS -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">

    <script src="<%=basePath%>RXF/assets/vendor/jquery/jquery.min.js"></script>
    <script src="<%=basePath%>RXF/assets/vendor/jquery/jquery.leanModal.min.js"></script>

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
	     });
        
        $(function() {
            $('#loginform').submit(function(e) {

                return true;
            });

            var x = $("a[href='#loginmodal']").attr("stuid");
            $('#loginform').attr("action", "userEnlist.do?stuid=" + x);

            $("a[href='#loginmodal']").leanModal({

                top: 200,
                overlay: 0.6,
                closeButton: ".hidemodal"
            });
        });
        
        
        $(function () {
	        $('#cs').ready(function () {
	        	var way = $('#cs').attr("num");
	        	if(way!="undefined"&&way!=null&&way!=""){
				$('#cs').val(way)
	        	}else{
					$('#cs').val(0)

	        	}
	        });
	   }); 
        $(function () {
	        $('#ia').ready(function () {
	        	var way = $('#ia').attr("num");
	        	if(way!="undefined"&&way!=null&&way!=""){
				$('#ia').val(way)
	        	}else{
					$('#ia').val(0)

	        	}
	        });
	   }); 
        
        $(function () {
	        $('#cp').ready(function () {
	        	var way = $('#cp').attr("num");
	        	if(way!="undefined"&&way!=null&&way!=""){
				$('#cp').val(way)
	        	}else{
					$('#cp').val(0)

	        	}
	        });
	   }); 
        $(function () {
	        $('#tm').ready(function () {
	        	var way = $('#tm').attr("num");
	        	if(way!="undefined"&&way!=null&&way!=""){
				$('#tm').val(way)
	        	}else{
					$('#tm').val(1)

	        	}
	        });
	   }); 
    </script>
	<script type="text/javascript">
		function logout(){
			 var bool = window.confirm("确定注销登录吗");
			 if(bool){//确定
				 window.location="logout.do";
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
                <a href="#"><span style="font-size: 35px;padding-top:20px;position:relative;top:8px;">Rimi</span></a>
            </div>
            <div class="container-fluid">
                <div class="navbar-btn">
                    <button type="button" class="btn-toggle-fullwidth"><i class="lnr lnr-arrow-left-circle"></i></button>
                </div>
                <div id="navbar-menu">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="<%=basePath%>RXF/assets/img/user1.png" class="img-circle" style="position:relative;top:7px;" alt="Avatar"><span>你好,${ub.userName}</span> <i class="icon-submenu lnr lnr-chevron-down"></i></a>
                            <ul class="dropdown-menu">
                                 <li><a href="lookInfo.do?InfoUserId=${ub.userId}"><i class="lnr lnr-user"></i> <span>我的信息</span></a></li>
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
                                    <li><a href="lookInfo.do?InfoUserId=${ub.userId}" class="">我的资料</a></li>
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
                    <form action="userStudent.do" method="post" class="panel-body no-padding">
                        <table class="table table-hover definewidth m10">
                            <tbody>
                                <tr>
                                    <td width="10%" class="tableleft">学生姓名：</td>
                                    <td><input type="text" name="stuName" value="${param.stuName}" /></td>


                                    <td width="10%" class="tableleft">学生电话：</td>
                                    <td><input type="text" name="stuTel" value="${param.stuTel}" /></td>

                                    <td width="10%" class="tableleft">学生QQ：</td>
                                    <td><input type="text" name="stuQq" value="${param.stuQq}" /></td>
                                    
                                     
                                </tr>

                                <tr>
                                    <td width="10%" class="tableleft" >咨询方式：</td>
                                    <td>
                                        <select name="consultWay" id="cs" num="${param.consultWay}">
							        		<option value="0" >--请选择--</option>
							        		<c:forEach var="way" items="${csway}">
							        		<option value="${way.csWayId}" >${way.csWayName}</option>
							        		</c:forEach>
							        	</select>
                                    </td>

                                    <td width="10%" class="tableleft" >是否报名：</td>
                                    <td>
                                        <select name="isApply" id="ia" num="${param.isApply}">
                                      		<option value="0" >--请选择--</option>
							        		<option value="1" >是</option>
							        		<option value="2" >否</option>
							        	</select>
                                    </td>

                                    <td width="10%" class="tableleft" >商情优先级：</td>
                                    <td>
                                        <select name="consultPriority" id="cp" num="${param.consultPriority}">
											<option value="0">--请选择--</option>
						                    <option value="1" >★</option>
						                    <option value="2" >★★</option>
						                    <option value="3" >★★★</option>
						                    <option value="4" >★★★★</option>
						                    <option value="5" >★★★★★</option>
						                </select>
                                    </td>
                                </tr>

                                <tr>
                                    <td width="10%" class="tableleft">
                                        <select name="timeway" id="tm" num="${param.timeway}">
							        		<option value="1">咨询日期</option>
							        		<option value="2">跟进日期</option>
							        	</select>
                                    </td>

                                    <td>
                                        <input type="date" name="Date1" value="" />&nbsp;至&nbsp;<input type="date" name="Date2" value="" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    </td>


                                    <td colspan="4">
                                        <div class="col-md-12 text-right">
                                            <button type="submit" class="btn btn-primary" id="bcx1" >查询</button>
                                            <button type="submit" class="btn btn-primary" id="bqk1"	>清空</button>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                </div>
            </div>
            <div class="panel">
                <div class="panel-heading">
                    <h3 class="panel-title">学员信息</h3>
                    <div class="right">
                        <button type="button" class="btn-toggle-collapse"><i class="lnr lnr-chevron-up"></i></button>
                    </div>
                </div>
                <div class="panel-body no-padding">
                    <table class="table table-bordered table-hover definewidth m10">
                        <thead>
                            <tr>
                                <th width="5%"><input type="checkbox" id="checkall" onChange="checkall();"></th>
                                <th>序号</th>
                                <th>学员姓名</th>
                                <th>咨询日期</th>
                                <th>线上咨询师</th>
                                <th>线下咨询师</th>
                                <th>联系电话</th>
                                <th>QQ</th>
                                <th>微信</th>
                                <th>年龄</th>
                                <th>性别</th>
                                <th>咨询方式</th>
                                <th>商情优先级</th>
                                <th>是否报名</th>
                                <th>最新跟进时间</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody>
                        <% 
                        int i=1;
                        
                        %>
                        <c:forEach   var="stu"  items="${stus}">
                            <tr>
                                <td style="vertical-align:middle;">
                                    <input type="checkbox" name="check" value="1">
                                </td>
                                <td><%=i %> </td>
                                <td>${stu.stuName}</td>
                                <td>${stu.consultDate}</td>
                                <td>${stu.onlineId}</td>
                                <td>${stu.offlineId}</td>
                                <td>${stu.stuTel}</td>
                                <td>${stu.stuQq}</td>
                                <td>${stu.stuWechat}</td>
                                <td>${stu.stuAge}</td>
                                <td>${stu.stuSex}</td>
                                <td>${stu.consultWay}</td>
                                <td>
                                  <c:forEach     begin="1" end="${stu.consultPriority}">
                            		      ★
                                  </c:forEach>
                                </td>
                                <c:if test="${stu.isApply==1}">
                                <td>已报名</td>
                                </c:if>
                                <c:if test="${stu.isApply==2}">
                                <td>未报名</td>
                                </c:if>
                                <td>${stu.recentRecordTime}</td>
                                <td>
                                    <a href='userInfoStu.do?stuid=${stu.stuId}'><span class="label label-primary">详情</span></a>
                                    <a href='userEditStu.do?stuid=${stu.stuId}'><span class="label label-info">编辑</span></a>
                                     <c:if test="${stu.isApply==2}">
									 <a href='#loginmodal'  stuid="${stu.stuId}"><span class="label label-success" >点击报名</span></a>
                                	</c:if>
                               	 	<c:if test="${stu.isApply==1}">
                               	 	<a  name="1"><span class="label label-danger" >已报名</span></a>
                                	</c:if>
                                	
                                </td>
                            </tr>
                            <% i++; %>
							</c:forEach>
                            <tr>
                            
                                <td colspan="16">
                                    <div class="col-md-6 text-left inline pull-left page">
                                        <a href='userStudent.do?isok=1&nowpage=1'>首页</a> &nbsp;&nbsp;&nbsp;
                                        <a href='userStudent.do?isok=1&nowpage=${pb.nowPage-1}'>上一页</a> &nbsp;&nbsp;&nbsp;
                                        <a href='userStudent.do?isok=1&nowpage=${pb.nowPage+1}'>下一页</a> &nbsp;&nbsp;&nbsp;
                                        <a href='userStudent.do?isok=1&nowpage=${pb.totalPage}'>尾页</a> &nbsp;&nbsp;&nbsp; 共
                                        <span class='current'>${pb.count}</span>条记录<span class='current'> 第${pb.nowPage}/${pb.totalPage}</span>页&nbsp;&nbsp;
                                        <input type="text" placeholder="${pb.nowPage}" id="forword" />
                                        <script type="text/javascript">
                                            $("#forword").keydown(function() {
                                                if (event.keyCode == "13") {
                                                	window.location.href="userStudent.do?isok=1&nowpage="+$("#forword").val()
                                                }
                                            });
                                        </script>
                                    </div>
                                    <div class=" col-md-6 text-right">
                                        <button type="submit" class="btn btn-primary" type="button">导出选中</button>
                                        <button type="submit" class="btn btn-primary" type="button">导出所有</button>
                                    </div>
                                </td>
                            </tr>

                        </tbody>
                    </table>
                </div>

            </div>
            
            <!-- END MAIN CONTENT -->
        </div>
        <div id="loginmodal" style="display:none;">
                <h1>报名</h1>
                <form id="loginform" name="loginform" method="POST" action="">
                    <label for="username">报名时间:</label>
                    <input type="date" class="form-control input-md" name="applytime">
                    <br>
                    <label for="password">付款方式：</label>
                    <select class="form-control input-md" name="applyWay">
							        		<option value="0" >--请选择--</option>
							        		<c:forEach var="way" items="${awb}">
							        		<option value="${way.applyWayId}" >${way.applyWayName}</option>
							        		</c:forEach>
							        	</select>
                    <br>
                    <div class="center"><input type="submit"  id="loginbtn" class="btn btn-primary btn-toastr" value="报名" ></div>
                </form>
            </div>
    </div>
    <!-- END MAIN -->
    <div class="clearfix"></div>
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