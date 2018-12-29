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
<script type="text/javascript">
	$(function(){
		if(${not empty msg}){
			alert('${msg}');
		}
	});
	function checkname(){
		$.ajax({
			type:"post",
			url:$("#path").val()+"/checkName",
			data:{username:$("#username").val()},
			dataType:"text",
			success:function(data){
				if(data=="OK"){
					$("#usernameMsg").html("<em style='color: red;'>用户名不存在</em>");
				}else{
					$("#usernameMsg").html("<em style='color: green;'>OK</em>");
				}
				
			}
		});
	}
	function Logintest(){
		checkname();
		if($("#usernameMsg").text()=="OK"){
			return true;
		}else{
			return false;
		}
	}
</script>
<style type="text/css">
</style>
</head>
<body>
	<div style="margin: 0 auto;text-align: center;">
		<form action="${pageContext.request.contextPath }/sendResetMail">
		<h2>重置密码</h2>
			<input type="hidden" name="path" id="path" value="${pageContext.request.contextPath}">
			 <label class="form-inline" style="font-weight: normal;"><input type="text" name="username" id="username" class="form-control" placeholder="输入用户名"  required="required" onblur="checkname()">*<span id="usernameMsg" style="margin-right: 20px;" ></span><input  type="submit" value="发送邮件" onclick="return Logintest()" class="btn btn-primary" ></label>
			<span style="color:red"></span>
		</form>
		<br>
	</div>
</body>
</html>