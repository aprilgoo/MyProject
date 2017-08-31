package second.cart.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import second.common.common.CommandMap;
import second.common.dao.AbstractDAO;

@Repository("cartDAO")
public class CartDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>>openCartList(CommandMap commandMap) {
		Map<String,Object>map = new HashMap<String,Object>();
		return (List<Map<String,Object>>)selectList("cart.openCartList", map);
	}
	
	public void deleteCart(Map<String, Object> map) {
		update("cart.deleteCart", map);
		
		
	}

}
