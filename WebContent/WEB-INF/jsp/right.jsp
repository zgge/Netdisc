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
		$("#b").click();
	});
</script>
</head>
<body>
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" style="display: none;" id="b">
 提问（点击弹出模态窗口）
</button>
	<form action="${pageContext.request.contextPath }/listResourceByName">
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog">
			        <div class="modal-content">
			          <div class="modal-header">
			            <button data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
			            <h4 class="modal-title">搜索用户资源</h4>
			          </div>
			          <div class="modal-body">
			         	<input type="text" name="username" required="required" class="form-control" style="width: 100px;margin: 0 auto" placeholder="输入用户名">
			          </div>
			          <div class="modal-footer">
			            <button data-dismiss="modal" class="btn btn-default" type="button">关闭</button>
			            <input type="submit" class="btn btn-primary" value="搜索">
			          </div>
			        </div><!-- /.modal-content -->
			 </div><!-- /.modal-dialog -->
		</div>	
	</form>
		
</body>
</html>