<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>书城城首页</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css" type="text/css" />
<script src="${pageContext.request.contextPath }/js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap.min.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(".mainBlock").mouseenter(function() {
			$(this).find("li").slideDown(30);
		}).mouseleave(function() {
			$(this).find("li").slideUp(30);
		});
		/* $.ajax({
			"async":true,
			"url":"shopVideoProductListServlet",
			"dataType","JSON",
			"success":function(data){
				for(var i = 0;i < data.length;i++){
					console.log(data[]);
				}
			}
			
		}); */
	});
	function toVideoInfo(id) {
		console.log(id);
		/* window.location.href='/videoInfo.jsp'; */
	}
</script>
<style type="text/css">
html, body {
	width: 100%;
	height: 100%;
}

.mainBlock {
	width: 130px;
	height: 150px;
	background-color: azure;
	padding-inline-start: 0;
	list-style: none;
	position: relative;
	list-style: none;
}

.mainBlock li {
	position: absolute;
	bottom: 0;
	height: 130px;
	width: 130px;
	background-color: white;
	opacity: 0.5;
	display: none;
}
</style>
</head>
<body>
	<!-- 引入header.jsp -->
	<jsp:include page="/admin/publicBoard/header.jsp"></jsp:include>

	<!-- 轮播图 -->
	<div id="carousel-example-generic" class="carousel slide"
		data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#carousel-example-generic" data-slide-to="0"
				class="active"></li>
			<li data-target="#carousel-example-generic" data-slide-to="1"></li>
			<li data-target="#carousel-example-generic" data-slide-to="2"></li>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<img src="${pageContext.request.contextPath }/videoimage/bixiejianpu.jpg" alt="...">
				<div class="carousel-caption">...</div>
			</div>
			<div class="item">
				<img src="${pageContext.request.contextPath }/videoimage/qiankundanuoyi.jpg" alt="...">
				<div class="carousel-caption">...</div>
			</div>
			<div class="item">
				<img src="${pageContext.request.contextPath }/videoimage/xinaglongshibazhang.jpg" alt="...">
				<div class="carousel-caption">...</div>
			</div>
		</div>

		<!-- Controls -->
		<a class="left carousel-control" href="#carousel-example-generic"
			role="button" data-slide="prev"> <span
			class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#carousel-example-generic"
			role="button" data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>
	<div style="margin-top: 30px; width: 90%; margin: 0 auto;background-color:#F8F8F8;"
		align="center">
		<div class="container-fluid" style="background-color:white;border:1px solid gray;padding:0;margin:0;">
			<div class="col-md-12" style="background-color:#F8F8F8;">
				<h2 style="text-align: center;">
					<!-- <img src="img/title2.jpg" />&nbsp;&nbsp; -->
					最热图书
				</h2>
			</div>
			<div class="col-md-10 clearfix">
				<c:forEach items="${hotList }" var="hot">

					<div class="col-md-2"
						style="text-align: center; height: 150px; margin-top: 20px;"
						onclick="window.location.href='${pageContext.request.contextPath}/admin/bookShop/videoInfo.jsp?pbdate=${hot.pbdate }&pbdesc=${hot.pbdesc }&pbimage=${hot.pbimage }&pbname=${hot.pbname }&pbprice=${hot.pbprice }'">
						<%-- toVideoInfo('${hot.pbid}') --%>
						<ul class="mainBlock"
							style="background-image: url('${hot.pbimage}');background-size:100% 100%;border:2px solid black;">

							<li style="width: 130px; height: 75px"></li>
							<li
								style="color: black; border: 0 auto; /*  text-align: center; line-height: 40px; */ width: 130px; height: 75px;">
								<p>发布时间：${hot.pbdate }</p>
								<p>最优价：${hot.pbprice }</p>
							</li>
						</ul>
					</div>

				</c:forEach>

			</div>
		</div>
		<div class="col-md-12">
			<h2 style="text-align: center;">
				<!-- <img src="img/title2.jpg" />&nbsp;&nbsp; -->
				最新图书
			</h2>
		</div>
		<div class="row">
			<c:forEach items="${latestList }" var="latest">
				<div class="col-sm-6 col-md-4"
					onclick="window.location.href='${pageContext.request.contextPath}/admin/bookShop/videoInfo.jsp?pbdate=${latest.pbdate }&pbdesc=${latest.pbdesc }&pbimage=${latest.pbimage }&pbname=${latest.pbname }&pbprice=${latest.pbprice }'">
					<div class="thumbnail">
						<img src="${latest.pbimage}" alt="...">
						<div class="caption">
							<h3>${latest.pbname }</h3>
							<div class="price clearfix">
								<del style="float: right;">${latest.pbprice}</del>
								<p style="float: left;">${latest.pbprice}</p>
							</div>

						</div>
					</div>
				</div>
			</c:forEach>

		</div>

	</div>

	<!-- 引入footer.jsp -->
	<jsp:include page="/admin/publicBoard/footer.jsp"></jsp:include>
</body>
</html>