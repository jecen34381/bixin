<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/bootstrap.min.css" />
<script src="${pageContext.request.contextPath }/js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/js/jquery 2.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath }/js/jquery-1.11.1.js" type="text/javascript" charset="utf-8"></script>
<style type="text/css">
html, body {
	width: 100%;
	height: 100%;
	background-color: gainsboro;
}

.libShowBar {
	width: 100%;
	height: 50%;
	background-image: url("videoimage/qiankundanuoyi.jpg");
	background-size: 100% 100%;
	background-color: aqua;
	text-align: center;
	position: relative;
}

#lookfor {
	width: 50%;
	height: 60px;
	border-radius: 35px;
	margin: 0 auto; /* margin-top: 13%; */
	border: 2px solid black;
	text-align: left;
	position: relative;
	top: 200px;
}

#lookforInput {
	width: 85%;
	height: 53px;
	border-radius: 35px;
	background-color: transparent; /* margin: 0 auto; */
	/* margin-top: 13%; */
	padding-left: 30px;
	font-size: 25px;
	outline: none; /* opacity: 0.4; */
	float: left;
	border: 0;
}

#lookforsubmit {
	width: 7%;
	height: 50px;
	border-radius: 25px;
	margin: 0 auto;
	line-height: 45px;
	text-align: center;
	font-size: 30px;
	border: 0;
	outline: none;
	background-color: transparent;
}

.bookcategory {
	width: 90%;
	height: 60px;
	background-color: white;
	margin: 0 auto;
	margin-top: 10px;
}

#categoryList {
	padding-left: 0;
}

#categoryList li {
	float: left;
	height: 60px;
	background-color: white;
	display: block;
	list-style: none;
	font-size: 25px;
	margin: 0 auto;
	text-align: center;
	line-height: 60px;
	border-right: 1px solid darkgray;
	width: 150px;
}

#categoryList li a {
	text-decoration: none;
	color: black;
}

.categoryByChar {
	width: 90%;
	height: 60px;
	background-color: white;
	margin: 0 auto;
	margin-top: 10px;
}

#categoryByCharList li {
	float: left;
	height: 60px;
	background-color: white;
	display: block;
	list-style: none;
	font-size: 25px;
	margin: 0 auto;
	text-align: center;
	line-height: 60px;
	border-right: 1px solid darkgray;
	width: 100px;
}

#categoryByCharList li a {
	text-decoration: none;
	color: black;
}

a:hover {
	background-color: gray;
	display: block;
}

.content {
	width: 90%;
	background-color: white;
	margin: 0 auto;
	margin-top: 10px;
}
</style>
<script type="text/javascript">
	$(function() {

	});
</script>
</head>
<body>
	<!-- 引入header.jsp -->

	<jsp:include page="/admin/publicBoard/header.jsp"></jsp:include>
	<!-- 图书馆展示栏 -->
	<div class="libShowBar">
		<div id="lookfor" class="lookfor clearfix">
			<input type="submit" value="查" id="lookforsubmit"
				style="float: right;" /> <input type="text" name="lookforbook"
				id="lookforInput" placeholder="请输入书名或编号查询" />

		</div>

	</div>
	<!-- 种类菜单 -->
	<div class="bookcategory">
		<ul id="categoryList" class="categoryList clearfix">
			<li><a>JAVA</a></li>
			<li><a>HTML</a></li>
			<li><a>JAVASCRIPT</a></li>
			<li><a>CSS</a></li>
		</ul>
	</div>
	<!-- 按照首字母查找 -->
	<div class="categoryByChar">
		<ul id="categoryByCharList" class="categoryByCharList clearfix">
			<li style="width: 150px; margin: 0 auto;">首字母查找</li>
			<li><a>A</a></li>
			<li><a>B</a></li>
			<li><a>C</a></li>
			<li><a>D</a></li>
			<li><a>E</a></li>
			<li><a>F</a></li>
			<li><a>G</a></li>
			<li><a>H</a></li>
			<li><a>I</a></li>
			<li><a>J</a></li>
		</ul>
		<div class="content"></div>
	</div>
	<!-- 图书列表 -->
	<div class="content">
		<h4 style="margin-left: 30px; padding-top: 20px;">以显示所有此类图书</h4>
		<div class="row">
			<c:forEach var="1" begin="0" end="12">
				<div class="col-sm-6 col-md-4">
					<div class="thumbnail">
						<img src="${pageContext.request.contextPath }/videoimage/rulaishenzhang.jpg" alt="图书">
						<div class="caption">
							<p>书名</p>
							<p>作者|类型|</p>
							<p>发布于：</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<div style="margin: 0 auto;" align="center">
			<nav aria-label="Page navigation">
				<ul class="pagination">
					<li><a href="#" aria-label="Previous"> <span
							aria-hidden="true">&laquo;</span>
					</a></li>
					<li><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li><a href="#" aria-label="Next"> <span
							aria-hidden="true">&raquo;</span>
					</a></li>
				</ul>
			</nav>
		</div>

	</div>

	<!-- 引入footer.jsp -->
	<jsp:include page="/admin/publicBoard/footer.jsp"></jsp:include>
</body>
</html>