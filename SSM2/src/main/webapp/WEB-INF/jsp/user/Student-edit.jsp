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
    <title>Rimi | 修改学员信息</title>
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
    <link rel="stylesheet" href="<%=basePath%>RXF/assets/css/common.css"/>
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

            var sourceNode = document.getElementById("low-" + 1); // 获得被克隆的节点对象 
            i++;
            var clonedNode = sourceNode.cloneNode(true);
            // 克隆节点 

            clonedNode.setAttribute("id", "low-" + i); // 修改一下id 值，避免id 重复 
            clonedNode.getElementsByTagName("input")[1].value = "";
            clonedNode.getElementsByTagName("div")[0].innerHTML = i + ".";
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
            var num = obj.id;
            if (num == "d-1") {
                alert("必须保留第一次的记录");
            } else {
                var x = document.getElementById("papa").removeChild(obj.parentElement);
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
                <a href="#"><span style="font-size: 35px;padding-top:20px;">Rimi</span></a>
            </div>
            <div class="container-fluid">
                <div class="navbar-btn">
                    <button type="button" class="btn-toggle-fullwidth"><i class="lnr lnr-arrow-left-circle"></i></button>
                </div>
                <div id="navbar-menu">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="<%=basePath%>RXF/assets/img/user1.png" class="img-circle" alt="Avatar"> <span>你好,${ub.userName}</span> <i class="icon-submenu lnr lnr-chevron-down"></i></a>
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
            <!-- MAIN CONTENT -->
            <div class="main-content">
                <div class="container-fluid">
                    <h3 class="page-title">更改学员信息</h3>
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
                                        <div class="input-group" style="width:30%">
                                            <span class="input-group-addon"><i class="fa fa-user" ></i></span>
                                            <input class="form-control" placeholder="学员姓名" type="text">
                                        </div>
                                        <br>
                                        <input type="text" class="form-control" style="width:30%;" placeholder="年龄">
                                        <br>
                                        <label class="fancy-radio">
										<input name="gender" value="male" type="radio">
										<span><i></i>男</span>
									</label>
                                        <label class="fancy-radio">
										<input name="gender" value="female" type="radio">
										<span><i></i>女</span>
									</label>
                                        <br>

                                        <input type="text" class="form-control" placeholder="电话号码">

                                        <br>
                                        <input type="text" class="form-control" placeholder="微信号码">

                                        <br>
                                        <input type="text" class="form-control" placeholder="QQ号码">
                                        <br>
                                        <input type="text" class="form-control" placeholder="地址">
                                        <br>
                                        <select class="form-control" style="width:30%;float:left">
										<option value="cheese">学历</option>
										<option value="tomatoes">高中及以下</option>
										<option value="mozarella">专科</option>
										<option value="mushrooms">本科</option>
										<option value="pepperoni">硕士</option>
										<option value="onions">博士</option>
									</select>
                                        <input type="text" class="form-control" style="width:40%;float:left" placeholder="学校">

                                        <input type="text" class="form-control" style="width:30%;float:left" placeholder="专业">
                                        <br>
                                        <br>
                                        <br>
                                        <div>
                                            <div style="float:left">工作状态:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
                                            <label class="fancy-checkbox" style="float:left">
										<input type="radio" name="job">
										<span>在职&nbsp;&nbsp;&nbsp;</span>
									</label>
                                            <label class="fancy-checkbox" style="float:left">
										<input type="radio" name="job">
										<span>休假&nbsp;&nbsp;&nbsp;</span>
									</label>
                                            <label class="fancy-checkbox" style="float:left">
										<input type="radio" name="job">
										<span>离职</span>
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
										<input name="gender" value="YES" type="radio">
										<span><i></i>已报名</span>
									    </label>
                                        <label class="fancy-radio">
										<input name="gender" value="NO" type="radio">
										<span><i></i>未报名</span>
									    </label>
                                        <br>
                                        <div class="form-group form-group-md">
                                            <label class="col-md-2 control-label" for="formGroupInputLarge" style="position: relative;right: 5px;"> 学员报名时间:</label>
                                            <div class="col-md-10">
                                                <input class="form-control" type="date" id="formGroupInputLarge" placeholder="Large input" style="width:30%">
                                            </div>
                                            <br>
                                            <br>
                                            <label class="col-md-2 control-label" for="formGroupInputLarge" style="position: relative;right: 5px;"> 学员付费方式:</label>
                                            <div class="col-md-10">
                                                <select class="form-control" style="width:30%;float:left">
										    <option value="cheese">学历</option>
										    <option value="tomatoes">高中及以下</option>
										    <option value="mozarella">专科</option>
										    <option value="mushrooms">本科</option>
										    <option value="pepperoni">硕士</option>
										    <option value="onions">博士</option>
									</select>
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


                                        <select class="form-control">
										<option value="cheese">线上咨询师</option>
										<option value="tomatoes">张三</option>
										<option value="mozarella">李四</option>
										<option value="mushrooms">王五</option>
										<option value="pepperoni">赵六</option>
										<option value="onions">茅十八</option>
									</select>
                                        <br>
                                        <select class="form-control">
										<option value="cheese">线下咨询师</option>
										<option value="tomatoes">张三</option>
										<option value="mozarella">李四</option>
										<option value="mushrooms">王五</option>
										<option value="pepperoni">赵六</option>
										<option value="onions">茅十八</option>
									</select>
                                        <br>
                                        <select class="form-control">
										<option value="cheese">咨询类别</option>
										<option value="tomatoes">java</option>
										<option value="mozarella">安卓</option>
										<option value="mushrooms">前端</option>
										<option value="pepperoni">C</option>
									</select>
                                        <br>
                                        <select class="form-control">
										<option value="cheese">咨询方式</option>
										<option value="tomatoes">电话</option>
										<option value="mozarella">网页</option>
										<option value="mushrooms">邮箱</option>
									</select>
                                        <br>
                                        <div class="form-group form-group-md">
                                            <label class="col-md-2 control-label" for="formGroupInputLarge">学员咨询日期</label>
                                            <div class="col-md-10">
                                                <input class="form-control" type="date" id="formGroupInputLarge" placeholder="Large input">
                                            </div>
                                        </div>
                                        <select class="form-control">
										<option value="cheese">咨询时段</option>
										<option value="tomatoes">电话</option>
										<option value="mozarella">网页</option>
										<option value="mushrooms">邮箱</option>
									</select>
                                        <br>
                                        <select class="form-control">
										<option value="">平台来源</option>
										<option value="1">网站</option>
										<option value="2">报纸</option>
										<option value="3">报纸</option>
				                        <option value="4">报纸</option>
				                        <option value="5">报纸</option>

									</select>
                                        <br>
                                        <select class="form-control">
										<option value="cheese">商情优先级</option>
										<option value="tomatoes">★</option>
										<option value="mozarella">★★</option>
										<option value="mushrooms">★★★</option>
				                        <option value="mushrooms">★★★★</option>
				                        <option value="mushrooms">★★★★★</option>

									</select>
                                        <br>
                                        <div class="form-group form-group-md">
                                            <label class="col-md-2 control-label" for="formGroupInputLarge">学员到访时间</label>
                                            <div class="col-md-10">
                                                <input class="form-control" type="date" id="formGroupInputLarge" placeholder="Large input">
                                            </div>
                                        </div>

                                        <textarea class="form-control" placeholder="备注" rows="4" style="resize:none"></textarea>



                                    </div>
                                </div>
                                <div class="panel">
                                    <div class="panel-heading">
                                        <h3 class="panel-title" style="float:left">跟进记录</h3>
                                        <a href="#" style="float:left;position: relative;top: 2px;left: 4px;" onclick="addlow()"><i class="fa fa-plus-square" ></i></a>


                                    </div>
                                    <br>
                                    <div class="panel-body" id="papa">
                                        <div id="low-1">
                                            <div style="float:left" class="control-label">1.</div>
                                            <div style="float:left" class="control-label">跟进时间:&nbsp;&nbsp;&nbsp;&nbsp;</div>
                                            <input type="date" class="form-control input-sm" name="times" style="width:20%;float:left">
                                            <div style="float:left">&nbsp;&nbsp;&nbsp;</div>
                                            <input class="form-control input-sm" placeholder="请输入跟进记录" type="text" style="width:58%;float:left">
                                            <div style="float:left">&nbsp;&nbsp;</div>
                                            <a href="#" style="float:left;position: relative;top: 7px;" onclick="dele(this)" id="d-1"><span class="label label-danger" class="control-label">删除</span></a>
                                            <br>
                                            <br>
                                        </div>






                                    </div>

                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <button type="button" class="btn btn-primary btn-lg btn-block">修改</button>
                                    </div>
                                    <div class="col-md-6">
                                        <button type="button" class="btn btn-danger btn-lg btn-block">返回</button>
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
