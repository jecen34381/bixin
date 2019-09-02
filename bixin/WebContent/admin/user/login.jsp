<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录表</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"
	type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
	$(function() {
		document.querySelector("#img").onclick = function() {
			this.src = "${pageContext.request.contextPath}/image?a="
					+ new Date();//每次带的参数必须不一样，才能够再发请求
		};

	});
</script>
</head>
<body>
	<!-- 引入header.jsp -->

	<jsp:include page="/admin/publicBoard/header.jsp"></jsp:include>
	<div
		style="width: 600px; height: 50px; text-align: center; color: red; font-size: 20px; margin: 0 auto; line-height: 50px">
		${errorMessage }</div>
	<div class="well" style="margin-left: 300px; width: 900px">
		<h2 style="text-align: center">登录界面</h2>
		<form class="form-horizontal"
			action="${pageContext.request.contextPath }/registerServlet"
			method="post" id="loginForm">
			<input type="hidden" name="op" value="login" />
			<div class="form-group" style="width: 700px">
				<label for="inputEmail3" class="col-sm-2 control-label">用户名</label>
				<div class="col-sm-10">
					<input type="text" name="userName" class="form-control"
						id="inputEmail3" placeholder="用户名">
				</div>
			</div>
			<div class="form-group" style="width: 700px">
				<label for="inputPassword3" class="col-sm-2 control-label">密码</label>
				<div class="col-sm-10">
					<input type="password" name="userPass" class="form-control"
						id="inputPassword3" placeholder="Password">
				</div>
			</div>
			<div class="form-group" style="width: 700px">
				<label for="inputyanzhengma" class="col-sm-2 control-label">请输入验证码</label>
				<div class="col-sm-10">
					<input type="text" name="checkCode" class="form-control"
						id="inputyanzhengma" placeholder="验证码"> <img id="img"
						src="${pageContext.request.contextPath }/image">
				</div>
			</div>
			<div class="form-group" style="width: 700px">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-default">登录</button>
					<button type="button" class="btn btn-default">
						<a
							href="${pageContext.request.contextPath }/admin/user/register.jsp">去注册</a>
					</button>
				</div>
			</div>
		</form>
	</div>
	<div style="position:absolute;bottom:0;">
		<!-- 引入footer.jsp -->
		<jsp:include page="/admin/publicBoard/footer.jsp"></jsp:include>
	</div>

</body>
</html>