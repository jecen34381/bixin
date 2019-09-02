<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title></title>
<link rel="stylesheet"
	href="https://static.nowcoder.com/nowcoder/1.2.1277/stylesheets/common/base.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/bootstrap.min.css"
	type="text/css" />

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/fonts/iconfont.css">
<link rel="stylesheet" type="text/css" media="screen"
	href="${pageContext.request.contextPath }/css/reset.css" />
<link rel="stylesheet" type="text/css" media="screen"
	href="${pageContext.request.contextPath }/css/player.css" />

<script
	src="${pageContext.request.contextPath }/js/jquery-1.11.3.min.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/wangEditor.min.js"></script>
<style type="text/css">
body, html {
	background-color: balck;
	background-image:url("/bixin/img/bg.gif");
}

.mainDiv {
	width: 1000px;
	height: 1000px;
	margin: 0px auto;
	/*border: 1px solid;*/
}

.clearfix {
	display: block;
	zoom: 1;
}

.bbs_ad_top {
	width: 100%;
	height: 180px;
}

.module_head {
	padding: 0px 20px 0;
	line-height: normal;
	position: relative;
}

.module_head h2 {
	font-size: 16px;
	line-height: 16px;
	float: left;
	font-weight: 700;
	font-family: "微软雅黑";
	white-space: nowrap;
	margin: 18px 0 0 0;
}

.module_head h2:before {
	background: #ff6547;
	content: "";
	display: inline-block;
	width: 7px;
	height: 7px;
	margin-right: 5px;
	margin-bottom: 2px;
	vertical-align: middle;
}

.btn {
	display: inline-block;
	text-align: center;
	/*padding: 10px 0;*/
	margin: 0 0 0px 0;
	width: 110px;
	color: #fff;
	font-size: 14px;
	border-radius: 3px;
	border: none 0;
	cursor: pointer;
	line-height: normal;
	outline: 0;
	white-space: nowrap;
}

.module_head_oprt {
	float: right;
	font-size: 14px;
	padding: 15px 0 0 0;
}

.btn-b-publish {
	padding: 7px 0;
	margin-top: -6px !important;
	float: right;
}

.btn i {
	margin-right: 5px;
}

.ico-submit {
	width: 11px;
	height: 11px;
	background-position: -203px 20px;
}

.btn-primary {
	background: #25bb9b;
}

.btn-primary:hover {
	background: #22ae90;
}

.bbs_content {
	float: left;
	width: 690px;
	margin: 0 10px 0 0;
	padding: 11px 0 0 0;
}

div {
	display: block;
}

.module_box {
	width: 690px;
	border: 1px solid #e0e0e0;
	border-radius: 3px;
	margin-bottom: 10px;
	background: #fff;
}

a:hover {
	color: #25BB9B;
}

a {
	color: #000000;
}

a:link, a:visited {
	text-decoration: none;
}

.module-body {
	padding: 20px;
}
</style>

<script type="text/javascript">
	$(function() {

	});
</script>
<script type="text/javascript">
	$(function() {
		var E = window.wangEditor
		var editor = new E('#editor')
		// 或者 var editor = new E( document.getElementById('editor') )
		editor.create()

		$("#replay").click(function() {
			var topicContent = $(".w-e-text").html();
			console.log(topicContent);
			var topicId = $("#uidHidden").text();

			$.ajax({
				"async" : true,
				"url" : "/bixin/topic.do",
				"type" : "POST",
				"data" : {
					"topicContent" : topicContent,
					"topicId" : topicId,
					"function" : "saveReplay"
				},
				"success" : function(data) {
					alert(data);
					if (data == "回复成功") {
						window.location.reload();
						/* window.location.href = "/bixin/topicModelInfoServlet"; */
					} else {

						window.location.reload();
					}

				}
			});
		});

	});
</script>
</head>


