package com.bixin.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bixin.Entity.BBS_replay;
import com.bixin.Entity.BBS_topic;
import com.bixin.IService.IPersonMyTopicListService;
import com.bixin.ServiceImpl.PeronMyTopicListServiceImpl;
import com.google.gson.Gson;

/**
 * Servlet implementation class MyTopicList
 */
@WebServlet("/topicModelInfoServlet")
public class TopicModelInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TopicModelInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		IPersonMyTopicListService p = new PeronMyTopicListServiceImpl();
		int topicId = Integer.parseInt(request.getParameter("topicId"));
		BBS_topic bBS_topic = p.getMyTopicList(topicId);
		List<BBS_replay> replayList = p.getReplayList(topicId,0);
//		Gson g = new Gson();
//		String jsonList = g.toJson(list);
		if(bBS_topic != null) {
			request.setAttribute("topicList", bBS_topic);
			
		}
		if(replayList != null) {
			request.setAttribute("replayList", replayList);
		}
		request.getRequestDispatcher("/admin/topic/topicModel.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
