package com.bixin.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bixin.DaoImpl.PersonMyTopicListImpl;
import com.bixin.Entity.BBS_replay;

/**
 * Servlet implementation class SaveReplayServlet
 */
@WebServlet("/SaveReplayServlet")
public class SaveReplayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveReplayServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String content = request.getParameter("topicContent");
		String topicId = request.getParameter("topicId");
		String uid = (String)request.getSession().getAttribute("uid");
		String createTime = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss").format(new Date());
		BBS_replay bbs_replay = new BBS_replay();
		bbs_replay.setContent(content);
		bbs_replay.setCreateTime(createTime);
		bbs_replay.setTopicId(topicId);
		bbs_replay.setUid(uid);
		boolean status = false;
		try {
			//获得状态码
			status = new PersonMyTopicListImpl().saveReplay(bbs_replay);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//如果存入失败，返回提示信息。
		if(!status) {
//			response.setHeader("refresh", "3;url=bbs_topic.jsp");
			response.getWriter().append("回复失败");
//			response.sendRedirect("/bbs_topic.jsp");
			return ;
		}
		
		response.getWriter().append("回复成功");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
