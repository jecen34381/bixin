package IDaoProduct;
import java.sql.SQLException;
import java.util.List;

import com.bixin.Entity.Order;
import com.bixin.Entity.Product;
public interface IDaoProduct {
public List<Product> findHotProducts() throws SQLException;
	// 查询最新商品
	public List<Product> findNewProducts() throws SQLException;
	public Product findProductById(String id);//通过id查找一个商品展示在商品详情页面
	
	public void addOrders(Order order) throws SQLException;//向订单表插入数据
	
	public void addOrderItems(Order order)throws SQLException;//向订单项表中插入数据
}
