<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>文章编辑</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/bootstrap.min.css"
	type="text/css" />
<script
	src="${pageContext.request.contextPath }/js/jquery-1.11.3.min.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/wangEditor.min.js"></script>
<style type="text/css">
html, body {
	width: 100%;
	height: 50%;
}

#editContent {
	width: 80%;
	background-color: #E6E6FA;
	margin: 0 auto;
	border-radius:30px;
}

#topicContent {
	border-top: 5px;
	border-radius: 10px;
}
</style>
<script type="text/javascript">
	$(function() {
		var E = window.wangEditor
		var editor = new E('#editor')
		// 或者 var editor = new E( document.getElementById('editor') )
		editor.create()

		$("#submit").click(function() {
			var topicContent = $(".w-e-text").html();
			var title = $("#title").val();
			var type = $("#type").val();
			var url = $("form").attr("action");
			console.log(url);
			$.ajax({
				"async" : false,
				"url" : "/bixin/topic.do",
				"type" : "POST",
				"data" : {
					"topicContent" : topicContent,
					"title" : title,
					"type" : type,
					"function" : "saveTopic"
				},
				"success" : function(data) {
					alert(data);
					if (data == "保存成功") {
						window.location.href = "/bixin/myTopicList";
					} else {

						window.location.reload();
					}

				}
			});
		});

	});
</script>

<!-- <script type="text/javascript">
	var E = window.wangEditor
	var editor = new E('#editor')
	// 或者 var editor = new E( document.getElementById('editor') )
	editor.create()
</script> -->
</head>
<body>
	<!-- 引入header.jsp -->
	<jsp:include page="/admin/publicBoard/header.jsp"></jsp:include>

	<div id="editContent">
		<form action="${pageContext.request.contextPath }/saveTopicServlet"
			method="POST">
			<table border="0" align="center">
				<tr align="center">
					<th>
						<div class="input-group input-group-lg">
							<span class="input-group-addon" id="sizing-addon1">文章标题</span> <input
								type="text" class="form-control" placeholder="title"
								aria-describedby="sizing-addon1" name="title" id="title">
						</div>
					</th>
					<th>类型<select name="type" id="type">
							<option>java</option>
							<option>js</option>
							<option>css</option>
							<option>html</option>
					</select></th>
					<th><input type="button" value="保存"
						style="border-radius: 3px;" id="submit"></th>
				</tr>

				<tr>
					<td colspan="3">
						<!-- <textarea name="topicContent"
							id="topicContent" cols="100%" rows="30"></textarea> -->
						<div id="editor"
							style="width: 720px; height: 333px; border: 2px solid white;">
							<p>请开始你的操作</p>
						</div> <!-- 注意， 只需要引用 JS，无需引用任何 CSS ！！！-->

					</td>
				</tr>
			</table>
		</form>
	</div>
	<div class="bbs_ad_top" align="center">
		<%-- <jsp:include page="/admin/topic/keyboardHeader.jsp"></jsp:include> --%>
	</div>
	<!-- 引入footer.jsp -->
	<jsp:include page="/admin/publicBoard/footer.jsp"></jsp:include>
</body>
</html>