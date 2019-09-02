package com.bixin.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.junit.Test;

import com.bixin.Entity.Pbook;
import com.bixin.ServiceImpl.VideoProductListServiceImpl;
import com.bixin.utils.JedisPoolUtils;
import com.google.gson.Gson;
import com.google.gson.JsonArray;

import net.sf.json.JSONArray;
import redis.clients.jedis.Jedis;

/**
 * Servlet implementation class ShopVideoProductListServlet
 */
@WebServlet("/shopVideoProductListServlet")
public class ShopVideoProductListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShopVideoProductListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
//		Jedis jedis = JedisPoolUtils.getJedis();
//		if(jedis.exists("VideoProductList")) {
//			String videoProductList = jedis.get("VideoProductList");
//			response.getWriter().append(videoProductList);
//		}else {
//			List<Pbook> list = new VideoProductListServiceImpl().findPbookList();
//			Gson g = new Gson();
//			String jsonList = g.toJson(list);
//			
//			jedis.set("VideoProductList", jsonList);
//			response.getWriter().append(jsonList);
//		}
		List<Pbook> hotList = new VideoProductListServiceImpl().findHotPbookList();
		List<Pbook> latestList = new VideoProductListServiceImpl().findLatestPbookList();
		request.setAttribute("hotList", hotList);
		request.setAttribute("latestList", latestList);
		request.getRequestDispatcher("/admin/bookShop/bookmarket.jsp").forward(request, response);
	}

	@Test
	public void test2() {
		Jedis jedis = JedisPoolUtils.getJedis();
		if(jedis.exists("VideoProductList")) {
			String videoProductList = jedis.get("VideoProductList");
			
			System.out.println();
		}else {
			List<Pbook> list = null;
			try {
				list = new VideoProductListServiceImpl().findHotPbookList();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			Gson g = new Gson();
			String jsonList = g.toJson(list);
			jedis.set("VideoProductList", jsonList);
			System.out.println(jsonList.toCharArray());
			
			
		}
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
