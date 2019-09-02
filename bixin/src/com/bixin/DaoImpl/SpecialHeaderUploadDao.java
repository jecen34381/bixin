package com.bixin.DaoImpl;

import java.sql.Connection;
import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.bixin.utils.DataSourceUtils;

public class SpecialHeaderUploadDao {

	//根据图片名字和图片用户id存储图片链接
	public boolean saveHeaderImage(String name,String uid) throws SQLException{
		Connection conn = DataSourceUtils.getConnection();
		int status = -1;
		QueryRunner query = new QueryRunner();
		String queryStatus = "select himage from Uimage where uid=?";
		String IStatus = query.query(conn, queryStatus, new ScalarHandler<String>(), uid);
		if(IStatus == null || IStatus == "") {
			String insert = "insert into Uimage values(?,?)";
			status = query.update(conn, insert, name, uid);
		}else {
			String sql = "update Uimage set himage=? where uid=?";
			status = query.update(conn, sql,name,uid);
		}
		System.out.println(status);
		if(status > 0) {
			return true;
		}
		conn.close();
		return false;
	
	}
	//根据图片名字和图片用户id存储图片链接
		public String getHeaderImage(String uid) throws SQLException{
			Connection conn = DataSourceUtils.getConnection();
			QueryRunner query = new QueryRunner();
			String sql = "select himage from Uimage where uid = ?";
			String imageName = query.query(conn, sql, new ScalarHandler<String>(), uid);
			
			return imageName;
		
		}
}
