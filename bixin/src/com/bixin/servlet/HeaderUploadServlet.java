package com.bixin.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.bixin.DaoImpl.SpecialHeaderUploadDao;
import com.bixin.utils.CommonUtils;

/**
 * Servlet implementation class HeaderUploadServlet
 */
@WebServlet("/HeaderUploadServlet")
@MultipartConfig
public class HeaderUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public HeaderUploadServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		Part part = request.getPart("headerFile");
		String fielName = part.getName();
		InputStream input = part.getInputStream();
		// 文件的保存路径
		String dir = getServletContext().getRealPath("headerImage");
		//String dir = "/bixin/WebContent/headerImage";
		String realName = CommonUtils.getUUID();
		System.out.println(getServletContext().getContextPath());
		File filename = new File(dir,realName+".jpg");
		if(!filename.exists()) {
			filename.createNewFile();
		}
		OutputStream out = new FileOutputStream(filename);
		boolean status = false;
		try {
			 status = new SpecialHeaderUploadDao().saveHeaderImage(realName+".jpg", (String)request.getSession().getAttribute("uid"));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(new File(dir+"/"+realName+".jpg").exists());
		int len = 0;
		byte[] b = new byte[1024 * 8];
		while ((len = input.read(b)) > -1) {
			out.write(b, 0, len);
		}
		input.close();
		out.close();
		response.setCharacterEncoding("utf-8");
		if(status) {
			//request.getRequestDispatcher("personCenterServlet").forward(request, response);
			response.sendRedirect("personCenterServlet");
			return ;
		}
		response.getWriter().print("upload fail!!");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
