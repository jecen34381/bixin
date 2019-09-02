package com.bixin.IServicelog_Reg;
import com.bixin.Entity.User;
public interface IServiceLogAndReg {
	public boolean saveUser(User u);//保存用户
	public User selectByUser(String userName);//通过ajax检查用户名是否重复的方法
	public boolean editState(String code);//通过验证码修改状态码
	public User checkLogin(String userName,String userPass);//检查用户登录
	public User selectByUid(String uid);//通过UID查一个用户
	public boolean updateUser(User user) ;//修改用户个人信息
}
