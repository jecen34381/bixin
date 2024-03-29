/**
 * 
 */
$.validator.addMethod(
		"checkUserName",
		function(Value,element,params){
			var flag = true;
			
			$.ajax({
				"async":false,
				"url":"${pageContext.request.contextPath}/VerifyServlet",
				"type":"POST",
				"data":{"username":Value},
				"dataType":"json",
				"success":function(data){
					flag = data.isExist;
					console.log(flag);
				}
			});
			return !flag;
		}
	);
	$(function(){
		$("#validateform").validate({
			
			"rules":{
				"userName":{
					"required":true,
					"checkUserName":true,
					"max":5,
					"min":1
				},
				"password":{
					"required":true,
					"max":10,
					"min":5
				},
				"email":{
					"required":true,
				},
				"name":{
					"required":true,
				},
				"telephone":{
					"required":true,
				},
				"sex":{
					"required":true,
				},
				"birthday":{
					"required":true,
				},
				"verifyCode":{
					"required":true,
				}
			},
			"messages":{
				"userName":{
					"required":"用户名必须填写",
					"checkUserName":"用户名已被注册",
					"max":"用户名不能超过5",
					"min":"用户名不能小于1"
				},
				"password":{
					"required":"密码是必填项",
					"max":"密码长度不能超过10",
					"min":"密码不能短于5"
				},
				"email":{
					"required":"邮箱是必填项",
				},
				"name":{
					"required":"姓名是必填项",
				},
				"telephone":{
					"required":"手机是必填项",
				},
				"sex":{
					"required":"用户名必须填写",
				},
				"birthday":{
					"required":"性别是必填项",
				},
				"verifyCode":{
					"required":"验证码是必填项",
				}
			}
		});
	});
	