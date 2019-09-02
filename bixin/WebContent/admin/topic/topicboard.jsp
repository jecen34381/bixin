<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title></title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/base.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/bootstrap.min.css"
	type="text/css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/calendar.css">

<script
	src="${pageContext.request.contextPath }/js/jquery-1.11.3.min.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"
	type="text/javascript"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.9.1.min.js"></script>
<style type="text/css">
.mainDiv {
	width: 1100px;
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
	height: 290px;
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

.ico-add, .ico-back, .ico-boy, .ico-del, .ico-edit, .ico-edu, .ico-girl,
	.ico-info, .ico-items, .ico-lbs, .ico-letter, .ico-return, .ico-self,
	.ico-submit, .ico-upload, .ico-upload2, .ico-work {
	display: inline-block;
	*zoom: 1;
	vertical-align: middle;
	/* background: url() -203px 0px no-repeat; */
}

.discuss-tab-wrap {
	background: #f5f5f5;
	padding: 15px 15px 10px;
	margin: 10px 0 0;
}

.discuss-tab.selected {
	background: #25bb9b;
	color: #fff;
	text-align: center;
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

.discuss-tab {
	padding: 0 5px;
	height: 28px;
	line-height: 28px;
	display: inline-block;
	white-space: nowrap;
	font-size: 14px;
	margin-right: 10px;
	margin: 0 10px 5px 0;
}

.clearfix:after, .clearfix:before {
	clear: both;
	content: ".";
	display: block;
	height: 0;
	visibility: hidden;
}

.menu-box:after, .menu-txt-box:after {
	clear: both;
	content: ".";
	display: block;
	height: 0;
	visibility: hidden;
}

.menu-txt-box {
	width: 100%;
	height: 42px;
	padding: 10px;
	font-size: 14px;
}

.menu, .menu-txt {
	float: left;
	letter-spacing: 0px;
	white-space: nowrap;
}

ol, ul {
	list-style: none;
}

.menu li, .menu-txt li {
	letter-spacing: 0;
	display: inline-block;
	*display: inline;
	*zoom: 1;
	margin-right: 1px;
	position: relative;
}

.menu-txt .selected a {
	color: #25bb9b;
}

.menu-txt a {
	padding: 0 10px;
	color: #888;
}

ul {
	margin: 0;
	padding: 0;
	font-weight: 400;
}

.menu-pipe {
	color: #eee;
	vertical-align: 1px;
}

.module-body {
	padding: 20px;
}
</style>

<script type="text/javascript">
	$(function() {
		/* $("li").click(function(){
			alert("ddd");
		}); */
		$
				.ajax({
					"url" : "/bixin/topic.do",
					"dataType" : "JSON",
					"type" : "POST",
					"data" : {
						"function" : "getPublishTopic"
					},
					"success" : function(result) {
						$
								.each(
										result,
										function(index, element) {
											var topicId = "";
											var title = "";
											var autor = "";
											var time = "";
											$
													.each(
															element,
															function(i, e) {
																if (i == "topicId") {
																	topicId = "<li class=\"current clearfix\"><div class=\"media\"><div class=\"media-left\"><a href=\"#\"> <img src=\"${pageContext.request.contextPath }/img/touxiang.gif\" alt=\"...\" class=\"img-circle\" width:70px;height:70px;></a></div><div class=\"media-body\" style=\"margin-top:20px;margin-left:10px;\"><a class=\"media-heading\" href=\"${pageContext.request.contextPath}/topic.do?start=0&function=topicModel&topicId="
																			+ e
																			+ "\">";
																}
																if (i == "title") {
																	title = e
																			+ "</a>"
																}
																if (i == "uid") {
																	$
																			.ajax({
																				"url" : "/bixin/topic.do",
																				"async" : false,
																				"type" : "POST",
																				"data" : {
																					"function" : "queryUnameByUid",
																					"uid" : e
																				},
																				"success" : function(
																						result) {
																					console
																							.log(result);
																					author = "<div class=\"clearfix\" style=\"margin-top:110px;\"><b style=\"color:red;\">用户:"
																							+ result
																							+ "</b>";
																				}
																			});

																}
																if (i == "createTime") {
																	time = " <b>"
																			+ e
																			+ "</b></div></div></div><hr /></li>";
																}
															});
											$(".common-list").append(
													topicId + title + author
															+ time);
										});
					}
				});

		$(".discuss-tab")
				.click(
						function() {
							var fun = $(this).text();
							alert(fun);
							$
									.ajax({
										"url" : "#",
										"dataType" : "JSON",
										"type" : "POST",
										"data" : {
											"function" : "getPublishTopic"
										},
										"success" : function(result) {
											$
													.each(
															result,
															function(index,
																	element) {
																var topicId = "";
																var title = "";
																var autor = "";
																var time = "";
																$
																		.each(
																				element,
																				function(
																						i,
																						e) {
																					if (i == "topicId") {
																						topicId = "<li class=\"current clearfix\"><div class=\"media\"><div class=\"media-left\"><a href=\"#\"> <img src=\"${pageContext.request.contextPath }/img/touxiang.gif\" alt=\"...\" class=\"img-circle\" width:70px;height:70px;></a></div><div class=\"media-body\" style=\"margin-top:20px;margin-left:10px;\"><a class=\"media-heading\" href=\"${pageContext.request.contextPath}/topic.do?topicId="
																								+ e
																								+ "&function=topicModel\">";
																					}
																					if (i == "title") {
																						title = e
																								+ "</a>"
																					}
																					if (i == "uid") {
																						author = "<div class=\"clearfix\" style=\"margin-top:110px;\"><b style=\"color:red;\">"
																								+ e
																								+ "</b>";
																					}
																					if (i == "createTime") {
																						time = " <b>"
																								+ e
																								+ "</b></div></div></div><hr /></li>";
																					}
																				});
																$(
																		".common-list")
																		.append(
																				topicId
																						+ title
																						+ author
																						+ time);
															});
										}
									});
						});
	});
</script>
</head>


<body style="background-color: #EEEEEE;">
	<!-- 引入header.jsp -->
	<jsp:include page="/admin/publicBoard/header.jsp"></jsp:include>

	<div class="mainDiv">
		<div class="bbs_ad_top" align="center">
			<jsp:include page="/admin/topic/shujuan.jsp"></jsp:include>
			
			<%-- <a href="#" target="_blank"><img
				src="${pageContext.request.contextPath }/img/first.png" width="100%"
				height="100px" /></a> --%>
		</div>
		<!-- right -->
		<div
			style="float: right; width: 400px; height: 600px; margin-top: 40px;">
			<div id="calendar" class="calendar"></div>

			<script src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
			<script src="${pageContext.request.contextPath }/js/calendar.js"></script>

			<div style="text-align: center; clear: both">
				<script src="${pageContext.request.contextPath }/gg_bd_ad_720x90.js" type="text/javascript"></script>
				<script src="${pageContext.request.contextPath }/follow.js" type="text/javascript"></script>
			</div>

			<!-- <p style="font-size: 100px; text-align: center;">广</p>
			<p style="font-size: 100px; text-align: center; margin-top: 50px;">告</p> -->
		</div>
		<!-- left -->
		<div class="bbs_content" style="margin-top: 60px; float: left;">
			<div class="module_box">
				<div class="module_head clearfix">
					<h2>分享与求助</h2>
					<div class="module_head_oprt">
						<a class="btn btn-primary btn-b-publish" href="#"> <i
							class="ico-submit"></i> 我要发布
						</a>
					</div>
				</div>
				<div class="discuss-tab-wrap">
					<a href="#" class="discuss-tab selected">全部</a> <a href="#"
						class="discuss-tab">Java</a> <a href="#" class="discuss-tab">JavaScript</a>
					<a href="#" class="discuss-tab">CSS</a> <a href="#"
						class="discuss-tab">HTML</a> <a href="#" class="discuss-tab">jQuery</a>
					<a href="#" class="discuss-tab">JavaScript</a> <a href="#"
						class="discuss-tab">CSS</a> <a href="#" class="discuss-tab">HTML</a>
					<a href="#" class="discuss-tab">jQuery</a> <a href="#"
						class="discuss-tab">JavaScript</a> <a href="#" class="discuss-tab">CSS</a>
					<a href="#" class="discuss-tab">HTML</a> <a href="#"
						class="discuss-tab">jQuery</a>
				</div>
				<div class="menu-txt-box">
					<ul class="menu-txt clearfix">
						<li class="selected"><a href="#">最新回复</a></li>
						<li class="menu-pipe">|</li>
						<li><a href="#">最新发表</a></li>
						<li class="menu-pipe">|</li>
						<li><a href="#">最热</a></li>
						<li class="menu-pipe">|</li>
						<li><a href="#">精华</a></li>
					</ul>
				</div>
				<div class="module-body">
					<ul class="common-list">



					</ul>
				</div>
			</div>
		</div>
	</div>



	<!-- 引入footer.jsp -->
	<jsp:include page="/admin/publicBoard/footer.jsp"></jsp:include>
</body>

</html>