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
<link href="${pageContext.request.contextPath}/css/popup_layer.css" type="text/css" rel="stylesheet"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/popup_layer.js"></script>		
<script type="text/javascript">
	$(function(){
		//弹出层插件调用
		new PopupLayer({
			trigger:".clickedElement",
			popupBlk:"#showDiv",
			closeBtn:"#closeBtn",
			useOverlay:false,
		});
		
		
	});
	function getResource(id){
		$.ajax({
			url:"getResource",
			data:{"id":id},
			dataType:"json",
			success:function(result){
				   var dataObj = result, //返回的result为json格式的数据
			           con = "";
			               con += "<li>文件名："+dataObj.filename+"</li>";
						   con += "<li>文件类型："+dataObj.filetype+"</li>";
					       con += "<li>文件大小："+dataObj.filesize+"KB</li>";
			               con += "<li>分类："+dataObj.catalog+"</li>";
			               if(dataObj.is_share==1){
			            	   con += "<li>是否共享：是</li>";
			               }else{
			            	   con += "<li>是否共享：否</li>";
			               }
			               con += "<li>上传时间："+dataObj.uploaddate+"</li>";
			               con += "<li>下载次数："+dataObj.count+"</li>";
			               con += "<li>文件介绍："+dataObj.memo+"</li>";
			               $("#resourceId").val(dataObj.id);
	                	 $("#showTable").html(con);
			}
		})
	}
	function show(obj){
		var y=obj.children;
		for(var i=3;i<=4;i++){
			var c=y[i].firstElementChild;
			c.style.display = "block";
		}
	}
	function unshow(obj) {
		
		var y=obj.children;
		for(var i=3;i<=4;i++){
			var c=y[i].firstElementChild;
			c.style.display="none";
		}
		
	}
</script>
<style type="text/css">	
		td span{
			display: none;
		} 
		.util{
			height: 30px;
		}
		body{
			padding: 0px;
		}
</style>
</head>
<body>
	<table class="table table-hover">
	<thead>
		<tr>
			<th>文件名</th>
			<th></th>
			<th></th>
			<th></th>
			<th></th>
			<th>大小</th>
			<th>上传日期</th>
		</tr>
	</thead>
			<c:forEach items="${resources}" var="r">
				<tr id="list" onmouseover=show(this) onmouseout=unshow(this) style="padding: 2px">
					<td width="30%"> <img alt="文件" src="img/05.png" width="25" height="25" style="margin-right: 20px;"> ${r.filename}</td>
					<td width="30%"><div class="util"></div></td>
					<td width="5%"></td>
					<td width="5%"><span><a href="${pageContext.request.contextPath}/downloadResource?id=${r.id}" class="btn btn-success" style="font-size: 5px;padding: 6px 17px"><span class="glyphicon glyphicon-download-alt"></span></a></span></td>
					<td width="5%"><span><a href="#" class="clickedElement btn btn-info" onclick="getResource('${r.id}')" style="font-size: 5px;">更多</a></span></td>
					<td width="15%">${r.filesize}kb</td>
					<td width="10%">${r.uploaddate}</td> 
					
				</tr>
			</c:forEach>
	</table>
	<div style="padding-left: 40%;">
		<div >
			<nav>
				  <ul class="pagination">
				  	<c:if test="${pageBean.currentPage!=1}">
						<li>
				      		<a href="${pageContext.request.contextPath}/listResource?currentPage=${pageBean.currentPage-1} ">
				       		 <span>&laquo;</span>
				      		</a>
				    	</li>
					</c:if>
					<c:if test="${pageBean.currentPage==1}">
						<li class="disabled">
				      		<a href="#">
				       		 <span>&laquo;</span>
				      		</a>
				    	</li>
					</c:if>
				    <c:if test="${pageBean.totalPage<=6}">
						<c:forEach var="i" begin="1" end="${pageBean.totalPage}">
   							<c:if test="${pageBean.currentPage==i}">
   								<li><a href="${pageContext.request.contextPath}/listResource?currentPage=${i} " class='B' style="background-color: #CCE8FF">${i}</a></li>
   							</c:if>
   							<c:if test="${pageBean.currentPage!=i}">
   								<li><a href="${pageContext.request.contextPath}/listResource?currentPage=${i} " class='B'>${i}</a></li>
   							</c:if>
						</c:forEach>
					</c:if>
					<c:if test="${pageBean.totalPage>6}">
							<c:forEach var="i" begin="1" end="6">
   							<c:if test="${pageBean.currentPage==i}">
   								<li><a href="${pageContext.request.contextPath}/listResource?currentPage=${i} " class='B' style="background-color: #CCE8FF">${i}</a></li>
   							</c:if>
   							<c:if test="${pageBean.currentPage!=i}">
   								<li><a href="${pageContext.request.contextPath}/listResource?currentPage=${i} " class='B'>${i}</a></li>
   							</c:if>

							</c:forEach>
					</c:if>
					<c:if test="${pageBean.totalPage==pageBean.currentPage}">
						<li class="disabled">
						 <a href="#">
						      <span>&raquo;</span>
						    </a>
				   		</li>
					</c:if>
					<c:if test="${pageBean.totalPage!=pageBean.currentPage}">
						<li>
						    <a href="${pageContext.request.contextPath}/listResource?currentPage=${pageBean.currentPage+1}">
						      <span>&raquo;</span>
						    </a>
				   		</li>
					</c:if>
				    
				  </ul>
		</nav>
	</div>
	</div>
	

		<div id="showDiv" class="blk" style="display:none;">
            <div class="main">
                <h2>文件信息</h2>
                <a href="javascript:void(0);" id="closeBtn" class="closeBtn btn" style="font-size: 15px;">关闭</a>
				<div style="padding:20px;" id="showTable">
				</div>
				<form action="${pageContext.request.contextPath}/inEdit" method="get">
					<input type="hidden" id="resourceId" name="id" />
				</form>
            </div>
        </div>
</body>
</html>