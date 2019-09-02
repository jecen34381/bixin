<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>极客商城购物车</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css" type="text/css" />
		<script src="${pageContext.request.contextPath }/js/jquery-1.11.3.min.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath }/js/bootstrap.min.js" type="text/javascript"></script>
		<!-- 引入自定义css文件 style.css -->
		<link rel="stylesheet" href="css/style.css" type="text/css" />
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
		$(function(){
			
			$(".delete").click(function(){
				var cid = $(this).next().text();
				$.ajax({
					"async":true,
					"url":"deleteProductFromCar",
					"data":{"cid":cid},
					"success":function(data){
						alert(data);
						window.location.reload();
					}
				});
			});
		});
		</script>
		
	</head>

	<body>
		<!-- 引入header.jsp -->
		<jsp:include page="/admin/publicBoard/header.jsp"></jsp:include>

		<div class="container">
			<div class="row">

				<div style="margin:0 auto; margin-top:10px;width:950px;">
					<strong style="font-size:16px;margin:5px 0;">订单详情</strong>
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
							<c:forEach items="${products }" var="car">
								<tr class="active">
								<td width="60" width="40%">
									<input type="hidden" name="id" value="22">
									<img src="${car.cimage }" width="70" height="60">
								</td>
								<td width="30%">
									<a target="_blank">${car.cname }</a>
								</td>
								<td width="20%">
									${car.cprice }
								</td>
								<td width="10%">
									<input type="text" name="quantity" value=${car.cnumber } maxlength="8" size="10">
								</td>
								<td width="15%">
									<span class="subtotal">${car.cprice * car.cnumber }</span>
								</td>
								<td>
									<button class="delete" id="deleteProduct">删除</button>
									<p id="hiddenData" style="display:none;">${car.cid }</p>
								</td>
							</tr>
							</c:forEach>
							
						</tbody>
					</table>
				</div>
			</div>

			<div style="margin-right:130px;">
				<div style="text-align:right;">
					<em style="color:#ff6600;">
				登录后确认是否享有优惠&nbsp;&nbsp;
			</em> 赠送积分: <em style="color:#ff6600;">596</em>&nbsp; 商品金额: <strong style="color:#ff6600;">￥596.00元</strong>
				</div>
				<div style="text-align:right;margin-top:10px;margin-bottom:10px;">
					<a href="order_info.htm" id="clear" class="clear">清空购物车</a>
					<a href="order_info.htm">
						<input type="submit" width="100" value="提交订单" name="submit" border="0" style="background: url('./images/register.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0);
						height:35px;width:100px;color:white;">
					</a>
				</div>
			</div>

		</div>

		<!-- 引入footer.jsp -->
		<jsp:include page="/admin/publicBoard/footer.jsp"></jsp:include>

	</body>

</html>