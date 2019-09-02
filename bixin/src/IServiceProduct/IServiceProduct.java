package IServiceProduct;
import java.util.List;

import com.bixin.Entity.Order;
import com.bixin.Entity.Product;

public interface IServiceProduct {
	public List<Product> findHotProduct();
	public List<Product> findNewProduct();
	public Product findProductById(String id);//通过id查找一个商品展示在商品详情页面
	
	public void submitOrders(Order order);//处理定单的方法
}
