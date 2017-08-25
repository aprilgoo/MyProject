package bmu.common.session;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class CommonSession extends HandlerInterceptorAdapter {
	
	Logger log = Logger.getLogger(this.getClass());
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		log.info("session체크");
		HttpSession session = request.getSession();
		
		String login = (String)session.getAttribute("login");
		
		log.info("현재 로그인하려는 login =" + login);
		
		if (login == null) {
			
			response.sendRedirect("login.do");
			return false;
			
		}
		
		else return true;			
	}
}
