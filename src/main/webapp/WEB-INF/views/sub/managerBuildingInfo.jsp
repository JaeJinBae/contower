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
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
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
	.menuWrap > ul > li:nth-child(2) > a{
		color: #fff;
	}
	.menuWrap > ul > li:nth-child(2) > .menuBg{
		display:block !important;
		position: absolute;
		top: -18px;
		left: -44px;
		z-index: -1;
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
		padding: 23px;
	}
	.section{
		width: 1100px;
	}
	.tblTop{
		overflow: hidden;
		margin-bottom: 10px;
		padding-left: 35px;
	}
	.tblTop > table{
		float:left;
		background: #fff;
	}
	.tblTop > table tr{
		border-bottom: 10px solid #ecf7ff;
	}
	.tblTop > table tr > th{
		background: #6c7981;
		color: #fff;
		font-size: 15px;
		padding: 7px 10px;
		letter-spacing: 1px;
	}
	.tblTop > table tr > td{
		font-size: 15px;
		padding: 7px 10px;
		border-right: 8px solid #ecf7ff;
	}
	.updateBtnDiv{
		float:left;
		margin-left: 20px;
	}
	.updateBtnDiv > p{
		background: #105340;
		color: #fefefe;
		font-size: 15px;
		padding: 5px 12px;
		border-radius: 4px;
		letter-spacing: 2px;
		cursor: pointer;
	}
	.m2{
		width: 20px;
	}
	
	
	.tblTop2{
		margin-bottom: 25px;
		padding-left: 35px;
	}
	.tblTop2 > table{
		background: #fff;
		box-shadow: 0px 0px 16px -5px gray;
	}
	.tblTop2 > table tr{
		
	}
	.tblTop2 > table tr > th{
		background: #6c7981;
		color: #fff;
		font-size: 15px;
		padding: 7px 10px;
		letter-spacing: 1px;
	}
	.tblTop2 > table tr > td{
		font-size: 15px;
		padding: 7px 10px;
	}
	
	.tblBottom{ 
		width: 100%;
		padding-left: 35px;
	}
	.tblWrap{
		margin: 10px 0; 
		margin-right: 15px;
	}
	.tblWrap > select{
		font-size: 14px;
		padding: 3px;
		border-radius: 10px;
		margin-bottom: 3px;
		margin-top: 30px;
	}
	.tblWrap > #addRoomBtn{
		color: #efefef;
		font-size:14px;
		margin-bottom: 3px;
		border-radius: 4px;
	}
	#addRoomBtn > img{
		width: 30px;
	}
	.tblWrap > table{
		box-shadow: 0px 0px 35px -5px gray;
		-webkit-box-shadow: 0px 0px 35px -5px gray;
	}
	.tblWrap > table tr{
		background: #fff;
	}
	.tblWrap > table tr > th{
		color: #fff;
		font-size: 15px;
		padding: 7px 10px;
		letter-spacing: 1px;
	}
	.tblWrap > table tr > td{
		font-size: 15px;
		padding: 7px 10px;
		text-align: center;
		border-bottom: 2px solid #dfdfdf;
	}
	.tblWrap > table tr > td > select{
		font-size: 15px;
		border: 1px solid #ccc;
	}
	
	.tblWrap:nth-child(1) > table tr:not(.tblContentTr){
		background: #598db4;
		border-bottom: 1px solid #ddd;
	}
	.tblWrap:nth-child(2) > table tr:not(.tblContentTr){
		background: #21608e;
		border-bottom: 1px solid #ddd;
	}
	.tblWrap:nth-child(3) > table tr:not(.tblContentTr){
		background: #327bb2;
		border-bottom: 1px solid #ddd;
	}
	.tblWrap:nth-child(4) > table tr:not(.tblContentTr){
		background: #193f5a;
		border-bottom: 1px solid #ddd;
	}
	#totalInfo > table .tblContentTr > td:last-child{
		position: relative;
		width: 200px;
		height: 40px;
		cursor: pointer; 
	}
	#emptyRoom > table .tblContentTr > td:last-child{
		position: relative;
		width: 200px;
		height: 40px;
	}
	#contractComplete > table .tblContentTr > td:last-child{
		position: relative;
		width: 200px;
		height: 40px;
	}
	.repairSimple{
		width: 200px;
		height: 40px;
		overflow: hidden;
	}
	.repairDetail{
		display: none;
		position: absolute;
		bottom: 15px;
		left: -270px;
		width: 300px;
		background: #ececec;
		box-shadow: 0px 0px 35px -5px gray;
	}
	.repairDetail > h3{
		width: 100%;
		font-size: 23px;
		background: #237db1;
		background: #b67c17;
		color: #fff;
		padding: 10px 0;
	}
	.repairDetail > .repairDetailContent{
		width: 100%;
		height: 300px;
		text-align: left;
	}
	.repairDetail > .repairDetailContent > textarea{
		width: 100%;
		height: 100%;
		padding: 7px;
		resize: none;
		font-size: 15px; 
	}
