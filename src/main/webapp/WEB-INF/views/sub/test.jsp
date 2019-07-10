<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/calendar.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/calendar.js"></script>
<style>
	.allWrap{
		width: 100%;
		min-width: 1340px;
		position: relative;
	}
	.popupWrap{
		display: none;
		position: fixed;
		width: 100%;
		height: 100%;
		z-index: 9;
	}
	.popup_bg{
		position: fixed;
		top:0;
		left:0;
		width:100%;
		height:100%;
		background: #111;
		opacity: 0.5;
	}
	
	.leftAside{
		position: absolute;
		top:0;
		left: 0;
		width: 200px;
		box-shadow: 0px 0px 6px 0px gray;
		background: #fff;
		z-index: 5;
	}
	
	.rightAside{
		position: absolute;
		top: 0;
		left:0;
		padding-left:202px;
		width: 100%;
	}
	.raTop{
		width: 100%;
		height: 80px;
		background: #fff;
		box-shadow: 0px 0px 10px 0px gray;
	}
	.raBg{
		position: absolute;
		top: 0;
		left:0;
		width: 100%;
		height: 700px;
		background: #ecf7ff;
		z-index: -1;
	}
	
	
	.sectionWrap{
		width: 100%;
		min-height: 829px;
		clear: both;
		padding: 10px;
	}
	.section{
		width: 1100px;
		margin: 0 auto;
	}
	
</style>
<script>


$(function(){
	
	
	
});
</script>
<style>


</style>
</head>
<body>
	<div class="allWrap">
		<div class="popupWrap">
			<div class="popup_bg"></div>
			
		</div><!-- popupWrap end -->
		<div class="leftAside">
			<jsp:include page="../include/managerMenu.jsp"></jsp:include>
		</div>
		<div class="rightAside">
			<div class="raTop">
				<jsp:include page="../include/managerHeader.jsp"></jsp:include>
			</div>
			<div class="raBg"></div>
			<div class="sectionWrap">
				<div class="section">
					<img alt="" src="${pageContext.request.contextPath}/resources/images/sidoMap.png" usemap="#sidoMap">
					<map id="sidoMap" name="sidoMap">
						<area shape="rect" alt="인천광역시" title="" coords="33,127,69,150" href="" target="" />
						<area shape="rect" alt="서울특별시" title="" coords="91,156,124,175" href="" target="" />
						<area shape="rect" alt="강원도" title="" coords="235,128,282,149" href="" target="" />
						<area shape="rect" alt="경기도" title="" coords="112,192,158,211" href="" target="" />
						<area shape="rect" alt="충청북도" title="" coords="153,263,213,282" href="" target="" />
						<area shape="rect" alt="경상북도" title="" coords="268,312,328,332" href="" target="" />
						<area shape="rect" alt="충청남도" title="" coords="64,312,122,330" href="" target="" />
						<area shape="rect" alt="대전광역시" title="" coords="139,327,165,342" href="" target="" />
						<area shape="rect" alt="전라북도" title="" coords="107,416,167,434" href="" target="" />
						<area shape="rect" alt="대구광역시" title="" coords="281,394,308,409" href="" target="" />
						<area shape="rect" alt="울산광역시" title="" coords="351,444,378,461" href="" target="" />
						<area shape="rect" alt="경상남도" title="" coords="218,467,276,485" href="" target="" />
						<area shape="rect" alt="부산광역시" title="" coords="309,486,336,504" href="" target="" />
						<area shape="rect" alt="광주광역시" title="" coords="94,486,119,502" href="" target="" />
						<area shape="rect" alt="전라남도" title="" coords="83,522,142,541" href="" target="" />
						<area shape="rect" alt="제주특별자치도" title="" coords="333,623,361,640" href="" target="" />
					</map>
				</div><!-- section end -->
			</div><!-- sectionWrap end -->
		</div><!-- rightAside end -->
	</div><!-- allWrap end -->
</body>
</html>