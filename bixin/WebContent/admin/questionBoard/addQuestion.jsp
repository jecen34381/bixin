<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>添加问题</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"
	type="text/javascript" charset="utf-8"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/messages_zh.min.js"></script>
<style type="text/css">
html, body {
	background-image: url("/bixin/img/bg.gif");
}

#signupForm label.error {
	color: Red;
	font-size: 20px;
	margin-left: 5px;
	padding-left: 16px;
}
</style>
<script type="text/javascript">
	$(function() {
		$("#signupForm").validate({
			rules : {
				questionName : {
					required : true,
				},
				questionAnswer : {
					required : true,
				},
				questionAuthor : {
					required : true,
				},
			},
			messages : {
				questionName : {
					required : "请输入问题名",
				},
				questionAnswer : {
					required : "请输入问题答案",
				},
				questionAuthor : {
					required : "请输入问题作者",
				},
			}
		});
		$("#questionName").blur(function() {
			$.get("/bixin/addQuestionServlet", {
				qtitle : $("#questionName").val(),
				op : "checkExists"
			}, function(msg) {
				$("#exists").html(msg);
			});
		});
	});
</script>
</head>

<body>
	<jsp:include page="/admin/publicBoard/header.jsp"></jsp:include>
	<div id="outer" class="clearfix">
		<div id="questionAdd"
			style="width: 800px; margin: 0 auto; margin-top: 100px">
			<h2 style="text-align: center;">添加问题</h2>
			<form action="${pageContext.request.contextPath }/addQuestionServlet" method="post" id="signupForm"
				class="form-horizontal">
				<input type="hidden" name="op" value="addQuestion" />
				<div class="form-group" style="margin-left: 100px; width: 600px;">
					<label for="questionName" class="col-sm-2 control-label">问题名</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="questionName"
							id="questionName" placeholder="问题名"> <label id="exists"
							style="color: red"></label>
					</div>
				</div>

				<div class="form-group" style="margin-left: 100px; width: 600px;">
					<label for="questionAnswer" class="col-sm-2 control-label">问题答案</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="questionAnswer"
							id="questionAnswer" placeholder="答案">
					</div>
				</div>

				<div class="form-group" style="margin-left: 100px; width: 600px;">
					<label for="questionAuthor" class="col-sm-2 control-label">作者</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="questionAuthor"
							id="questionAuthor" placeholder="作者">
					</div>
				</div>

				<div class="form-group" style="margin-left: 100px; width: 600px;">
					<label for="questionType" class="col-sm-2 control-label">问题类型</label>
					<div class="col-sm-10">
						<input type="radio" name="type" id="java" checked="checked"
							value="1"><label for="java">java</label>&nbsp;&nbsp;&nbsp;
						<input type="radio" name="type" id="html" value="2"><label
							for="html">html</label>&nbsp;&nbsp;&nbsp; <input type="radio"
							name="type" id="javaScript" value="3"><label
							for="javaScript">javaScript</label>&nbsp;&nbsp;&nbsp; <input
							type="radio" name="type" id="python" value="4"><label
							for="python">python</label>&nbsp;&nbsp;&nbsp;
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" id="sbt" style="margin-left: 200px;"
							class="btn btn-default">提交问题</button>
					</div>
				</div>
			</form>
		</div>
	</div>

	<div style="position:absolute;bottom:0;">
		<!-- 引入footer.jsp -->
		<jsp:include page="/admin/publicBoard/footer.jsp"></jsp:include>
	</div>
</body>

</html>