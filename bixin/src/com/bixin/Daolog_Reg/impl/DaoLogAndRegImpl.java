package com.bixin.Daolog_Reg.impl;
import java.sql.SQLException;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import com.bixin.IDaolog_Reg.IDaoLogAndReg;
import com.bixin.Entity.User;
import com.bixin.utils.DataSourceUtils;
public class DaoLogAndRegImpl implements IDaoLogAndReg{
	private QueryRunner q = new QueryRunner(DataSourceUtils.getDataSource());
	@Override
	public int saveUser(User u) {//实现接口中保存用户的方法
		int result = 0;
		String sql = "insert into user(uid,username,password,name,email,birthday,state,sex,code)"
				+ "values(?,?,?,?,?,?,?,?,?)";
		Object[] obj = {u.getUid(),u.getUsername(),u.getPassword(),u.getName(),u.getEmail(),
				u.getBirthday(),u.getState(),u.getSex(),u.getCode()};
		try {
			result = q.update(sql, obj);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	@Override
	public User selectByUser(String userName) {//通过用户名查询
		User user = null;
		String sql  = "select * from user where username = ?";
		try {
			user = q.query(sql, new BeanHandler<User>(User.class),userName);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}
	@Override
	public int editState(String code) {//激活状态码
		int result = 0;
		String sql = "update user set state = 1 where code = ?";
		try {
			result = q.update(sql, code);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	@Override
	public User checkLogin(String userName, String userPass) {//判断用户名和密码是否正确
		User user = null;
		String sql = "select * from user where username = ? and password = ?";
		try {
			user = q.query(sql,new BeanHandler<User>(User.class),userName,userPass);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}
	@Override
	public User selectByUid(String uid) {//通过UID查一个用户
		User user = null;
		String sql = "select * from user where uid = ?";
		try {
			user = q.query(sql, new BeanHandler<User>(User.class),uid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}
	@Override
	public int updateUser(User user) {//修改用户个人信息
		int result = 0;
		Object[] obj = {user.getUsername(),user.getName(),user.getEmail()
				,user.getSex(),user.getBirthday(),user.getUid()};
		String sql = "update user set username = ?,name = ?,email = ? , sex = ?,birthday = ? where uid = ?";
		try {
			result = q.update(sql, obj);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
}
