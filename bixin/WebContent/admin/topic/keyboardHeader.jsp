<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
<meta charset="UTF-8">
<style type="text/css">
	body{ background: #000;}
	textarea{ display:block;width:880px; height: 100px; margin: 10px auto; font-size: 16px; color:#fff; background: #555;}
	.keyboard{ width:100%; margin: 10px auto;}
</style>

<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/keyboard.min.js"></script>



<div class="keyboard"></div>
<script type="text/javascript">
	//$('textarea').focus();
	$('.keyboard').keyboard({audio:'${pageContext.request.contextPath }/music/keydown.mp3'});
</script>

<div style="text-align:center;clear:both">
<script src="/gg_bd_ad_720x90.js" type="text/javascript"></script>
<script src="/follow.js" type="text/javascript"></script>
</div>

