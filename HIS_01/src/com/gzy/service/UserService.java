package com.gzy.service;

import java.sql.SQLException;

import com.gzy.damain.User;
import com.gzy.dao.userDao;

public class UserService {

	public boolean checkUsername(String username) throws SQLException {
		userDao dao=new userDao();
		long isExit=dao.checkUsername(username);
		return isExit>0?true:false;
	}

	public User login(String username, String userpassword) throws SQLException {
		userDao dao=new userDao();
		User user=dao.login(username,userpassword);
		return user;
	}

}
