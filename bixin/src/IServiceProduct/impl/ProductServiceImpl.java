package IServiceProduct.impl;
import java.sql.SQLException;
import java.util.List;

import com.bixin.Entity.Order;
import com.bixin.Entity.Product;
import com.bixin.utils.DataSourceUtils;

import IDaoProduct.IDaoProduct;
import IDaoProduct.impl.ProductDaoImpl;
import IServiceProduct.IServiceProduct;
public class ProductServiceImpl implements IServiceProduct {
	IDaoProduct dao = new ProductDaoImpl();

	@Override
	public List<Product> findHotProduct() {//返回最热商品
		List<Product> result = null;
		try {
			result = dao.findHotProducts();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Product> findNewProduct() {//返回最新商品
		List<Product> result = null;
		try {
			result = dao.findNewProducts();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public Product findProductById(String id) {//根据ID查找一个商品
		return dao.findProductById(id);
	}

	@Override
	public void submitOrders(Order order) {//提交订单的方法
		try {
			//1.开启事务
			DataSourceUtils.startTransaction();
			//2.调用dao层的操作order的方法
			dao.addOrders(order);
			//3.调用dao层的操作orderitem的方法
			dao.addOrderItems(order);
		} catch (SQLException e) {
			//事务回滚
			try {
				DataSourceUtils.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally{
			try {
				//提交释放资源
				DataSourceUtils.commitAndRelease();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
