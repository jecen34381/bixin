package com.bixin.IService;

import java.sql.SQLException;
import java.util.List;

import com.bixin.Entity.User;

public interface IPersonCenterService {

	public User getUserInfo(String uid);
	public String getUserName(String uid);
}
