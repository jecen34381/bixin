package com.bixin.IService;

import java.sql.SQLException;
import java.util.List;

import com.bixin.Entity.Car;

public interface IShoppingCarService {

	public boolean addProductToCar(Car car);
	public boolean deleteProductToCar(int cid);
	public List<Car> getAllCarProList(String uid);
}
