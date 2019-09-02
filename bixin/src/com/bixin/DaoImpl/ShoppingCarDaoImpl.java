package com.bixin.DaoImpl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.bixin.Entity.Car;
import com.bixin.IDao.IShoppingCarDao;
import com.bixin.utils.DataSourceUtils;

public class ShoppingCarDaoImpl implements IShoppingCarDao {

	@Override
	public boolean addProductToCar(Car car) throws SQLException {
		// TODO Auto-generated method stub
		Connection conn = DataSourceUtils.getConnection();
		QueryRunner query = new QueryRunner();
		String sql = "insert into car(cname,cimage,cprice,cnumber,uid) values(?,?,?,?,?)";
		Object[] params = {car.getCname(),car.getCimage(),car.getCprice(),car.getCnumber(),car.getUid()};
		int status = query.update(conn, sql, params);
		System.out.println(status);
		if(status > 0) {
			return true;
		}
		conn.close();
		return false;
	}

	@Override
	public boolean deleteProductToCar(int cid) throws SQLException {
		// TODO Auto-generated method stub
		Connection conn = DataSourceUtils.getConnection();
		QueryRunner query = new QueryRunner();
		String sql = "delete from car where cid = ?";
		int status = query.update(conn, sql, cid);
		System.out.println(status);
		if(status > 0) {
			return true;
		}
		conn.close();
		return false;
	}

	@Override
	public List<Car> getAllCarProList(String uid) throws SQLException {
		// TODO Auto-generated method stub
		Connection conn = DataSourceUtils.getConnection();
		QueryRunner query = new QueryRunner();
		String sql = "select * from car where uid=?";
		List<Car> list = query.query(conn, sql, new BeanListHandler<Car>(Car.class), uid);
		conn.close();
		return list;
	}

}
