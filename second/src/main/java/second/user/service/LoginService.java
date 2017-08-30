package second.user.service;

import java.util.Map;

public interface LoginService {

	Map<String, Object> openLoginSession(Map<String, Object> commandMap) throws Exception;

	Map<String, Object> adminLogin(Map<String, Object> commandmap) throws Exception;

}
