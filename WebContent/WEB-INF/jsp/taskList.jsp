<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="refresh" content="3;url=${pageContext.request.contextPath }/getOutLineList">
<title>Insert title here</title>
<script src="js/jquery/2.0.0/jquery.min.js"></script>
<link href="css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
<script src="js/bootstrap/3.3.6/bootstrap.min.js"></script>
<style type="text/css">
li{
	list-style: none;
}
</style>
</head>
<body>
<div style="margin-left:21%; width: 45%;padding: 40px;" class="panel panel-default">
	<c:forEach items="${list}" var="d">
		<li style="float:left">${d.filename}</li><li style="float:right">${d.loading*100}%</li><br><br>
	</c:forEach>
</div>
</body>
</html>