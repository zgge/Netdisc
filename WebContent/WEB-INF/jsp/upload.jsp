<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
	$(function(){
		if(${not empty msg}){
			alert('${msg}');
		}
	});
</script>
<style type="text/css">
.button {
	    background-color: #4CAF50; /* Green */
	    border: none;
	    color: white;
	    border-radius:3px;
	    padding: 8px 15px;
	    text-align: center;
	    text-decoration: none;
	    display: inline-block;
	    font-size: 13px;
		}
body{
			background-color: #F7F7F7
		}
</style>
</head>
<body>
	<form action="${pageContext.request.contextPath }/uploadResource" method="post" enctype="multipart/form-data">
	<table style="margin: 0 auto; margin-top: 120px; height:300px; background-color: #D0DFEE; padding: 20px; border-radius: 15px;">
		<tr>
			<td>选择文件</td>
			<td><input type="file" name="resourceFile" required="required"></td>
		</tr>
		<tr>
			<td>选择分类</td>
			<td><select name="catagory">
				<option value="视频">视频</option>
				<option value="音乐">音乐</option>
				<option value="文档">文档</option>
				<option value="其他">其他</option>
			</select></td>
		</tr>
		<tr>
			<td>是否共享</td>
				<td><select name="is_share">
				<option value="1">是</option>
				<option value="0">否</option>
			</select></td>
		</tr>
		<tr>
			<td>文件描述</td>
			<td><textarea name="memo" cols="35" rows="3">
			</textarea></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" class="button" value="上传">
			</td>
		</tr>
	</table>
	</form>
</body>
</html>