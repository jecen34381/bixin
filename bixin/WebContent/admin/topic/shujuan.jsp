<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<style type="text/css">
*{margin:0;padding:0;list-style-type:none;}
body{background:url(/bixin/img/bg.gif);}
a,img{border:none;}

.zx_slider{position:relative;margin:40px auto 0 auto;width:1002px;height:350px;overflow:hidden;border-radius:5px;}
.zx_slider .imgbox{width:3750px;height:310px;position:absolute;left:5px;top:4px;}
.zx_slider .imgbox img{float:left;width:750px;height:310px;}
.zx_slider .png{width:1002px;height:350px;left:0px;top:0px;position:absolute;background:url(/bixin/img/slider_bg.png);_background:none;filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src="/bixin/img/slider_bg.png");}
.zx_slider .lbtn{cursor:pointer;width:45px;height:55px;position:absolute;left:0px;bottom:-3px;background:url(/bixin/img/slider_l_btn.png);_background:none;filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src="/bixin/img/slider_l_btn.png");}
.zx_slider .rbtn{cursor:pointer;width:45px;height:55px;position:absolute;left:718px;bottom:-3px;background:url(/bixin/img/slider_r_btn.png);_background:none;filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src="/bixin/img/slider_r_btn.png");}
.zx_slider .btnbox{width:750px;height:60px;position:absolute;left:30px;bottom:0px;}
.zx_slider .btnbox a{cursor:pointer;display:inline-block;float:left;width:126px;height:54px;margin:0 0 0 10px;}
.zx_slider .btnbox a img{position:relative;display:inline;width:120px;height:48px;float:left;border:3px solid #392101;border-radius:2px;}
.zx_slider .btnbox a .img_hover{border:3px solid #e4471f;border-radius:2px;}
.zx_slider .slider_p{overflow:hidden;width:220px;height:290px;position:absolute;right:15px;top:15px;}
.zx_slider .slider_p h3{margin:20px 0 10px 0;font-size:20px;text-align:center;color:#faa629;}
.zx_slider .slider_p p{line-height:26px;font-size:14px;color:#faa629;}
.hi_btn{width:740px;height:330px;position:absolute;left:0px;top:0px;display:block;}
</style>
<div class="zx_slider">

    <div class="imgbox">
        <img alt="Danx" src="${pageContext.request.contextPath }/img/danx1.jpg" width="750" height="310" />
        <img alt="Danx" src="${pageContext.request.contextPath }/img/danx2.jpg" width="750" height="310" />
        <img alt="Danx" src="${pageContext.request.contextPath }/img/danx3.jpg" width="750" height="310" />
        <img alt="Danx" src="${pageContext.request.contextPath }/img/danx4.jpg" width="750" height="310" />
        <img alt="Danx" src="${pageContext.request.contextPath }/img/danx5.jpg" width="750" height="310" />
    </div>
	
    <div class="png"></div>
	
    <a href="#" id="hi_btn0" class="hi_btn"></a>
    <a href="#" id="hi_btn1" class="hi_btn"></a>
    <a href="#" id="hi_btn2" class="hi_btn"></a>
    <a href="#" id="hi_btn3" class="hi_btn"></a>
    <a href="#" id="hi_btn4" class="hi_btn"></a>
	
    <div class="btnbox">
        <a onmouseover="btn_m_over(0)"><img alt="Danx" id="btn_img0" class="thumb img_hover" src="${pageContext.request.contextPath }/img/danx1.jpg" /></a>
        <a onmouseover="btn_m_over(1)"><img alt="Danx" id="btn_img1" class="thumb" src="${pageContext.request.contextPath }/img/danx2.jpg" /></a>
        <a onmouseover="btn_m_over(2)"><img alt="Danx" id="btn_img2" class="thumb" src="${pageContext.request.contextPath }/img/danx3.jpg" /></a>
        <a onmouseover="btn_m_over(3)"><img alt="Danx" id="btn_img3" class="thumb" src="${pageContext.request.contextPath }/img/danx4.jpg" /></a>
        <a onmouseover="btn_m_over(4)"><img alt="Danx" id="btn_img4" class="thumb" src="${pageContext.request.contextPath }/img/danx5.jpg" /></a>
    </div>
	
    <div class="lbtn"></div>
    <div class="rbtn"></div>
	
    <div class="slider_p">
	
        <div id="slider_p0" class="slider_p_div">
			<h3>标题1</h3>
			<p>百度（Nasdaq简称：BIDU）是全球最大的中文搜索引擎，2000年1月由李彦宏、徐勇两人创立于北京中关村，致力于向人们提供“简单，可依赖”的信息获取方式。“百度”二字源于中国宋朝词人辛弃疾的《青玉案·元夕》词句“众里寻他千百度”，象征着百度对中文信息检索技术的执著追求。</p>
        </div>
		
        <div id="slider_p1" class="slider_p_div">
			<h3>标题2</h3>
			<p>2000年1月由李彦宏、徐勇两人创立于北京中关村，致力于向人们提供“简单，可依赖”的信息获取方式。“百度”二字源于中国宋朝词人辛弃疾的《青玉案·元夕》词句“众里寻他千百度”，象征着百度对中文信息检索技术的执著追求。</p>
        </div>
		
        <div id="slider_p2" class="slider_p_div">
			<h3>标题3</h3>
			<p>致力于向人们提供“简单，可依赖”的信息获取方式。“百度”二字源于中国宋朝词人辛弃疾的《青玉案·元夕》词句“众里寻他千百度”，象征着百度对中文信息检索技术的</p>
        </div>
		
        <div id="slider_p3" class="slider_p_div">
			<h3>标题4</h3>
			<p>您到卡上黑暗圣经卡萨丁</p>
        </div>
		
        <div id="slider_p4" class="slider_p_div">
			<h3>标题5</h3>
			<p>打考勤卡和饭来欺骗卡号发</p>
        </div>
		
    </div>
	
</div><!--zx_slider end-->


<script type="text/javascript">
var slider_count=4;
$(".slider_p_div").hide();
$("#slider_p0").show();
$(".hi_btn").hide();
$("#hi_btn0").show();
$(".img_hover").animate({bottom:'10px'});
var slider_i=1;
var m_over=true;

function zx_slider(){
	if(m_over){
		if(slider_i<0){slider_i=slider_count;}
		//p
		$(".slider_p_div").hide();
		$("#slider_p"+slider_i).show();
		//p end
		//hi_btn
		$(".hi_btn").hide();
		$("#hi_btn"+slider_i).show();
		//hi_btn end
		//btn
		$(".btnbox img").stop(true,true);
		$(".btnbox img").removeClass("img_hover");
		$(".btnbox img").animate({bottom:'0px'},200);
		$("#btn_img"+slider_i).addClass("img_hover");
		$("#btn_img"+slider_i).animate({bottom:'10px'},200);
		//btn end
		$(".imgbox").stop();
		$(".imgbox").animate({left:'-750'*slider_i+'px'});
		if(slider_i<slider_count){
			slider_i++;	
		}else{
			slider_i=0;
		}
	}
}

$(".lbtn").click(function(){
	m_over=true;
	if(slider_i==0){slider_i=slider_count-1}else{slider_i=slider_i-2;}
	zx_slider();
	m_over=false;
});

$(".rbtn").click(function(){
	m_over=true;
	zx_slider();
	m_over=false;
});

function btn_m_over(btn_i){
	if(slider_i-1!=btn_i){
		m_over=true;
		slider_i=btn_i;
		zx_slider();
		m_over=false;
	}
}

zx_timer=setInterval("zx_slider();",5000); 
$(".zx_slider").mouseover(function(){
	m_over=false;
});
$(".zx_slider").mouseout(function(){
	m_over=true;
});
</script>

<div style="text-align:center;clear:both">
<script src="/gg_bd_ad_720x90.js" type="text/javascript"></script>
<script src="/follow.js" type="text/javascript"></script>
</div>
