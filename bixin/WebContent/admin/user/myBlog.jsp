<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>我的博客</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/base.css" />

<script src="${pageContext.request.contextPath }/js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap.min.js" type="text/javascript"></script>
<style type="text/css">
/*#outer div {
				float: left;
			}
			*/
html, body {background-color:#F8F8FF;background:url(/bixin/img/bg.gif);}

#outer {
	/* height: 600px; */
	width: 1160px;
	margin-left: auto;
	margin-right: auto;
	margin-top: 60px;
	
}

#left p {
	height: 30px;
	font-size: 18px;
	margin-top: 20px;
	text-align:center;
	margin: 0 auto;
	line:height:30px;
	display:block;
}

#xuanxiangka li {
	font-size: 18px;
	margin-top: 30px;
	margin-left: 35px;
	float: left;
	border: 1px;
}

#middle p {
	float: left;
	margin-left: 30px;
	margin-top: 18px;
}

#middle {
	height: 50px;
	width: 900px;
	margin-top: 20px;
	margin-left: 30px;
	border: 1px solid rgba(200, 200, 200, 0.5);
}
#left a {text-decoration:none;text-align:center;}
#topicEditor:hover {color:white;}
#articleMana a:hover {color:white;}
#commentMana a:hover {color:white;}
</style>
<script type="text/javascript">
	$(function() {
		//$("#edit").css({"background-color":"#","color":"#"});
		$("#edit").mouseenter(function() {
			$("#edit").css({
				"background-color" : "gray",
				"color" : "#yellow"
			});
		}).mouseleave(function() {
			$("#edit").css({
				"background-color" : "#FFFFFF",
				"color" : "#929292"
			});
		});
		$("#articleMana").mouseenter(function() {
			$("#articleMana").css({
				"background-color" : "gray",
				"color" : "#yellow"
			});
		}).mouseleave(function() {
			$("#articleMana").css({
				"background-color" : "#FFFFFF",
				"color" : "#929292"
			});
		});
		$("#commentMana").mouseenter(function() {
			$("#commentMana").css({
				"background-color" : "gray",
				"color" : "#yellow"
			});
		}).mouseleave(function() {
			$("#commentMana").css({
				"background-color" : "#FFFFFF",
				"color" : "#929292"
			});
		});
		$(function(){
			$(".publishTopic").click(function(){
				var topicId = $(this).val();
				$.ajax({
					"async":true,
					"url":"/bixin/topic.do",
					"data":{"topicId":topicId,"option":"publish","function":"publishAndDelete"},
					"success":function(data){
						alert(data);
						window.location.reload();
					}
				});
			});
		});
		$(function(){
			$(".deleteTopic").click(function(){
				var topicId = $(this).val();
				$.ajax({
					"async":true,
					"url":"/bixin/topic.do",
					"data":{"topicId":topicId,"option":"delete","function":"publishAndDelete"},
					"success":function(data){
						alert(data);
						window.location.reload();
					}
				});
			});
		});
		$(function(){
			$(".blogCategory").click(function(){
				var method = $(this).text();
				console.log(method);
				$("#contentList ul").empty();
				$.ajax({
					"async":true,
					"url":"/bixin/topic.do",
					"type":"POST",
					"dataType":"JSON",
					"data":{"method":method,"function":"getMyTopic"},
					"success":function(data){
						
						$.each(data,function(index,element){
							var title = "";
							var topicId = "";
							var content = "";
							var uid = "";
							$.each(element,function(i,e){
								
								if(i == "title"){
									title = title + "<li><div class=\"media\" style=\"background-color:#FCFCFC;\"><div class=\"media-body\" style=\"border: 1px solid #FCFCFC;height: 100px;position:relative;\"><div class=\"clearfix\"><b>标题："+e+"</b>";
								}
								if(i == "topicId"){
									topicId = topicId + "<a href=\"${pageContext.request.contextPath }/myTopicList\" style=\"display:black;float:right;margin-right:10px;\">刷新</a><button class=\"publishTopic\" value=\""+e+"\" style=\"float:right;margin-right:10px;\">发布</button><button class=\"deleteTopic\" value=\""+ e +"\" style=\"float:right;margin-right:10px;\">删除</button></div>";
								}
								if(i == "content"){
									content = content + "<div>"+ e +"</div>";
								}
								if(i == "uid"){
									uid = uid + "<div style=\"position:relative;bottom:0;\"><b>作者:(-_-)</b> <b>点赞</b> <b>浏览量</b></div></div></div></li>";
								}
							});
							$("#contentList ul").append(title + topicId + content + uid + "<hr/>");
						});
					}
				});
			});
		});
	});
