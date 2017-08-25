package second.user.service;

import java.util.List;
import java.util.Map;

public interface LoginService {

	Map<String, Object> openLoginSession(Map<String, Object> commandMap) throws Exception;

}
