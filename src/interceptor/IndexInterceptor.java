package interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import pojo.User;

public class IndexInterceptor extends HandlerInterceptorAdapter {  
 
    public boolean preHandle(HttpServletRequest request,    
            HttpServletResponse response, Object handler) throws Exception {
    	User user=(User) request.getSession().getAttribute("user");
    	if(user==null) {
    		  response.setContentType("text/html;charset=utf-8");
              PrintWriter out =  response.getWriter();
              out.println("<script language='javascript' type='text/javascript'>");
              out.println("window.top.location.href='" +  request.getContextPath() + "/loginPage'");
              out.println("</script>");
    		
    		return false;
    	}else {
    		return true;
    	}
        
  
    }  

    
    public void postHandle(HttpServletRequest request,    
            HttpServletResponse response, Object handler,    
            ModelAndView modelAndView) throws Exception {  
    
    }  

   
    
    public void afterCompletion(HttpServletRequest request,    
            HttpServletResponse response, Object handler, Exception ex)  
    throws Exception {  
           
    }  
      
} 