</script>
</head>

<body>
	<!-- 引入header.jsp -->

	<jsp:include page="/admin/publicBoard/header.jsp"></jsp:include>
	<div id="outer" class="outer clearfix">

		<div id="left"
			style="width: 120px; height: 600px; background-color: #FCFCFC; border: 1px solid rgba(200, 200, 200, 0.5); float: left;">
			<p id="edit">
				<a href="${pageContext.request.contextPath }/admin/topic/bbs_topic.jsp" id="topicEditor">文章编辑器</a>
			</p>
			<hr style="border: 1px solid rgba(200, 200, 200, 0.5);" />
			<p id="articleMana">
				<a href="#">文章管理</a>
			</p>
			<p id="commentMana">
				<a href="# ">评论管理</a>
			</p>
		</div>
		<div style="float: right; margin-left: 20px; width: 1000px;">
			<div id="right " style="background-color: #FCFCFC;">
				<ul class="clearfix " id="xuanxiangka">
					<li><a class="blogCategory" href="#">全部</a></li>
					<li><a class="blogCategory" href="#">公开</a></li>
					<li><a class="blogCategory" href="#">私密</a></li>
					<li><a class="blogCategory" href="#">审核</a></li>
					<li><a class="blogCategory" href="#">草稿箱</a></li>
					<li><img src="img/grabage.jpg" style="width: 20px;" /><a
						href="#">回收站</a></li>
				</ul>

				<div id="middle" class="clearfix">
					<p>
						<select
							style="display: block; width: 60px; border: 1px solid rgba(200, 200, 200, 0.5);">
							<option>年</option>
						</select>
					</p>

					<p>
						<select
							style="display: block; width: 60px; border: 1px solid rgba(200, 200, 200, 0.5);">
							<option>月</option>
						</select>
					</p>

					<p>
						<select
							style="display: block; width: 90px; border: 1px solid rgba(200, 200, 200, 0.5);">
							<option>文章类型</option>
						</select>
					</p>

					<p>
						<select
							style="display: block; width: 120px; border: 1px solid rgba(200, 200, 200, 0.5);">
							<option>个人分类</option>
						</select>
					</p>

					<p>
						<input type="text" placeholder="请输入标题关键词"
							style="border: 1px solid rgba(200, 200, 200, 0.5);" />
					</p>

					<p>
						<input type="button" value="搜索"
							style="background-color: #CA0C16; border: 1px solid rgba(200, 200, 200, 0.5);" />
					</p>
				</div>

			</div>
			<div id="contentList" style="margin-top:10px;">
				<ul>
					<c:forEach items="${topics }" var="topic">
						<li>
							<div class="media" style="background-color:#FCFCFC;">

								<div class="media-body" style="border: 3px solid #FCFCFC;position:relative;">
									<div class="clearfix">
										<b>标题：${topic.title }</b>
										<a href="${pageContext.request.contextPath }/myTopicList" style="display:black;float:right;margin-right:10px;">刷新</a>
										<button class="publishTopic" value="${topic.topicId }" style="float:right;margin-right:10px;">发布</button>
										<button class="deleteTopic" value="${topic.topicId}" style="float:right;margin-right:10px;">删除</button>
										
									</div>
									<div>${topic.content }</div>
									<div style="position:relative;bottom:0;">
										<b>作者(-_-)</b> <b>点赞</b> <b>浏览量</b>
									</div>
								</div>

							</div>
							
						</li>
						<hr/>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>

	<!-- 引入footer.jsp -->
	<jsp:include page="/admin/publicBoard/footer.jsp"></jsp:include>
</body>
</html>