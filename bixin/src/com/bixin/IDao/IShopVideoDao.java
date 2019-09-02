package com.bixin.IDao;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.bixin.Entity.Pbook;

public interface IShopVideoDao {

	public List<Pbook> findHotPbookList() throws SQLException;
	public List<Pbook> findLatestPbookList() throws SQLException;
}
