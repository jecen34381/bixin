package com.bixin.DaoImpl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import org.junit.Test;

import com.bixin.Entity.User;
import com.bixin.IDao.IPersonCenterDao;
import com.bixin.utils.DataSourceUtils;

public class PersonCenterDaoImpl implements IPersonCenterDao {

	@Override
	public User getUserInfo(String uid) throws SQLException {
		// TODO Auto-generated method stub
		Connection conn = DataSourceUtils.getConnection();
		QueryRunner query = new QueryRunner();
		String sql = "select * from user where uid=?";
		User user = query.query(conn, sql, new BeanHandler<User>(User.class), uid);
		return user;
	}
	@Override
	public String getUserName(String uid) throws SQLException {
		String name = "";
		Connection conn = DataSourceUtils.getConnection();
		QueryRunner query = new QueryRunner();
		String sql = "select username from user where uid=?";
		name = query.query(conn, sql, new ScalarHandler<String>(), uid);
		return name;
	}

	
}
