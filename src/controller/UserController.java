package controller;

import java.security.GeneralSecurityException;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import pojo.User;
import service.UserService;
import utils.Mail;
import utils.UserFormValidate;

@Controller
@Scope("prototype")
@RequestMapping("")
public class UserController {
	@Autowired
	UserService service;
	@RequestMapping("user_login")
	public ModelAndView login(User user,HttpServletRequest req) {
		ModelAndView mav=new ModelAndView();
		User u=service.login(user);
		if(u==null) {
			mav.setViewName("index");
			mav.addObject("error","账号或密码错误");
		}else {
			mav.setViewName("redirect:home");
			req.getSession().setAttribute("user", u);
		}
		return mav;
	}
	@RequestMapping("doRegister")
	public ModelAndView doRegister(User user) throws GeneralSecurityException {
		ModelAndView mav=new ModelAndView();
		HashMap<String,String> errors=UserFormValidate.validate(user);
		if(!errors.isEmpty()) {
			mav.addAllObjects(errors);
			System.out.println("error");
			mav.setViewName("register");
		}else {
			user.setCode(UUID.randomUUID().toString());
			user.setState(0);
			service.register(user);
			sendKey(user);
			mav.addObject("msg", "注册成功，快去邮箱激活体验吧！");
			mav.setViewName("index");
		}
		return mav;	
	}
	public void sendKey(User user) throws GeneralSecurityException {
		String url="http://localhost:8080/MyPan/activateUser?code="+user.getCode()+"  点击激活";
		Mail.SendMail(user, "网盘账户激活", user.getUsername()+"，你好。"+url);
		System.out.println("发送成功！");
		
	}
	@RequestMapping("activateUser")
	public ModelAndView activateUser(String code) {
		ModelAndView mav=new ModelAndView();
		if(service.activate(code)==0) {
			mav.addObject("msg", "激活失败");
		}else {
			mav.addObject("msg", "激活成功");
		}
		mav.setViewName("index");
		return mav;
	}
	@RequestMapping("sendResetMail")
	public ModelAndView sendResetMail(String username) throws GeneralSecurityException {
		User user=service.getUserByName(username);
		String url="http://localhost:8080/MyPan/goReset?code="+user.getCode()+"  点击重置密码";
		Mail.SendMail(user, "网盘密码重置", user.getUsername()+"，你好。"+url);
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", "发送成功！");
		mav.setViewName("resetPwd");
		return mav;
	}
	@RequestMapping("goReset")
	public ModelAndView goReset(String code) {
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("code", code);
		mav.setViewName("resetPage");
		return mav;
	}
	@RequestMapping("reset")
	public ModelAndView reset(User user) {
		service.reset(user);
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", "修改成功");
		System.out.println("修改成功");
		mav.setViewName("index");
		return mav;
	}
	@ResponseBody
	@RequestMapping("checkUpdateName")
	public String checkUpdateName(HttpServletRequest req,String username) {
		String result;
		//获取已登录用户
		User u=(User) req.getSession().getAttribute("user");
		User user=service.checkName(username);
		if(user==null) {
			result="OK";
		}else if(u.getUsername().equals(user.getUsername())) {
			result="OK";
		}else{
			result="用户名已存在";
		}
		return result;
	}
	@ResponseBody
	@RequestMapping("checkName")
	public String check(String username) {
		String result;
		User user=service.checkName(username);
		if(user!=null) {
			result="用户名已存在";
		}else{
			result="OK";
		}
		return result;
	}
	@RequestMapping("register")
	public String register() {
		return "register";
	}
	@RequestMapping("logout")
	public ModelAndView logout(HttpServletRequest request) {
		ModelAndView mav =new ModelAndView();
		request.getSession().removeAttribute("user");
		mav.setViewName("index");
		mav.addObject("msg","注销成功！");
		return mav;
	}
	@RequestMapping("updateUser")
	public ModelAndView updateUser(User user) {
		ModelAndView mav=new ModelAndView();
		if(service.updateUser(user)==0) {
			mav.addObject("msg","修改失败");
		}else {
			mav.addObject("msg","修改成功");
		}
		mav.setViewName("userInfo");
		return mav;
	}
	@RequestMapping("loginPage")
	public String login() {
		return "index";
	}
	@RequestMapping("resetPwd")
	public String resetPwd() {
		return "resetPwd";
	}
	@RequestMapping("resetPage")
	public String resetPage() {
		return "resetPage";
	}
	@RequestMapping("userInfo")
	public String userInfo() {
		return "userInfo";
		
	}
}
