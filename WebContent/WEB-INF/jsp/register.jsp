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
<script type="text/javascript" src="${pageContext.request.contextPath}/js/register.js"></script>
<style type="text/css">
body{
background:url(${pageContext.request.contextPath}/img/03.jpg) top  center no-repeat;
background-position:200px;
}
</style>
</head>
<body >
	<div style="width: 25%;margin-left:55%; margin-top: 1%;" class="panel panel-default">
		<div class="panel-body">
		<form action="${pageContext.request.contextPath}/doRegister" method="POST" >
			<input type="hidden" name="path" id="path" value="${pageContext.request.contextPath}">
			<div style="margin-left: 110px;" ><h2>用户注册</h2></div>
			<p>用户名</p>
			<input type="text" name="username" id="username" class="form-control"   required="required" onblur="checkname()">*<span id="usernameMsg">${username}</span>
			<p>密码</p>
			<input type="password" name="password" id="password" class="form-control"   required="required" onblur="checkpassword()">*<span id="passwordMsg">${password}</span>
			<p>确认密码</p>
			<input type="password" name="repwd" id="repwd" class="form-control"   required="required" onblur="checkrepassword()">*<span id="repwdMsg">${repwd}</span>
			<p>个人简介</p>
			<textarea rows="3" cols="11"  class="form-control" name="memo" id="memo"  required="required" onblur="checkmemo()"></textarea>*<span id="memoMsg">${memo}</span>
			<p>手机号</p>
			<input type="text" name="tel" id="tele" class="form-control"   required="required" onblur="checktele()">*<span id="teleMsg">${tel}</span>
			<p>邮箱</p>
			<input type="text" name="email" id="email" class="form-control"   required="required" onblur="checkemail()">*<span id="emailMsg">${emailMsg}</span>
			<br><input type="submit" value="确定" id="submit" id="submit" class="btn btn-primary" style="margin-left: 145px;" onclick="return Logintest()">
		</form>
		</div>
	</div>
</body>
</html>