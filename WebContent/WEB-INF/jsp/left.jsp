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
	function change(obj){
		var lis = document.getElementsByTagName('li');
		for(var i=0;i<lis.length;i++){
			lis[i].setAttribute("class","#");
		}
		obj.setAttribute("class","active");
	}
		
</script>
</head>
<div>
<ul class="nav nav-pills nav-justified" style="width:150px">
	<li role="presentation" class="active" onclick="change(this)"><a href="${pageContext.request.contextPath }/showMyPan?currentPage=0&father=0" target="right" >我的网盘</a></li>
	<li role="presentation" onclick="change(this)"><a href="${pageContext.request.contextPath }/right" target="right">搜索分享</a></li>
	<li role="presentation" onclick="change(this)"><a href="${pageContext.request.contextPath }/getOutLineList" target="right">离线列表</a></li>
	<li role="presentation" onclick="change(this)"><a href="${pageContext.request.contextPath }/listResource?currentPage=0" target="right">下载排行</a></li>
</ul>
</div>
</body>
</html> 