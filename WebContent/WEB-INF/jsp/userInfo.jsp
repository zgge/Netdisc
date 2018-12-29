<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery/2.0.0/jquery.min.js"></script>
<link href="css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
<script src="js/bootstrap/3.3.6/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/update_user.js"></script>
<style type="text/css">
.title{
	font-size: large;
}
span{
	font-size: medium;
}
</style>
<script type="text/javascript">
	$(function(){
		if(${not empty msg}){
			alert('${msg}');
		}
		$('#sex').val('${user.sex}');
	});
</script>
</head>
<body>
<div style="margin: 0 auto; width: 15%">
	<h1>个人资料</h1>
</div>
<div style="margin-left:33%; width: 30%;padding: 40px;" class="panel panel-default">
	<span class="title">用户名</span><br>
	<span>${user.username}</span><br><br>
	<span class="title">性别</span><br>
	<c:if test="${empty user.sex}">
	<span>未设定</span><br><br>
	</c:if>
	<c:if test="${not empty user.sex}">
	<span>${user.sex}</span><br><br>
	</c:if>
	<span class="title">个人简介</span><br>
	<span>${user.memo}</span><br><br>
	<span class="title">邮箱</span><br>
	<span>${user.email}</span><br><br>
	<span class="title">手机号</span><br>
	<span>${user.tel}</span><br><br>
	<button class="btn btn-primary" style="margin-left:38%;" data-toggle="modal" data-target="#myModal">修改</button>
</div>
<form action="${pageContext.request.contextPath }/updateUser" method="post">
<input type="hidden" name="path" id="path" value="${pageContext.request.contextPath}">
		<input type="hidden" value="${user.uid }" name="uid">
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
			<div class="modal-dialog" style="width: 25%">
			        <div class="modal-content">
			          <div class="modal-header">
			            <button data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
			            <h4 class="modal-title">修改用户个人信息</h4>
			          </div>
			          <div class="modal-body">
			         	<p>用户名</p>
						<input type="text" name="username" value="${user.username}" id="username" class="form-control"   required="required" onblur="checkname()">*<span id="usernameMsg">${username}</span>
			          	<p>性别</p>
			          	<select name="sex" id="sex" class="form-control">
			          		<option value="男">男</option>
			          		<option value="女">女</option>
			          	</select>
			          	<p>个人简介</p>
						<textarea rows="3" cols="11"  class="form-control" name="memo" id="memo"  required="required" onblur="checkmemo()">${user.memo}</textarea>*<span id="memoMsg">${memo}</span>
			        	<p>手机号</p>
						<input type="text" name="tel" id="tele" class="form-control" value="${user.tel}"  required="required" onblur="checktele()">*<span id="teleMsg">${tel}</span>
						<p>邮箱</p>
						<input type="text" name="email" id="email" class="form-control" value="${user.email }"  required="required" onblur="checkemail()">*<span id="emailMsg">${emailMsg}</span>
			          </div>
			          <div class="modal-footer">
			            <input type="submit" class="btn btn-primary" value="修改" onclick="return Logintest()">
			          </div>
			        </div><!-- /.modal-content -->
			 </div><!-- /.modal-dialog -->
		</div>	
	</form>
</body>
</html>