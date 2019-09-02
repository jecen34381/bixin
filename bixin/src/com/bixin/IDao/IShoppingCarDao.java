package com.bixin.IDao;

import java.sql.SQLException;
import java.util.List;

import com.bixin.Entity.Car;

public interface IShoppingCarDao {

	public boolean addProductToCar(Car car) throws SQLException;
	public boolean deleteProductToCar(int cid) throws SQLException;
	public List<Car> getAllCarProList(String uid) throws SQLException;
	
}
