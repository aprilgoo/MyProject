package second.join.service;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import second.join.dao.JoinDAO;

@Service("JoinService")
public class JoinServiceImpl implements JoinService {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="joinDAO")
	private JoinDAO joinDAO;

	@Override
	public void insertJoinForm(Map<String, Object> map) throws Exception {
		joinDAO.insertJoinForm(map);	
	}

}
