<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<frameset rows="100,*"  border="0" framespacing="0">
 	 <frame src="${pageContext.request.contextPath}/top" name="top">
	<frameset cols="159,*" border="0" framespacing="0">
		  <frame src="${pageContext.request.contextPath}/left" name="left">
		  <frame src="${pageContext.request.contextPath }/showMyPan?currentPage=0&father=0"  name="right">                                                                
	</frameset>
</frameset>
</html>