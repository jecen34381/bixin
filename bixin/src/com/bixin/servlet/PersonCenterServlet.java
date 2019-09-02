package com.bixin.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.junit.Test;

import com.bixin.DaoImpl.SpecialHeaderUploadDao;
import com.bixin.Entity.User;
import com.bixin.ServiceImpl.PersonCenterImpl;

/**
 * Servlet implementation class PersonCenterServlet
 */
@WebServlet("/personCenterServlet")
public class PersonCenterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PersonCenterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
   
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uid = (String) request.getSession().getAttribute("uid");
		try {
			String imageName = new SpecialHeaderUploadDao().getHeaderImage(uid);
			if(imageName != null) {
				request.setAttribute("imageName", imageName);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("id=" + uid);
		User user = new PersonCenterImpl().getUserInfo(uid);
		if(user != null) {
			request.setAttribute("user", user);
		}
		
		request.getRequestDispatcher("/admin/user/personCenter.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
