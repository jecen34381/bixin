package com.bixin.loginServlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.bixin.IServicelog_Reg.IServiceLogAndReg;
import com.bixin.Servicelog_Reg.impl.ServiceLogAndRegImpl;
import com.bixin.Entity.User;
import com.bixin.utils.CommonUtils;
import com.bixin.utils.MailUtils;
@WebServlet("/registerServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IServiceLogAndReg userService = new ServiceLogAndRegImpl();
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String op =request.getParameter("op");
		System.out.println(op);
		switch (op) {
		case "register":
			register(request,response);
			break;
		case "checkUserName":
			checkUserName(request,response);
			break;
		case "login":
			checkUserLogin(request,response);
			break;
		default:
			break;
		}
	}
	private void checkUserLogin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		//拿到验证码，开始已经存进session了
		String generageCode = (String) request.getSession().getAttribute("generatecode");
		PrintWriter out = response.getWriter();
		String userName = request.getParameter("userName");//获取账户
		String userPass = request.getParameter("userPass");//获取密码
		String checkCode = request.getParameter("checkCode");//获取验证码
		User user = userService.checkLogin(userName, userPass);
		int state = 0;
		if (user != null) {
			state = user.getState();
			if (!checkCode.equalsIgnoreCase(generageCode)) {
				request.setAttribute("errorMessage", "验证码错误");
				request.getRequestDispatcher("/admin/user/login.jsp").forward(request, response);
				return;
			}
			if (state != 1) {
				out.write("账号尚未激活，请去您的邮箱激活账号");
				return;
			}
			request.getSession().setAttribute("user", user);
			request.getSession().setAttribute("uid", user.getUid());
			request.getRequestDispatcher("/admin/user/main.jsp").forward(request, response);
			return;
		}
		else {
			request.setAttribute("errorMessage", "账号或密码错误");
			request.getRequestDispatcher("/admin/user/login.jsp").forward(request, response);
		}
	}
	private void checkUserName(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{//注册时检查用户名是否重复的方法
		PrintWriter out = response.getWriter();
		String userName = request.getParameter("username");
		User user = userService.selectByUser(userName);
		if (user != null) {
			out.write("此用户名可能太受欢迎了，请您重新挑一个吧");
		}
	}
	private void register(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException
	{//处理用户注册的方法
		PrintWriter out = response.getWriter();
		User user = new User();
		String username = request.getParameter("username");
		String password = request.getParameter("upass");
		String uemail = request.getParameter("uemail");
		String name = request.getParameter("names");
		String birth = request.getParameter("birth");
		String gender = request.getParameter("gender");
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		switch (gender) {
		case "1":
			user.setSex("男");
			break;
		case "2":
			user.setSex("女");
			break;
		case "3":
			user.setSex("保密");
			break;
		default:
			break;
		}
		user.setUsername(username);
		user.setPassword(password);
		user.setName(name);
		user.setEmail(uemail);
		try {
			user.setBirthday(df.parse(birth));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		//生成一个uid 的方法
		user.setUid(CommonUtils.getUUID());
		//生成激活码
		user.setCode(CommonUtils.getUUID());
		boolean result = userService.saveUser(user);
		if (result) {
			try {
				MailUtils.sendMail(user.getEmail(),"比心题库会员激活", 
						"祝贺" + user.getName()
						+ "，注册成功,点击链接激活<a href=\"http://192.168.31.119:8080/bixin/activeServlet?code="
						+ user.getCode() + "\">激活会员</a>");
			} catch (Exception e) {
				e.printStackTrace();
			} 
			out.write("注册成功，请去您的邮箱激活");
		}
		else {
			out.write("注册失败");
		}
	}
}