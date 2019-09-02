<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/base.css" />

<script src="${pageContext.request.contextPath }/js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap.min.js" type="text/javascript"></script>
<title>欢迎来到烟酒批发部</title>
<style type="text/css">
div div {
	float: left;
}

#new {
	margin-top: 80px;
	margin-left: 100px;
	
}

#hot {
	margin-left: 100px;
	
}

p {
	margin-left: 20px;
	
}
</style>
</head>
<body>

	<div style="position:fixed;right:0; top:100px;"><a href="/bixin/admin/bookShop/cart.jsp" style="width:150px;height:60px;display:block;font-size:25px;">购物车🛒</a></div>
	<!-- 引入header.jsp -->
	<jsp:include page="/admin/publicBoard/header.jsp"></jsp:include>

	<div class="clearfix" id="new">
		<h1 style="margin-bottom: 15px">最新商品</h1>
		<c:forEach items="${hotProducts}" var="p">
			<div class="col-md-2"
				style="text-align: center; height: 200px; padding: 10px 0px;">

				<p>
					<a href="showDetailServlet?pid=${p.pid }"> <img
						src="${p.pimage}" width="130" height="130"
						style="display: inline-block;">
					</a>
				</p>

				<p>
					<a href="showDetailServlet?pid=${p.pid }" style='color: #666'>${p.pname}</a>
				</p>

				<p>
					<font color="#E4393C" style="font-size: 16px">&yen;${p.shop_price}</font>
				</p>

				<p>
					<a href="carServlet?count=1&pid=${p.pid }&&op=addCar"
						style='color: #666'> <input
						style="background: url('./images/product.gif') no-repeat scroll 0 -600px rgba(0, 0, 0, 0); height: 36px; width: 127px;"
						value="加入购物车" type="button">
					</a>
				</p>
			</div>
		</c:forEach>
	</div>
	<div class="clearfix" id="hot" style="margin-top:70px;">
		<h1 style="margin-bottom: 15px">最热商品</h1>
		<c:forEach items="${newProducts}" var="p">

			<div class="col-md-2"
				style="text-align: center; height: 200px; padding: 10px 0px;">
				<p>
					<a href="showDetailServlet?pid=${p.pid }"> <img
						src="${p.pimage}" width="130" height="130"
						style="display: inline-block;">
					</a>
				</p>

				<p>
					<a href="showDetailServlet?pid=${p.pid }" style='color: #666'>${p.pname}</a>
				</p>

				<p>
					<font color="#E4393C" style="font-size: 16px">&yen;${p.shop_price}</font>
				</p>

				<p>
					<a
						href="${pageContext.request.contextPath }/carServlet?count=1&pid=${p.pid }&op=addCar"
						style='color: #666'> <input
						style="background: url('./myimage/product.gif') no-repeat scroll 0 -600px rgba(0, 0, 0, 0); height: 36px; width: 127px;"
						value="加入购物车" type="button">
					</a>
				</p>

			</div>

		</c:forEach>

	</div>
	<!-- 引入footer.jsp -->
	<jsp:include page="/admin/publicBoard/footer.jsp"></jsp:include>
</body>
</html>