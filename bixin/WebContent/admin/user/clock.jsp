<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<meta charset="UTF-8">
<style type="text/css">
  html, body {height:100%;}

  body {
	background: #f2afd0; /* Old browsers */
	background: -moz-linear-gradient(-45deg, #f2afd0 0%, #ec91bc 50%, #aad8f0 50%, #aad8f0 50%, #88caec 100%); /* FF3.6+ */
	background: -webkit-gradient(linear, left top, right bottom, color-stop(0%,#f2afd0), color-stop(50%,#ec91bc), color-stop(50%,#aad8f0), color-stop(50%,#aad8f0), color-stop(100%,#88caec)); /* Chrome,Safari4+ */
	background: -webkit-linear-gradient(-45deg, #f2afd0 0%,#ec91bc 50%,#aad8f0 50%,#aad8f0 50%,#88caec 100%); /* Chrome10+,Safari5.1+ */
	background: -o-linear-gradient(-45deg, #f2afd0 0%,#ec91bc 50%,#aad8f0 50%,#aad8f0 50%,#88caec 100%); /* Opera 11.10+ */  
	background: -ms-linear-gradient(-45deg, #f2afd0 0%,#ec91bc 50%,#aad8f0 50%,#aad8f0 50%,#88caec 100%); /* IE10+ */
	background: linear-gradient(135deg, #f2afd0 0%,#ec91bc 50%,#aad8f0 50%,#aad8f0 50%,#88caec 100%); /* W3C */
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#f2afd0', endColorstr='#88caec',GradientType=1 ); /* IE6-9 fallback on horizontal gradient */
	font-family: 'Comfortaa', cursive;
  }
  
  #clock {
	height: 460px;
	position: relative;
	width: 460px;
	margin:10% auto;
	border-radius:50%;
	box-shadow:25px 40px 100px rgba(2, 2, 2, 0.7);
  }
  
  #clock div {
	position: absolute;
	left:50%;
  }
  
  #clock img[src*="second"] {
	transition: transform 600000s linear 1s;
  }
  
  #clock:target img[src*="second"] {
	transform: rotate(3600000deg);
  }
  
  #clock img[src*="minute"] {
	transition: transform 360000s linear 0s;
  }
  
  #clock:target img[src*="minute"] {
	transform: rotate(36000deg);
  }
  
  #clock img[src*="hour"] {
	transition: transform 216000s linear 0s;
  }
  
  #clock:target img[src*="hour"] {
	transform: rotate(360deg);
  }

		.clock1 {
	background:#383838 url("/bixin/clockImage/clock1.png") no-repeat;
  } 

		.clock2 {
	background:#383838 url("/bixin/clockImage/clock2.png") no-repeat;
  } 

		.clock3 {
	background:#383838 url("/bixin/clockImage/clock3.png") no-repeat;
  } 

		.clock4 {
	background:#383838 url("/bixin/clockImage/clock4.png") no-repeat;
  } 

		.clock5 {
	background:#383838 url("/bixin/clockImage/clock5.png") no-repeat;
  } 

		.clock6 {
	background:#383838 url("/bixin/clockImage/clock6.png") no-repeat;
  } 

		.clock7 {
	background:#383838 url("/bixin/clockImage/clock7.png") no-repeat;      } 

		.clock8 {
	background:#383838 url("/bixin/clockImage/clock8.png") no-repeat;
  } 

		.clock9 {
	background:#383838 url("/bixin/clockImage/clock9.png") no-repeat;
  } 

		.clock10 {
	background:#383838 url("/bixin/clockImage/clock10.png") no-repeat;
  } 

		.clock11 {
	background:#383838 url("/bixin/clockImage/clock11.png") no-repeat;
  } 

		.clock12 {
	background:#383838 url("/bixin/clockImage/clock12.png") no-repeat;
  } 

		.clock13 {
	background:#383838 url("/bixin/clockImage/clock1.png") no-repeat;
  } 

		.clock14 {
	background:#383838 url("/bixin/clockImage/clock2.png") no-repeat;
  } 

		.clock15 {
	background:#383838 url("/bixin/clockImage/clock3.png") no-repeat;
  } 

		.clock16 {
	background:#383838 url("/bixin/clockImage/clock4.png") no-repeat;
  } 

		.clock17 {
	background:#383838 url("/bixin/clockImage/clock5.png") no-repeat;
  } 

		.clock18 {
	background:#383838 url("/bixin/clockImage/clock6.png") no-repeat;
  } 

		.clock19 {
	background:#383838 url("/bixin/clockImage/clock7.png") no-repeat;      } 

		.clock20 {
	background:#383838 url("/bixin/clockImage/clock8.png") no-repeat;
  } 

		.clock21 {
	background:#383838 url("/bixin/clockImage/clock9.png") no-repeat;
  } 

		.clock22 {
	background:#383838 url("/bixin/clockImage/clock10.png") no-repeat;
  } 

		.clock23 {
	background:#383838 url("/bixin/clockImage/clock11.png") no-repeat;
  } 

		.clock0 {
	background:#383838 url("/bixin/clockImage/clock12.png") no-repeat;
  } 

</style>
<div id="clock">
  <div id="hour" style="transform: rotate(56deg);"><img src="${pageContext.request.contextPath }/clockImage/hour.png"></div>
  <div id="minute" style="transform: rotate(312deg);"><img src="${pageContext.request.contextPath }/clockImage/minute.png"></div>
  <div id="second" style="transform: rotate(6deg);"><img src="${pageContext.request.contextPath }/clockImage/second.png"></div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.7.2.min.js"></script> 
<script type="text/javascript">
function Clock_dg(prop) {
	var angle = 360/60,
		date = new Date();
		var h = date.getHours();
		if(h > 12) {
			h = h - 12;
		}
	
		hour = h;
		minute = date.getMinutes(),
		second = date.getSeconds(),
		hourAngle = (360 / 12) * hour + (360 / (12*60)) * minute;
	
		$('#minute')[0].style[prop] = 'rotate('+angle * minute+'deg)';
		$('#second')[0].style[prop] = 'rotate('+angle * second+'deg)';
		$('#hour')[0].style[prop] = 'rotate('+hourAngle+'deg)';
			  $('#clock').addClass('clock'+h);
}
	

$(function(){        
	var props = 'transform WebkitTransform MozTransform OTransform msTransform'.split(' '),
		prop,
		el = document.createElement('div');
	
	for(var i = 0, l = props.length; i < l; i++) {
		if(typeof el.style[props[i]] !== "undefined") {
			prop = props[i];
			break;
		}
	}
	setInterval(function(){
		Clock_dg(prop)
	},100);
});
</script>

<div style="text-align:center;clear:both">
<script src="/gg_bd_ad_720x90.js" type="text/javascript"></script>
<script src="/follow.js" type="text/javascript"></script>
</div>