</style>
<script>
function get_ownerInfo(ono){
	var dt;
	$.ajax({
		url:"${pageContext.request.contextPath}/getOwnerInfo/"+ono,
		type:"post",
        dataType : 'json',
        contentType : 'application/json; charset=UTF-8',
		async:false,
		success:function(json){
			dt = json;
		},
		error:function(request,status,error){
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
	return dt;
}

function get_buiInfo(bno){
	var dt;
	$.ajax({
		url:"${pageContext.request.contextPath}/getBuiInfo/"+bno,
		type:"post",
        dataType : 'json',
        contentType : 'application/json; charset=UTF-8',
		async:false,
		success:function(json){
			dt = json;
		},
		error:function(request,status,error){
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
	return dt;
}

function post_buiUpdate(vo){
	$.ajax({
		url:"${pageContext.request.contextPath}/buiInfoUpdate",
		type:"post",
		dataType:"text",
		data: vo,
		async:false,
		success:function(json){
			if(json == "ok"){
				alert("건물정보 수정이 완료되었습니다.");
				
				$(".popup_buiUpdate > table tr > td > input[name='bname']").val("");
				$(".popup_buiUpdate > table tr > td > input[name='baddr_old']").val("");
				$(".popup_buiUpdate > table tr > td > input[name='baddr_new']").val("");
				$(".popup_buiUpdate > table tr > td > input[name='bpw']").val("");
				$(".popup_buiUpdate > table tr > td > input[name='heating']").val("");
				$(".popup_buiUpdate > table tr > td > input[name='boption']").val("");
				$(".popup_buiUpdate > table tr > td > input[name='completion_date']").val("");
				$(".popup_buiUpdate > table tr > td > input[name='site']").val("");
				$(".popup_buiUpdate > table tr > td > input[name='gross_area']").val("");
				$(".popup_buiUpdate > table tr > td > input[name='road']").val("");
				$(".popup_buiUpdate > table tr > td > input[name='oname']").val("");
				$(".popup_buiUpdate > table tr > td > input[name='ophone']").val("");
				$(".popup_buiUpdate > table tr > td > input[name='obirth']").val("");
				$(".popup_buiUpdate > table tr > td > input[name='memo']").val("");
				
				$(".popupWrap > .popup_buiUpdate").css("display","none");
				$(".popupWrap").css("display","none");
				
				location.reload();
			}
		},
		error:function(request,status,error){
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}

function post_buiDelete(bno){
	$.ajax({
		url:"${pageContext.request.contextPath}/buiDelete",
		type:"post",
		dataType:"text",
		data: bno,
		async:false,
		success:function(json){
			if(json == "ok"){
				alert("삭제가 완료되었습니다.");
				
				$(".popup_buiUpdate > table tr > td > input[name='bname']").val("");
				$(".popup_buiUpdate > table tr > td > input[name='baddr_old']").val("");
				$(".popup_buiUpdate > table tr > td > input[name='baddr_new']").val("");
				$(".popup_buiUpdate > table tr > td > input[name='bpw']").val("");
				$(".popup_buiUpdate > table tr > td > input[name='heating']").val("");
				$(".popup_buiUpdate > table tr > td > input[name='boption']").val("");
				$(".popup_buiUpdate > table tr > td > input[name='completion_date']").val("");
				$(".popup_buiUpdate > table tr > td > input[name='site']").val("");
				$(".popup_buiUpdate > table tr > td > input[name='gross_area']").val("");
				$(".popup_buiUpdate > table tr > td > input[name='road']").val("");
				$(".popup_buiUpdate > table tr > td > input[name='oname']").val("");
				$(".popup_buiUpdate > table tr > td > input[name='ophone']").val("");
				$(".popup_buiUpdate > table tr > td > input[name='obirth']").val("");
				$(".popup_buiUpdate > table tr > td > input[name='memo']").val("");
				
				$(".popupWrap > .popup_buiUpdate").css("display","none");
				$(".popupWrap").css("display","none");
			}
		},
		error:function(request,status,error){
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}

function get_roomInfo(no){
	var dt;
	$.ajax({
		url:"${pageContext.request.contextPath}/getRoomInfo/"+no,
		type:"post",
        dataType : 'json',
        contentType : 'application/json; charset=UTF-8',
		async:false,
		success:function(json){
			dt = json;
		},
		error:function(request,status,error){
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
	return dt;
	
}

function post_roomRegister(vo){
	$.ajax({
		url:"${pageContext.request.contextPath}/roomRegOne",
		type:"post",
		data : JSON.stringify(vo),
        dataType : 'text',
        contentType : 'application/json; charset=UTF-8',
		async:false,
		success:function(json){
			if(json == "ok"){
				alert("방 등록이 완료되었습니다.");
				location.reload();
			}else{
				alert("방 등록이 완료되지 않았습니다.\n새로고침(F5) 후 다시 시도하세요.");
				console.log(json);
			}
			
		},
		error:function(request,status,error){
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}

function post_roomUpdate(vo){
	$.ajax({
		url:"${pageContext.request.contextPath}/roomInfoUpdate",
		type:"post",
		data : JSON.stringify(vo),
        dataType : 'text',
        contentType : 'application/json; charset=UTF-8',
		async:false,
		success:function(json){
			if(json == "ok"){
				alert("방정보 수정이 완료되었습니다.");
				
				$(".popup_roomUpdate > table tr > td > input").val("");
				
				$(".popupWrap > .popup_roomUpdate").css("display","none");
				$(".popupWrap").css("display","none");
			}
		},
		error:function(request,status,error){
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}

function post_updateRepair(info){
	$.ajax({
		url:"${pageContext.request.contextPath}/repairUpdate",
		type:"post",
		data : JSON.stringify(info),
        dataType : 'text',
        contentType : 'application/json; charset=UTF-8',
		async:false,
		success:function(json){
			if(json == "ok"){
				alert("수리내역이 수정되었습니다.");
				
				$(".popup_repair > h2 > input[name='rno']").val("");
				$(".popup_repair > table tr > td > textarea").val("");
				
				$(".popupWrap > .popup_repair").css("display","none");
				$(".popupWrap").css("display","none");
				
				var bno = $(".tblTop > table tr > td > input[name=bno]").val();
				draw_roomTotal(bno, "all", "rno");
				draw_roomEmpty(bno, "empty", "rno");
				draw_roomContractComplete(bno, "contractComplete", "rno");
			}
		},
		error:function(request,status,error){
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}

function post_roomDelete(info){
	$.ajax({
		url:"${pageContext.request.contextPath}/roomDeleteOne",
		type:"post",
		data : JSON.stringify(info),
        dataType : 'text',
        contentType : 'application/json; charset=UTF-8',
		async:false,
		success:function(json){
			if(json == "ok"){
				alert("삭제가 완료되었습니다.");
				
				$(".popup_roomUpdate > table tr > td > input[name='bname']").val("");
				$(".popup_roomUpdate > table tr > td > input[name='baddr_old']").val("");
				$(".popup_roomUpdate > table tr > td > input[name='baddr_new']").val("");
				$(".popup_roomUpdate > table tr > td > input[name='bpw']").val("");
				$(".popup_roomUpdate > table tr > td > input[name='heating']").val("");
				$(".popup_roomUpdate > table tr > td > input[name='boption']").val("");
				$(".popup_roomUpdate > table tr > td > input[name='completion_date']").val("");
				$(".popup_roomUpdate > table tr > td > input[name='site']").val("");
				$(".popup_roomUpdate > table tr > td > input[name='gross_area']").val("");
				$(".popup_roomUpdate > table tr > td > input[name='road']").val("");
				$(".popup_roomUpdate > table tr > td > input[name='oname']").val("");
				$(".popup_roomUpdate > table tr > td > input[name='ophone']").val("");
				$(".popup_roomUpdate > table tr > td > input[name='obirth']").val("");
				$(".popup_roomUpdate > table tr > td > input[name='memo']").val("");
				
				$(".popupWrap > .popup_roomUpdate").css("display","none");
				$(".popupWrap").css("display","none");
			}
		},
		error:function(request,status,error){
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}

function get_roomByBno(info){
	var dt;
	$.ajax({
		url:"${pageContext.request.contextPath}/getRoomByBno",
		type:"post",
		data : JSON.stringify(info),
        dataType : 'json',
        contentType : 'application/json; charset=UTF-8',
		async:false,
		success:function(json){
			dt = json;
		},
		error:function(request,status,error){
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
	return dt;
}

function get_roomByBnoState(info){
	var dt;
	$.ajax({
		url:"${pageContext.request.contextPath}/getRoomByBnoState",
		type:"post",
		data : JSON.stringify(info),
        dataType : 'json',
        contentType : 'application/json; charset=UTF-8',
		async:false,
		success:function(json){
			dt = json;
		},
		error:function(request,status,error){
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
	return dt;
}

function draw_roomTotal(bno, state, orderType){
	$("#totalInfo > table .tblContentTr").remove();
	var info = {bno:bno, state:state, orderType:orderType};
	var list = get_roomByBnoState(info);
	var txt = "";
	$(list).each(function(){
		txt += "<tr class='tblContentTr'>"
			+ "<td><select name='state'><option value='공실'>공실</option><option value='입주완료'>입주완료</option><option value='계약완료'>계약완료</option></select><input type='hidden' name='no' value='"+this.no+"'</td>"
			+ "<td>"+this.rno+"호</td>"
			+ "<td>원룸</td>"
			+ "<td>"+this.pay_type+"</td>"
			+ "<td>"+this.tenant+"</td>"
			+ "<td>"+this.phone+"</td>"
			+ "<td>"+this.check_in+"</td>"
			+ "<td>"+this.check_out+"</td>"
			+ "<td>"+this.deposit+"만원</td>"
			+ "<td>"+this.monthly_rent+"만원</td>"
			+ "<td><div class='repairSimple'>"+this.repair+"</div><div class='repairDetail'><h3><span></span> 수리내역</h3><div class='repairDetailContent'><textarea disabled>"+this.repair+"</textarea></div></div></td></tr>";
	});
	$("#totalInfo > table").append(txt);
	
	for(var i=0; i<$(list).size(); i++){
		if(list[i].state == "공실"){
			$("#totalInfo > table .tblContentTr").eq(i).find("td").eq(0).find("select > option[value='공실']").prop("selected", true);
		}else if(list[i].state == "입주완료"){
			$("#totalInfo > table .tblContentTr").eq(i).find("td").eq(0).find("select > option[value='입주완료']").prop("selected", true);
		}else if(list[i].state == "계약완료"){
			$("#totalInfo > table .tblContentTr").eq(i).find("td").eq(0).find("select > option[value='계약완료']").prop("selected", true);
		}
	}
}

function draw_roomEmpty(bno, state, orderType){
	$("#emptyRoom > table .tblContentTr").remove();
	var info = {bno:bno, state:state, orderType:orderType};
	var list = get_roomByBnoState(info);
	var txt = "";
	$(list).each(function(){
		txt += "<tr class='tblContentTr'>"
			+ "<td>"+this.rno+"호</td>"
			+ "<td><div class='repairSimple'>"+this.repair+"</div><div class='repairDetail'><h3><span></span> 수리내역</h3><div class='repairDetailContent'><textarea disabled>"+this.repair+"</textarea></div></div></td></tr>";
	});
	$("#emptyRoom > table").append(txt);
	
}

function draw_roomContractComplete(bno, state, orderType){
	$("#contractComplete > table .tblContentTr").remove();
	var info = {bno:bno, state:state, orderType:orderType};
	var list = get_roomByBnoState(info);
	var txt = "";
	$(list).each(function(){
		txt += "<tr class='tblContentTr'>"
			+ "<td>"+this.pay_type+"</td>"
			+ "<td>"+this.rno+"호</td>"
			+ "<td>"+this.company+"</td>"
			+ "<td>"+this.company_call+"</td>"
			+ "<td>"+this.check_in+"</td>"
			+ "<td>"+this.check_out+"</td>"
			+ "<td>"+this.downpayment+"만원</td>"
			+ "<td>"+this.deposit+"만원</td>"
			+ "<td>"+this.monthly_rent+"만원</td>"
			+ "<td><div class='repairSimple'>"+this.repair+"</div><div class='repairDetail'><h3><span></span> 수리내역</h3><div class='repairDetailContent'><textarea disabled>"+this.repair+"</textarea></div></div></td></tr>";
	});
	
	$("#contractComplete > table").append(txt);
}

$(function(){
	//표 드래그
	//$(".tblWrap").draggable();
	
	var bno_ = $(".tblTop > table tr > td >input[name=bno]").val();
	draw_roomTotal(bno_, "all", "rno");
	draw_roomEmpty(bno_, "empty", "rno");
	draw_roomContractComplete(bno_, "contractComplete", "rno");
	
	//팝업에서 x클릭
	$(".popup_content > h2 > img").click(function(){
		$(".popup_content input").val("");
		$(".popup_content select > option").eq(0).prop("selected", true);
		
		$(".popupWrap > .popup_content").css("display","none");
		$(".popupWrap").css("display","none");
		draw_roomTotal(bno_, "all", "rno");
	});
	
	//건물정보 수정 클릭
	$(".updateBtnDiv > p").click(function(){
		var bno = $(".tblTop > table tr > td > input[name='bno']").val();
		var info = get_buiInfo(bno);
		var ownerId = get_ownerInfo(info.ono);
		
		$(".popup_buiUpdate > table tr > td > input[name='bno']").val(info.bno);
		$(".popup_buiUpdate > table tr > td > input[name='bname']").val(info.bname);
		$(".popup_buiUpdate > table tr > td > input[name='baddr_old']").val(info.baddr_old);
		$(".popup_buiUpdate > table tr > td > input[name='baddr_new']").val(info.baddr_new);
		$(".popup_buiUpdate > table tr > td > input[name='bpw']").val(info.bpw);
		$(".popup_buiUpdate > table tr > td > input[name='heating']").val(info.heating);
		$(".popup_buiUpdate > table tr > td > input[name='boption']").val(info.boption);
		$(".popup_buiUpdate > table tr > td > input[name='completion_date']").val(info.completion_date);
		$(".popup_buiUpdate > table tr > td > input[name='site']").val(info.site);
		$(".popup_buiUpdate > table tr > td > input[name='gross_area']").val(info.gross_area);
		$(".popup_buiUpdate > table tr > td > input[name='road']").val(info.road);
		$(".popup_buiUpdate > table tr > td > input[name='oname']").val(info.oname);
		$(".popup_buiUpdate > table tr > td > input[name='ophone']").val(info.ophone);
		$(".popup_buiUpdate > table tr > td > input[name='obirth']").val(info.obirth);
		$(".popup_buiUpdate > table tr > td#ownerId").text(ownerId.id);
		$(".popup_buiUpdate > table tr > td > input[name='memo']").val(info.memo);
		
		$(".popupWrap").css("display","block");
		$(".popupWrap > .popup_buiUpdate").css("display","block");
	});
	
	//건물정보 수정 팝업 버튼 클릭
	$(".popup_buiUpdate_btn_wrap > p").click(function(){
		var  btnIdx = $(this).index();
		if(btnIdx == 0){
			var bno = $(".popup_buiUpdate > table tr > td > input[name='bno']").val();
			var bname = $(".popup_buiUpdate > table tr > td > input[name='bname']").val();
			var baddr_old = $(".popup_buiUpdate > table tr > td > input[name='baddr_old']").val();
			var baddr_new = $(".popup_buiUpdate > table tr > td > input[name='baddr_new']").val();
			var bpw = $(".popup_buiUpdate > table tr > td > input[name='bpw']").val();
			var heating = $(".popup_buiUpdate > table tr > td > input[name='heating']").val();
			var boption = $(".popup_buiUpdate > table tr > td > input[name='boption']").val();
			var completion_date = $(".popup_buiUpdate > table tr > td > input[name='completion_date']").val();
			var site = $(".popup_buiUpdate > table tr > td > input[name='site']").val();
			var gross_area = $(".popup_buiUpdate > table tr > td > input[name='gross_area']").val();
			var road = $(".popup_buiUpdate > table tr > td > input[name='road']").val();
			var oname = $(".popup_buiUpdate > table tr > td > input[name='oname']").val();
			var ophone = $(".popup_buiUpdate > table tr > td > input[name='ophone']").val();
			var obirth = $(".popup_buiUpdate > table tr > td > input[name='obirth']").val();
			var memo = $(".popup_buiUpdate > table tr > td > input[name='memo']").val();
			
			var vo ={bno:bno, bname:bname, baddr_old:baddr_old, baddr_new:baddr_new, bpw:bpw, heating:heating, boption:boption, completion_date:completion_date, site:site, gross_area:gross_area, road:road, oname:oname, ophone:ophone, obirth:obirth, memo:memo}
			post_buiUpdate(vo);
		}else if(btnIdx == 1){
			var reply = confirm("삭제 후 해당 건물 정보를 볼 수 없습니다.\n삭제하시겠습니까?");
			if(reply == true){
				var bno = $(".tblTop > table tr > td > input[name='bno]").val();
				alert("추후 업데이트 예정");
				//post_buiDelete(bno);
			}
		}
	});
	
	//종합현황 정렬
	$(document).on("change", "#totalInfo > select", function(){
		var orderType = $(this).val();
		$("#totalInfo > table .tblContentTr").remove();
		if(orderType == "rno"){
			draw_roomTotal(bno_, "all", "rno");
		}else if(orderType == "chkin"){
			draw_roomTotal(bno_, "all", "chkin");
		}else if(orderType == "chkout"){
			draw_roomTotal(bno_, "all", "chkout");
		}else{
			draw_roomTotal(bno_, "all", "rno");
		}
	});
	
	//계약완료 정렬
	$(document).on("change", "#contractComplete > select", function(){
		var orderType = $(this).val();
		$("#contractComplete > table .tblContentTr").remove();
		if(orderType == "rno"){ 
			draw_roomContractComplete(bno_, "contractComplete", "rno");
		}else if(orderType == "chkin"){
			draw_roomContractComplete(bno_, "contractComplete", "chkin");
		}else if(orderType == "chkout"){
			draw_roomContractComplete(bno_, "contractComplete", "chkout");
		}else{
			draw_roomContractComplete(bno_, "contractComplete", "rno");
		}
	});
	
	//종합현황 수리내역 hover
	$(document).on("mouseover", "#totalInfo > table .tblContentTr > td:last-child", function(){
		var rno = $(this).parent().find("td").eq(1).text();
		$(this).find(".repairDetail > h3 > span").text(rno);
		$(this).find(".repairDetail").css("display", "block");
	});
	$(document).on("mouseout", "#totalInfo > table .tblContentTr > td:last-child", function(){
		$(this).find(".repairDetail > h3 > span").text("");
		$(this).find(".repairDetail").css("display", "none");
	});
	
	//공실 수리내역 hover
	$(document).on("mouseover", "#emptyRoom > table .tblContentTr > td", function(){
		var rno = $(this).parent().find("td").eq(0).text();
		$(this).find(".repairDetail > h3 > span").text(rno);
		$(this).find(".repairDetail").css({"left":"200px", "bottom":"10px", "display":"block"});
	});
	$(document).on("mouseout", "#emptyRoom > table .tblContentTr > td", function(){
		$(this).find(".repairDetail > h3 > span").text("");
		$(this).find(".repairDetail").css("display", "none");
	});
	
	//공실 수리내역 hover
	$(document).on("mouseover", "#contractComplete > table .tblContentTr > td:last-child", function(){
		var rno = $(this).parent().find("td").eq(1).text();
		$(this).find(".repairDetail > h3 > span").text(rno);
		$(this).find(".repairDetail").css("display", "block");
	});
	$(document).on("mouseout", "#contractComplete > table .tblContentTr > td:last-child", function(){
		$(this).find(".repairDetail > h3 > span").text("");
		$(this).find(".repairDetail").css("display", "none");
	});
	
	//종합현황 수리내역 클릭
	$(document).on("click", "#totalInfo > table .tblContentTr > td:last-child", function(){
		var repairContent = $(this).find(".repairSimple").text();
		var no = $(this).parent().find("td").eq(0).find("input[name='no']").val();
		
		$(".popup_repair > h2 > input[name='no']").val(no);
		$(".popup_repair > table tr > td > textarea").val(repairContent);
		$(".popup_repair").css("display","block");
		$(".popupWrap").css("display", "block");
	});
	
	//종합현황 수리내역 팝업 +클릭
	$(document).on("click", ".popup_repair > .popup_btnWrap > p", function(){
		var repairContent = $(".popup_repair > table tr > td > textarea").val();
		var bno = $(".tblTop > table tr > td > input[name=bno]").val();
		var no = $(".popup_repair > h2 > input[name='no']").val();
		var info = {bno:bno, no:no, repair:repairContent};
		post_updateRepair(info);
	})
	
	//방 추가 클릭
	$("#addRoomBtn").click(function(){
		$(".popupWrap").css("display", "block");
		$(".popupWrap > .popup_roomRegister").css("display", "block");
	});

	//방 추가 팝업 버튼 클릭
	$(".popup_roomRegister_btn_wrap > p").click(function(){
		var  btnIdx = $(this).index();
		if(btnIdx == 0){
			
			var bno = $(".tblTop > table tr > td > input[name='bno']").val();
			var bname = $(".tblTop > table tr:first-child > td").eq(0).text(); 
			var state = $(".popup_roomRegister > table tr > td > select[name='state']").val();
			var room_type = $(".popup_roomRegister > table tr > td > select[name='room_type']").val();
			var pay_type = $(".popup_roomRegister > table tr > td > select[name='pay_type']").val();
			var rno = $(".popup_roomRegister > table tr > td > input[name='rno']").val();
			var tenant = $(".popup_roomRegister > table tr > td > input[name='tenant']").val();
			var phone = $(".popup_roomRegister > table tr > td > input[name='phone']").val();
			var check_in = $(".popup_roomRegister > table tr > td > input[name='check_in']").val();
			var check_out = $(".popup_roomRegister > table tr > td > input[name='check_out']").val();
			var deposit = $(".popup_roomRegister > table tr > td > input[name='deposit']").val();
			var monthly_rent = $(".popup_roomRegister > table tr > td > input[name='monthly_rent']").val();
			var rpw = $(".popup_roomRegister > table tr > td > input[name='rpw']").val();
			var hope_price = $(".popup_roomRegister > table tr > td > input[name='hope_price']").val();
			var selling_type = $(".popup_roomRegister > table tr > td > select[name='selling_type']").val();
			var repair = $(".popup_roomRegister > table tr > td > textarea[name='repair']").val();
			var company = $(".popup_roomRegister > table tr > td > input[name='company']").val();
			var company_call = $(".popup_roomRegister > table tr > td > input[name='company_call']").val();
			var downpayment = $(".popup_roomRegister > table tr > td > input[name='downpayment']").val();
			
			if(deposit == ""){
				deposit = 0;
			}
			if(monthly_rent == ""){
				monthly_rent = 0;
			}
			if(downpayment == ""){
				downpayment = 0;
			}
			if(repair.length == 0){
				repair = " "
			}
			
			var vo = {
					no:0, bno:bno, bname:bname, rno:rno, state:state, room_type:room_type, pay_type:pay_type, tenant:tenant, phone:phone, check_in:check_in, check_out:check_out, deposit:deposit, 
					monthly_rent:monthly_rent, hope_price:hope_price, selling_type:selling_type, repair:repair, rpw:rpw, company:company, company_call:company_call, downpayment:downpayment
			}
			
			post_roomRegister(vo);
		}else if(btnIdx == 1){
			var reply = confirm("삭제 후 해당 건물 정보를 볼 수 없습니다.\n삭제하시겠습니까?");
			if(reply == true){
				console.log('삭제');
			}
		}else if(btnIdx == 2){
			$(".popupWrap > .popup_roomRegister > table tr > td > input").val("");
			$(".popupWrap > .popup_roomRegister").css("display","none");
			$(".popupWrap").css("display","none");
		}
	});
	
	$(document).on("change", "#totalInfo > table .tblContentTr > td:nth-child(1) > select", function(){
		var no = $(this).parent().find("input[name='no']").val();
		var info = get_roomInfo(no);
		
		var idx = 0;
		var state = $(this).val();
		if(state == "공실"){
			$(".popup_roomUpdateEmpty > h2 > input[name='no']").val(no);
			$(".popup_roomUpdateEmpty > table tr > td > select[name='state'] > option[value='"+state+"']").prop("selected", true);
			$(".popup_roomUpdateEmpty > table tr > td > select[name='room_type'] > option[value='"+info.room_type+"']").prop("selected", true);
			$(".popup_roomUpdateEmpty > table tr > td > select[name='pay_type'] > option[value='"+info.pay_type+"']").prop("selected", true);
			$(".popup_roomUpdateEmpty > table tr > td > input[name='rno']").val(info.rno);
			$(".popup_roomUpdateEmpty > table tr > td > input[name='tenant']").val(info.tenant);
			$(".popup_roomUpdateEmpty > table tr > td > input[name='phone']").val(info.phone);
			$(".popup_roomUpdateEmpty > table tr > td > input[name='check_in']").val(info.check_in);
			$(".popup_roomUpdateEmpty > table tr > td > input[name='check_out']").val(info.check_out);
			$(".popup_roomUpdateEmpty > table tr > td > input[name='deposit']").val(info.deposit);
			$(".popup_roomUpdateEmpty > table tr > td > input[name='monthly_rent']").val(info.monthly_rent);
			$(".popup_roomUpdateEmpty > table tr > td > input[name='rpw']").val(info.rpw);
			$(".popup_roomUpdateEmpty > table tr > td > input[name='hope_price']").val(info.hope_price);
			$(".popup_roomUpdateEmpty > table tr > td > select[name='selling_type'] > option[value='"+info.selling_type+"']").prop("selected", true);
			$(".popup_roomUpdateEmpty > table tr > td > input[name='repair']").val(info.repair);
			
			$(".popupWrap").css("display", "block");
			$(".popupWrap > .popup_roomUpdateEmpty").css("display", "block");
		}else if(state == "입주완료"){
			$(".popup_roomUpdateComplete > h2 > input[name='no']").val(no);
			$(".popup_roomUpdateComplete > table tr > td > select[name='state'] > option[value='"+info.state+"']").prop("selected", true);
			$(".popup_roomUpdateComplete > table tr > td > select[name='room_type'] > option[value='"+info.room_type+"']").prop("selected", true);
			$(".popup_roomUpdateComplete > table tr > td > select[name='pay_type'] > option[value='"+info.pay_type+"']").prop("selected", true);
			$(".popup_roomUpdateComplete > table tr > td > input[name='rno']").val(info.rno);
			$(".popup_roomUpdateComplete > table tr > td > input[name='tenant']").val(info.tenant);
			$(".popup_roomUpdateComplete > table tr > td > input[name='phone']").val(info.phone);
			$(".popup_roomUpdateComplete > table tr > td > input[name='check_in']").val(info.check_in);
			$(".popup_roomUpdateComplete > table tr > td > input[name='check_out']").val(info.check_out);
			$(".popup_roomUpdateComplete > table tr > td > input[name='deposit']").val(info.deposit);
			$(".popup_roomUpdateComplete > table tr > td > input[name='monthly_rent']").val(info.monthly_rent);
			$(".popup_roomUpdateComplete > table tr > td > input[name='rpw']").val(info.rpw);
			$(".popup_roomUpdateComplete > table tr > td > input[name='hope_price']").val(info.hope_price);
			$(".popup_roomUpdateComplete > table tr > td > select[name='selling_type'] > option[value='"+info.selling_type+"']").prop("selected", true);
			$(".popup_roomUpdateComplete > table tr > td > input[name='repair']").val(info.repair);
			
			$(".popupWrap").css("display", "block");
			$(".popupWrap > .popup_roomUpdateComplete").css("display", "block");
		}else if(state == "계약완료"){
			$(".popup_roomUpdateContractComp > h2 > input[name='no']").val(no);
			$(".popup_roomUpdateContractComp > table tr > td > select[name='state'] > option[value='"+info.state+"']").prop("selected", true);
			$(".popup_roomUpdateContractComp > table tr > td > select[name='room_type'] > option[value='"+info.room_type+"']").prop("selected", true);
			$(".popup_roomUpdateContractComp > table tr > td > select[name='pay_type'] > option[value='"+info.pay_type+"']").prop("selected", true);
			$(".popup_roomUpdateContractComp > table tr > td > input[name='rno']").val(info.rno);
			$(".popup_roomUpdateContractComp > table tr > td > input[name='tenant']").val(info.tenant);
			$(".popup_roomUpdateContractComp > table tr > td > input[name='phone']").val(info.phone);
			$(".popup_roomUpdateContractComp > table tr > td > input[name='check_in']").val(info.check_in);
			$(".popup_roomUpdateContractComp > table tr > td > input[name='check_out']").val(info.check_out);
			$(".popup_roomUpdateContractComp > table tr > td > input[name='deposit']").val(info.deposit);
			$(".popup_roomUpdateContractComp > table tr > td > input[name='monthly_rent']").val(info.monthly_rent);
			$(".popup_roomUpdateContractComp > table tr > td > input[name='rpw']").val(info.rpw);
			$(".popup_roomUpdateContractComp > table tr > td > input[name='hope_price']").val(info.hope_price);
			$(".popup_roomUpdateContractComp > table tr > td > select[name='selling_type'] > option[value='"+info.selling_type+"']").prop("selected", true);
			$(".popup_roomUpdateContractComp > table tr > td > input[name='repair']").val(info.repair);
			
			$(".popupWrap").css("display", "block");
			$(".popupWrap > .popup_roomUpdateContractComp").css("display", "block");
		}
	});
	
	//공실수정 팝업에서 버튼클릭
	$(".popup_roomUpdateEmpty > .popup_roomUpdate_btn_wrap > p").click(function(){
		var idx = $(this).index();
		var no = $(".popup_roomUpdateEmpty > h2 > input[name='no']").val();
		if(idx == 0){
			var info = get_roomInfo(no);
			
			var bno = $(".tblTop > table tr > td > input[name='bno']").val();
			var bname = $(".tblTop > table tr:first-child > td").eq(0).text(); 
			var state = $(".popup_roomUpdateEmpty > table tr > td > select[name='state']").val();
			var room_type = $(".popup_roomUpdateEmpty > table tr > td > select[name='room_type']").val();
			var rno = $(".popup_roomUpdateEmpty > table tr > td > input[name='rno']").val();
			var rpw = $(".popup_roomUpdateEmpty > table tr > td > input[name='rpw']").val();
			var hope_price = $(".popup_roomUpdateEmpty > table tr > td > input[name='hope_price']").val();
			var selling_type = $(".popup_roomUpdateEmpty > table tr > td > select[name='selling_type']").val();
			 
			var vo = {
					no:no, bno:bno, bname:bname, rno:rno, state:state, room_type:room_type, pay_type:info.pay_type, tenant:"", phone:"", check_in:"", check_out:"", deposit:"0", 
					monthly_rent:"0", hope_price:hope_price, selling_type:selling_type, repair:"", rpw:rpw, company:"", company_call:"", downpayment:"0", prevState:info.state
			}
			post_roomUpdate(vo);
		}else{
			var reply = confirm("삭제 후 해당 정보를 되돌릴 수 없습니다.\n삭제하시겠습니까?");
			if(reply == true){
				var bno = $(".tblTop > table tr > td > input[name='bno']").val();
				var rno = $(".popup_roomUpdateEmpty > table tr > td > input[name='rno']").val();
				
				var info={no:no, bno:bno, rno:rno};
				
				post_roomDelete(info);
			}
		}
	});
	
});
</script>
</head>
<body>
	<div class="allWrap">
		<div class="popupWrap">
			<jsp:include page="../include/managerBuiInfoPopup.jsp"></jsp:include>
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
					<div class="tblTop">
						<table>
							<tr>
								<th>건물명</th>
								<td>${buiVO.bname}<input type="hidden" name="bno" value="${buiVO.bno}"></td>
								<th>주소</th>
								<c:choose>
									<c:when test="${buiVO.baddr_old == ''}">
										<td colspan="3">${buiVO.baddr_new}</td>
									</c:when>
									<c:otherwise>
										<td colspan="3">${buiVO.baddr_old}</td>
									</c:otherwise>
								</c:choose>
							</tr>							
							<tr>
								<th>메모</th>
								<td colspan="5">${buiVO.memo}</td>
							</tr>
						</table>
						<div class="updateBtnDiv">
							<p>수정</p>
						</div>
					</div><!-- tblTop end -->
					<div class="tblTop2">
						<table>
							<tr>
								<th>방개수</th>
								<td>${buiVO.cnt_complete + buiVO.cnt_contract_complete + buiVO.cnt_empty}개</td>
								<th>입주완료</th>
								<td>${buiVO.cnt_complete}개</td>
								<th>계약완료</th>
								<td>${buiVO.cnt_contract_complete}개</td>
								<th>공실</th>
								<td>${buiVO.cnt_empty}개</td>
								<th>월세합계</th>
								<td>${buiVO.total_monthly_rent} 만원</td>
								<th>보증금 합계</th>
								<td>${buiVO.total_deposit} 만원</td>
							</tr>
						</table>
					</div><!-- tblTop2 end -->
					<div class="tblBottom">
						<div class="tblWrap" id="totalInfo">
							<button id="addRoomBtn"><img src="${pageContext.request.contextPath}/resources/images/icon_plus.png"></button>
							<select>
								<option>정렬선택</option>
								<option value="rno">호실</option>
								<option value="chkin">입주일</option>
								<option value="chkout">퇴실일</option>
							</select>
							<table>
								<tr>
									<th colspan="11">종합현황</th>
								</tr>
								<tr>
									<th>상태</th>
									<th>호실</th>
									<th>타입</th>
									<th>구분</th>
									<th>이름</th>
									<th>전화번호</th>
									<th>입주일</th>
									<th>퇴실일</th>
									<th>보증금</th>
									<th>월세</th>
									<th>수리내역</th>
								</tr>
								
							</table>
						</div>
						<div class="tblWrap" id="emptyRoom">
							<!-- <select>
								<option>정렬선택</option>
								<option>호실</option>
								<option>입주일</option>
								<option>퇴실일</option>
							</select> -->
							<table>
								<tr>
									<th colspan="2">공실현황</th>
								</tr>
								<tr>
									<th>호실</th>
									<th>수리내역</th>
								</tr>
							</table>
						</div>
						<div class="tblWrap" id="contractComplete">
							<select>
								<option>정렬선택</option>
								<option value="rno">호실</option>
								<option value="chkin">입주일</option>
								<option value="chkout">퇴실일</option>
							</select>
							<table>
								<tr>
									<th colspan="10">계약완료 현황</th>
								</tr>
								<tr>
									<th>구분</th>
									<th>호실</th>
									<th>중개인</th>
									<th>중개인연락처</th>
									<th>입주일</th>
									<th>퇴실일</th>
									<th>계약금</th>
									<th>보증금</th>
									<th>월세</th>
									<th>수리요청</th>
								</tr>
							</table>
						</div>
					</div><!-- tblBottom end -->
				</div><!-- section end -->
			</div><!-- sectionWrap end -->
		</div><!-- rightAside end -->
	</div><!-- allWrap end -->
</body>
</html>