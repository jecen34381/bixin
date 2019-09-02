package com.bixin.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bixin.DaoImpl.PersonCenterDaoImpl;
import com.bixin.DaoImpl.PersonMyTopicListImpl;
import com.bixin.Entity.BBS_replay;
import com.bixin.Entity.BBS_topic;
import com.bixin.IDao.IPersonCenterDao;
import com.bixin.IService.IPersonMyTopicListService;
import com.bixin.ServiceImpl.PeronMyTopicListServiceImpl;
import com.bixin.utils.JedisPoolUtils;
import com.google.gson.Gson;

import redis.clients.jedis.Jedis;

@WebServlet("/topic.do")
public class TopicServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String function = req.getParameter("function");
		
		switch(function) {
		case "saveTopic":saveTopic(req,resp);break;
		case "getPublishTopic":getPublishTopic(req,resp);break;
		case "getMyTopic":getMyTopic(req,resp);break;
		case "topicModel":getTopicModelData(req,resp);break;
		case "saveReplay":saveReplay(req,resp);break;
		case "publishAndDelete":publishAndDelete(req,resp);break;
		case "queryUnameByUid":queryUnameByUid(req,resp);break;
		}
	}
	//根据uid查询用户名，单线查询
	private void queryUnameByUid(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException  {
		// TODO Auto-generated method stub
		String uid = req.getParameter("uid");
		IPersonCenterDao personCenterDao = new PersonCenterDaoImpl();
		String name = "";
		try {
			name = personCenterDao.getUserName(uid);
			System.out.println(name);
			resp.getWriter().append(name);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	/*
	 *  实现帖子的上传和删除操作
	 */
	private void publishAndDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Jedis jedis = JedisPoolUtils.getJedis();
		jedis.flushAll();
		String option = req.getParameter("option");
		String topicId = req.getParameter("topicId");
		System.out.println(option + "=" + topicId);
		if(option.equals("publish")) {
			boolean status = new PeronMyTopicListServiceImpl().changeTopicIsPublish(topicId);
			if(status) {
				resp.getWriter().append("发布成功！");
				return;
			}
			resp.getWriter().append("发布失败！");
			return;
		}
		boolean status = new PeronMyTopicListServiceImpl().deleteTopic(topicId);
		if(status) {
			resp.getWriter().append("删除成功！");
			return;
		}
		resp.getWriter().append("删除失败！");
	}

	private void saveReplay(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String content = req.getParameter("topicContent");
		String topicId = req.getParameter("topicId");
		String uid = (String)req.getSession().getAttribute("uid");
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
			resp.getWriter().append("回复失败");
//			response.sendRedirect("/bbs_topic.jsp");
			return ;
		}
		
		resp.getWriter().append("回复成功");
	}

	private void getTopicModelData(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		IPersonMyTopicListService p = new PeronMyTopicListServiceImpl();
		Integer start = Integer.parseInt(req.getParameter("start"));
		int topicId = Integer.parseInt(req.getParameter("topicId"));
		BBS_topic bBS_topic = p.getMyTopicList(topicId);
		List<BBS_replay> replayList = p.getReplayList(topicId, start * 5);
//		Gson g = new Gson();
//		String jsonList = g.toJson(list);
		if(bBS_topic != null) {
			req.setAttribute("topicList", bBS_topic);
			
		}
		if(replayList != null) {
			req.setAttribute("replayList", replayList);
			//传回帖子的id值，填充到分页列表中
			req.setAttribute("topicId", topicId);
		}
		req.getRequestDispatcher("/admin/topic/topicModel.jsp").forward(req, resp);
	}

	private void getMyTopic(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Gson g = new Gson();
		String method = req.getParameter("method");
		String uid = (String) req.getSession().getAttribute("uid");
		Jedis jedis = JedisPoolUtils.getJedis();
		if(method.equals("other")) {
			List<BBS_topic> list = new PeronMyTopicListServiceImpl().getMyTopicList(uid);
			if(list != null) {
				req.setAttribute("topics", list);
				jedis.append("topicList", g.toJson(list));
			}
			req.getRequestDispatcher("/admin/user/myBlog.jsp").forward(req, resp);
		}
		//获取所有公开的帖子
		if(method.equals("全部")) {
			String gsonList = "";
			if(jedis.exists("topicList") && jedis.get("topicList") != null) {
				gsonList = jedis.get("topicList");
			}else {
				List<BBS_topic> list = new PeronMyTopicListServiceImpl().getMyTopicList((String) req.getSession().getAttribute("uid"));
				gsonList = g.toJson(list);
				jedis.append("topicList", gsonList);
			}
			
			resp.getWriter().append(gsonList);
		}
		if(method.equals("公开")) {
			String gsonList = "";
			if(jedis.exists("publishTopicList") && jedis.get("publishTopicList") != null) {
				gsonList = jedis.get("publishTopicList");
			}else {
				List<BBS_topic> list = new PeronMyTopicListServiceImpl().getMyTopicList((String) req.getSession().getAttribute("uid"),1);
				gsonList = g.toJson(list);
				jedis.append("publishTopicList", gsonList);
			}
			
			resp.getWriter().append(gsonList);
		}
		if(method.equals("私密")) {
			String gsonList = "";
			if(jedis.exists("privateTopicList") && jedis.get("privateTopicList") != null) {
				gsonList = jedis.get("privateTopicList");
			}else {
				List<BBS_topic> list = new PeronMyTopicListServiceImpl().getMyTopicList((String) req.getSession().getAttribute("uid"),0);
				gsonList = g.toJson(list);
				jedis.append("privateTopicList", gsonList);
			}
			
			resp.getWriter().append(gsonList);
		}
	}
	/*
	 * 查询ispublish为1的帖子
	 */
	private void getPublishTopic(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<BBS_topic> list = new PeronMyTopicListServiceImpl().getMyTopicList();
		Gson g = new Gson();
		String jsonList = g.toJson(list);
		resp.getWriter().write(jsonList);
	}
	/*
	 * 保存编辑好的帖子，待发布
	 */
	private void saveTopic(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Jedis jedis = JedisPoolUtils.getJedis();
		jedis.flushAll();
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=UTF-8");
		String title = req.getParameter("title");
		String content = req.getParameter("topicContent");
		String typeName = req.getParameter("type");
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
		String uid = (String) req.getSession().getAttribute("uid");
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
			resp.getWriter().append("保存失败");
//			response.sendRedirect("/bbs_topic.jsp");
			return ;
		}
		//如果成功则获得topic数据，刷新myBlog
//		List<BBS_topic> list = new PeronMyTopicListServiceImpl().getMyTopicList(uid);
//		if(list != null) {
//			request.setAttribute("topics", list);
//		}
		//response.setHeader("refresh", "3;url=request.getContextPath()+\"/myTopicList\"");
		resp.getWriter().append("保存成功");
//		response.sendRedirect(request.getContextPath()+"/myTopicList");
		//request.getRequestDispatcher("/myBlog.jsp").forward(request, response);
	}
}
