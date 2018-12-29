function checkname(){	
	var username=$("#username").val();
	if(username.length==0){
		document.getElementById("usernameMsg").innerHTML="<em style='color: red;'>用户名不能为空</em>";
		return;
	}
	re=/^[a-zA-Z0-9_\u4e00-\u9fa5]{2,13}$/;
	if(!re.test(username)){
		document.getElementById("usernameMsg").innerHTML="<em style='color: red;'>用户名必须由2到13位的字符组成</em>";

	}else{
		$.ajax({
			type:"post",
			url:$("#path").val()+"/checkName",
			data:{username:$("#username").val()},
			dataType:"text",
			success:function(data){
				$("#usernameMsg").html("<em style='color: red;'>"+data+"</em>");
			}
		});
	}
}
function checkpassword(){
	var password=$("#password").val();
	if(password.length==0){
		document.getElementById("passwordMsg").innerHTML="<em style='color: red;'>密码不能为空</em>";
		return;
	}
	re=/^[a-zA-Z0-9]{3,13}$/;
	if(!re.test(password)){
		document.getElementById("passwordMsg").innerHTML="<em style='color: red;'>密码必须由3到13位的字母、数字组成</em>";
	}else{
		document.getElementById("passwordMsg").innerHTML="<em style='color: red;'>OK</em>";
	}
}
function checkmemo(){
	var memo=$("#memo").val();
	if(memo.length==0){
		document.getElementById("memoMsg").innerHTML="<em style='color: red;'>个人简介不能为空</em>";
		return;
	}else{
		document.getElementById("memoMsg").innerHTML="<em style='color: red;'>OK</em>";
		return;
	}
}
function checktele(){
	var tele=$("#tele").val();
	re=/^[0-9]{11}$/;
	if(!re.test(tele)){
		document.getElementById("teleMsg").innerHTML="<em style='color: red;'>手机号码格式错误</em>";
	}else{
		document.getElementById("teleMsg").innerHTML="<em style='color: red;'>OK</em>";
	}
}

function checkrepassword(){
	var repassword=$("#repwd").val();
	var password=$("#password").val();
	if(repassword.length==0){
		document.getElementById("repwdMsg").innerHTML="<em style='color: red;'>确认密码不能为空</em>";
		return;
	}
	if(repassword!=password){
		document.getElementById("repwdMsg").innerHTML="<em style='color: red;'>两次密码不同</em>";
	}else{
		document.getElementById("repwdMsg").innerHTML="<em style='color: red;'>OK</em>";
	}
}
function checkemail(){
	var email=$("#email").val();
	if(email.length==0){
		document.getElementById("emailMsg").innerHTML="<em style='color: red;'>邮箱不能为空</em>";
		return;
	}
	re=/^[a-zA-z0-9_-]+@[a-zA-z0-9-]+(\.[a-zA-z0-9]{2,4}){1,2}$/;
	if(!re.test(email)){
		document.getElementById("emailMsg").innerHTML="<em style='color: red;'>邮箱格式错误！</em>";
	}else{
		document.getElementById("emailMsg").innerHTML="<em style='color: red;'>OK</em>";
	}
}
function Logintest(){
	checkmemo();
	checktele();
	checkemail();
	checkpassword();
	checkrepassword();
	checkname();
	if($("#usernameMsg").text()=="OK" && $("#passwordMsg").text()=="OK" && $("#repwdMsg").text()=="OK" && $("#emailMsg").text()=="OK"&& $("#teleMsg").text()=="OK"&& $("#memoMsg").text()=="OK"){
		return true;
	}else{
		return false;
	}
}