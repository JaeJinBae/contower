<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
	.header{
		width: 100%;
		min-width: 1100px;
		margin: 0 auto;
		padding: 15px;
		position: absolute;
		top: 0;
	}
	.logoWrap{
		width: 250px;
		/* display: inline-block; */
		float: left;
		vertical-align: middle;
	}
	.logoWrap > a{
		width: 100%;
		display: inline-block;
	} 
	.logoWrap > a > img{
		width: 100%;
	}
	.se{
		display: none;
	}
	.headerBtnWrap{
		float: left;
		margin-left: 20px;
	}
	.headerBtnWrap > ul{
		
	}
	.headerBtnWrap > ul > li{
		float: left;
		width: 100px;
		line-height: 36px;
	}
	.headerBtnWrap > ul > li > p{
		font-size: 16px;
		text-align: center;
	}
	.headerBtnWrap > ul > li > p > a{
		color: #e1e1e1;
	}
	.headerBtnWrap > ul > li > p > a:hover{
		color: #fff;
		font-weight: bold;
	}
	.headerBtnWrap > ul > li:nth-child(3):hover > .headerSubMenu{
		display: block;
	}
	.headerSubMenu{
		display: none;
		margin-top: 19px;
		border: 1px solid lightgray;
	}
	.headerSubMenu > ul{
		
	}
	.headerSubMenu > ul > li{
		font-size: 15px;
		text-align: center;
		border-top: 1px solid lightgray;
		background: #fff;
	}
	.headerSubMenu > ul > li:hover{
		background: #7d93a8;
	}
	.headerSubMenu > ul > li:hover > a{
		color: #fff;
	}
	.headerSubMenu > ul > li > a{
		
	}
	
	.myInfo{
		float: right;
		margin-right: 26px;
	}
	.myInfo > p{
		font-size: 15px;
		color: #e1e1e1;
		text-align: center;
	}
	.myInfo > p > a{
		font-size: 15px;
		color: #e1e1e1;
	}
	.myInfo > p:nth-child(1){
		margin-bottom: 6px;
	}
</style>
<script>
function get_BuildingByOno(ono){
	var dt;
	$.ajax({
		url:"${pageContext.request.contextPath}/owner/getBuildingByOno/"+ono,
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
	var ono = $("#seOno").val();
	var buiList = get_BuildingByOno(ono);
	var str = "";
	
	$(buiList).each(function(){
		str += "<li><a href='${pageContext.request.contextPath}/owner/oBuiInfo/"+this.bno+"'>"+this.bname+"</a></li>";
	});

	$(".headerSubMenu > ul").append(str);
	
}

$(function(){
	if($("#seId").val()=="" || $("#seId").val() == null || $("#seName").val()=="" || $("#seName").val() == null || $("#seOno").val()=="" || $("#seOno").val() == null){
		alert("로그인 정보가 없습니다. 다시 로그인해주세요.");
		location.replace("${pageContext.request.contextPath}/");
	}
	
	draw_managementBui_subMenu();
});
</script>
<div class="header">
	<div class="logoWrap">
		<a href="${pageContext.request.contextPath}/owner/oMain"><img src="${pageContext.request.contextPath}/resources/images/logo3.png"></a>
	</div>
	<div class="se">
		<input id="seId" type="hidden" value="${sessionScope.id}">
		<input id="seName" type="hidden" value="${sessionScope.name}">
		<input id="seOno" type="hidden" value="${sessionScope.ono}">
		<input id="seOphone" type="hidden" value="${sessionScope.ophone}">
	</div>
	<div class="headerBtnWrap">
		<ul>
			<li><p><a href="${pageContext.request.contextPath}/owner/oMain">HOME</a></p></li>
			<li><p><a href="${pageContext.request.contextPath}/owner/oBuiReg">신규건물추가</a></p></li>
			<li>
				<p><a href="#none">관리건물 ▼</a></p>
				<div class="headerSubMenu">
					<ul>
						
					</ul>
				</div>
			</li>
			<%-- <li><p><a href="${pageContext.request.contextPath}/owner/oEmptyRoomInfo">공실정보</a></p></li> --%>
			<li><p><a href="${pageContext.request.contextPath}/owner/oRepairCompany">수리/시공</a></p></li>
			<li><p><a href="${pageContext.request.contextPath}/owner/oTradeInfo">건물매매</a></p></li>
		</ul>
	</div><!-- headerBtnWrap end -->
	<div class="myInfo">
		<p>${sessionScope.name}(${sessionScope.id})님 환영합니다.</p>
		<p><a href="${pageContext.request.contextPath}/owner/ownerMyPage">마이페이지</a> &nbsp;&nbsp;|&nbsp;&nbsp; <a href="${pageContext.request.contextPath}/logout">로그아웃</a></p>
	</div>
</div>