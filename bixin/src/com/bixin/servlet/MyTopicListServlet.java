package com.bixin.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bixin.Entity.BBS_topic;
import com.bixin.ServiceImpl.PeronMyTopicListServiceImpl;

/**
 * Servlet implementation class MyTopicList
 */
@WebServlet("/myTopicList")
public class MyTopicListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyTopicListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uid = (String) request.getSession().getAttribute("uid");
		
		System.out.println("myTopicList" + uid);
		List<BBS_topic> list = new PeronMyTopicListServiceImpl().getMyTopicList(uid);
		if(list != null) {
			request.setAttribute("topics", list);
		}
		request.getRequestDispatcher("/admin/user/myBlog.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
