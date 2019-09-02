package com.bixin.IDaolog_Reg;
import com.bixin.Entity.User;
public interface IDaoLogAndReg {
	public int saveUser(User u);//保存一个用户的方法
	public User selectByUser(String userName);//通过ajax检查用户名是否重复的方法
	public int editState(String code);//通过验证码修改状态码
	public User checkLogin(String userName,String userPass);//检查用户登录
	public User selectByUid(String uid);//通过UID查一个用户
	public int updateUser(User user) ;//修改用户个人信息
}
