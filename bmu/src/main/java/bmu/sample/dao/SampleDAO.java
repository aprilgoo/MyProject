package bmu.sample.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import bmu.common.dao.AbstractDAO;
 
@Repository("sampleDAO")
// @Repository로 이 클래스가 DAO임을 선언
public class SampleDAO extends AbstractDAO{
	
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception{
        return (List<Map<String, Object>>)selectList("sample.selectBoardList", map);

        //selectList는 MyBatis의 기본 기능 : 리스트를 조회할 때 사용
        //메서드의 인자는 두 가지로 첫번째는 쿼리 이름, 두 번째는 쿼리가 실행되는데 필요한 변수들
        //sample.selectBoardList가 쿼리 이름이며, Map<String,Object> map이 쿼리 실행시 필요한 변수들임
        //결과값은 형변환을 함
    }
    
}
