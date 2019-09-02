package com.bixin.loginServlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.bixin.IServicelog_Reg.IServiceLogAndReg;
import com.bixin.Servicelog_Reg.impl.ServiceLogAndRegImpl;
@WebServlet("/activeServlet")
public class ActiveServlet extends HttpServlet {//这个servlet的功能是用来激活状态码的
	private static final long serialVersionUID = 1L;
	private IServiceLogAndReg userService = new ServiceLogAndRegImpl();
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String code = request.getParameter("code");
		boolean result = false;
		if (code != null) {
			result = userService.editState(code);
		}
		if (result) {
			out.write("激活成功，可以去登陆了"+"<a href=/bixin/admin/user/login.jsp>去登录</a>");
		}
		else {
			out.write("激活失败");
		}
	}
}

