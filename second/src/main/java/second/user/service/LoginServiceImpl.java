package second.user.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

  import second.user.dao.LoginDAO;

@Service("loginService")
public class LoginServiceImpl implements LoginService {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="loginDAO")
	private LoginDAO loginDAO;

	@Override
	public Map<String, Object> openLoginSession(Map<String, Object>map) throws Exception {
		
		return loginDAO.openLoginSession(map);
				
	}

	@Override
	public Map<String, Object> adminLogin(Map<String, Object> map) throws Exception {
		
		return loginDAO.adminLogin(map);
	}
}
