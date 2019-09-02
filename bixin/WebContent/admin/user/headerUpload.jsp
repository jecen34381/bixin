<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
			
</style>
</head>
<body>
	<form action="${pageContext.request.contextPath }/HeaderUploadServlet" method="post" enctype="multipart/form-data">
			选择你的头像文件：<input type="file" name="headerFile" />
			<input type="submit" value="上传"/>
		</form>
		<hr />
</body>
</html>