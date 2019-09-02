<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>首页</title>
<link rel="stylesheet" href="/bixin/css/bootstrap.min.css" type="text/css" />
<script src="/bixin/js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="/bixin/js/bootstrap.min.js" type="text/javascript"></script>

<style type="text/css">
	body {background-color:gray;}
	#background {margin-top: 0;padding-top:0;}
</style>
</head>
<body>
	<!-- 引入header.jsp -->
	<jsp:include page="/admin/publicBoard/header.jsp"></jsp:include>

	<img alt="" src="${pageContext.request.contextPath }/image/background.jpg" style="width: 100%;height:100%;" id="background">
	<!-- 引入footer.jsp -->
	<jsp:include page="/admin/publicBoard/footer.jsp"></jsp:include>
</body>
</html>