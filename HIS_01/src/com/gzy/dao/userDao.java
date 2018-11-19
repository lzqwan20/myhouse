package com.gzy.dao;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.gzy.Utils.C3P0Utils;
import com.gzy.damain.User;

public class userDao {
		//是否存在用户
		public long checkUsername(String username) throws SQLException {
			QueryRunner runner=new QueryRunner(C3P0Utils.getDataSource());
			String sql="select count(*) from student where username=?";
			long query = (long) runner.query(sql, new ScalarHandler(),username);
			return query;
		}

		public User login(String username, String userpassword) throws SQLException {
			//获取核心类queryrunner
			QueryRunner qr=new QueryRunner(C3P0Utils.getDataSource());
			//编写sql语句
			String sql="select * from student where username=? and password=?";
			//执行查询
			User user = qr.query(sql, new BeanHandler<User>(User.class),username,userpassword);
			return user;
		}
}
