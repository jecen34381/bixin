package com.bixin.Servicelog_Reg.impl;
import com.bixin.Daolog_Reg.impl.DaoLogAndRegImpl;
import com.bixin.IDaolog_Reg.IDaoLogAndReg;
import com.bixin.IServicelog_Reg.IServiceLogAndReg;
import com.bixin.Entity.User;
public class ServiceLogAndRegImpl implements IServiceLogAndReg{
	private IDaoLogAndReg userDao = new DaoLogAndRegImpl();
	@Override
	public boolean saveUser(User u) {//实现接口中保存用户的方法
		return userDao.saveUser(u)>0;
	}
	@Override
	public User selectByUser(String userName) {//通过用户名查找
		return userDao.selectByUser(userName);
	}
	@Override
	public boolean editState(String code) {//激活状态码
		return userDao.editState(code)>0;
	}
	@Override
	public User checkLogin(String userName, String userPass) {//判断用户名和密码是否正确
		return userDao.checkLogin(userName, userPass);
	}
	@Override
	public User selectByUid(String uid) {//通过UID查一个用户
		return userDao.selectByUid(uid);
	}
	@Override
	public boolean updateUser(User user) {//修改用户个人信息
		return userDao.updateUser(user)>0;
	}
}
