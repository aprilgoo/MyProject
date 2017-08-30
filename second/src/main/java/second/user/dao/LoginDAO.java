package second.user.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import second.common.dao.AbstractDAO;

@Repository("loginDAO")
public class LoginDAO extends AbstractDAO {
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> openLoginSession(Map<String, Object> map) throws Exception {
		return (Map<String, Object>)selectOne("login.openLoginSession", map);
	
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> adminLogin(Map<String, Object> map) throws Exception {
		return (Map<String, Object>)selectOne("login.adminLogin", map);
	}
}
