<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery/2.0.0/jquery.min.js"></script>
<link href="css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
<script src="js/bootstrap/3.3.6/bootstrap.min.js"></script>
<link href="css/register.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	$(function(){
		if(${not empty msg}){
			alert('${msg}');
		}
	});
</script>
<style type="text/css">
body{
background:url(${pageContext.request.contextPath}/img/02.jpg) top  center no-repeat;
}
#error{
padding-left: 135px;
}
#sub{
	padding-left: 135px;
}
#submit{
	color:#44BBBB;
	width:60px;
	height:26px;
	background-color: transparent;	
}

	.errorMessage li {  
         list-style-type: none;  
       }  
        .errorMessage {  
            padding:0;  
        } 
</style>

</head>
<body >
		<div style="width: 18%;margin-left:65%; margin-top: 15%;" class="panel panel-default">
		<div class="panel-body">
		<form action="${pageContext.request.contextPath}/user_login" method="post" class="form-group">
		<div style="margin-left: 65px;" ><h2>用户登录</h2></div>
	      <input type="text" name="username" class="form-control" placeholder="请输入用户名"  required="required" style="width: 83%" >
		 <input type="password" name="password" class="form-control" placeholder="请输入密码"  required="required" style="width: 83%">
		 <input type="submit" value="登陆" class="btn btn-primary" style="margin:5px;margin-left: 90px;"><br>
		  没有账号？<a href="${pageContext.request.contextPath}/register">注册</a>
		  忘记密码？<a href="${pageContext.request.contextPath}/resetPwd">找回密码</a><span style="color:red"> ${error}</span>
		</form>
		</div>
		</div>
</body>
</html>