<body style="background-color: white;">
	<!-- 引入header.jsp -->
	<jsp:include page="/admin/publicBoard/header.jsp"></jsp:include>
	<h6 id="uidHidden" style="position: fixed; left: 0; color: #EEEEEE;">${topicList.topicId }</h6>
	<div class="mainDiv">
		<div class="bbs_ad_top" style="background-color:black;">
			<jsp:include page="/admin/topic/music.jsp"></jsp:include>
			<!-- <a href="#" target="_blank"><img src="img/first.png" width="100%"
				height="100px" /></a> -->
		</div>
		<div class="clearfix">
			<!-- right -->
			<div
				style="float: right; width: 300px; height: 600px; background-color: #EEEEEE; margin-top: 30px;">
				<p style="font-size: 150px; text-align: center;">广</p>
				<p style="font-size: 150px; text-align: center; margin-top: 50px;">告</p>
			</div>
			<!-- left -->
			<div class="bbs_content" style="margin-top: 20px; float: left;">
				<div class="module_box">

					<div class="module-body">

						<div class="media">
							<div class="media-left">
								<a href="#"> <img
									src="${pageContext.request.contextPath }/img/touxiang.gif"
									alt="..." class="img-circle"width:100px;height:100px;>
								</a>
							</div>
							<div class="media-body">

								<h4 class="media-heading">${topicList.title }</h4>
								<div class="clearfix" style="margin-top: 110px;">
									<b>${topicList.uid }</b> <b>${topicList.createTime }</b>
								</div>
							</div>
						</div>
						<hr />
						<div class="media" style="">${topicList.content }</div>
					</div>
					<hr style="height: 5px;" />
					<div style="margin-top: 20px; margin-left: 30px;">
						<div class="clearfix">
							<a href="#editor"
								style="float: right; display: block; height: 50px; width: 100px; color: white; background-color: green; margin-left: 30px; text-align: center; line-height: 50px;">回帖</a>
							<h4 style="float: left;">回帖:</h4>
						</div>

						<div style="margin-top: 50px;">
							<ul style="list-style: none;">
								<c:forEach items="${replayList }" var="replay">
									<li>
										<div class="media">
											<div class="media-left">
												<a href="#"> <img
													src="${pageContext.request.contextPath }/img/touxiang.gif"
													alt="..." class="img-rounded" width="75px" height="75px">
												</a>
											</div>
											<div class="media-body">
												<a class="media-heading"
													href="${pageContext.request.contextPath }"
													style="color: blue;">${replay.uid }</a> <br />
												<h4>${replay.content}</h4>
												<br />
												<h5>发表于 ${replay.createTime}</h5>
											</div>
										</div>

									</li>
									<hr />
								</c:forEach>

							</ul>

						</div>
					</div>
					<div style="width: 100%; text-align: center;">
						<nav aria-label="Page navigation">
							<ul class="pagination" >
								<li><a href="#" aria-label="Previous"> <span
										aria-hidden="true">&laquo;</span>
								</a></li>
								<li><a
									href="${pageContext.request.contextPath}/topic.do?start=0&function=topicModel&topicId=${topicId}">1</a></li>
								<li><a
									href="${pageContext.request.contextPath}/topic.do?start=1&function=topicModel&topicId=${topicId}">2</a></li>
								<li><a
									href="${pageContext.request.contextPath}/topic.do?start=2&function=topicModel&topicId=${topicId}">3</a></li>
								<li><a
									href="${pageContext.request.contextPath}/topic.do?start=3&function=topicModel&topicId=${topicId}">4</a></li>
								<li><a
									href="${pageContext.request.contextPath}/topic.do?start=4&function=topicModel&topicId=${topicId}">5</a></li>
								<li><a href="#" aria-label="Next"> <span
										aria-hidden="true">&raquo;</span>
								</a></li>
							</ul>
						</nav>
					</div>

				</div>
				<div style="border: 1px solid gray; background-color: white;">
					<div id="editor"
						style="width: 690px; height: 330px; border: 2px solid white; background-color: white;">
						<p>请开始你的操作</p>
					</div>
					<!-- 注意， 只需要引用 JS，无需引用任何 CSS ！！！-->
					<button id="replay"
						style="width: 100px; height: 50px; float: right; background-color: white; text-align: center; line-height: 50px; margin-top: 30px; margin-top: 30px;">回帖</button>
				</div>


			</div>
		</div>


	</div>

	<!-- 引入footer.jsp -->
	<jsp:include page="/admin/publicBoard/footer.jsp"></jsp:include>
</body>
</html>