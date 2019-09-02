package IDaoProduct.impl;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.bixin.Entity.Order;
import com.bixin.Entity.OrderItem;
import com.bixin.Entity.Product;
import com.bixin.utils.DataSourceUtils;

import IDaoProduct.IDaoProduct;

public class ProductDaoImpl implements IDaoProduct {
	QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
	@Override
	public List<Product> findHotProducts() throws SQLException {//查找最新商品
		String sql = "select * from product where is_hot = 1 limit 9;";
		List<Product> result = (List<Product>)runner.query(sql, new BeanListHandler<>(Product.class));
		return result;
	}

	@Override
	public List<Product> findNewProducts() throws SQLException {//查找最热商品
		String sql = "select * from product order by pdate desc limit 9;";
		List<Product> result = (List<Product>)runner.query(sql, new BeanListHandler<>(Product.class));
		return result;
	}

	@Override
	public Product findProductById(String id) {//根据ID查找一个商品
		Product product = null;
		String sql = "select * from product where pid = ?";
		try {
			product = runner.query(sql, new BeanHandler<Product>(Product.class),id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return product;
	}

	@Override
	public void addOrders(Order order) throws SQLException{//向订单表插入数据
		String sql = "insert into orders values(?,?,?,?,?,?,?,?)";
		runner.update( DataSourceUtils.getConnection(),sql, order.getOid(),order.getOrdertime(),order.getTotal(),
                    order.getState(),order.getAddress(),order.getName(),
                    order.getTelephone(),order.getUser().getUid());
	}

	@Override
	public void addOrderItems(Order order) throws SQLException{//向订单项表中插入数据
		for(OrderItem item : order.getOrderItems())
		{
			String sql = "insert into orderitem values(?,?,?,?,?)";
			runner.update(DataSourceUtils.getConnection(),sql,item.getItemid(),item.getCount(),item.getSubtotal(),
					item.getProduct().getPid(),order.getOid());
		}
	}
}
