package bmu.sample.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import bmu.sample.dao.SampleDAO;
 
@Service("sampleService")
public class SampleServiceImpl implements SampleService{
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="sampleDAO")
	private SampleDAO sampleDAO;

	@Override
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) 
			throws Exception {
		return sampleDAO.selectBoardList(map);
	}
	// service 인터페이스를 통해 정의된 메서드를 실제로 구현
	//@service 어노테이션을 통해서 service 객체임을 선언함
	// 객체의 이름은 sampleService임을 선언
	
	
	
	
}
