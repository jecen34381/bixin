package com.bixin.IDao;

import java.sql.SQLException;
import java.util.List;

import com.bixin.Entity.User;

public interface IPersonCenterDao {

	public User getUserInfo(String uid) throws SQLException;
	public String getUserName(String uid) throws SQLException;
}
