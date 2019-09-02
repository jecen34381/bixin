<%@page import="com.bixin.Entity.Pbook"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title></title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css" type="text/css" />
<script src="${pageContext.request.contextPath }/js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap.min.js" type="text/javascript"></script>

<style type="text/css">
html, body {
	width: 100%;
	height: 100%;
	margin: 0;
	padding: 0;
}

#headerShowImage {
	width: 100%;
	height: 40%;
	background-color: aqua;
}

#contentCategory {
	width: 100%;
	height: 50px;
}

#contentCategory .category {
	width: 80%;
	height: 100%;
	background-color: aliceblue;
	list-style: none;
	margin: 0 auto;
	padding: 0;
}

#contentCategory .category li {
	float: left;
	display: block;
}

.category li button {
	width: 100px;
	height: 50px;
}

#mainContent {
	background-color: white;
	width: 100%;
}

#mainContent .infotable {
	background-color: white;
	width: 80%;
	margin: 0 auto;
	margin-top: 30px;
}

#mainContent .infotable table {
	width: 100%;
}

#mainContent .infotable table td {
	height: 50px;
	text-align: center;
	font-size: 20px;
}

#courseintroduce {
	width: 80%;
	background-color: white;
	margin: 0 auto;
	margin-top: 10px;
}
 #shoppingRight:hover {background-color:white;}
 #rightPop {display: block;width:100px;height:40px;margin-top:0;font-size:20px;text-align:center; text-decoration:none;position:fixed; top:300px;z-index:0;margin: 0 auto;}

</style>
<script type="text/javascript">
		$(function(){
			$("#shoppingRight").mouseenter(function(){
				$("#rightPop").css("background-color","red").animate({right:'50px'}).css("background-color","red");
			}).mouseleave(function(){
				$("#rightPop").animate({right:"-50px"}).css("background-color","#BDBDBD");
			});
			$("#addProduct").click(function(){
				var pbname = $("#pbname").text();
				var pbprice = $("#pbprice").text();
				var pbimage = $("#pbimage").attr("src");
				$.ajax({
					"url":"/bixin/addProductToCar",
					"data":{"pbname":pbname,"pbprice":pbprice,"pbimage":pbimage},
					"success":function(result){
						window.location.href="/bixin/shoppingCarList";
					}
				});
			});
			$("#addProduct").blur(function(){
				$(this).css("background-color","black");
			}); 
		});
</script>
</head>
<body>
	<% 
		String pbname=request.getParameter("pbname"); 
		String pbimage=request.getParameter("pbimage"); 
		String pbdate=request.getParameter("pbdate"); 
		String pbdesc=request.getParameter("pbdesc"); 
		String pbprice=request.getParameter("pbprice");
		 
	%>
	<div style="float:right;width:50px;height:100%;position:fixed;right:0;background-color:#BDBDBD;">
		<a id="shoppingRight" href="${pageContext.request.contextPath }/shoppingCarList" style="display: block;width:50px;height:120px;color:orange;margin-top:300px;font-size:30px;text-align:center; text-decoration:none;z-index:1;position:fixed;background-color:#BDBDBD;" align="center">购物车</a>
		<div id="rightPop" style="" align="center" >这是购物车</div>
	</div>
	<!-- 引入header.jsp -->
	<jsp:include page="/admin/publicBoard/header.jsp"></jsp:include>
	
	<div id="headerShowImage"><img src="${pageContext.request.contextPath }/videoimage/xinaglongshibazhang.jpg" style="width:100%;height:100%;"></div>
		<div id="contentCategory">
			<ul class="category clearfix">
				<li style="float:right;" ><button style="" id="addProduct">加入购物车</button></li>
				<li><button class="introduceCourse">图书介绍</button></li>
				<li><button class="introduceLectuer">作者介绍</button></li>
				
			</ul>
		</div>
		<div id="mainContent">
			
			<div class="infotable">
				<table border="1">
					<tr>
						<td style="width:20%;">图书书名</td>
						<td id="pbname"><%= pbname %></td>
					</tr>
					<tr>
						<td style="width:20%;">发布时间</td>
						<td><%= pbdate %></td>
					</tr>
					<tr>
						<td style="width:20%;">适合人群</td>
						<td>热爱技术的猿猴</td>
					</tr>
					<tr>
						<td style="width:20%;">图书价格</td>
						<td id="pbprice"><%= pbprice %></td>
					</tr>
				</table>
			</div>
			<div id="courseintroduce" style="border:1px solid gray;">
				<label style="margin-left: 30px;"><h2>课程介绍</h2></label>
				<div style="margin-left: 30px;font-size:25px;"><%= pbdesc %></div>
				<img id="pbimage" src="${pageContext.request.contextPath }/<%= pbimage + "" %>" width="70%" height="800px"
				style="margin: 0 auto;display: block;margin-top: 20px;background-size:100% 100%;">
			</div>
		</div>
		<!-- 引入footer.jsp -->
	<jsp:include page="/admin/publicBoard/footer.jsp"></jsp:include>
	</body>

</html>