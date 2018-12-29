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
	 $(document).ready(function(){
		 $("#catalog").val('${resource.catalog}');
		 $("#is_share").val('${resource.is_share}');
	 })
</script>
<style type="text/css">
</style>
</head>
<body>
	<div style="margin: 0 auto; width: 30%">
		<div style="margin-left:40px;"><h2>修改文件信息</h2></div>
		<form action="${pageContext.request.contextPath }/edit" method="post">
		<input type="hidden" name="id" value="${resource.id }" ></input>
		<div class="input-group">
			<label for="filename" class="control-label">文件名</label>
			<input type="text" class="form-control" value="${resource.filename}" name="filename" id="filename">		 
		</div>
		<div class="input-group">
			<label for="catalog" class="control-label">分类</label>
			<select name="catalog" class="form-control" id="catalog">
				<option value="视频">视频</option>
				<option value="音乐">音乐</option>
				<option value="文档">文档</option>
				<option value="其他">其他</option>
			</select>
		</div>
		<div class="input-group">
			<label for="is_share" class="control-label">是否分享</label>
			<select name="is_share" id="is_share" class="form-control" >
				<option value="1">是</option>
				<option value="0">否</option>
			</select>
		</div>
		<div class="input-group">
			<label for="memo" class="control-label">文件描述</label>
			<input type="text" class="form-control" value="${resource.memo}" name="memo" id="memo">		 
		</div>
		<input type="submit" class="btn btn-primary" value="修改">
		</form>
	</div>
</body>
</html>