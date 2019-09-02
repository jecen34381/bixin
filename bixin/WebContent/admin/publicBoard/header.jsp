<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!-- 登录 注册 购物车... -->

<script type="text/javascript">
	$(function() {
		$("#dropQuestion").mouseenter(function() {
			$("#dropQuestionWill").css("display", "block");
			console.log("enter");
		}).mouseleave(function() {
			$("#dropQuestionWill").css("display", "none");
			console.log("leave");
		});
		$("#dropStudy").mouseenter(function() {
			$("#dropStudyWill").css("display", "block");
			console.log("enter");
		}).mouseleave(function() {
			$("#dropStudyWill").css("display", "none");
			console.log("leave");
		});
		var logined = $("#logined").text();
		if(logined != ""){
			$(".loginendhidden").css("display","none");
			$(".ejectloginend").css("display","block");
			$("#logined").text("个人中心");
		}else{
			$(".loginendhidden").css("display","block");
			$(".ejectloginend").css("display","none");
		}
		
		$("#loginForm").submit(function(){
			
			/* $("#gologin").css("display","none"); */
			/* $("#gologin").attr("disabled",true); */
		});
	});
</script>

<nav class="navbar navbar-default" style="z-index:2;">

	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#"><img src=""> </a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="${pageContext.request.contextPath }/admin/user/main.jsp">首页<span class="sr-only">(current)</span></a></li>

				<li class="dropdown"  id="dropQuestion"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown" role="button"
					aria-haspopup="true" aria-expanded="false">题库<span
						class="caret"></span></a>
					<ul class="dropdown-menu" id="dropQuestionWill">
						<li><a href="${pageContext.request.contextPath }/admin/questionBoard/showQuestion.jsp">在线刷题</a></li>
						<li><a href="#">公司练习</a></li>
						<li><a href="#">真题练习</a></li>

					</ul></li>
				<li class="dropdown" id="dropStudy"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown" role="button"
					aria-haspopup="true" aria-expanded="false">学习<span
						class="caret"></span></a>
					<ul class="dropdown-menu" id="dropStudyWill">
						<li><a href="${pageContext.request.contextPath }/productServlet">书城</a></li>
						<li><a href="http://192.168.31.119:8080/Noval/novel">图书馆</a></li>

					</ul></li>
				<li class="active"><a href="${pageContext.request.contextPath }/admin/topic/topicboard.jsp">讨论区<span class="sr-only">(current)</span></a></li>
			</ul>
			<!-- <form class="navbar-form navbar-left">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Search">
				</div>
				<button type="submit" class="btn btn-default" style="color:#555">Submit</button>
			</form> -->
			<ul class="nav navbar-nav navbar-right">
				<% 
					String status = (String)request.getAttribute("uid");
					
				%>
				<li class="loginendhidden" style="display:block;"><a href="${pageContext.request.contextPath }/admin/user/register.jsp">注册</a></li>
				<li  class="loginendhidden" style="display:block;"><a href="${pageContext.request.contextPath }/admin/user/login.jsp">登录</a></li>
				<li  class="ejectloginend" style="display:none;"><a href="${pageContext.request.contextPath }/ejectLogin">注销</a></li>
				<li><a href="${pageContext.request.contextPath }/personCenterServlet" id="logined">${uid }</a></li>
				<!-- <li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">Dropdown <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">Action</a></li>
						<li><a href="#">Another action</a></li>
						<li><a href="#">Something else here</a></li>
						<li role="separator" class="divider"></li>
						<li><a href="#">Separated link</a></li>
					</ul></li> -->
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid -->
</nav>

