package com.bixin.servlet;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bixin.DaoImpl.PersonMyTopicListImpl;
import com.bixin.Entity.BBS_topic;
import com.bixin.ServiceImpl.PeronMyTopicListServiceImpl;
import com.bixin.utils.CommonUtils;
import com.mchange.v2.codegen.bean.BeangenUtils;

/**
 * Servlet implementation class SaveTopicServlet
 */
@WebServlet("/saveTopicServlet")
public class SaveTopicServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveTopicServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//获取数据
		request.setCharacterEncoding("utf-8");
		String title = request.getParameter("title");
		String content = request.getParameter("topicContent");
		String typeName = request.getParameter("type");
		Integer boardId = null;
		switch(typeName) {
		case "java":boardId = 1;
			break;
		case "html":boardId = 2;
			break;
		case "css":boardId = 4;
			break;
		case "js":boardId = 3;
			break;
		}
		//得到当前日期
		DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
		java.util.Date date = new java.util.Date();
		String createTime = dateFormat.format(date);
		String uid = (String) request.getSession().getAttribute("uid");
		//设置数据到实体类
		BBS_topic topic = new BBS_topic();
		topic.setTitle(title);
		topic.setContent(content);
		topic.setCreateTime(createTime);
		topic.setUid(uid);
		topic.setBoardId(boardId);
		topic.setIsPublish(0);
		boolean status = false;
		try {
			//获得状态码
			status = new PersonMyTopicListImpl().saveTopic(topic);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//如果存入失败，返回提示信息。
		if(!status) {
//			response.setHeader("refresh", "3;url=bbs_topic.jsp");
			response.getWriter().append("保存失败");
//			response.sendRedirect("/bbs_topic.jsp");
			return ;
		}
		//如果成功则获得topic数据，刷新myBlog
//		List<BBS_topic> list = new PeronMyTopicListServiceImpl().getMyTopicList(uid);
//		if(list != null) {
//			request.setAttribute("topics", list);
//		}
		//response.setHeader("refresh", "3;url=request.getContextPath()+\"/myTopicList\"");
		response.getWriter().append("保存成功");
//		response.sendRedirect(request.getContextPath()+"/myTopicList");
		//request.getRequestDispatcher("/myBlog.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
