package second.user.controller;

import java.util.HashMap;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import second.common.common.CommandMap;
import second.user.service.LoginService;

@Controller
public class AdminController {
	
Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="loginService")
	private LoginService loginService;
	
	@RequestMapping(value="/user/adminLogin.do")
    public String adminLogin(HttpSession session, HttpServletResponse response, HttpServletRequest request, CommandMap commandMap) throws Exception {
    	String returnURL = "";	    	    	
     	Map<String,Object>map = new HashMap<String, Object>();
    	map = loginService.adminLogin(commandMap.getMap());    
    	
	    	if(session.getAttribute("admin") != null) {
	    		session.removeAttribute("admin");
	    	}	
    	
         	if (request.getParameter("user_id").equals((String)map.get("admin")) && request.getParameter("user_password").equals((String)map.get("admin_password"))) {    		
	    	  	log.debug("로그인되었습니다");
	    	  	commandMap.put("user_id", "admin");
	    	  	commandMap.put("user_type", "관리자");
	    	  	request.getSession().setAttribute("admin", map);
	    	  	returnURL = "redirect:/page/user/admin_main.jsp";      
	    		return returnURL;		
        	} 	    
         	
         	else {       
    			
	    	log.debug("아이디와 비밀번호를 확인하세요");    	    	
	    	returnURL = "redirect:/page/user/loginpage.jsp";
	    	return returnURL;    	
	    	
    		}
         	
    }

}
