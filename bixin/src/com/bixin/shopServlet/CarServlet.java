package com.bixin.shopServlet;
import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bixin.Entity.Cart;
import com.bixin.Entity.CartItem;
import com.bixin.Entity.Product;

import IServiceProduct.IServiceProduct;
import IServiceProduct.impl.ProductServiceImpl;


@WebServlet("/carServlet")
public class CarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	IServiceProduct service = new ProductServiceImpl();
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String op = request.getParameter("op");
		switch (op) {
		case "clearCar":
			clearCar(request, response);
			break;
		case "delCart":
			delCart(request, response);
			break;
		case "addCar":
			addProductCar(request, response);
			break;
		case "modCar":
			modCar(request,response);
			break;
		default:
			break;
		}
	}
	
	//清空购物车
	public void clearCar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.removeAttribute("cart");
//		response.sendRedirect(request.getContextPath()+"/admin/bookShop/show.jsp");
		response.sendRedirect("productServlet");
	}
	
	//删除购物车中的商品
	public void delCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		Cart cart = (Cart)session.getAttribute("cart");
		String pid = request.getParameter("pid");
		
		if(cart!=null)
		{
			Map<String, CartItem> list = cart.getList();
			cart.setTotalPrice(cart.getTotalPrice()-list.get(pid).getTotalPrice());
			list.remove(pid);
		}
		session.setAttribute("cart", cart);
		response.getWriter().append(cart.getTotalPrice()+"");
	}
	
	//修改购物者中购买数量变化总价变化的方法
	private void modCar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String pid = request.getParameter("id"); 
		int newTotal = Integer.parseInt(request.getParameter("newTotal").trim());
		HttpSession session = request.getSession();
		Cart cart = (Cart)session.getAttribute("cart");
		if(cart==null) cart = new Cart();
		if(cart.getList().containsKey(pid)){
			CartItem item = cart.getList().get(pid);
			item.setCount(newTotal);
			item.setTotalPrice(item.getProduct().getShop_price()*item.getCount());
		}
		double newTotalPrice = cart.getTotalPrice();
		session.setAttribute("cart", cart);
		response.getWriter().append(newTotalPrice+"");
	}
	//添加到购物车的方法
	public void addProductCar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int count = Integer.parseInt(request.getParameter("count"));
		String pid = request.getParameter("pid");
		Product product = service.findProductById(pid);
		CartItem item = new CartItem(product,count,product.getShop_price()*count);
		// 2.3 将购物车项放入购物车
		// 获取购物车
		HttpSession session = request.getSession();
		Cart cart = (Cart)session.getAttribute("cart");
		if(cart==null) 
		{
			cart = new Cart();
		}
		if(cart.getList().containsKey(pid))
		{
			// 得到之前已添加的
			CartItem oldItem = cart.getList().get(pid);
			// 把数量和总价都放到当前新的购物车项上
			item.setCount(item.getCount()+oldItem.getCount());
			item.setTotalPrice(item.getTotalPrice()+oldItem.getTotalPrice());
			// 在从总价上减去原先购物车的价格
			cart.setTotalPrice(cart.getTotalPrice()-oldItem.getTotalPrice());
		}
		// 将新的购物车放入
		cart.getList().put(pid, item);
		// 计算总价
		cart.setTotalPrice(cart.getTotalPrice()+item.getTotalPrice());
		// 2.4 将购物车再次放入session中
		session.setAttribute("cart", cart);
		// 3. 请求转发
		response.sendRedirect("/bixin/admin/bookShop/cart.jsp");
	}
}
