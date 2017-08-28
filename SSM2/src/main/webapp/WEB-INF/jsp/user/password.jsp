<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%   
String path = request.getContextPath();   
String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Rimi | 修改密码</title>
	<link rel="stylesheet" href="<%=basePath%>RXF/assets/css/common.css"/>
	<script src="<%=basePath%>RXF/assets/vendor/jquery/jquery.min.js"></script>
	<style type="text/css">
		body{
			font:.85em/1.4 "微软雅黑","Microsoft Yahei",'Arial','san-serif';
			color:#666;
			margin:0;
			padding:0
		}
		ul,li{
			list-style:none
		}
		a,button,input{
			-webkit-tap-highlight-color:rgba(255,0,0,0)
		}
		input{
			border:0 none;
			-webkit-appearance:none
		}
		span{
			display:block;
			width:100%;
			height:20px;
		}
	</style>
	<script type="text/javascript">
		$(function() {
			$("#userPs1").change(function(){
	        	$("#sp1").html("<font color='red'>√</font>");
	        });
	        $("#userPs2").blur(function(){
	        	var userPs1 =$.trim($("#userPs1").val());
		        var userPs2 = $.trim($("#userPs2").val());
	        	if(equals(userPs1,userPs2) != true || equals(userPs2,userPs1) != true){
	        		$("#sp2").html("<font color='red'>两次密码不一致</font>");
	        		$(".submitBtn").attr({"disabled":true});
		        }else{
		        	$("#sp2").html("<font color='red'>√</font>");
		        	$(".submitBtn").attr({"disabled":false});
		        }
	        });
	        
        	var isok =$.trim($("#isok").val());
        	if(isok =="修改成功"){
        		alert("修改成功");
        		parent.location.href = "index.do";
        	}
        	if(isok =="修改失败"){
        		alert("修改失败");
        	}
		});
		 function equals(str1,str2) {
				if(str1 == str2){
					return true;
				}
					return false;
			}
	</script>
</head>
<body>
	<form action="" method="post" id="editForm">
		<ul class="editInfos">
			<li>
				<label><font color="red">* </font>旧密码：&nbsp;&nbsp;&nbsp;
				<input type="password" name="userOldPs"  value="" class="ipt" placeholder="请输入旧密码..." />
				<span><font color="red">${IsOldPs}</font></span>
				</label>
			</li>
			<li>
				<label><font color="red">* </font>新密码：&nbsp;&nbsp;&nbsp;
				<input type="password" name="" value="" id="userPs1" class="ipt" placeholder="请输入新密码..." />
				<span id="sp1"></span>
				</label>
			</li>
			<li>
				<label><font color="red">* </font>确认密码：
				<input type="password" name="userNewPs" value="" id="userPs2" class="ipt" placeholder="请确认新密码..." />
				<span id="sp2"></span>
				</label>
			</li>
			<li><input type="text" value="${IsokEdit}" id="isok" style="display:none"/></li>
			<li><input type="submit" value="确认提交" class="submitBtn" /></li>
		</ul>
	</form>
</body>
</html>
