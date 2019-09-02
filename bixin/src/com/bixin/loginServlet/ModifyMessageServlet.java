package com.bixin.loginServlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.bixin.IServicelog_Reg.IServiceLogAndReg;
import com.bixin.Servicelog_Reg.impl.ServiceLogAndRegImpl;
import com.bixin.Entity.User;
@WebServlet("/modifyMessageServlet")
public class ModifyMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IServiceLogAndReg userService = new ServiceLogAndRegImpl();
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
//		http://localhost:8080/Test/modifyMessageServlet?op=prepareUpdate&uid=0e1dba8f0cf840a7ae8054ee4bc2f789
		String op = request.getParameter("op");
		switch (op) {
		case "chongfu":
			checkChongfu(request,response);
			break;
		case "prepareUpdate":
			prepareUpdate(request, response);
			break;
		case "updateMessage":
			updateMessage(request, response);
			break;
		default:
			break;
		}
	}
	
	//用户修改名字之后，看看有没有和数据库中已有的重复
	private void checkChongfu(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		User u = userService.selectByUser(request.getParameter("username"));
		if (u != null) {
			out.write("阎王爷不批准你用这个名字");
		}
	}
	//通过前台传过来的uid将该用户查询出来，显示在一个页面，供用户修改
	private void prepareUpdate(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uid = request.getParameter("uid");
		if (uid != null) {
			User user = userService.selectByUid(uid);
			request.setAttribute("user", user);
			request.getRequestDispatcher("/admin/user/ModifyMessage.jsp").forward(request, response);
		}
	}
	
	//接收用户传过来的消息，然后保存
	private void updateMessage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		User user = new User();
		user.setUid(request.getParameter("uid"));
		String username = request.getParameter("username");
		String uemail = request.getParameter("uemail");
		String name = request.getParameter("name");
		String birth = request.getParameter("birthday");
		String sex = request.getParameter("sex");
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		user.setUsername(username);
		user.setName(name);
		user.setEmail(uemail);
		user.setSex(sex);
		try {
			user.setBirthday(df.parse(birth));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		boolean result = userService.updateUser(user);
		if (result) {
			response.sendRedirect(request.getContextPath() + "/personCenterServlet");
		}else {
			response.setHeader("refresh", "3;url=admin/user/ModifyMessage.jsp");
			out.append("失败,三秒后返回");
		}
	}
}

