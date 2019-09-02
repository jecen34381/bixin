package com.bixin.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bixin.ServiceImpl.PeronMyTopicListServiceImpl;

/**
 * Servlet implementation class PublishAndDeleteTopicServlet
 */
@WebServlet("/publishAndDeleteTopicServlet")
public class PublishAndDeleteTopicServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PublishAndDeleteTopicServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		String option = request.getParameter("option");
		String topicId = request.getParameter("topicId");
		System.out.println(option + "=" + topicId);
		if(option.equals("publish")) {
			boolean status = new PeronMyTopicListServiceImpl().changeTopicIsPublish(topicId);
			if(status) {
				response.getWriter().append("发布成功！");
				return;
			}
			response.getWriter().append("发布失败！");
			return;
		}
		boolean status = new PeronMyTopicListServiceImpl().deleteTopic(topicId);
		if(status) {
			response.getWriter().append("删除成功！");
			return;
		}
		response.getWriter().append("删除失败！");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
