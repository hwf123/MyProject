<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%   
String path = request.getContextPath();   
String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" class="fullscreen-bg">

<head>
    <title>Rimi | Login</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <!-- VENDOR CSS -->
    <link rel="stylesheet" href="<%=basePath%>RXF/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=basePath%>RXF/assets/vendor/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="<%=basePath%>RXF/assets/vendor/linearicons/style.css">
    <!-- MAIN CSS -->
    <link rel="stylesheet" href="<%=basePath%>RXF/assets/css/main.css">
    <!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
    <link rel="stylesheet" href="<%=basePath%>RXF/assets/css/demo.css">
    <!-- GOOGLE FONTS -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
    <!-- ICONS -->
    <link rel="apple-touch-icon" sizes="76x76" href="<%=basePath%>RXF/assets/img/apple-icon.png">
    <link rel="icon" type="image/png" sizes="96x96" href="<%=basePath%>RXF/assets/img/favicon.png">
    <script language="javascript">
	function myReload() {
		document.getElementById("CreateCheckCode").src = document
				.getElementById("CreateCheckCode").src
				+ "?nocache=" + new Date().getTime();
	}
	</script>
</head>

<body>
    <!-- WRAPPER -->
    <div id="wrapper">
        <div class="vertical-align-wrap">
            <div class="vertical-align-middle">
                <div class="auth-box ">
                    <div class="left">
                        <div class="content">
                            <div class="header">
                                <div class="logo text-center"></div>
                                <p class="lead">睿峰科技-学员管理系统</p>
                            </div>
                            <form class="form-auth-small" action="login.do" method="post">
                                <div class="form-group">
                                    <label for="signin-name" class="control-label sr-only">Name</label>
                                    <input type="text" required="required" class="form-control" id="signin-name" name="userLoginName" value="${userLoginName}" placeholder="用户名">
                                </div>
                                <div class="form-group">
                                    <label for="signin-password" class="control-label sr-only">Password</label>
                                    <input type="password" required="required" class="form-control" id="signin-password" name="userPs" value="${userPs}" placeholder="密码">
                                </div>
								<div class="form-group" align="left">
								<label for="signin-pictureCheckCode" class="control-label sr-only">PictureCheckCode</label>
                                    <input type="text" required="required" style="width:30%;height:34px;padding:6px 12px;font-size:14px;line-height:1.42857143;color:#555;background-color:#fff;background-image:none;border:1px solid #ccc;border-radius:4px;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,.075);box-shadow:inset 0 1px 1px rgba(0,0,0,.075);-webkit-transition:border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;-o-transition:border-color ease-in-out .15s,box-shadow ease-in-out .15s;transition:border-color ease-in-out .15s,box-shadow ease-in-out .15s" name="checkCode" id="checkCode" title="验证码区分大小写" size="10" maxlength="4" placeholder="验证码">
									<img src="PictureCheckCode" id="CreateCheckCode">
									<a href="" onclick="myReload()"> 看不清,换一个</a>
								</div>
								<div class="form-group clearfix">
                                    <label class="fancy-checkbox element-left">
										<input type="checkbox" name="remember" value="Checked">
										<span>记住我</span>
									</label>
                                </div>
                                <input type="submit" class="btn btn-primary btn-lg btn-block" value="登录">
                                <div class="bottom">
                                    <span class="text-danger">${nameIsOk} ${psIsOk} ${message}</span>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="right">
                        <div class="overlay"></div>
                        <div class="content text">
                            <h1 class="heading">Chengdu Rightiphone Technology</h1>
                            <p>by The Developers</p>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
    </div>
    <!-- END WRAPPER -->
</body>

</html>