package com.bixin.IService;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.bixin.Entity.Pbook;

public interface IShopVideoService {

	public List<Pbook> findHotPbookList() throws SQLException;
	public List<Pbook> findLatestPbookList() throws SQLException;
}
