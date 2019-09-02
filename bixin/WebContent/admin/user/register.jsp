<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css" />
<script src="${pageContext.request.contextPath }/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/messages_zh.min.js"></script>
<style type="text/css">
#outer {
	margin-top: 40px;
}

.form-group {
	width: 600px;
}

#signupForm label.error {
	color: Red;
	font-size: 20px;
	margin-left: 5px;
	padding-left: 16px;
}

#header p {
	float: left;
}
</style>
<script type="text/javascript">
	function check() {
		var ck = document.getElementById("isAgree");
		if (ck.checked) { //选中
			document.getElementById("sbt").disabled = false;
		} else { //没选中
			document.getElementById("sbt").disabled = true;
		}
	}
	$(function() {
		$("#signupForm").validate({
			rules : {
				username : {
					required : true,
					minlength : 6,
					maxlength : 12,
				},
				upass : {
					required : true,
					minlength : 6,
					maxlength : 12,
				},
				confirmPass : {
					required : true,
					minlength : 6,
					equalTo : "#upass",
				},
				names : {
					required : true,
				},
				uemail : {
					required : true,
					email : true,
				},
				checkMa : {
					required : true,
				},
				birth : {
					required : true,
				},
			},
			messages : {
				username : {
					required : "请输入用户名",
					minlength : "用户名必需由六个字母组成",
					maxlength : "用户名的长度不能超过十二位，应在6~12位",
				},
				upass : {
					required : "请输入密码",
					minlength : "密码长度不能小于 6",
					maxlength : "密码的长度不能超过十二位，应在6~12位",
				},
				confirmPass : {
					required : "请输入密码",
					minlength : "密码长度不能小于 6",
					equalTo : "两次密码输入不一致",
				},
				names : {
					names : "请留下你的大名",
				},
				uemail : {
					uemail : "请输入一个正确的邮箱",
				},
				birth : {
					birth : "请输入出生年月",
				},
				checkMa : {
					checkMa : "请输入验证码",
				},
			}
		})
		
		$("#username").focus(function() {
			$("#uname").css("display", "block");
		}).blur(function() {
			$("#uname").css("display", "none");
			$.get(
					"/bixin/registerServlet",
					{username:$("#username").val(),op:"checkUserName"},
					function(msg){
						$("#exists").html(msg);
				});
		});
		$("#upass").focus(function() {
			$("#ups").css("display", "block");
		}).blur(function() {
			$("#ups").css("display", "none");
		});
		$("#confirmPass").focus(function() {
			$("#confirmUps").css("display", "block");
		}).blur(function() {
			$("#confirmUps").css("display", "none");
		});
		$("#uemail").focus(function() {
			$("#uemails").css("display", "block");
		}).blur(function() {
			$("#uemails").css("display", "none");
		});
		$("#names").focus(function() {
			$("#NAME").css("display", "block");
		}).blur(function() {
			$("#NAME").css("display", "none");
		});
		$("#birth").focus(function() {
			$("#day").css("display", "block");
		}).blur(function() {
			$("#day").css("display", "none");
		});
		$("#checkMa").focus(function() {
			$("#ma").css("display", "block");
		}).blur(function() {
			$("#ma").css("display", "none");
		});
	});
</script>
</head>


<body>
	<!-- 引入header.jsp -->

	<jsp:include page="/admin/publicBoard/header.jsp"></jsp:include>
	<div id="header" style="margin-left: 200px; height: 60px;"
		class="clearfix">
		<p>
			<img src="${pageContext.request.contextPath }/img/registerLogo.jpg" width="80px" height="80px" style="border-radius:75px;"/>
		</p>

		<p style="margin-top: 20px; margin-left: 250px;">
			我已注册，现在就<a class="btn btn-default" href="/bixin/admin/user/login.jsp" role="button">登录</a>
		</p>

	</div>
	<div id="outer" style="margin-left: 200px;">
		<form id="signupForm" class="form-horizontal" action="${pageContext.request.contextPath }/registerServlet">
			<input type="hidden" name="op" value="register">
			<div class="form-group">
				<label for="username" class="col-sm-2 control-label">用户名</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="username"
						id="username" placeholder="账号">
					<div id="uname" style="display: none;">Tips:必填项哦 ，长度应在6-12位</div>
					<p id="exists" style="color:red;"></p>
				</div>
			</div>

			<div class="form-group">
				<label for="upass" class="col-sm-2 control-label">密码</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" name="upass" id="upass"
						placeholder="Password">
					<div id="ups" style="display: none;">友情提示:必填项哦 ，长度应在6-12位</div>
				</div>
			</div>

			<div class="form-group">
				<label for="confirmPass" class="col-sm-2 control-label">确认密码</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" id="confirmPass"
						name="confirmPass" placeholder="确认密码">
					<div id="confirmUps" style="display: none;">Tips:两次密码要一样哦</div>
				</div>

			</div>

			<div class="form-group">
				<label for="uemail" class="col-sm-2 control-label">邮箱</label>
				<div class="col-sm-10">
					<input type="email" class="form-control" id="uemail" name="uemail"
						placeholder="Email" value="dao13403978472@163.com">
					<div id="uemails" style="display: none;">温馨提示您：要写一个合法的邮箱哦，例如825782689@qq.com</div>
				</div>
			</div>

			<div class="form-group">
				<label for="names" class="col-sm-2 control-label">姓名</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="names" name="names"
						placeholder="姓名">
					<div id="NAME" style="display: none;">朱绅士提示您，这个也是必填项呢</div>
				</div>
			</div>

			<div class="form-group">
				<label for="birth" class="col-sm-2 control-label">出生日期</label>
				<div class="col-sm-10">
					<input type="date" class="form-control" id="birth" name="birth"
						placeholder="birthday">
					<div id="day" style="display: none;">冒死告知：这个也是必填项</div>
				</div>
			</div>

			<div class="form-group">
				<label for="gender" class="col-sm-2 control-label">性别</label>
				<div class="col-sm-10">
					<input type="radio" name="gender" id="male" checked="checked"
						value="1"><label for="male">男</label>&nbsp;&nbsp;&nbsp; <input
						type="radio" name="gender" id="female" value="2"><label
						for="female">女</label>&nbsp;&nbsp;&nbsp; <input type="radio"
						name="gender" id="baomi" value="3"><label for="baomi">保密</label>
				</div>
			</div>

			<div class="form-group">
				<label for="birth" class="col-sm-2 control-label">条款</label>
				<div class="col-sm-10">
					<textarea class="form-control" readonly>
						你要是不同意就不能注册 我们将在这里获取你的一些基本信息，例如头像，账号等等这里是一些乱七八糟别人都不看的东西，而又不得不同意
					</textarea>
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<div class="checkbox">
						<label> <input type="checkbox" id="isAgree"
							onclick="check()"> 我已阅读并同意《比心条款》
						</label>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" id="sbt" class="btn btn-default"
						disabled="disabled">Sign in</button>
				</div>
			</div>
		</form>
	</div>
	<!-- 引入footer.jsp -->
	<jsp:include page="/admin/publicBoard/footer.jsp"></jsp:include>
</body>
</html>