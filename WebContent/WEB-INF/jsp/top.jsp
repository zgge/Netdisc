<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://how2j.cn/study/js/jquery/2.0.0/jquery.min.js"></script>
<link href="http://how2j.cn/study/css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
<script src="http://how2j.cn/study/js/bootstrap/3.3.6/bootstrap.min.js"></script>
<style type="text/css">
li{
	list-style: none;
}
hr{
	margin-top: 0px;
    margin-bottom: 0px;
    border: 0;
    border-top: 1px solid #eee;
}
</style>
</head>
<body>
<div>
<ul>
<li style="float: left;margin-top: 1%;margin-left: 1%">
	<a href="${pageContext.request.contextPath }/userInfo" target="right"><img src="img/timg.jpg" class="img-circle" width="55px" height="55px"></a>
</li>
<li  style="float: left; margin-left: 34%;">
	<span style="font-size: 45px;" >PanDownlaod</span>
</li>
<li style="float: right;margin-right:3%;margin-top: 2%;">
	<a href="${pageContext.request.contextPath }/logout" class="btn btn-danger"  target="_top">退出</a>
</li>
</ul>
</div>
<br>
<br>
<br>
<br>
<hr>
</body>

</html>