<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
	.logoWrap{
		width: 100%;
		margin:30px 0 50px 0;
	}
	.logoWrap > a > img{
		width: 100%;
	}
	.menuWrap{
		width: 99%;
		margin: 0 auto;
	}
	.menuWrap > ul{
		margin-left: 35px;
	}
	.menuWrap > ul > li{
		width: 100%;
		text-align: left;
		margin-bottom: 40px;
		position: relative;
	}
	.menuBg{
		display: none;
	}
	.menuWrap > ul > li > a{
		font-size: 18px;
		font-weight: bold;
		font-family: sans-serif;
	}
	.menuWrap > ul > li:nth-child(2):hover > .headerSubMenu{
		display: block;
	}
	.headerSubMenu{
		display: none;
		margin-top: 24px;
	}
	.headerSubMenu > ul{
		maring-left: 13px;
	}
	.headerSubMenu > ul > li{
		font-size: 15px;
		text-align: left;
		background: #fff;
		padding: 10px 5px 10px 10px;
		border-radius: 5px;
	}
	.headerSubMenu > ul > li:hover{
		background: #7d93a8;
	}
	.headerSubMenu > ul > li:hover > a{
		color: #fff;
	}
	.headerSubMenu > ul > li > a{
		
	}
</style>
<script>
function get_BuildingByMno(mno){
	var dt;
	$.ajax({
		url:"${pageContext.request.contextPath}/getBuildingByMno/"+mno,
		type:"get",
		async:false,
		dataType:"json",
		success:function(json){
			dt = json;
		},
		error:function(request,status,error){
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
	return dt;
}

function draw_managementBui_subMenu(){
	var mno = $("#seMno").val();
	var buiList = get_BuildingByMno(mno);
	var str = ""; 
	
	$(buiList).each(function(){
		str += "<li><a href='${pageContext.request.contextPath}/mBuiInfo/"+this.bno+"'>- "+this.bname+"</a></li>";
	});

	$(".headerSubMenu > ul").append(str);
	
}

$(function(){
	var raHeight = $(".rightAside").css("height");
	$(".leftAside").css("height",raHeight);
});
</script>
<div class="logoWrap">
	<a href="${pageContext.request.contextPath}/mMain"><img src="${pageContext.request.contextPath}/resources/images/logotest.png"></a>
</div>
<div class="menuWrap">
	<ul>
		<li><a href="${pageContext.request.contextPath}/mBuiReg">신규건물추가</a><img class="menuBg" src="${pageContext.request.contextPath}/resources/images/menuBg.png"></li>
		<li>
			<a href="">관리건물 ▼</a>
			<img class="menuBg" src="${pageContext.request.contextPath}/resources/images/menuBg.png">
			<div class="headerSubMenu">
				<ul>
					
				</ul>
			</div>
			
		</li>
		<li><a href="${pageContext.request.contextPath}/emptyRoomInfo">공실정보</a><img class="menuBg" src="${pageContext.request.contextPath}/resources/images/menuBg.png"></li>
		<li><a href="${pageContext.request.contextPath}/repairCompany">수리/시공</a><img class="menuBg" src="${pageContext.request.contextPath}/resources/images/menuBg.png"></li>
		<li><a href="${pageContext.request.contextPath}/tradeInfo">건물매매</a><img class="menuBg" src="${pageContext.request.contextPath}/resources/images/menuBg.png"></li>
	</ul>
</div>