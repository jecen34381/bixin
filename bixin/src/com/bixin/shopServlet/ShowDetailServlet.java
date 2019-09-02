package com.bixin.shopServlet;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bixin.Entity.Product;

import IServiceProduct.IServiceProduct;
import IServiceProduct.impl.ProductServiceImpl;


@WebServlet("/showDetailServlet")
public class ShowDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		IServiceProduct service = new ProductServiceImpl();
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String pid = request.getParameter("pid");
		Product product = service.findProductById(pid);
		request.setAttribute("product", product);
		request.getRequestDispatcher("/admin/bookShop/ProductDetail.jsp").forward(request, response);
	}
}
