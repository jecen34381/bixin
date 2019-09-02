package com.bixin.shopServlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bixin.Entity.Product;

import IServiceProduct.IServiceProduct;
import IServiceProduct.impl.ProductServiceImpl;

@WebServlet("/productServlet")
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		IServiceProduct service = new ProductServiceImpl();
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		List<Product> p1 = service.findHotProduct();
		List<Product> p2 = service.findNewProduct();
		HttpSession session = request.getSession();
		session.setAttribute("hotProducts", p1);
		session.setAttribute("newProducts", p2);
		
		// 3. 请求转发首页
		request.getRequestDispatcher("/admin/bookShop/show.jsp").forward(request, response);
	}
}
