package bmu.sample.service;

import java.util.List;
import java.util.Map;

public interface SampleService {
	// 비즈니스 로직의 수행을 위한 메서드를 정의
	
	List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception;
	//throws Exception : 추후 에러처리를 위함
	

}
