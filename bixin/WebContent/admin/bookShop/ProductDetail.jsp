<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css" type="text/css" />
<script src="${pageContext.request.contextPath }/js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap.min.js" type="text/javascript"></script>
<style type="text/css">
img {
	width: 150px;
}
</style>
<title>详细介绍</title>
</head>
<body>
<!-- 引入header.jsp -->

	<jsp:include page="/admin/publicBoard/header.jsp"></jsp:include>
	<table class="table table-bordered"
		style="margin: 0 auto; margin-top: 200px; text-align: center; height: 300px; width: 700px;">

		<tr>
			<th>商品名</th>
			<th>市场价</th>
			<th>惊爆价</th>
			<th>图片</th>
			<th>出厂日期</th>
			<th>描述</th>
		</tr>

		<tr>
			<td>${product.pname }</td>
			<td>${product.market_price }</td>
			<td>${product.shop_price }</td>
			<td><img src="${product.pimage }"></td>
			<td>${product.pdate }</td>
			<td>${product.pdesc }</td>
		</tr>
	</table>
	<!-- 引入footer.jsp -->
	<jsp:include page="/admin/publicBoard/footer.jsp"></jsp:include>
</body>
</html>