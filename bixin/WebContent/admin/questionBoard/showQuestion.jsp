<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>题</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/base.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/style5.css"
	media="screen" />
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-3.4.1.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"
	type="text/javascript" charset="utf-8"></script>
<style type="text/css">
html, body {
	background-image: url("/bixin/img/bg.gif");
}

#outer {
	width: 90%;
	height: 600px;
	margin: 0 auto;
}

#lul li {
	font-size: 18px;
	margin-top: 10px;
}

#left {
	margin-left: 30px;
	margin-top: 30px;
}

ol li {
	font-size: 25px;
	float: left;
	margin-top: 20px;
	margin-left: 140px;
}

#questionJava div {
	margin-top: 20px;
}

#questionJava p {
	font-size: 18px;
}

#right {
	margin-left: 70px;
}
#questionJava li,a {display:block;}
</style>
<script type="text/javascript">
	$(function() {
		$("#questionJava").empty();
		var firstCategory = "java";
		$("#type").html(firstCategory);
		var pageList = "<ul id=\"menu\"><li><a class=\"page\">Previous</a></li><li><a class=\"page\" >0</a></li><li><a  class=\"page\">1</a></li> <li><a href=\"#\" class=\"page\">2</a></li><li><a href=\"#\" class=\"page\">3</a></li> <li><a href=\"#\" class=\"page\">4</a></li> <li><a href=\"#\" class=\"page\">5</a></li><li><a href=\"#\" class=\"page\">Next</a></li></ul>";
		$("#questionJava").next().remove();
		$("#questionJava").after(pageList);
		$
				.post(
						"/bixin/showQuestionServlet",
						{
							"category" : "java",
							"option":"null"
						},
						function(result) {
							var start = "<div style=\"background-color:#F2F2F2;width:600px;margin-bottom:20px;border:1px solid gray;\">";
							var end = "</div>";
							$
									.each(
											result,
											function(i, e) {
												var title = "";
												var answer = "";
												var author = "";

												$
														.each(
																e,
																function(k, v) {
																	if (k == "qtitle") {
																		title = start
																				+ "<p style=\"padding-left:10px;background-color:gray;height:40px;font-size:25px;color:white;\">"
																				+ "题目:"
																				+ v
																				+ "</p>";
																	}
																	if (k == "qanswer") {
																		answer = "<p style=\"margin-left:20px;height:100px;\">"
																				+ "答案:"
																				+ v
																				+ "</p>";
																	}
																	if (k == "qauthor") {
																		author = "<p style=\"padding-left:10px;background-color:gray;\">"
																				+ "作者:"
																				+ v
																				+ "</p>"
																				+ end;
																	}

																});//里层each结束的标志
												$("#questionJava")
														.append(
																title
																		+ answer
																		+ author);
											})//第一个each结束的符号
						},//成功之后执行函数结束的符号
						"json");//ajax结束的符号
		$(".sub")
				.click(
						function() {
							$("#questionJava").empty();
							$("#questionJava").html("");
							var category = $(this).text();
							$("#type").html(category);
							var pageList = "<ul id=\"menu\"><li><a class=\"page\">Previous</a></li><li><a class=\"page\" >0</a></li><li><a  class=\"page\">1</a></li> <li><a href=\"#\" class=\"page\">2</a></li><li><a href=\"#\" class=\"page\">3</a></li> <li><a href=\"#\" class=\"page\">4</a></li> <li><a href=\"#\" class=\"page\">5</a></li><li><a href=\"#\" class=\"page\">Next</a></li></ul>";
							$("#questionJava").next().remove();
							$("#questionJava").after(pageList);
							$
									.post(
											"/bixin/showQuestionServlet",
											{
												"category" : category,
												"option":"null"
											},
											function(result) {
												var start = "<div style=\"background-color:#F2F2F2;width:600px;margin-bottom:20px;border:1px solid gray;\">";
												var end = "</div>";
												$
														.each(
																result,
																function(i, e) {
																	var title = "";
																	var answer = "";
																	var author = "";

																	$
																			.each(
																					e,
																					function(
																							k,
																							v) {
																						if (k == "qtitle") {
																							title = start
																									+ "<p style=\"padding-left:10px;background-color:gray;height:40px;font-size:25px;color:white;\">"
																									+ "题目:"
																									+ v
																									+ "</p>";
																						}
																						if (k == "qanswer") {
																							answer = "<p style=\"margin-left:20px;height:100px;\">"
																									+ "答案:"
																									+ v
																									+ "</p>";
																						}
																						if (k == "qauthor") {
																							author = "<p style=\"padding-left:10px;background-color:gray;\">"
																									+ "作者:"
																									+ v
																									+ "</p>"
																									+ end;
																						}

																					});//里层each结束的标志
																	$(
																			"#questionJava")
																			.append(
																					title
																							+ answer
																							+ author);
																});//第一个each结束的符号
											},//成功之后执行函数结束的符号
											"json");//ajax结束的符号

						});//事件结束的符号

		$(".page")
				.click(
						function() {
							console.log("click");
							$("#questionJava").empty();
							var length = $(this).text();
							var category = $("#type").html();
							console.log(length + category);
							
							$
									.post(
											"/bixin/showQuestionServlet",
											{
												"category" : category,
												"start":length,
												"option":"pageList"
											},
											function(result) {
												var start = "<div style=\"background-color:#F2F2F2;width:600px;margin-bottom:20px;border:1px solid gray;\">";
												var end = "</div>";
												$
														.each(
																result,
																function(i, e) {
																	var title = "";
																	var answer = "";
																	var author = "";

																	$
																			.each(
																					e,
																					function(
																							k,
																							v) {
																						if (k == "qtitle") {
																							title = start
																									+ "<p style=\"padding-left:10px;background-color:gray;height:40px;font-size:25px;color:white;\">"
																									+ "题目:"
																									+ v
																									+ "</p>";
																						}
																						if (k == "qanswer") {
																							answer = "<p style=\"margin-left:20px;height:100px;\">"
																									+ "答案:"
																									+ v
																									+ "</p>";
																						}
																						if (k == "qauthor") {
																							author = "<p style=\"padding-left:10px;background-color:gray;\">"
																									+ "作者:"
																									+ v
																									+ "</p>"
																									+ end;
																						}

																					});//里层each结束的标志
																	$(
																			"#questionJava")
																			.append(
																					title
																							+ answer
																							+ author);
																});//第一个each结束的符号
											},//成功之后执行函数结束的符号
											"json");//ajax结束的符号

							var pageList = "<ul id=\"menu\"><li><a class=\"page\">Previous</a></li><li><a class=\"page\" >0</a></li><li><a  class=\"page\">1</a></li> <li><a href=\"#\" class=\"page\">2</a></li><li><a href=\"#\" class=\"page\">3</a></li> <li><a href=\"#\" class=\"page\">4</a></li> <li><a href=\"#\" class=\"page\">5</a></li><li><a href=\"#\" class=\"page\">Next</a></li></ul>";
							$("#questionJava").next().remove();
							$("#questionJava").after(pageList);
						});//事件结束的符号
	});//整体结束的符号
