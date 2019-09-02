<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改个人信息页面</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/bootstrap.min.css" />
<script src="${pageContext.request.contextPath }/js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/js/jquery 2.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath }/js/jquery-1.11.1.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jQuery/jquery-3.4.1.js"></script>
<style type="text/css">
input {
	width: 300px;
	height: 30px;
	font-size: 18px;
	border-radius: 90px;
	text-align: center;
}
#tb{
	/* background-color: #ccc; */
}
tr {
	font-size: 18px;
}
</style>
<script type="text/javascript">
	$(function(){
		$("#username").change(function(){
		 $.get(
				"/bixin/modifyMessageServlet",
				{username:$("#username").val(),op:"chongfu"},
				function(msg){
					$("#exists").html(msg);
				}
			);
			
		});
	});
</script>
<style>
  body{
	background:url(images/bg.jpg) top left no-repeat;
	background-size:cover;
  }
</style>

</head>
<body>
<!-- 引入header.jsp -->
	<script type="text/javascript" src="js/mymouse.js" id="mymouse"></script>

	<jsp:include page="/admin/publicBoard/header.jsp"></jsp:include>
	<div style="margin-top: 100px;" align="center">
		<form action="modifyMessageServlet">
			<input type="hidden" name="op" value="updateMessage" /> <input
				type="hidden" name="uid" value="${user.uid }" />
			<table id= "tb" cellSpacing="0" width=500px height=600px>
				<tr>
					<th colspan="2" align="center" style="text-align:center;font-size:25px;">个人信息修改</th>
				<tr>
				
				<tr>
					<td>用户名</td>
					<td><input type="text" name="username"
						value="${user.username }" id="username" /></td>
				</tr>
				
				<tr style="height:30px;">
					<td colspan="2">
						<div id="exists" style = "color:red;text-align:center"></div>
					</td>
				</tr>

				<tr>
					<td>姓名</td>
					<td><input type="text" name="name" value="${user.name }" /></td>
				</tr>
				
				<tr>
					<td>性别</td>
					<td><input type="text" name="sex" value="${user.sex }" /></td>
				</tr>

				<tr>
					<td>邮箱</td>
					<td><input type="mail" name="uemail" value="${user.email }" /></td>
				</tr>

				<tr>
					<td>出生年月</td>
					<td><input type="date" name="birthday"
						value="${user.birthday }" /></td>
				</tr>

				<tr style="text-align: center;">
					<td colspan="2" ><input type="submit" value="提交" style="background-color:white;"/></td>
				</tr>
			</table>
		</form>
	</div>
	
	<!-- 引入footer.jsp -->
	<jsp:include page="/admin/publicBoard/footer.jsp"></jsp:include>
</body>
</html>