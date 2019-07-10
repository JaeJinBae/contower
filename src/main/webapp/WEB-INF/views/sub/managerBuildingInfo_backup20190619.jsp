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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/calendar.js"></script>
<style>
	.allWrap{
		width: 100%;
	}
	.popupWrap{
		width:100%;
		position:fixed;
		top:0;
		left:0; 
		display:none;
		z-index: 9999;
	}
	
	.headerWrap{
		width: 100%;
		height: 70px;
		background: #475c6f;
	}
	.sectionWrap{
		width: 100%;
		clear: both;
		margin-bottom: 20px;
	}
	.sectionTitle{
		width: 100%;
		background: #efefef;
	}
	.sectionTitle > p{
		width: 1100px;
		font-size: 25px;
		padding: 15px 20px;
	}
	.sectionTitle > p > img:first-child{
		width: 20px;
		vertical-align: middle;
		margin-right: 10px;
	}
	.sectionTitle > p > img:last-child{
		width: 500px;
		vertical-align: middle;
		margin-left: 15px;
	}
	.section{
		width: 100%;
		padding: 20px;
	}
	.tblTop{
		overflow: hidden;
		margin-bottom: 10px;
	}
	.tblTop > table{
		float:left;
		background: #fff;
	}
	.tblTop > table tr{
		
	}
	.tblTop > table tr > th{
		background: #7b93a8;
		color: #fff;
		font-size: 15px;
		padding: 7px 10px;
		border: 1px solid lightgray;
		letter-spacing: 1px;
	}
	.tblTop > table tr > td{
		font-size: 15px;
		padding: 7px 10px;
		border: 1px solid lightgray;
	}
	.updateBtnDiv{
		float:left;
		margin-left: 20px;
	}
	.updateBtnDiv > p{
		background: #105340;
		color: #fefefe;
		font-size: 15px;
		padding: 7px 15px;
		border-radius: 4px;
		letter-spacing: 2px;
		cursor: pointer;
	}
	.m2{
		width: 20px;
	}
	
	
	.tblTop2{
		margin-bottom: 25px;
	}
	.tblTop2 > table{
		background: #fff;
	}
	.tblTop2 > table tr{
		
	}
	.tblTop2 > table tr > th{
		background: #7b93a8;
		color: #fff;
		font-size: 15px;
		padding: 7px 10px;
		border: 1px solid lightgray;
		letter-spacing: 1px;
	}
	.tblTop2 > table tr > td{
		font-size: 15px;
		padding: 7px 10px;
		border: 1px solid lightgray;
	}
	.tblBottom{ 
		width: 100%;
		/* overflow: auto; */
	}
	.tblBottom > table{
		margin: 10px 0;
		display: inline;
		/* float:left; */
	}
	.tblBottom > table tr{
		background: #fff;
	}
	.tblBottom > table tr > th{
		background: #7b93a8;
		color: #fff;
		font-size: 15px;
		padding: 7px 10px;
		border: 1px solid lightgray;
		letter-spacing: 1px;
	}
	.tblBottom > table tr > th > select{
		float: right;
		font-size: 14px;
		padding: 3px;
		margin-left: 10px;
	}
	.tblBottom > table tr > th > #addRoomBtn{
		background: #0881c6;
		color: #efefef;
		font-size:14px;
		padding: 5px 7px;
		border-radius: 4px;
		float: right;
	}
	.tblBottom > table tr > td{
		font-size: 15px;
		padding: 7px 10px;
		border: 1px solid lightgray;
		text-align: center;
	}
	.tblBottom > table tr:first-child > th{
		background: #475c6f;
		overflow: hidden;
	}
	.tblBottom > table .tblContentTr:nth-child(even){
		background: #efefef;
	}
	.tblContentTr > td > button{
		background: #105340;
		color: #efefef;
		font-size:14px;
		padding: 5px 7px;
		border-radius: 4px;
	}
	
	
	.footerWrap{
		display: none;
		width: 100%;
		height: 70px;
		background: #7b93a8;
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

$(function(){
	//표 크기 변경
	/* $(".tblBottom > table").mousemove(function(e){
		var x = e.pageX-$(this).position().left;
		var y = e.pageY-$(this).position().top;
		var z = $(this).width();

		if((x>(z-10)&&x<z)){
			$("#aaa").html('a');
			$(this).css("cursor", "e-resize");
			$(this).resizable({
				minHeight:25
			});
			}else{
				$(this).css("cursor", "default");
			}
	}).mouseout(function(){
		$(this).css("cursor", "default");
	}); */
	
	//표 드래그
	$(".tblBottom > table").draggable();
	
	
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
		}else if(btnIdx == 2){
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
	});
	
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
			var repair = $(".popup_roomRegister > table tr > td > input[name='repair']").val();
			
			var vo = {
					no:0, bno:bno, bname:bname, rno:rno, state:state, room_type:room_type, pay_type:pay_type, tenant:tenant, phone:phone, check_in:check_in, check_out:check_out,
					deposit:deposit, monthly_rent:monthly_rent, hope_price:hope_price, selling_type:selling_type, repair:repair, rpw:rpw
			}

			console.log(vo);
			
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
	
	//방정보 수정 클릭
	$(".tblContentTr > td > button").click(function(){
		var no = $(this).parent().find("input[name='no']").val();
		var info = get_roomInfo(no);
		
		$(".popup_roomUpdate > h2 > input[name='no']").val(no);
		$(".popup_roomUpdate > table tr > td > select[name='state'] > option[value='"+info.state+"']").prop("selected", true);
		$(".popup_roomUpdate > table tr > td > select[name='room_type'] > option[value='"+info.room_type+"']").prop("selected", true);
		$(".popup_roomUpdate > table tr > td > select[name='pay_type'] > option[value='"+info.pay_type+"']").prop("selected", true);
		$(".popup_roomUpdate > table tr > td > input[name='rno']").val(info.rno);
		$(".popup_roomUpdate > table tr > td > input[name='tenant']").val(info.tenant);
		$(".popup_roomUpdate > table tr > td > input[name='phone']").val(info.phone);
		$(".popup_roomUpdate > table tr > td > input[name='check_in']").val(info.check_in);
		$(".popup_roomUpdate > table tr > td > input[name='check_out']").val(info.check_out);
		$(".popup_roomUpdate > table tr > td > input[name='deposit']").val(info.deposit);
		$(".popup_roomUpdate > table tr > td > input[name='monthly_rent']").val(info.monthly_rent);
		$(".popup_roomUpdate > table tr > td > input[name='rpw']").val(info.rpw);
		$(".popup_roomUpdate > table tr > td > input[name='hope_price']").val(info.hope_price);
		$(".popup_roomUpdate > table tr > td > select[name='selling_type'] > option[value='"+info.selling_type+"']").prop("selected", true);
		$(".popup_roomUpdate > table tr > td > input[name='repair']").val(info.repair);
		
		$(".popupWrap").css("display", "block");
		$(".popupWrap > .popup_roomUpdate").css("display", "block");
	});
	
	//방정보 수정 팝업에서 입주상태 공실로 바뀐경우
	$(".popup_roomUpdate > table tr > td > select[name='state']").change(function(){
		var res = $(this).val();
		if(res == "공실"){
			$(".popup_roomUpdate > table tr > td > input[name='tenant']").val("");
			$(".popup_roomUpdate > table tr > td > input[name='phone']").val("");
			$(".popup_roomUpdate > table tr > td > input[name='check_in']").val("");
			$(".popup_roomUpdate > table tr > td > input[name='check_out']").val("");
			$(".popup_roomUpdate > table tr > td > input[name='deposit']").val(0);
			$(".popup_roomUpdate > table tr > td > input[name='monthly_rent']").val(0);
		}
	});
	
	//방정보 수정 팝업 버튼 클릭
	$(".popup_roomUpdate_btn_wrap > p").click(function(){
		var  btnIdx = $(this).index();
		if(btnIdx == 0){
			
			var no = $(".popup_roomUpdate > h2 > input[name='no']").val();
			var bno = $(".tblTop > table tr > td > input[name='bno']").val();
			var state = $(".popup_roomUpdate > table tr > td > select[name='state']").val();
			var room_type = $(".popup_roomUpdate > table tr > td > select[name='room_type']").val();
			var pay_type = $(".popup_roomUpdate > table tr > td > select[name='pay_type']").val();
			var rno = $(".popup_roomUpdate > table tr > td > input[name='rno']").val();
			var tenant = $(".popup_roomUpdate > table tr > td > input[name='tenant']").val();
			var phone = $(".popup_roomUpdate > table tr > td > input[name='phone']").val();
			var check_in = $(".popup_roomUpdate > table tr > td > input[name='check_in']").val();
			var check_out = $(".popup_roomUpdate > table tr > td > input[name='check_out']").val();
			var deposit = $(".popup_roomUpdate > table tr > td > input[name='deposit']").val();
			var monthly_rent = $(".popup_roomUpdate > table tr > td > input[name='monthly_rent']").val();
			var rpw = $(".popup_roomUpdate > table tr > td > input[name='rpw']").val();
			var hope_price = $(".popup_roomUpdate > table tr > td > input[name='hope_price']").val();
			var selling_type = $(".popup_roomUpdate > table tr > td > select[name='selling_type']").val();
			var repair = $(".popup_roomUpdate > table tr > td > input[name='repair']").val();
			
			var prevState = $(".tblContentTr > td:nth-child(1) > input[value='"+no+"']").parent().next().text();

			var vo = {no:no, bno:bno, rno:rno, state:state, room_type:room_type, pay_type:pay_type, tenant:tenant, phone:phone, check_in:check_in, check_out:check_out, deposit:deposit,
					monthly_rent:monthly_rent, hope_price:hope_price, selling_type:selling_type, repair:repair, prevState:prevState};
			
			post_roomUpdate(vo);
			
		}else if(btnIdx == 1){
			var reply = confirm("삭제 후 해당 정보를 되돌릴 수 없습니다.\n삭제하시겠습니까?");
			if(reply == true){
				var no = $(".popup_roomUpdate > h2 > input[name='no']").val();
				var bno = $(".tblTop > table tr > td > input[name='bno']").val();
				var rno = $(".popup_roomUpdate > table tr > td > input[name='rno']").val();
				
				var info={no:no, bno:bno, rno:rno};
				
				post_roomDelete(info);
			}
		}else if(btnIdx == 2){
			$(".popupWrap > .popup_roomUpdate > table tr > td > input").val("");
			$(".popupWrap > .popup_roomUpdate").css("display","none");
			$(".popupWrap").css("display","none");
		}
	});
});
</script>
</head>
<body>
	<div class="allWrap">
		<div class ="popupWrap">
			<jsp:include page="../include/managerBuiInfoPopup.jsp"></jsp:include>
		</div>
		<div class="headerWrap">
			<jsp:include page="../include/managerHeader.jsp"></jsp:include>
		</div>
		<div class="sectionWrap">
			<div class="sectionTitle">
				<p><img src="${pageContext.request.contextPath}/resources/images/icon_plus_cr.png"><span>관리건물상세</span><img src="${pageContext.request.contextPath}/resources/images/icon_line.png"></p>
			</div>
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
							<th>공동현관</th>
							<td>${buiVO.bpw}</td>
							<th>난방</th>
							<td>${buiVO.heating}</td>
							<th>옵션</th>
							<td>${buiVO.boption}</td>
						</tr>
						<tr>
							<th>대지</th>
							<td>${buiVO.site}<img class="m2" src="${pageContext.request.contextPath}/resources/images/m2.png"></td>
							<th>연면적</th>
							<td>${buiVO.gross_area}<img class="m2" src="${pageContext.request.contextPath}/resources/images/m2.png"></td>
							<th>도로</th>
							<td>${buiVO.road}</td>
						</tr>
						<tr>
							<th>건축주</th>
							<td>${buiVO.oname}</td>
							<th>연락처</th>
							<td>${buiVO.ophone}</td>
							<th>생년월일</th>
							<td>${buiVO.obirth}</td>
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
					<table>
						<tr>
							<th colspan="12">
								종합현황
								<select>
									<option>정렬선택</option>
									<option>호실</option>
									<option>입주일</option>
									<option>퇴실일</option>
								</select>
								<button id="addRoomBtn">추가</button>
							</th>
						</tr>
						<tr>
							<th>선택</th>
							<th>상태</th>
							<th>타입</th>
							<th>구분</th>
							<th>호실</th>
							<th>이름</th>
							<th>전화번호</th>
							<th>입주일</th>
							<th>퇴실일</th>
							<th>보증금</th>
							<th>월세</th>
							<th>수리내역</th>
						</tr>
						<c:forEach var="item" items="${roomList}">
							<tr class="tblContentTr">
								<td><button>수정</button><input type="hidden" name="no" value="${item.no}"></td>
								<td>${item.state}</td>
								<c:choose>
									<c:when test="${item.room_type eq 'one'}">
										<td>원룸</td>
									</c:when>
									<c:when test="${item.room_type eq 'mitwo'}">
										<td>미니투룸</td>
									</c:when>
									<c:when test="${item.room_type eq 'two'}">
										<td>투룸</td>
									</c:when>
									<c:when test="${item.room_type eq 'three'}">
										<td>쓰리룸</td>
									</c:when>
									<c:when test="${item.room_type eq 'owner'}">
										<td>주인세대</td>
									</c:when>
									<c:when test="${item.room_type eq 'store'}">
										<td>상가</td>
									</c:when>
								</c:choose>
								
								<td>${item.pay_type}</td>
								<td>${item.rno}호</td>
								<td>${item.tenant}</td>
								<td>${item.phone}</td>
								<td>${item.check_in}</td>
								<td>${item.check_out}</td>
								<td>${item.deposit}</td>
								<td>${item.monthly_rent}</td>
								<td>${item.repair}</td>
							</tr>
						</c:forEach>
					</table>
					<table>
						<tr>
							<th colspan="2">공실현황
								<select>
									<option>정렬선택</option>
									<option>호실</option>
									<option>입주일</option>
									<option>퇴실일</option>
								</select>
							</th>
						</tr>
						<tr>
							<th>호실</th>
							<th>수리내역</th>
						</tr>
						<c:set var="cnt" value="0" ></c:set>
						<c:forEach var="item" items="${roomList}">
							<c:if test="${item.state eq '공실'}">
								<c:set var="cnt" value="${cnt+1}"></c:set>
							</c:if>
						</c:forEach>
						<c:choose>
							<c:when test="${cnt==0}">
								<tr>
									<td colspan="2">공실이 존재하지 없습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="item" items="${roomList}">
									<c:if test="${item.state eq '공실'}">
										<tr class="tblContentTr">
											<td>${item.rno}호</td>
											<td>${item.repair}</td>
										</tr>
									</c:if>
								</c:forEach>
								<c:set var="cnt" value="0"></c:set>
							</c:otherwise>
						</c:choose>
					</table>
					<table>
						<tr>
							<th colspan="9">계약완료 현황
								<select>
									<option>정렬선택</option>
									<option>호실</option>
									<option>입주일</option>
									<option>퇴실일</option>
								</select>
							</th>
						</tr>
						<tr>
							<th>구분</th>
							<th>호실</th>
							<th>이름</th>
							<th>전화번호</th>
							<th>입주일</th>
							<th>퇴실일</th>
							<th>보증금</th>
							<th>월세</th>
							<th>수리내역</th>
						</tr>
						<c:forEach var="item" items="${roomList}">
							<c:if test="${item.state eq '계약완료'}">
								<c:set var="cnt" value="${cnt+1}"></c:set>
							</c:if>
						</c:forEach>
						<c:choose>
							<c:when test="${cnt==0}">
								<tr>
									<td colspan="9">계약완료된 방이 없습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="item" items="${roomList}">
									<c:if test="${item.state eq '계약완료'}">
										<tr class="tblContentTr">
											<td>${item.pay_type}</td>
											<td>${item.rno}호</td>
											<td>${item.tenant}</td>
											<td>${item.phone}</td>
											<td>${item.check_in}</td>
											<td>${item.check_out}</td>
											<td>${item.deposit}</td>
											<td>${item.monthly_rent}</td>
											<td>${item.repair}</td>
										</tr>
									</c:if>
								</c:forEach>
								<c:set var="cnt" value="0"></c:set>
							</c:otherwise>
						</c:choose>
					</table>
					<table>
						<tr>
							<th colspan="3">수리내역
								<select>
									<option>정렬선택</option>
									<option>호실</option>
									<option>입주일</option>
									<option>퇴실일</option>
								</select>
							</th>
						</tr>
						<tr>
							<th>상태</th>
							<th>호실</th>
							<th>수리내역</th>
						</tr>
						<c:forEach var="item" items="${roomList}">
							<tr class="tblContentTr">
								<td>${item.state}</td>
								<td>${item.rno}호</td>
								<td>${item.repair}</td>
							</tr>
						</c:forEach>						
					</table>
				</div><!-- tblBottom end -->
			</div><!-- section end -->
		</div><!-- sectionWrap -->
		<div class="footerWrap">
			
		</div>
	</div>
</body>
</html>