package com.bixin.DaoImpl;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.junit.Test;

import com.bixin.Entity.Pbook;
import com.bixin.IDao.IShopVideoDao;

import com.bixin.utils.DataSourceUtils;

public class VideoProductListDaoImpl implements IShopVideoDao{

	//查询最热图书
	@Override
	public List<Pbook> findHotPbookList() throws SQLException {
		// TODO Auto-generated method stub
		Connection conn = DataSourceUtils.getConnection();
		QueryRunner query = new QueryRunner();
		String sql = "select * from pbook where ishot=?";
		List<Pbook> list = query.query(conn, sql, new BeanListHandler<Pbook>(Pbook.class),1);
		//关闭资源
		conn.close();
		return list;
	}
	//查询最新图书
	@Override
	public List<Pbook> findLatestPbookList() throws SQLException {
		// TODO Auto-generated method stub
		Connection conn = DataSourceUtils.getConnection();
		QueryRunner query = new QueryRunner();
		String sql = "select * from pbook where ishot=?";
		List<Pbook> list = query.query(conn, sql, new BeanListHandler<Pbook>(Pbook.class),0);
		//关闭资源
		conn.close();
		return list;
		
	}
	@Test
	public void test1() {
		try {
			List<Pbook> list = findHotPbookList();
			for (Pbook pbook : list) {
				System.out.println(pbook.getCid());
				System.out.println(pbook.getPbname());
				System.out.println(pbook.getPbimage());
				System.out.println(pbook.getPbdate());
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			List<Pbook> list = findLatestPbookList();
			for (Pbook pbook : list) {
				System.out.println(pbook.getCid());
				System.out.println(pbook.getPbname());
				System.out.println(pbook.getPbimage());
				System.out.println(pbook.getPbdate());
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
	
}
