<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>注册成功，3秒后跳转登陆页面</h1>
<% response.setHeader("refresh", "3;URL="+request.getContextPath()+"/index.jsp"); %>
</body>
</html>