package com.bixin.ServiceImpl;

import java.sql.SQLException;
import java.util.List;

import com.bixin.DaoImpl.PersonCenterDaoImpl;
import com.bixin.Entity.User;
import com.bixin.IService.IPersonCenterService;

public class PersonCenterImpl implements IPersonCenterService {

	@Override
	public User getUserInfo(String uid){
		// TODO Auto-generated method stub
		User user = null;
		try {
			user = new PersonCenterDaoImpl().getUserInfo(uid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}

	@Override
	public String getUserName(String uid) {
		// TODO Auto-generated method stub
		String name = "";
		try {
			name = new PersonCenterDaoImpl().getUserName(uid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return name;
	}

}
