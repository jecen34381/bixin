<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>比心商城购物车</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/easyui/themes/icon.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/easyui/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/easyui/jquery.easyui.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/bootstrap.min.css"
	type="text/css" />
<!-- <script src="js/jquery-1.11.3.min.js" type="text/javascript"></script> -->
<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"
	type="text/javascript"></script>
<!-- 引入自定义css文件 style.css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/style.css"
	type="text/css" />
<style>
body {
	margin-top: 20px;
	margin: 0 auto;
}

.carousel-inner .item img {
	width: 100%;
	height: 300px;
}

font {
	color: #3164af;
	font-size: 18px;
	font-weight: normal;
	padding: 0 10px;
}
</style>
<script type="text/javascript">
	function clearCar() {
		window.location.href = "/bixin/carServlet?op=clearCar";
	}
	$(function() {
		$("[name=quantity]").change(function() {
			var price = $(this).parent("td").prev("td").html();
			var total = price * $(this).val();
			var $newTotal = $(this).val();
			$(this).parent("td").next("td").find("span").html(total);
			var $id = $(this).parents("tr").find("input[name=id]").val();
			$.post("/bixin/carServlet", {
				op : "modCar",
				id : $id,
				newTotal : $newTotal
			}, function(msg) {
				$("#total").html(msg);
			});
		});
		$(".delete").click(function() {
			var $id = $(this).parents("tr").find("input[name=id]").val();
			var $this = $(this);
<%-- start --%>
	$("#isDel").css("display", "block");
			$("#isDel").dialog({
				title : "删除对话框", //一些属性
				width : 400,
				height : 400,
				modal : true,
				buttons : [ {
					text : "删除",
					iconCls : "icon-add", //引用此按钮属性，会自动为你的按钮增加样式和图标
					handler : function() {
						$.post("/bixin/carServlet", {
							op : "delCart",
							pid : $id
						}, function(msg) {
							$this.parents("tr").remove();
							$("#isDel").dialog("close");
							$("#total").html(msg);
						});//ajax End
					}
				}, {
					text : "取消",
					iconCls : "icon-cancel",
					handler : function() {
						$("#isDel").dialog("close");//关闭对话框
					}
				} ]
			});

		});

		$(".clear").click(function() {
			$("#isClear").css("display", "block");
			$("#isClear").dialog({
				title : "清空购物车", //一些属性
				width : 400,
				height : 400,
				modal : true,
				buttons : [ {
					text : "删除",
					iconCls : "icon-add", //引用此按钮属性，会自动为你的按钮增加样式和图标
					handler : function() {
						$("#isClear").css("display", "block");
						clearCar();
					}
				}, {
					text : "取消",
					iconCls : "icon-cancel",
					handler : function() {
						$("#isClear").dialog("close");//关闭对话框
					}
				} ]
			});

		});

	});
</script>
</head>

<body>
	<!-- 引入header.jsp -->

	<jsp:include page="/admin/publicBoard/header.jsp"></jsp:include>
	<c:if test="${empty cart.list}">
		<!-- 显示图片 -->
		<img src="${pageContext.request.contextPath }/myimage/jiache.jpg"
			width=300px>
		<br>
		<h1 style="font-size: 18px">购物车内暂时没有商品，快去挑选你的宝贝吧</h1>
		<a href="${pageContext.request.contextPath }/productServlet"><h2>去挑选</h2></a>
	</c:if>

	<c:if test="${!empty cart.list}">
		<div class="container">
			<div class="row">
				<div style="margin: 0 auto; margin-top: 10px; width: 950px;">
					<strong style="font-size: 16px; margin: 5px 0;">订单详情</strong>
					<table class="table table-bordered">
						<tbody>

							<tr class="warning">
								<th>图片</th>
								<th>商品</th>
								<th>价格</th>
								<th>数量</th>
								<th>小计</th>
								<th>操作</th>
							</tr>

							<c:forEach items="${cart.list}" var="entry">

								<tr class="active">

									<td width="60" width="40%"><input type="hidden" name="id"
										value="${entry.value.product.pid }"> <img
										src="${pageContext.request.contextPath }/${entry.value.product.pimage }"
										width="70" height="60"></td>
									<td width="30%"><a target="_blank">
											${entry.value.product.pname }</a></td>
									<td width="20%">${entry.value.product.shop_price }</td>
									<td width="10%"><input type="text" name="quantity"
										maxlength="4" size="10" value="	${entry.value.count }"></td>
									<td width="15%"><span class="subtotal">${entry.value.totalPrice }</span>
									</td>

									<td><a class="delete">删除</a></td>

								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

			</div>

			<div style="margin-right: 130px;">

				<div style="text-align: right;">
					<em style="color: #ff6600;"> 登录后确认是否享有优惠&nbsp;&nbsp; </em> 赠送积分: <em
						style="color: #ff6600;">596</em>&nbsp; 商品金额: <strong id="total"
						style="color: #ff6600;">￥${cart.totalPrice }</strong>
				</div>

				<div
					style="text-align: right; margin-top: 10px; margin-bottom: 10px;">
					<a id="clear" class="clear">清空购物车</a> <a
						href="${pageContext.request.contextPath }/orderServlet?op=submitOrder">
						<input type="submit" width="100" value="提交订单" name="submit"
						border="0"
						style="background: url('${pageContext.request.contextPath }/myimage/register.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0); height: 35px; width: 100px; color: white;">
					</a>
				</div>

			</div>

		</div>
		<div id="isDel" style="font-size: 20px; display: none;">寥城绅士提示你万万不可轻易删除啊</div>
		<div id="isClear" style="font-size: 20px; display: none;">婉秋绅士：陛下三思啊</div>
	</c:if>

	<!-- 引入footer.jsp -->
	<jsp:include page="/admin/publicBoard/footer.jsp"></jsp:include>
</body>

</html>