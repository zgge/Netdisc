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
</script>
<style type="text/css">
	body{
	background-color: #F7F7F7
}
.button {
	    background-color: #4CAF50; /* Green */
	    border: none;
	    color: white;
	    padding: 5px 10px;
	    text-align: center;
	    text-decoration: none;
	    display: inline-block;
	    font-size: 5px;
		}
</style>
</head>
<body>
	<div style="margin: 0 auto;text-align: center;">
		<form action="${pageContext.request.contextPath }/reset" method="post">
		<h2>重置密码</h2>
			<input type="hidden" value="${code}" name="code" />
			 <label class="form-inline" style="font-weight: normal;"><input type="password" name="password" class="form-control" placeholder="输入新密码"  required="required"><input type="submit" value="修改" class="btn btn-primary" style="margin-left: 10px;"></label>
			<span style="color:red"></span>
		</form>
		<br>
	</div>
</body>
</html>