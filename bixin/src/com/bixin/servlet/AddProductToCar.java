package com.bixin.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bixin.Entity.Car;
import com.bixin.ServiceImpl.ShoppingCarServiceImple;

/**
 * Servlet implementation class AddProductToCar
 */
@WebServlet("/addProductToCar")
public class AddProductToCar extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddProductToCar() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String pbname = request.getParameter("pbname");
		String pbprice = request.getParameter("pbprice");
		String pbimage = request.getParameter("pbimage");
		System.out.println(pbname+pbprice+pbimage);
		Car car = new Car();
		car.setCname(pbname);
		car.setCimage(pbimage);
		car.setCprice(Double.parseDouble(pbprice));
		car.setCnumber(1);
		car.setUid((String)request.getSession().getAttribute("uid"));
		boolean status = new ShoppingCarServiceImple().addProductToCar(car);
		
		if(status) {
			response.getWriter().append("添加成功");
			
		}else {
			response.getWriter().append("添加失败");
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
