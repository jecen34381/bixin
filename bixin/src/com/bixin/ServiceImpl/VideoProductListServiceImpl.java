package com.bixin.ServiceImpl;

import java.sql.SQLException;
import java.util.List;

import com.bixin.DaoImpl.VideoProductListDaoImpl;
import com.bixin.Entity.Pbook;
import com.bixin.IService.IShopVideoService;

public class VideoProductListServiceImpl implements IShopVideoService {

	@Override
	public List<Pbook> findHotPbookList(){
		// TODO Auto-generated method stub
		List<Pbook> list = null;
		 try {
			list = new VideoProductListDaoImpl().findHotPbookList();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Pbook> findLatestPbookList(){
		// TODO Auto-generated method stub
		List<Pbook> list = null;
		 try {
			list = new VideoProductListDaoImpl().findLatestPbookList();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

}
