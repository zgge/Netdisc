package utils;

import java.util.HashMap;
import java.util.regex.Pattern;

import pojo.User;


public class UserFormValidate {
	public static HashMap<String,String> validate(User user){
		HashMap<String,String> errors = new HashMap<String,String>();
		String usernamePattern ="^[a-zA-Z0-9\\u4e00-\\u9fa5]{2,13}$";
		String pswPattern = "^[a-zA-Z0-9]{3,13}$";
		String emailPattern="^[A-Za-z0-9\\u4e00-\\u9fa5]+@[a-zA-Z0-9_-]+(\\.[a-zA-Z0-9_-]+)+$";
		String telPattern="/^[0-9]{11}$/;";
		if(user.getUsername()==null||!Pattern.matches(usernamePattern, user.getUsername())){
			errors.put("username", "用户名格式错误");
		}
		if(user.getPassword()==null||!Pattern.matches(pswPattern, user.getPassword())){
			errors.put("password", "密码格式错误");
		}
		if(user.getRepwd()==null||!user.getRepwd().equals(user.getPassword())){
			errors.put("pwd", "确认密码与密码不一致");
		}
		if(user.getEmail()==null||!Pattern.matches(emailPattern, user.getEmail())){
			errors.put("emial", "邮箱格式错误");
		}
		if(user.getMemo()==null) {
			errors.put("memo", "简介不能为空");
		}
		if(user.getTel()==null||Pattern.matches(telPattern, user.getTel())) {
			errors.put("tel", "手机号格式错误");
		}
		return errors;
	}
}
