package com.bixin.ServiceImpl;

import java.sql.SQLException;
import java.util.List;

import com.bixin.DaoImpl.ShoppingCarDaoImpl;
import com.bixin.Entity.Car;
import com.bixin.IService.IShoppingCarService;

public class ShoppingCarServiceImple implements IShoppingCarService{

	@Override
	public boolean addProductToCar(Car car) {
		// TODO Auto-generated method stub
		boolean status = false;
		try {
			status = new ShoppingCarDaoImpl().addProductToCar(car);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return status;
	}

	@Override
	public boolean deleteProductToCar(int cid) {
		// TODO Auto-generated method stub
		boolean status = false;
		try {
			status = new ShoppingCarDaoImpl().deleteProductToCar(cid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return status;
	}

	@Override
	public List<Car> getAllCarProList(String uid) {
		// TODO Auto-generated method stub
		List<Car> list = null;
		try {
			list = new ShoppingCarDaoImpl().getAllCarProList(uid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

}
