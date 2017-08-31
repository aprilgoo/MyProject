package second.cart.Service;

import java.util.List;
import java.util.Map;

import second.common.common.CommandMap;


public interface CartService {

	List<Map<String, Object>> openCartList(CommandMap commandMap) throws Exception;

	void deleteCart(Map<String, Object>map) throws Exception;

}
