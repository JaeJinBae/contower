<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
	.header{
		width: 100%;
	}
	.loginInfo{
		float:right;
		margin-right: 20px;
		font-size: 17px;
		font-weight: bold;
	}
	.loginInfo > a{
		font-size: 17px;
		font-weight: bold;
		font-family: sans-serif;
		line-height: 80px;
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
		str += "<li><a href='${pageContext.request.contextPath}/mBuiInfo/"+this.bno+"'>"+this.bname+"</a></li>";
	});

	$(".headerSubMenu > ul").append(str);
	
}

$(function(){
	if($("#seId").val()=="" || $("#seId").val() == null || $("#seName").val()=="" || $("#seName").val() == null || $("#seMno").val()=="" || $("#seMno").val() == null){
		alert("로그인 정보가 없습니다. 다시 로그인해주세요.");
		location.replace("${pageContext.request.contextPath}/");
	}
	
	draw_managementBui_subMenu();
});
</script>
<div class="header">
	<div class="loginInfo">
		<a href="${pageContext.request.contextPath}/managerMyPage">MyPage</a>&nbsp;&nbsp;/&nbsp;&nbsp;
		<a href="${pageContext.request.contextPath}/logout">Logout</a>
	</div>
	<div class="se">
		<input id="seId" type="hidden" value="${sessionScope.id}">
		<input id="seName" type="hidden" value="${sessionScope.name}">
		<input id="seMno" type="hidden" value="${sessionScope.mno}">
		<input id="seMphone" type="hidden" value="${sessionScope.mphone}">
	</div>
	
</div>