<%@page import="com.bixin.Entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>个人中心</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/base.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css" type="text/css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css">
  <script src="${pageContext.request.contextPath }/js/prefixfree.min.js"></script>
<script src="${pageContext.request.contextPath }/js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap.min.js" type="text/javascript"></script>

<style type="text/css">
#outer {
	margin: 0 auto;
	height: 650px;
	width: 1300px;
	/* background-color: #FFFFFF; */
}

#leftUl li {
	text-align: center;
	font-size: 20px;
	margin-top: 30px;
}


#outer div {
	float: left;
}

#right div {
	float: left;
}

tr {
	display: block;
	font-size: 20px;
	margin-top: 30px;
}
</style>
</head>
<body>
	<!-- 引入header.jsp -->

	<jsp:include page="/admin/publicBoard/header.jsp"></jsp:include>

	<div id="outer" class="clearfix">
		<div style="width: 150px;">
			<ul id="leftUl">
				<li
					style="background-color: #B20B13; color: #FFFFFF; margin-left: 18px;">个人资料</li>
				<li><a href="#">我的收藏</a></li>
				<li><a href="${pageContext.request.contextPath }/topic.do?method=other&function=getMyTopic">我的博客</a></li>
			</ul>
		</div>

		<div id="right" style="margin-top: 40px; margin-left: 80px;"
			class="clearfix">
			<p style="font-size: 25px;">个人资料</p>
			<hr />
			<div style="text-align: center;">
			<%
				
			%>
				<img src="${pageContext.request.contextPath }/headerImage/${imageName }"
					style="display: block; border-radius: 90px;" width="150px"height="150px"/> <a href="${pageContext.request.contextPath }/admin/user/headerUpload.jsp"
					style="font-size: 15px; display: block; margin-top: 50px;">上传头像</a><br />
				<a href="${pageContext.request.contextPath }/modifyMessageServlet?op=prepareUpdate&uid=${user.uid}"
					style="font-size: 15px; display: block; margin-top: 20px;">修改个人资料</a>
			</div>

			<div style="margin-left: 45px;">
				<table>

					<tr>
						<td>昵称：</td>
						<td>${user.username }</td>
					</tr>

					<tr>
						<td>实名：</td>
						<td>${user.name }</td>
					</tr>

					<tr>
						<td>性别：</td>
						<td>${user.sex }</td>
					</tr>
					<tr>
						<td>生日：</td>
						<td>${user.birthday }</td>
					</tr>

					<tr>
						<td>邮箱：</td>
						<td>${user.email }</td>
					</tr>

					<tr>
						<td>行业：</td>
						<td>未添加</td>
					</tr>

					<tr>
						<td>职位：</td>
						<td>未添加</td>
					</tr>

					<tr>
						<td>简介：</td>
						<td>未添加</td>
					</tr>
				</table>

			</div>

		</div>
		<div class="east" style="float:left;height:400px;width:400px;/* border:1px solid black; */margin-top:100px;margin-left:60px;">
			<jsp:include page="/admin/user/clock.jsp"></jsp:include>
		</div>
	</div>
	<!-- 引入footer.jsp -->
	<jsp:include page="/admin/publicBoard/footer.jsp"></jsp:include>
</body>
</body>
</html>