</script>
</head>

<body>
	<!-- 引入header.jsp -->

	<jsp:include page="/admin/publicBoard/header.jsp"></jsp:include>
	<div id="outer" class="clearfix">

		<div id="left" style="float: left; margin-left: 100px;">

			<ul id="lul"
				style="position: fixed; top: 0px; width: 150px; height: 600px; z-index: 0; padding-top: 60px; padding-left: 10px; margin-top: 70px;">
				<li>
					<button type="button" class="btn btn-success sub">java</button>
				</li>

				<li>
					<button type="button" class="btn btn-success sub">html</button>
				</li>

				<li>
					<button type="button" class="btn btn-success sub">javaScript</button>
				</li>

				<li>
					<button type="button" class="btn btn-success sub">python</button>
				</li>

			</ul>

		</div>

		<div id="right" style="float: left; margin-left: 200px;">

			<ol class="clearfix" style="width: 600px; background-color: #EDEDED;">
				<li id="type" style="color: gray; text-align: center;">java</li>
				<li><a
					href="${pageContext.request.contextPath }/admin/questionBoard/addQuestion.jsp">贡献新题</a></li>
			</ol>

			<div id="questionJava"></div>
			<%-- <jsp:include page="/admin/questionBoard/splitPage.jsp"></jsp:include> --%>
		</div>

	</div>

	<!-- 引入footer.jsp -->
	<jsp:include page="/admin/publicBoard/footer.jsp"></jsp:include>


</body>
</html>