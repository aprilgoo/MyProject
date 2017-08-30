
package second.user.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import second.common.common.CommandMap;
import second.user.service.LoginService;

@Controller
public class LoginController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="loginService")
	private LoginService loginService;
	
	@RequestMapping(value="/sample/testMapArgumentResolver.do")
	public ModelAndView testMapArgumentResolver(CommandMap commandMap) throws Exception{
	    ModelAndView mv = new ModelAndView("");
	     
	    if(commandMap.isEmpty() == false){
	        Iterator<Entry<String,Object>> iterator = commandMap.getMap().entrySet().iterator();
	        Entry<String,Object> entry = null;
	        while(iterator.hasNext()){
	            entry = iterator.next();
	            log.debug("key : "+entry.getKey()+", value : "+entry.getValue());
	            }
	        }
	    return mv;
	}
	
    @RequestMapping(value="/user/login_Form.do") 
    public ModelAndView login_Form() throws Exception {
    	log.debug("로그인 페이지로 이동합니다");
    	ModelAndView mv = new ModelAndView("redirect:/page/user/user_login.jsp");     	
    	return mv;    	 	
    }    
	
    
    @RequestMapping(value="/user/openLoginSession.do")
    public String openLoginSession(HttpSession session, HttpServletResponse response, HttpServletRequest request, CommandMap commandMap) throws Exception {
    	String returnURL = "";	    	    	
     	Map<String,Object>map = new HashMap<String, Object>();
    	map = loginService.openLoginSession(commandMap.getMap());    
    	
	    	if(session.getAttribute("user") != null) {
	    		session.removeAttribute("user");
	    	}	
    	
         	if (request.getParameter("user_id").equals((String)map.get("user_id")) && request.getParameter("user_password").equals((String)map.get("user_password"))) {    		
	    	  	log.debug("로그인되었습니다");
	    	  	commandMap.put("user_id", "user");
	    	  	commandMap.put("user_type", "사용자");
	    	  	request.getSession().setAttribute("user", map);
	    	  	returnURL = "redirect:/page/user/user_main.jsp";      
	    		return returnURL;		
        	} 	    
         	
         	else {       
    			
	    	log.debug("아이디와 비밀번호를 확인하세요");    	    	
	    	returnURL = "redirect:/page/user/user_login.jsp";
	    	return returnURL;    	
	    	
    		}
         	
    }
    

	@RequestMapping(value="/user/user_main.do") 
    public ModelAndView user_Main() throws Exception {
    	log.debug("사용자 메인 페이지로 이동합니다");
    	ModelAndView mv = new ModelAndView("redirect:/page/user/user_main.jsp");     	
    	return mv;
    	 	
    }    
    
}

