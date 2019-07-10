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
	.popup_memoRegister{
		display: none;
		width:350px;
		background: #fff;
		margin:0 auto;
		margin-top:100px;
		position: relative;
		z-index: 999;
		text-align: center;
	}
	.popup_memoRegister > h3{ 
		width: 100%;
		font-size: 23px;
		color: #fff;
		padding: 10px 0;
		background: #6c7981;
		position: relative;
	}
	.popup_memoRegister > h3 > img{
		width: 20px;
		position: absolute;
		right: 10px;
		cursor: pointer;
		margin-top:2px;
	}
	.popup_memoRegister > table{
		width: 100%;
	}
	.popup_memoRegister > table tr{
		border-bottom: 1px solid lightgray;
	}
	.popup_memoRegister > table tr > th{
		width: 100px;
		background: #7b93a8;
		text-align: center;
		font-size: 15px;
		color: #efefef;
		padding: 10px 0;
		letter-spacing: 2px;
	}
	.popup_memoRegister > table tr > td{
		padding: 5px 10px;
	}
	.popup_memoRegister > table tr > td > input{
		width: 100%;
		font-size: 15px;
		padding: 0 10px;
	}
	.popup_memoRegister > table tr > td > textarea{
		width: 100%;
		height: 150px;
		font-size: 15px;
		resize: none;
		padding: 7px;
	}
	.popup_btnWrap{
		width: 100%;
		text-align: center;
		padding: 10px 0;
	}
	.popup_btnWrap > p{
		cursor: pointer;
		display: inline-block;
		border-radius: 4px;
	}
	.popup_btnWrap > p > img{
		width: 35px;
	}
	
	.popup_memoUpdate{
		display: none;
		width:350px;
		background: #fff;
		margin:0 auto;
		margin-top:100px;
		position: relative;
		z-index: 999;
		text-align: center;
	}
	.popup_memoUpdate > h3{ 
		width: 100%;
		font-size: 23px;
		color: #fff;
		padding: 10px 0;
		background: #6c7981;
		position: relative;
	}
	.popup_memoUpdate > h3 > img{
		width: 20px;
		position: absolute;
		right: 10px;
		cursor: pointer;
		margin-top:2px;
	}
	.popup_memoUpdate > table{
		width: 100%;
	}
	.popup_memoUpdate > table tr{
		border-bottom: 1px solid lightgray;
	}
	.popup_memoUpdate > table tr > th{
		width: 100px;
		background: #7b93a8;
		text-align: center;
		font-size: 15px;
		color: #efefef;
		padding: 10px 0;
		letter-spacing: 2px;
	}
	.popup_memoUpdate > table tr > td{
		padding: 5px 10px;
	}
	.popup_memoUpdate > table tr > td > input{
		width: 100%;
		font-size: 15px;
		padding: 0 10px;
	}
	.popup_memoUpdate > table tr > td > textarea{
		width: 100%;
		height: 150px;
		font-size: 15px;
		resize: none;
		padding: 7px;
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
	.asideTop{
		overflow: hidden;
		margin-bottom: 15px;
	}
	#calendarWrap {
		float:left;
		margin: 15px;
		background: #fff;
		box-shadow: 0px 0px 20px -5px gray;
	}
	
	
	.calNoticeWrap{
		width: 100%;
		height: 45px; 
		float:left;
		padding-top: 10px;
		text-align: center;
	}
	
	.noticeListWrap{
		width: 340px;
		float: right;
		margin: 15px 15px 10px 15px;
	}
	.noticeChkInOut{
		box-shadow: 0px 0px 20px -5px gray;
	}
	.noticeChkInOut > h4{
		width: 100%;
		background: #6c7981;
		color: #fff;
		text-align: center;
		padding: 7px;
		font-size: 17px;
	}
	.noticeChkInOut > .tblWrap{
		width: 100%;
		max-height: 150px;
		overflow: auto;
		border: 1px solid #efefef;
		background: #fff;
	}
	.noticeChkInOut > .tblWrap > table{
		width: 100%;
	}
	.noticeChkInOut > .tblWrap > table tr{
		border-bottom: 1px solid #e4e9ed;
	}
	.noticeChkInOut > .tblWrap > table tr th{
		font-size:18px;
		padding: 10px 0;
	}
	.noticeChkInOut > .tblWrap > table tr td{
		font-size: 15px;
		padding: 10px;
		
	}
	.noticeChkInOut > .tblWrap > table tr td > span{
		margin-right: 5px;
	}
	.noticeChkInOut > .tblWrap > table tr td > p{
		width: 100%;
		text-align: center;
		font-size: 15px;
	}
	.noticeChkOutWrap{
		margin-top:15px;
	}
	
	.memoWrap{
		display: none;
		width: 100%;
		margin-top: 15px;
		background: #fff;
		box-shadow: 0px 0px 20px -5px gray;
		border: 1px soild #efefef;
	}
	.memoTitle{
		width: 100%;
		background: #6c7981;
	}
	.memoTitle > h4{
		width: 100%;
		text-align: center;
		color: #fff;
		padding: 7px 0;
		font-size: 17px;
		position: relative;
	}
	.memoTitle > h4 > img.memoCloseBtn{
		width: 16px;
		position: absolute;
		right: 10px;
		cursor: pointer;
	}
	.memoContent{
		width: 100%;
		height: 145px;
		padding: 5px;
		border-bottom: 1px solid lightgray;
	}
	.memoContent > textarea{
		width: 100%;
		height: 100%;
		font-size: 15px;
		resize: none;
		padding: 7px;
		overflow: auto;
		border: 1px solid #efefef;
		background: #fff;
	}
	.memoBtnWrap{
		width: 100%;
		text-align: right;
		padding: 5px 0;
	}
	.memoBtnWrap > p{
		display: inline-block;
		cursor: pointer;
		margin-right: 10px;
	}
	.memoBtnWrap > p > img{
		width: 35px;
	}
	
	.asideBottom{
		width: 100%;
		margin: 10px;
		margin: 0 auto;
		box-shadow: 0px 0px 30px -5px gray;
	}
	.asideBottom > table{
		width: 100%;
		border: 1px solid #efefef;
	}
	.asideBottom > table tr{
	
	}
	.asideBottom > table tr > th{
		font-size: 15px;
	}
	.asideBottom > table tr > td{
		font-size: 15px;
		text-align: center;
		padding: 7px 0;
		border-bottom: 1px solid lightgray;
	}
	.asideBottom > table tr:first-child{
		background: #6c7981;
	}
	.asideBottom > table tr:first-child > th{
		color: #fff;
		font-size: 18px;
		padding: 5px;
	}
	.asideBottom > table tr:nth-child(2){
		border-bottom: 3px solid lightgray;
	}
	.asideBottom > table tr:nth-child(2) > th{
		color: #333;
		padding: 6px 0;
		font-weight: bold;
	}
	.asideBottom > table tr:nth-child(2) > th:first-child{
		width: 35px;
	}
	.asideBottom > table tr:nth-child(2) > th:nth-child(2){
		width: 110px;
	}
	.asideBottom > table tr:nth-child(2) > th:nth-child(3){
		width: 80px;
	}
	.asideBottom > table tr:nth-child(2) > th:nth-child(4){
		width: 135px;
	}
	.asideBottom > table tr:nth-child(2) > th:nth-child(5){
		width: 270px;
	}
	.asideBottom > table tr:nth-child(2) > th:nth-child(6){
		width: 70px;
	}
	.asideBottom > table tr:nth-child(2) > th:nth-child(7){
		width: 50px;
	}
	.asideBottom > table tr:nth-child(2) > th:nth-child(8){
		width: 90px;
	}
	.asideBottom > table tr:nth-child(2) > th:nth-child(9){
		width: 90px;
	}
	.mbListTr > td:nth-child(2) > a:hover{
		font-weight: bold;
		color: #4374d9;
		transition-duration: 300ms;
		transition-property: color, border-color, background-color, font-weight;
		transition-timing-function: ease;
	} 
	
	.fc_green{
		color: #0f753b;
		font-weight: bold;
	}
	.fc_red{
		color: #c41f2f;
		font-weight: bold;
	}
