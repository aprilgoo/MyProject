package second.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import second.board.dao.BoardDAO;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="boardDAO")
	private BoardDAO boardDAO;


	@Override
	public List<Map<String, String>>searchBoard(String opt, String keyword) throws Exception {	
		return boardDAO.searchBoard(opt, keyword);
	}

	@Override
	public void insertBoard(Map<String, Object> map) throws Exception {
		boardDAO.insertBoard(map);		
	}

	@Override
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception {
		Map<String,Object>resultMap = boardDAO.selectBoardDetail(map);			
		return resultMap;
	}

	@Override
	public void updateBoard(Map<String, Object> map) throws Exception {
		boardDAO.updateBoard(map);
		
	}

	@Override
	public void deleteBoard(Map<String, Object> map) throws Exception {
		boardDAO.deleteBoard(map);
		
	}


}
