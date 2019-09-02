package com.bixin.shopServlet;
import java.io.IOException;
import java.util.Date;
import java.util.Map;
import java.util.Map.Entry;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bixin.Entity.Cart;
import com.bixin.Entity.CartItem;
import com.bixin.Entity.Order;
import com.bixin.Entity.OrderItem;
import com.bixin.Entity.User;
import com.bixin.utils.CommonUtils;

import IServiceProduct.IServiceProduct;
import IServiceProduct.impl.ProductServiceImpl;
@WebServlet("/orderServlet")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	IServiceProduct service = new ProductServiceImpl();
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String op = request.getParameter("op");
		switch (op) {
		case "submitOrder":
			submitOrder(request,response);
			break;
		default:
			break;
		}
	}

	//处理用户订单的方法
	private void submitOrder(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException	{
		HttpSession session = request.getSession();
		// 验证用户是否登录
		
		  User user = (User) session.getAttribute("user"); if (user == null) { // 未登录状态
		  response.sendRedirect(request.getContextPath() + "/admin/user/login.jsp"); return; }
		 
		// 创建Order对象
		Order order = new Order();

		// 属性封装
		// 订单编号
		String oid = CommonUtils.getUUID();
		order.setOid(oid);
		// 下单时间
		order.setOrdertime(new Date());
		// 总金额,从购物车中获取
		// 获取购物车
		Cart cart = (Cart) session.getAttribute("cart");
		// 处理详细逻辑（省略）
		order.setTotal(cart.getTotalPrice());
		// 设置购买用户
		order.setUser(user);

		// 设List<OrderItem> orderitems;
		// 从购物车中获取CartItem转成OrderItem
		Map<String, CartItem> list = cart.getList();
		for (Entry<String, CartItem> entry : list.entrySet()) {
			// 得到每一个购物项
			CartItem cartItem = entry.getValue();
			// 准备OrderItem，从CartItem转换数据
			OrderItem orderitem = new OrderItem();
			// private String itemid;
			orderitem.setItemid(CommonUtils.getUUID());
			// private int count;//购买的数量
			orderitem.setCount(cartItem.getCount());
			// private double subtotal;//小计
			orderitem.setSubtotal(cartItem.getTotalPrice());
			// private Product product;//该项中购买的商品对象
			orderitem.setProduct(cartItem.getProduct());
			// private Order order;
			orderitem.setOrder(order);
			// 将订单项存入到order中的订单项的集合中
			order.getOrderItems().add(orderitem);
		}
		// 调用service层 方法
		service.submitOrders(order);
		// order存到session
		session.setAttribute("order", order);
		// 跳转
		response.sendRedirect(request.getContextPath() + "/admin/bookShop/order_info.jsp");
	}
}
