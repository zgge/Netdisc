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
	function myWarn(){
		return confirm("删除文件夹将会删除文件夹内所有文件，是否继续删除？");
	}
	function outLineDownload(){
		var path=$("#path").val();
		$.ajax({
			url:'outLineDownload',
			data:{"path":path},
			success:function(result){
				alert(result);
			}
		});
	}
	function show(obj){
		var y=obj.children;
		var c=y[4].firstElementChild;
		c.style.display = "block";
		for(var i=3;i<=5;i++){
			var c=y[i].firstElementChild;
			c.style.display = "block";
		}
	}
	function unshow(obj) {
		var y=obj.children;
		var c=y[4].firstElementChild;
		c.style.display="none";
		for(var i=3;i<=5;i++){
			var c=y[i].firstElementChild;
			c.style.display="none";
		}
		
	}
	$(function(){
		if(${not empty msg}){
			alert('${msg}');
		}
		$('input[id=lefile]').change(function() {
			$('#photoCover').val($(this).val());
			});
	});
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
	<table class="table table-hover" style="margin-top: 0px;">
	<thead>
		<tr>
			<th><a href="javascript:history.go(-1)" class="btn btn-primary">返回</a></th>
			<th></th>
			<th><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#createFolder" style="font-size: 8px;">创建文件夹</button></th>
			<th><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#upload" style="font-size: 8px;">上传</button></th>
			<th><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" style="font-size: 8px;">离线下载</button></th>
			<th></th>
			<th>大小</th>
			<th>日期</th>
		</tr>
	</thead>
			<c:forEach items="${resources}" var="r">
				<tr id="list" onmouseover=show(this) onmouseout=unshow(this) style="padding: 2px">
					<c:if test="${r.is_folder==0 }">
						<td width="30%"> <img alt="文件" src="img/05.png" width="25" height="25" style="margin-right: 20px;"> ${r.filename}</td>
						<td width="25%"><div class="util"></div></td>
						<td width="5%"></td>
						<td width="5%"><span><a href="${pageContext.request.contextPath}/downloadResource?id=${r.id}" class="btn btn-success" style="font-size: 5px;padding: 6px 17px"><span class="glyphicon glyphicon-download-alt"></span></a></span></td>
						<td width="5%"><span><a href="${pageContext.request.contextPath}/deleteResource?id=${r.id}&currentPage=${pageBean.currentPage}&father=${pageBean.father}" class="btn btn-danger" style="font-size: 5px;">删除</a></span></td>
						<td width="5%"><span><a href="#" class="clickedElement btn btn-info" onclick="getResource('${r.id}')" style="font-size: 5px;">更多</a></span></td>
						<td width="15%">${r.filesize}kb</td>
						<td width="10%">${r.uploaddate}</td> 
					</c:if>
					<c:if test="${r.is_folder==1 }">
						<td width="30%"><a href="${pageContext.request.contextPath }/showMyPan?currentPage=1&father=${r.id}"> <img alt="文件" src="img/04.png" width="25" height="25" style="margin-right: 20px;"> ${r.filename}</a></td>
						<td width="25%"><div class="util"></div></td>
						<td width="5%"></td>
						<td width="5%"></td>
						<td width="5%"><span><a href="${pageContext.request.contextPath}/deleteResource?id=${r.id}&currentPage=${pageBean.currentPage}&father=${pageBean.father}" class="btn btn-danger" style="font-size: 5px;" onclick="return myWarn()">删除</a></span></td>
						<td width="5%"></td>
						<td width="15%"></td>
						<td width="10%"></td> 
					
					</c:if>
					<c:if test="${r.is_folder==2 }">
						<td width="30%"></td>
						<td width="25%"><div class="util"></div></td>
						<td width="5%"></td>
						<td width="5%"></td>
						<td width="5%"></td>
						<td width="5%"></td>
						<td width="15%"></td>
						<td width="10%"></td> 
					</c:if>
					
				</tr>
			</c:forEach>
	</table>
	<div style="padding-left: 40%;">
		<div >
			<nav>
				  <ul class="pagination">
				  	<c:if test="${pageBean.currentPage!=1}">
						<li>
				      		<a href="${pageContext.request.contextPath}/showMyPan?currentPage=${pageBean.currentPage-1}&father=${pageBean.father } ">
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
   								<li><a href="${pageContext.request.contextPath}/showMyPan?currentPage=${i}&father=${pageBean.father } " class='B' style="background-color: #CCE8FF">${i}</a></li>
   							</c:if>
   							<c:if test="${pageBean.currentPage!=i}">
   								<li><a href="${pageContext.request.contextPath}/showMyPan?currentPage=${i}&father=${pageBean.father } " class='B'>${i}</a></li>
   							</c:if>
						</c:forEach>
					</c:if>
					<c:if test="${pageBean.totalPage>6}">
							<c:forEach var="i" begin="1" end="6">
   							<c:if test="${pageBean.currentPage==i}">
   								<li><a href="${pageContext.request.contextPath}/showMyPan?currentPage=${i}&father=${pageBean.father } " class='B' style="background-color: #CCE8FF">${i}</a></li>
   							</c:if>
   							<c:if test="${pageBean.currentPage!=i}">
   								<li><a href="${pageContext.request.contextPath}/showMyPan?currentPage=${i}&father=${pageBean.father } " class='B'>${i}</a></li>
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
						    <a href="${pageContext.request.contextPath}/showMyPan?currentPage=${pageBean.currentPage+1}&father=${pageBean.father }">
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
					<input type="submit" class="btn btn-info" value="修改" style="margin-left: 330px; font-size: 10px;"/>
				</form>
            </div>
        </div>
		<div>
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
					<div class="modal-dialog">
					        <div class="modal-content">
					          <div class="modal-header">
					            <button data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
					            <h4 class="modal-title">离线下载</h4>
					          </div>
					          <div class="modal-body">
					         	<input type="text" name="path" id="path" required="required" class="form-control" style="width: 130px;margin: 0 auto" placeholder="输入下载地址">
					          </div>
					          <div class="modal-footer">
					            <button data-dismiss="modal" class="btn btn-default" type="button">关闭</button>
					           	<button data-dismiss="modal" class="btn btn-primary" onclick="outLineDownload()" type="button">下载</button>
					          </div>
					        </div><!-- /.modal-content -->
					 </div><!-- /.modal-dialog -->
				</div>	
		</div>
		
		
		<!-- 上传文件-->
		<div>
				<div class="modal fade" id="upload" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
					<form action="${pageContext.request.contextPath }/uploadResource" class="form-group" method="post" enctype="multipart/form-data">
					<div class="modal-dialog">
					        <div class="modal-content">
					          <div class="modal-header">
					            <button data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
					            <h4 class="modal-title">文件上传</h4>
					          </div>
					          <div class="modal-body">
					         	<!-- 上传部分 -->
	<div style="margin: 0 auto; width: 60%">
	<div style="margin: 0 auto;width: 80%"><h2>文件上传</h2></div>
			<input id="lefile" type="file" style="display:none" name="resourceFile">
			<div class="input-group">
				
				<input id="photoCover" class="form-control" type="text" style="height:34px ;width: 300px;">
				<span class="input-group-btn">
			        <a class="btn btn-primary" onclick="$('input[id=lefile]').click();">浏览 . . . </a>
			    </span>
			</div>
				<br/>
			<div class="input-group">
				<label for="catagory" class="control-label">分类</label>
				 <select name="catagory" class="form-control" id="catagory">
					<option value="视频">视频</option>
					<option value="音乐">音乐</option>
					<option value="文档">文档</option>
					<option value="其他">其他</option>
				</select>
			</div>
	        <div class="input-group">
				<label for="catagory" class="control-label">是否分享</label>
				<select name="is_share" class="form-control">
					<option value="1">是</option>
					<option value="0">否</option>
				</select>
			</div>
	        <div class="input-group">
				<label for="catagory" class="control-label">备注</label>
				<textarea name="memo"  class="form-control">
			</textarea>
			</div>
			<input type="hidden" name="father" value="${resources[0].father}">
			<input type="hidden" name="is_folder" value="0">
		</div>
					          </div>
					          <div class="modal-footer">
					            <button data-dismiss="modal" class="btn btn-default" type="button">关闭</button>
					            <input type="submit" class="btn btn-primary" value="上传" ">
					  
					          </div>
					        </div><!-- /.modal-content -->
					 </div><!-- /.modal-dialog -->
			</form>
				</div>	
				
				
	<!-- 创建文件夹 -->
		</div>
				<div>
				<div class="modal fade" id="createFolder" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
					<div class="modal-dialog">
					        <div class="modal-content">
					          <div class="modal-header">
					            <button data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
					            <h4 class="modal-title">创建文件夹</h4>
					          </div>
					          <form action="${pageContext.request.contextPath }/createFolder">
						          <div class="modal-body">
						          	<input type="hidden" name="uid" value="${sessionScope.user.uid }">
						          	<input type="hidden" name="father" value="${resources[0].father }">
						         	<input type="text" name="filename" value="" required="required" class="form-control" style="width: 130px;margin: 0 auto" placeholder="输入文件夹名">
						          </div>
						          <div class="modal-footer">
						            <button data-dismiss="modal" class="btn btn-default" type="button">关闭</button>
						           	<input type="submit" class="btn btn-primary" value="确定">
						          </div>
					          </form>
					        </div><!-- /.modal-content -->
					 </div><!-- /.modal-dialog -->
				</div>	
		</div>
</body>
</html>