</style>
<script>
function get_memoByMnoDate(vo){
	var dt;
	$.ajax({
		url:"${pageContext.request.contextPath}/memoByMnoDate",
		type: "post",
		data:JSON.stringify(vo),
		async:false,
		contentType : "application/json; charset=UTF-8",
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

function post_memoRegister(vo){
	var dt;
	$.ajax({
		url:"${pageContext.request.contextPath}/memoRegister",
		type: "post",
		data:JSON.stringify(vo),
		async:false,
		contentType : "application/json; charset=UTF-8",
		dataType:"text",
		success:function(json){
			dt = json;
			if(json == 'ok'){
				alert("메모가 등록되었습니다.");
				$(".popup_memoRegister > table tr > td > input[name='mdate']").val("");
				$(".popup_memoRegister > table tr > td > textarea").val("");
				$(".popup_memoRegister").css("display", "none");
				$(".popupWrap").css("display", "none");
				
				var selDate = $("#sYearMonth > input[name='selectDate']").val();
				var date = new Date(selDate);
				drawCalendar(date);
			}
		},
		error:function(request,status,error){
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
	return dt;
}

function post_memoUpdate(vo){
	var dt;
	$.ajax({
		url:"${pageContext.request.contextPath}/memoUpdate",
		type: "post",
		data:JSON.stringify(vo),
		async:false,
		contentType : "application/json; charset=UTF-8",
		dataType:"text",
		success:function(json){
			dt = json;
			if(json == 'ok'){
				alert("메모가 수정되었습니다.");
				$(".popup_memoUpdate > table tr > td > input[name='mdate']").val("");
				$(".popup_memoUpdate > table tr > td > textarea").val("");
				$(".popup_memoUpdate").css("display", "none");
				$(".popupWrap").css("display", "none");
				
				$(".memoWrap").css("display", "none");
				var selDate = $("#sYearMonth > input[name='selectDate']").val();
				var date = new Date(selDate);
				drawCalendar(date);
			}
		},
		error:function(request,status,error){
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
	return dt;
}

function post_memoDelete(no){
	$.ajax({
		url:"${pageContext.request.contextPath}/memoDelete/"+no,
		type:"post",
		async:false,
		dataType:"text",
		success:function(json){
			if(json == "ok"){
				alert("삭제되었습니다.");
				$(".memoWrap").css("display", "none");
				var selDate = $("#sYearMonth > input[name='selectDate']").val();
				var date = new Date(selDate);
				drawCalendar(date);
			}else{
				alert("새로고침(F5) 후 다시 시도하세요.");
			}
		},
		error:function(request,status,error){
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}

function get_roomByBnoDate(bnoList, date){
	var dt;
	$.ajax({
		url:"${pageContext.request.contextPath}/getRoomByBnoDate/"+bnoList+"/"+date,
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

function draw_memo(date){
	var mno = $("#seMno").val();
	var vo ={mno:mno, mdate:date};
	var list = get_memoByMnoDate(vo);
	var targetClass = "";
	var str = "";
	
	$(list).each(function(){
		targetClass = "c_"+this.mdate+" > .calNoticeWrap";
		str = "<span class='btnMemo'><img src='${pageContext.request.contextPath}/resources/images/icon_memo.png'><input type='hidden' name='memoNo' value='"+this.no+"'>"
			+"<input type='hidden' name='memoMdate' value='"+this.mdate+"'><input type='hidden' name='memoCon' value='"+this.content+"'></span>";
		$(".c_"+this.mdate+" > p > .btnPlus").remove();
		$("."+targetClass).prepend(str);
	});
}

function draw_table_managementBuilding(mno){
	var buiList = get_BuildingByMno(mno);
	var str = "";
	var cntNum = 1;
	var addr = "";
	if(buiList.length == 0){
		str = "<tr><td colspan='9'>관리건물이 존재하지 않습니다.</td></tr>";
	}else{
		$(buiList).each(function(){
			if(this.baddr_old == "" || this.baddr_old == null || this.baddr_old == "null"){
				addr = this.baddr_new;
			}else{
				addr = this.baddr_old;
			}
			str += "<tr class='mbListTr'><td>"+cntNum+"<input type='hidden' name='bno' value='"+this.bno+"'></td><td><a href='${pageContext.request.contextPath}/mBuiInfo/"+this.bno+"'>"+this.bname+"</a></td>"
				+"<td>"+this.oname+"</td><td>"+this.ophone+"</td><td>"+addr+"</td>"
				+"<td>"+this.cnt_complete+"</td><td>"+this.cnt_empty+"</td><td>"+this.total_monthly_rent+"</td><td>"+this.total_deposit+"</td>";
				cntNum++;
		});
	}
	
	$(".asideBottom > table").append(str);
	$(".mbInfoTr > th > span").text(cntNum-1);
	cntNum = 1;
}

function draw_table_roomMonthSchedule(date){
	$(".noticeChkInOut > .tblWrap > table").html("");
	console.log(date);
	var str = "";
	var size = $(".mbListTr > td:first-child > input[name='bno']");
	
	$(".noticeChkInWrap > h4").text(date.split("-")[0]+"년 "+date.split("-")[1]+"월 "+"입주 일정");
	$(".noticeChkOutWrap > h4").text(date.split("-")[0]+"년 "+date.split("-")[1]+"월 "+"퇴실 일정");
	
	if(size.size() == 0){
		str = "<tr class='noticeContentTr'><td><p>일정이 없습니다.</p></td></tr>";
		$(".noticeChkInWrap > .tblWrap > table").html(str);
		$(".noticeChkOutWrap > .tblWrap > table").html(str);
	}else{
		var bnoList = [];
		for(var i=0; i < size.size(); i++){
			bnoList.push(size.eq(i).val());
		}
		var list = get_roomByBnoDate(bnoList, date);
		
		var cTag;
		
		//입주
		if($(list.chkInList).size() == 0){
			str += "<tr class='noticeContentTr'><td><p>일정이 없습니다.</p></td></tr>";
		}else{
			$(list.chkInList).each(function(){
				str += "<tr class='noticeContentTr'><td><span class='fc_green'>입주</span> "+this.check_in+" "+"<a href='${pageContext.request.contextPath}/mBuiInfo/"+this.bno+"'> "+this.bname+"</a> "+this.rno+"호</td></tr>";
				//달력표시
				cTag = $(".c_"+this.check_in+" > .calNoticeWrap");
				if(cTag.find(".icon_in_house").length <= 0){
					cTag.append("<img class='icon_in_house' src='${pageContext.request.contextPath}/resources/images/icon_chkin.png'>");
				}
			});
		}
		
		$(".noticeChkInWrap > .tblWrap > table").html(str);
		
		str = "";
		
		//퇴실
		if($(list.chkOutList).size() == 0){
			str += "<tr class='noticeContentTr'><td><p>일정이 없습니다.</p></td></tr>";
		}else{
			$(list.chkOutList).each(function(){
				str += "<tr class='noticeContentTr'><td><span class='fc_red'>퇴실</span>  "+this.check_out+"<a href='${pageContext.request.contextPath}/mBuiInfo/"+this.bno+"'> "+this.bname+"</a> "+this.rno+"호</td></tr>";
				//달력표시
				cTag = $(".c_"+this.check_out+" > .calNoticeWrap");
				if(cTag.find(".icon_out_house").length <= 0){
					cTag.append("<img class='icon_out_house' src='${pageContext.request.contextPath}/resources/images/icon_chkout.png'>");
				}
			});
		}
		
		$(".noticeChkOutWrap > .tblWrap > table").html(str);
	}
	
}


$(function(){
	
	var today = new Date();
	draw_table_managementBuilding($("#seMno").val());
	drawCalendar(today);
	
	var memoBtnNum = 0; 
	
	//달력 이전달 클릭
	$("#prevMonth > p").click(function(){
		var selectDate = $("#sYearMonth > input[name='selectDate']").val();
		var splitDateInfo = selectDate.split("-");
		var nowDate = new Date(splitDateInfo[0], Number(splitDateInfo[1])-1, 1);
		var prevDate = new Date(nowDate.setDate(nowDate.getDate()-1));
		drawCalendar(prevDate);
		//draw_table_roomMonthSchedule($("#sYearMonth > input[name='selectDate']").val());
		
		//메모 + 버튼 유무
		if(memoBtnNum == 0){
			$(".calendarDateTr > td > p > span.btnPlus").css("display","none");
		}else{
			$(".calendarDateTr > td > p > span.btnPlus").css("display","inline-block");
		}
	});
	
	//달력 다음달 클릭
	$("#nextMonth > p").click(function(){
		var selectDate = $("#sYearMonth > input[name='selectDate']").val();
		var splitDateInfo = selectDate.split("-");
		var nowDate = new Date(splitDateInfo[0], Number(splitDateInfo[1])+1, 1);
		var nextDate = new Date(nowDate.setDate(nowDate.getDate()-1));
		drawCalendar(nextDate);
		
		//메모 + 버튼 유무
		if(memoBtnNum == 0){
			$(".calendarDateTr > td > p > span.btnPlus").css("display","none");
		}else{
			$(".calendarDateTr > td > p > span.btnPlus").css("display","inline-block");
		}
	});
	
	
	//달력 메모 클릭, +버튼 보이도록
	$("#calendarWrap > table #calendar1tr > #nextMonth > button").click(function(){
		if(memoBtnNum == 0){
			memoBtnNum = 1;
			$(".calendarDateTr > td > p > span.btnPlus").css("display","inline-block");
		}else{
			memoBtnNum = 0;
			$(".calendarDateTr > td > p > span.btnPlus").css("display","none");
		}
	}); 
	
	//달력에서 +클릭했을 때
	$(document).on("click", ".calendarDateTr > td > p > .btnPlus", function(){
		var targetDate = $(this).parent().parent().prop("class").split("_")[1];
		$(".popup_memoRegister > table tr > td > input[name='mdate']").val(targetDate);
		$(".popup_memoRegister").css("display", "block");
		$(".popupWrap").css("display","block");
	});
	
	//달력 메모 추가 팝업에서 버튼 클릭
	$(".popup_memoRegister > .popup_btnWrap > p").click(function(){
		var btnIdx = $(this).index();
		if(btnIdx == 0){
			var mno = $("#seMno").val();
			var mdate = $(".popup_memoRegister > table tr > td > input[name='mdate']").val();
			var content = $(".popup_memoRegister > table tr > td > textarea").val();
			var vo = {mno:mno, mdate:mdate, content:content};
			
			post_memoRegister(vo);
			memoBtnNum = 0;
		}
	});
	
	//달력 메모추가팝업 닫기
	$(".popup_memoRegister > h3 > img").click(function(){
		$(".popup_memoRegister > table tr > td > input[name='mdate']").val("");
		$(".popup_memoRegister > table tr > td > textarea").val("");
		$(".popup_memoRegister").css("display", "none");
		$(".popupWrap").css("display", "none");
	});
	
	//달력에 날짜옆에 메모 적혀있는거 눌렀을 때, 메모내용 보이는 기능
	$(document).on("click", ".btnMemo", function(){
		var memoNo = $(this).find("input[name='memoNo']").val();
		var mdate = $(this).find("input[name='memoMdate']").val();
		var content = $(this).find("input[name='memoCon']").val();
		
		var str = "<div class='memoTitle'><h4><span>"+mdate+"</span> 메모<input type='hidden' name='memoNo' value='"+memoNo+"'><img class='memoCloseBtn' src='${pageContext.request.contextPath}/resources/images/icon_x.png'></h4></div>"
				+"<div class='memoContent'><textarea disabled>"+content+"</textarea></div><div class='memoBtnWrap'><p><img class='memoCloseBtn' src='${pageContext.request.contextPath}/resources/images/icon_write.png'>"
				+"</p><p><img class='memoCloseBtn' src='${pageContext.request.contextPath}/resources/images/icon_garbage.png'></p></div>";
		
		$(".memoWrap").html(str);
		
		$(".memoWrap").css("display", "block");
	});
	
	//메모 내용 나오는 곳에서 버튼(수정, 삭제, 닫기) 클릭했을 때
	$(document).on("click", ".memoBtnWrap > p", function(){
		var btnIdx = $(this).index();
		if(btnIdx == 0){
			var memoNo = $(".memoTitle > h4 > input[name='memoNo']").val();
			var mDate = $(".memoTitle > h4 > span").text();
			var mContent = $(".memoContent").text();
			
			$(".popup_memoUpdate > h3 > input[name='memoNo']").val(memoNo);
			$(".popup_memoUpdate > table tr > td > input[name='mdate']").val(mDate);
			$(".popup_memoUpdate > table tr > td > textarea").val(mContent);
			
			$(".popupWrap").css("display", "block");
			$(".popup_memoUpdate").css("display", "block");
		}else if(btnIdx == 1){
			var confirm_result = confirm("삭제 후에는 내용을 복구 할 수 없습니다. \n삭제하시겠습니까?");
			if(confirm_result){
				var no = $(".memoTitle > h4 > input[name='memoNo']").val();
				post_memoDelete(no);
			}else{
				return false;
			}
		}
	});
	$(document).on("click", ".memoCloseBtn", function(){
		$(".memoWrap").css("display", "none");
	});
	//달력 메모수정 팝업 에서 버튼 클릭
	$(".popup_memoUpdate > .popup_btnWrap > p").click(function(){
		var btnIdx = $(this).index();
		if(btnIdx == 0){
			var no = $(".popup_memoUpdate > h3 > input[name='memoNo']").val();
			var mno = $("#seMno").val();
			var mdate = $(".popup_memoUpdate > table tr > td > input[name='mdate']").val();
			var content = $(".popup_memoUpdate > table tr > td > textarea").val();
			var vo = {no:no, mno:mno, mdate:mdate, content:content};
			
			post_memoUpdate(vo);
			memoBtnNum = 0;
		}
	});
	//달력 메모수정 팝업 닫기
	$(".popup_memoUpdate > h3 > img").click(function(){
		$(".popup_memoUpdate > table tr > td > input[name='mdate']").val("");
		$(".popup_memoUpdate > table tr > td > textarea").val("");
		$(".popup_memoUpdate").css("display", "none");
		$(".popupWrap").css("display", "none");
	});
	
});
</script>
<style>


</style>
</head>
<body>
	<div class="allWrap">
		<div class="popupWrap">
			<div class="popup_bg"></div>
			<div class="popup_memoRegister">
				<h3>메모추가<img src="${pageContext.request.contextPath}/resources/images/icon_x.png" title="닫기"></h3>
				<table>
					<tr>
						<td><input type="date" name="mdate" placeholder="ex) 2019-09-09" readonly></td>
					</tr>
					<tr>
						<td><textarea></textarea></td>
					</tr>
				</table>
				<div class="popup_btnWrap">
					<p><img src="${pageContext.request.contextPath}/resources/images/icon_plus.png" title="수정"></p>
				</div>
			</div><!-- popup_memoRegister -->
			<div class="popup_memoUpdate">
				<h3>메모수정<input type="hidden" name="memoNo" value=""><img src="${pageContext.request.contextPath}/resources/images/icon_x.png" title="닫기"></h3>
				<table>
					<tr>
						<td><input type="date" name="mdate" placeholder="ex) 2019-09-09" readonly></td>
					</tr>
					<tr>
						<td><textarea></textarea></td>
					</tr>
				</table>
				<div class="popup_btnWrap">
					<p><img src="${pageContext.request.contextPath}/resources/images/icon_plus.png" title="수정"></p>
				</div>
			</div><!-- popup_memoRegister -->
		</div>
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
					<div class="asideTop">
						<div id="calendarWrap">
							<table>
								<tr id="calendar1tr">
									<td id="prevMonth" colspan="2"><p>◀</p></td>
									<td id="sYearMonth" colspan="3"><h3></h3><h4></h4><input type='hidden' name='selectDate' value=''></td>
									<td id="nextMonth" colspan="2"><p>▶</p><button><img src="${pageContext.request.contextPath}/resources/images/icon_pencil_gray.png" title="메모작성"></button></td>
								</tr>
								<tr id="calendar2tr">
									<td colspan="7"><img src="${pageContext.request.contextPath}/resources/images/icon_chkin.png"><span>입실</span><img src="${pageContext.request.contextPath}/resources/images/icon_chkout.png"><span>퇴실</span></td>
								</tr>
								<tr id="calendar3tr">
									<td><p>SUN</p></td>
									<td><p>MON</p></td>
									<td><p>TUE</p></td>
									<td><p>WED</p></td>
									<td><p>THU</p></td>
									<td><p>FRI</p></td>
									<td><p>SAT</p></td>
								</tr>
								
							</table>
						</div><!-- calendarWrap end -->
						<div class="noticeListWrap">
							<div class="noticeChkInWrap noticeChkInOut">
								<h4></h4>
								<div class="tblWrap">
									<table></table>
								</div>
								
							</div>
							<div class="noticeChkOutWrap noticeChkInOut">
								<h4></h4>
								<div class="tblWrap">
									<table></table>
								</div>
							</div>
							<div class="memoWrap">
								
							</div>
						</div><!-- noticeListWrap end -->
					</div><!-- asideTop end -->
					<div class="asideBottom">
						<table>
							<tr class="mbInfoTr">
								<th colspan="9">현재 관리 중인 건물은 총 <span>3</span>채입니다.</th>
							</tr>
							<tr class="mbTblColTr">
								<th>No</th>
								<th>건물명</th>
								<th>건물주</th>
								<th>연락처</th>
								<th>주소</th>
								<th>입주완료</th>
								<th>공실</th>
								<th>월세 합계</th>
								<th>보증금 합계</th>
							</tr>
						</table>
					</div>
				</div><!-- section end -->
			</div><!-- sectionWrap end -->
		</div><!-- rightAside end -->
	</div><!-- allWrap end -->
</body>
</html>