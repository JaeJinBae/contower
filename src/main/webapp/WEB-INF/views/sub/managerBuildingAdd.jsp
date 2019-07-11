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
	.popup_ownerRegister{
		display: none;
		width:350px;
		background: #fff;
		margin:0 auto;
		margin-top:100px;
		position: relative;
		z-index: 999;
		text-align: center;
	}
	.popup_ownerRegister > h3{ 
		width: 100%;
		font-size: 22px;
		color: #fff;
		padding: 10px 0;
		background: #6c7981;
		position: relative;
	}
	.popup_ownerRegister > h3 > img{
		width: 20px;
		position: absolute;
		right: 10px;
		cursor: pointer;
		margin-top:5px;
	}
	.popup_ownerRegister > table{
		width: 98%;
		margin: 0 auto;
	}
	.popup_ownerRegister > table tr{
		border-top: 10px solid #fff;
		box-shadow: 0px 0px 6px 0px gray;
	}
	.popup_ownerRegister > table tr > th{
		width: 120px;
		background: #6d7a81;
		text-align: center;
		font-size: 15px;
		color: #efefef;
	}
	.popup_ownerRegister > table tr > td{
		text-align: left;
	}
	.popup_ownerRegister > table tr > td > input{
		width: 100%;
		font-size: 15px;
		padding: 5px;
		border: 1px solid #ddd;
	}
	.popup_ownerRegister > table tr > td > input[name='id']{
		width:130px;
	}
	.popup_ownerRegister > table tr > td > button{
		font-size: 14px;
		padding: 6px;
		float:right;
		border-radius: 3px;
		background: #f3a953;
		color: #fff;
		margin-left: 19px;
		margin-right:5px;
	}
	.popup_btnWrap{
		width: 100%;
		text-align: center;
		padding: 10px 0;
	}
	.popup_btnWrap > p{
		cursor: pointer;
		display: inline-block;
	}
	.popup_btnWrap > p > img{
		width: 40px;
	}
	.popup_repair{
		display: none;
		width:500px;
		background: #fff;
		margin:0 auto;
		margin-top:100px;
		position: relative;
		z-index: 999;
		text-align: center;
	}
	.popup_repair > h3{ 
		width: 100%;
		font-size: 22px;
		color: #fff;
		padding: 10px 0;
		background: #6c7981;
		position: relative;
	}
	.popup_repair > h3 > img{
		width: 20px;
		position: absolute;
		right: 10px;
		cursor: pointer;
		margin-top:5px;
	}
	.popup_repair > table{
		width: 98%;
		margin: 0 auto;
	}
	.popup_repair > table tr{
		border-top: 10px solid #fff;
		box-shadow: 0px 0px 6px 0px gray;
	}
	.popup_repair > table tr > th{
		width: 100px;
		background: #6d7a81;
		text-align: center;
		font-size: 15px;
		color: #efefef;
	}
	.popup_repair > table tr > td{
		text-align: left;
	}
	
	.popup_repair > table tr > td > textarea{
		width:100%;
		resize: none;
		height:300px;
		border: 1px solid #efefef;
		font-size: 15px;
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
	.menuWrap > ul > li:nth-child(1) > a{
		color: #fff;
	}
	.menuWrap > ul > li:nth-child(1) > .menuBg{
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
		min-width: 1500px;
		height: 80px;
		background: #fff;
		box-shadow: 0px 0px 10px 0px gray;
	}
	.raBg{
		position: absolute;
		top: 0;
		left:0;
		width: 100%;
		min-width: 1700px;
		height: 700px;
		background: #ecf7ff;
		z-index: -1;
	}
	
	
	.sectionWrap{
		width: 100%;
		min-height: 829px;
		clear: both;
		padding: 10px 0;
		margin-bottom: 70px;
	}
	.section{
		width: 100%;
		min-width: 1500px;
	}
	.asideTop{
		overflow: hidden;
		margin-bottom: 15px;
	}
	.formWrap{
		width: 100%;
	}
	.buiInfo{
		width: 100%;
		margin: 20px 0;
		padding: 25px;
		background: #fff;
	}
	.buiInfo > h4{
		font-size: 22px;
		margin: 10px 0 20px 0;
		padding-left: 20px;
		color: #444;
	}
	.buiInfo > table{
		width: 1000px;
	}
	.buiInfo > table tr{
		
	}
	.buiInfo > table tr > th{
		width: 110px;
		padding: 10px;
		color: #333;
		font-size: 16px;
		font-weight: bold;
		letter-spacing: 2px;
	}
	.buiInfo > table tr > td{
		text-align: center;
	}
	.buiInfo > table tr > td > input{
		width: 100%;
		font-size: 15px;
		padding: 5px 3px;
		border: 1px solid #ccc;
		box-shadow: 0px 0px 10px -3px gray;
	}
	.buiInfo > table tr > td > input[name='baddr_old']{
		width: 48%;
	}
	.buiInfo > table tr > td > input[name='baddr_new']{
		width: 49%;
		margin-left: 18px;
	}
	.buiInfo > table tr > td > input[name='site']{
		width: 78%;
		text-align: right;
	}
	.buiInfo > table tr > td > input[name='gross_area']{
		width: 78%;
		text-align: right;
	}
	.imgM2{
		vertical-align: middle;
	}
	.buiInfo > table tr > td > #ownerChk{
		width: 100%;
		font-size: 14px;
		background: #037dd2;
		color: #fefefe;
		text-align: center;
		padding: 7px;
		border-radius: 4px;
	}
	.roomInfo{
		width: 100%;
		padding: 0 10px;
	}
	.roomInfo > table{
		width: 100%;
		background: #fff;
	}
	.roomInfo > table tr{
		
	}
	.roomInfo > table tr > th{
		background: #1797f7;
		font-size: 15px;
		color: #fff;
		padding: 7px 0;
		letter-spacing: 1px;
		border-bottom: 6px solid #dde4ea;
	}
	.roomInfo > table tr > td{
		text-align: center;
		padding: 7px 3px;
		border-bottom: 3px solid #dce2e7;
	}
	.roomInfo > table tr > td > select{
		font-size: 14px;
		border: 1px solid #ddd;
	}
	.roomInfo > table tr > td > input{
		font-size: 14px;
		width: 100%;
		padding: 2px;
		border: 1px solid #ddd;
	}
	.roomInfo > table tr > td > textarea{
		width: 100%;
		height: 24px;
		border: 1px solid #ddd;
		resize: none;
		overflow: hidden;
	}
	.roomInfo > table tr > th:first-child{
		width: 80px;
	}
	.roomInfo > table tr > th:nth-child(2){
		width: 80px;
	}
	.roomInfo > table tr > th:nth-child(3){
		width: 60px;
	}
	.roomInfo > table tr > th:nth-child(4){
		width: 55px;
	}
	.roomInfo > table tr > th:nth-child(5){
		width: 70px;
	}
	.roomInfo > table tr > th:nth-child(6){
		width: 125px;
	}
	.roomInfo > table tr > th:nth-child(7){
		width: 142px;
	}
	.roomInfo > table tr > th:nth-child(8){
		width: 142px;
	}
	.roomInfo > table tr > th:nth-child(9){
		width: 60px;
	}
	.roomInfo > table tr > th:nth-child(10){
		width: 60px;
	}
	.roomInfo > table tr > th:nth-child(11){
		width: 60px;
	}
	.roomInfo > table tr > th:nth-child(12){
		width: 70px;
	}
	.roomInfo > table tr > th:nth-child(13){
		width: 90px;
	}
	.roomInfo > table tr > th:nth-child(14){
		width: 70px;
	}
	.roomInfo > table tr > th:nth-child(15){
		width: 125px;
	}
	.roomInfo > table tr > th:nth-child(16){
		width: 60px;
	}
	.roomInfo > table tr > th:nth-child(17){
	}
	.btn_addTrWrap{
		width: 100%;
		margin: 15px 0;
		text-align: left;
	}
	.btn_addTrWrap > p{
		display: inline-block;
		width: 40px;
		height: 40px;
		font-size: 43px;
		line-height: 28px;
		color: #fff;
		background: #105340;
		text-align: center;
		border-radius: 40px;
		cursor: pointer;
	}
	.btn_addTrWrap > p:last-child{
		background: #cf121b;
	}
	.btn_registerWrap{
		width: 100%;
		text-align: center;
		margin-top: 20px;
	}
	.btn_registerWrap > p{
		display: inline-block;
		width: 80px;
		margin: 0 auto;
		font-size: 15px;
		color: #fff;
		background: #475c6f;
		text-align: center;
		padding: 5px 0;
		border-radius: 4px;
		cursor: pointer; 
	}
	input::placeholder{
		
	}
	input::-webkit-input-placeholder {
		font-size: 13px;
		color: #999999;
	}
	input:-ms-input-placeholder {
		font-size: 13px;
		color: #999999;
	}
	textarea::-webkit-input-placeholder {
		font-size: 13px;
		color: #999999;
	}
	textarea:-ms-input-placeholder {
		font-size: 13px;
		color: #999999;
	}
	
	.footer{
		width: 100%;
		height: 100px;
		background: #1797f8;
		box-shadow: 0px 0px 20px 0px gray;
	}
</style>
<script>
function inputBirthChk(obj) {
	var number = obj.value.replace(/[^0-9]/g, "");
	var birth = "";
	
	if(number.length < 5) {
		return number;
	} else if(number.length < 7) {
		birth += number.substr(0, 4);
		birth += "-";
		birth += number.substr(4);
	}else {
		birth += number.substr(0, 4);
		birth += "-";
		birth += number.substr(4, 2);
		birth += "-";
		birth += number.substr(6);
	}
	
	obj.value = birth;
}

function inputPhoneNumber(obj) {
	var number = obj.value.replace(/[^0-9]/g, "");
	var phone = "";
	
	if(number.length < 4) {
		return number;
	} else if(number.length < 7) {
		phone += number.substr(0, 3);
		phone += "-";
		phone += number.substr(3);
	} else if(number.length < 11) {
		phone += number.substr(0, 3);
		phone += "-";
		phone += number.substr(3, 3);
		phone += "-";
		phone += number.substr(6);
	} else {
		phone += number.substr(0, 3);
		phone += "-";
		phone += number.substr(3, 4);
		phone += "-";
		phone += number.substr(7);
	}
	obj.value = phone;
}

function add_roomInfo_tbl_tr(){
	var str = "";
	str = "<tr class='roomInfoTr'><td><select name='state'><option value='공실'>공실</option><option value='입주완료'>입주완료</option><option value='계약완료'>계약완료</option></select></td>"
		+ "<td><select name='room_type'><option value='one'>원룸</option><option value='mitwo'>미니투룸</option><option value='two'>투룸</option><option value='three'>쓰리룸</option>"
		+ "<option value='store'>상가</option><option value='owner'>주인세대</option></select></td>"
		+ "<td><select name='pay_type'><option value='월세'>월세</option>	<option value='전세'>전세</option>	</select></td>"
		+ "<td><input type='text' name='rno' placeholder='101' class='numberOnly'></td><td><input type='text' name='tenant'></td><td><input type='text' name='phone' placeholder='010-1234-1234' onKeyup='inputPhoneNumber(this);' maxlength='13'></td>"
		+ "<td><input type='date' name='check_in' placeholder='2019-05-05' onKeyup='inputBirthChk(this);' maxlength='10'></td><td><input type='date' name='check_out' placeholder='2019-05-05' onKeyup='inputBirthChk(this);' maxlength='10'></td>"
		+ "<td><input type='text' name='deposit' placeholder='500' class='numberOnly'></td>	<td><input type='text' name='monthly_rent' placeholder='35' class='numberOnly'></td>"
		+ "<td><input type='text' name='rpw'></td><td><input type='text' name='hope_price' placeholder='300/30'></td>"
		+ "<td><select name='selling_type'><option value='월세'>월세</option><option value='전세'>전세</option><option value='월세, 전세'>월세, 전세</option></select></td>"
		+ "<td><input type='text' name='company'></td><td><input type='text' name='company_call' placeholder='010-1234-1234' onKeyup='inputPhoneNumber(this);' maxlength='13'></td><td><input type='text' name='downpayment'></td>"
		+ "<td><textarea name='repair'></textarea></td></tr>";

	$(".roomInfo > table").append(str);
	
	var height = $(".rightAside").css("height");
	$(".leftAside").css("height", height);
}

function post_buiInfo(vo){
	$.ajax({
		url:"${pageContext.request.contextPath}/buiInfoReg",
		type:"post",
		data : JSON.stringify(vo),
        dataType : 'text',
        contentType : 'application/json; charset=UTF-8',
		async:false,
		success:function(json){
			console.log(json);
			post_roomInfo(json);
		},
		error:function(request,status,error){
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}

function post_roomInfo(bno){
	var rArr = [];
	var rObj = {};
	
	var bname = $(".buiInfo > table tr > td > input[name='bname']").val();
	var state;
	var room_type;
	var pay_type;
	var rno;
	var tenant;
	var phone;
	var check_in;
	var check_out;
	var deposit;
	var monthly_rent;
	var rpw;
	var hope_price;
	var selling_type;
	var company;
	var company_call;
	var downpayment;
	var repair;
	
	$(".roomInfoTr").each(function(){
		state = $(this).find("td:nth-child(1) > select").val();
		room_type = $(this).find("td:nth-child(2) > select").val();
		pay_type = $(this).find("td:nth-child(3) > select").val();
		rno = $(this).find("td:nth-child(4) > input").val();
		tenant = $(this).find("td:nth-child(5) > input").val();
		phone = $(this).find("td:nth-child(6) > input").val();
		check_in = $(this).find("td:nth-child(7) > input").val();
		check_out = $(this).find("td:nth-child(8) > input").val();
		deposit = $(this).find("td:nth-child(9) > input").val();
		monthly_rent = $(this).find("td:nth-child(10) > input").val();
		rpw = $(this).find("td:nth-child(11) > input").val();
		hope_price = $(this).find("td:nth-child(12) > input").val();
		selling_type = $(this).find("td:nth-child(13) > select").val();
		company = $(this).find("td:nth-child(14) > input").val();
		company_call = $(this).find("td:nth-child(15) > input").val();
		downpayment = $(this).find("td:nth-child(16) > input").val();
		repair = $(this).find("td:nth-child(17) > textarea").val();
		
		if(deposit==""){ 
			deposit = 0;
		}
		if(monthly_rent==""){
			monthly_rent = 0;
		}
		if(downpayment==""){
			downpayment = 0;
		}
		if(repair.length == 0){
			repair = "";
		}

		rObj={no:0, bno:bno, bname:bname, rno:rno, state:state, room_type:room_type, pay_type:pay_type, tenant:tenant, phone:phone, check_in:check_in, check_out:check_out, deposit:deposit, monthly_rent:monthly_rent, rpw:rpw, hope_price:hope_price, selling_type:selling_type, company:company, company_call:company_call, downpayment:downpayment, repair:repair};
		rArr.push(rObj);
	});
	
	$.ajax({
		url:"${pageContext.request.contextPath}/roomReg",
		type:"post",
		data : JSON.stringify(rArr),
        dataType : 'text',
        contentType : 'application/json; charset=UTF-8',
		async:false,
		success:function(json){
			if(json == "ok"){
				alert("신규 관리건물 등록이 완료되었습니다.");
				location.replace("${pageContext.request.contextPath}/mBuiInfo/"+bno);
			}else{
				alert("신규관리건물 등록이 완료되지 않았습니다.\n새로고침(F5) 후 다시 시도하세요.");
			}
			
		},
		error:function(request,status,error){
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}

function ownerExistChk(oname, ophone, obirth){
	var vo = {oname:oname, ophone:ophone, obirth:obirth};
	$.ajax({
		url:"${pageContext.request.contextPath}/ownerExistChk",
		type:"post",
		data : JSON.stringify(vo),
        dataType : 'text',
        contentType : 'application/json; charset=UTF-8',
		async:false,
		success:function(json){
			if(json == "no"){
				alert("계정이 존재하지 않습니다. 건축주 신규등록을 하세요.");

				$(".popup_ownerRegister > table tr > td > input[name='name']").val(oname);
				$(".popup_ownerRegister > table tr > td > input[name='phone']").val(ophone);
				$(".popup_ownerRegister > table tr > td > input[name='birth']").val(obirth);
				
				$(".popupWrap").css("display", "block");
				$(".popup_ownerRegister").css("display", "block");
			}else{
				alert("계정이 존재합니다.");
				$(".buiInfo > table tr > td > input[name='ono']").val(json);
				$(".buiInfo > table tr td > input[name='ownerChkVal']").val("o");
			}
			
		},
		error:function(request,status,error){
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}

function ownerIdChk(id){
	$.ajax({
		url:"${pageContext.request.contextPath}/ownerIdChk/"+id,
		type:"post",
        dataType : 'text',
        contentType : 'application/json; charset=UTF-8',
		async:false,
		success:function(json){
			if(json == "no"){
				alert("사용가능한 아이디입니다.");
				$(".popup_ownerRegister > table tr td > input[name='idChk']").val("o");
			}else{
				alert("이미 존재하는 아이디입니다.");
				$(".popup_ownerRegister > table tr td > input[name='idChk']").val("x");
			}
			
		},
		error:function(request,status,error){
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}

function ownerRegister(vo){
	$.ajax({
		url:"${pageContext.request.contextPath}/ownerRegister",
		type:"post",
		data : JSON.stringify(vo),
        dataType : 'text',
        contentType : 'application/json; charset=UTF-8',
		async:false,
		success:function(json){
			if(json == "no"){
				alert("계정이 정상적으로 생성되지 않았습니다. 새로고침(F5) 후 다시 시도해주세요.");
				$(".popupWrap").css("display", "none");
			}else{
				alert("건축주 계정이 정상적으로 생성되었습니다.");
				$(".buiInfo > table tr > td > input[name='ono']").val(json);
				$(".buiInfo > table tr td > input[name='ownerChkVal']").val("o");
			}
			
		},
		error:function(request,status,error){
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}

$(function(){
	//기본 방 입력칸 11개 생성
	for(var i = 0; i < 19; i++){
		add_roomInfo_tbl_tr();
	}
	
	//칸추가, 제거 클릭
	$(".btn_addTrWrap > p").click(function(){
		var btn_idx = $(this).index();
		if(btn_idx == 0){
			add_roomInfo_tbl_tr();
		}else if(btn_idx == 1){
			if($(".roomInfoTr").length == 1){
				return false;
			}
			$(".roomInfoTr:last-child").remove();
			var height = $(".rightAside").css("height");
			$(".leftAside").css("height", height);
		}
	})
	
	$(document).on("keyup", ".numberOnly", function(){
		$(this).val($(this).val().replace(/[^0-9]/g,""));
		
	});
	
	//등록, 다시작성 클릭
	$(".btn_registerWrap > p").click(function(){
		var idxBtn = $(this).index();
		if(idxBtn == 0){
			var errorIdx = 0;
			var bname = $(".buiInfo > table tr > td > input[name='bname']").val();
			var baddr_old = $(".buiInfo > table tr > td > input[name='baddr_old']").val();
			var baddr_new = $(".buiInfo > table tr > td > input[name='baddr_new']").val();
			var bpw = $(".buiInfo > table tr > td > input[name='bpw']").val();
			var heating = $(".buiInfo > table tr > td > input[name='heating']").val();
			var boption = $(".buiInfo > table tr > td > input[name='boption']").val();
			var completion_date = $(".buiInfo > table tr > td > input[name='completion_date']").val();
			var site = $(".buiInfo > table tr > td > input[name='site']").val();
			var gross_area = $(".buiInfo > table tr > td > input[name='gross_area']").val();
			var road = $(".buiInfo > table tr > td > input[name='road']").val();
			var ono = $(".buiInfo > table tr > td > input[name='ono']").val();
			var oname = $(".buiInfo > table tr > td > input[name='oname']").val();
			var ophone = $(".buiInfo > table tr > td > input[name='ophone']").val();
			var obirth = $(".buiInfo > table tr > td > input[name='obirth']").val();
			
			var mno = $(".se > #seMno").val();
			var mphone = $(".se > #seMphone").val();
			var memo = $(".buiInfo > table tr > td > input[name='memo']").val();
			var cnt_one = 0;
			var cnt_mitwo = 0;
			var cnt_two = 0;
			var cnt_three = 0;
			var cnt_store = 0;
			var cnt_owner = 0;
			var cnt_complete = 0;
			var cnt_empty = 0;
			var deposit = 0;
			var total_deposit = 0;
			var monthly_rent = 0;
			var total_monthly_rent = 0;
			var roomType = "";
			
			//건물등록 예외처리
			if(bname == ""){
				alert("건물명을 입력하세요");
				errorIdx = 1;
				return false;
			}
			if(baddr_old == "" && baddr_new ==""){
				alert("지번주소와 도로명주소 중 하나는 반드시입력하세요.");
				errorIdx = 1;
				return false;
			}
			if(bpw == ""){
				alert("현관비밀번호를 입력하세요.");
				errorIdx = 1;
				return false;
			}
			if(heating == ""){
				alert("난방을 입력하세요.");
				errorIdx = 1;
				return false;
			}
			if(boption == ""){
				alert("옵션을 입력하세요.");
				errorIdx = 1;
				return false;
			}
			if(oname == ""){
				alert("건축주명을 입력하세요.");
				errorIdx = 1;
				return false;
			}
			if(ophone == ""){
				alert("건축주 연락처를 입력하세요.");
				errorIdx = 1;
				return false;
			}
			if($(".buiInfo > table tr > td > input[name='ownerChkVal']").val() == "x"){
				alert("건축주 계정 확인&생성을 진행하세요.");
				errorIdx = 1;
				return false;
			}
			
			if(site.length == 0){
				site = 0;
			}
			if(gross_area.length == 0){
				gross_area = 0;
			}
			
			var rno;
			var rtenant;
			var rphone;
			var rcheck_in;
			var rcheck_out;
			var rdeposit;
			var rmonthly_rent;
			var rhope_price;
			var rselling_type;
			
			$(".roomInfoTr").each(function(){
				state = $(this).find("td > select[name='state']").val();
				rno = $(this).find("td > input[name='rno']").val();
				if(rno == ""){
					alert("호실을 입력해주세요.");
					errorIdx = 1;
					return false;
				}
				if(state == "입주완료"){
					
					rtenant = $(this).find("td > input[name='tenant']").val();
					rphone = $(this).find("td > input[name='phone']").val();
					rcheck_in = $(this).find("td > input[name='check_in']").val();
					rcheck_out = $(this).find("td > input[name='check_out']").val();
					rdeposit = $(this).find("td > input[name='deposit']").val();
					rmonthly_rent = $(this).find("td > input[name='monthly_rent']").val();
					
					if(rno=="" || rtenant=="" || rphone=="" || rcheck_in=="" || rcheck_out=="" || rdeposit=="" || rmonthly_rent=="" || rhope_price==""){
						alert("입주완료된 방 정보를 정확하게 입력해주세요.");
						errorIdx = 1;
						return false;
					}
					cnt_complete++;
				}else{
					rhope_price = $(this).find("td > input[name='hope_price']").val();
					rselling_type = $(this).find("td > select[name='selling_type']").val(); 
					if(rhope_price == ""){
						alert("희망금액을 입력해주세요.");
						errorIdx = 1;
						return false;
					}
					if(rselling_type == ""){
						alert("판매유형을 선택해주세요.");
						errorIdx = 1;
						return false;
					}
					cnt_empty++;
				}
				
				roomType = $(this).find("td > select[name='room_type']").val();
				if(roomType == "one"){
					cnt_one++;
				}else if(roomType == "mitwo"){
					cnt_mitwo++;
				}else if(roomType == "two"){
					cnt_two++;
				}else if(roomType == "three"){
					cnt_three++;
				}else if(roomType == "store"){
					cnt_store++;
				}else if(roomType == "owner"){
					cnt_owner++;
				}
				
				deposit = $(this).find("td > input[name='deposit']").val();
				if(deposit != ""){
					total_deposit += Number(deposit);
				}
				
				monthly_rent = $(this).find("td > input[name='monthly_rent']").val();
				if(monthly_rent != ""){
					total_monthly_rent += Number(monthly_rent);
				}
				
			});
			
			if(errorIdx == 0){
				var vo = {
						bno:0, bname:bname, baddr_old:baddr_old, baddr_new:baddr_new, bpw:bpw, heating:heating, boption:boption,
						completion_date:completion_date, site:site, gross_area:gross_area, road:road,
						ono:ono, oname:oname, ophone:ophone, obirth:obirth, mno:mno, mphone:mphone,
						cnt_one:cnt_one, cnt_mitwo:cnt_mitwo, cnt_two:cnt_two, cnt_three:cnt_three, cnt_store:cnt_store, cnt_owner:cnt_owner,
						cnt_complete:cnt_complete, cnt_empty:cnt_empty, total_monthly_rent:total_monthly_rent, total_deposit:total_deposit, memo:memo
						};
				
				post_buiInfo(vo);
			}else{
				return false;
			}
			
		}else{
			$(".formWrap input").val("");
			$(".formWrap select > option:first-child").prop("selected",true);	
		}
	});
	
	//건축주 계정확인&생성 클릭
	$("#ownerChk").click(function(){
		var oname = $(".buiInfo > table tr > td > input[name='oname']").val();
		var ophone = $(".buiInfo > table tr > td > input[name='ophone']").val();
		var obirth = $(".buiInfo > table tr > td > input[name='obirth']").val();
		if(oname==""){
			alert("건축주명을 입력하세요.");
			return false;
		}
		if(ophone==""){
			alert("건축주 연락처를 입력하세요.");
			return false;
		}
		
		ownerExistChk(oname, ophone, obirth);
	});
	
	$(".popup_ownerRegister > table tr > td > button").click(function(){
		var id = $(".popup_ownerRegister > table tr > td > input[name='id']").val();
		if(id.length < 7){
			alert("아이디를 형식에 맞게 입력하세요.");
			return false;
		}else{
			ownerIdChk(id);
		}
	});
	
	$(".popup_ownerRegister .popup_btnWrap > p").click(function(){
		var name = $(".popup_ownerRegister > table tr > td > input[name='name']").val();
		var phone = $(".popup_ownerRegister > table tr > td > input[name='phone']").val();
		var birth = $(".popup_ownerRegister > table tr > td > input[name='birth']").val();
		var mail = $(".popup_ownerRegister > table tr > td > input[name='mail']").val();
		var id = $(".popup_ownerRegister > table tr > td > input[name='id']").val();
		var id_confirm = $(".popup_ownerRegister > table tr > td > input[name='idChk']").val();
		var pw = $(".popup_ownerRegister > table tr > td > input[name='pw']").val();
		var pw_confirm = $(".popup_ownerRegister > table tr > td > input[name='pw_confirm']").val();
		
		if(name.length == 0){
			alert("이름을 입력해주세요.");
			return false;
		}
		if(phone.length == 0){
			alert("연락처를 입력해주세요.");
			return false;
		}
		if(id.length == 0){
			alert("아이디를 입력해주세요.");
			return false;
		}
		if(id_confirm == "x"){
			alert("아이디 중복확인을 해주세요.");
			return false;
		}
		if(pw.length == 0){
			alert("비밀번호를 입력해주세요.");
			return false;
		}
		if(pw_confirm.length == 0){
			alert("비밀번호 확인을 입력해주세요.");
			return false;
		}
		if(pw != pw_confirm){
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		}
		var vo = {ono:0, name:name, phone:phone, birth:birth, mail:mail, id:id, pw:pw};
		ownerRegister(vo);
		
	});
	
	$(".popup_ownerRegister > h3 > img").click(function(){
		$(".popup_ownerRegister > table tr > td > input").val("");
		$(".popup_ownerRegister").css("display", "none");
		$(".popupWrap").css("display", "none");
	});
	
	//방정보입력에서 수리내역 input 클릭
	$(document).on("click", ".roomInfoTr > td:last-child > textarea[name='repair']", function(){
		var idx = $(this).parent().parent().index();
		var content = $(this).val()
		$(".popup_repair > h3 > input[name='trIdx']").val(idx);
		$(".popup_repair > table tr > td > textarea").val(content);
		$(".popupWrap").css("display", "block");
		$(".popupWrap > .popup_repair").css("display", "block");
	})
	
	//수리내역 팝업에서 X클릭
	$(document).on("click", ".popup_repair > h3 > img", function(){
		$(".popup_repair > h3 > input[name='trIdx']").val("");
		$(".popup_repair > table tr > td > textarea").val("");
		$(".popupWrap > .popup_repair").css("display", "none");
		$(".popupWrap").css("display", "none");
	})
	
	//수리내역 팝업에서 +클릭
	$(document).on("click", ".popup_repair > .popup_btnWrap > p > img", function(){
		var idx = $(".popup_repair > h3 > input[name='trIdx']").val()-1;
		var content = $(".popup_repair > table tr > td > textarea").val();
		
		$(".roomInfoTr").eq(idx).find("td:last-child > textarea[name='repair']").val(content);
		$(".popup_repair > h3 > input[name='trIdx']").val("");
		$(".popup_repair > table tr > td > textarea").val("");
		$(".popupWrap > .popup_repair").css("display", "none");
		$(".popupWrap").css("display", "none");
	})
});
</script>
</head>
<body>
	<div class="allWrap">
		<div class="popupWrap">
			<div class="popup_bg"></div>
			<div class="popup_ownerRegister">
				<h3>건축주 계정 생성<img src="${pageContext.request.contextPath}/resources/images/icon_x.png" title="닫기"></h3>
				<table>
					<tr>
						<th>이름</th>
						<td><input type="text" name="name"></td>
					</tr>
					<tr>
						<th>연락처</th>
						<td><input type="text" name="phone" placeholder="010-1234-1234" onKeyup="inputPhoneNumber(this);" maxlength="13"></td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td><input type="text" name="birth" placeholder="1999-09-09" onKeyup='inputBirthChk(this);' maxlength='10'></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input type="text" name="mail" placeholder="contower@naver.com"></td>
					</tr>
					<tr>
						<th>아이디</th>
						<td><input type="text" name="id" placeholder="7자 이상 영문 숫자만"><input type="hidden" name="idChk" value="x"><button>중복확인</button></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="pw" placeholder=""></td>
					</tr>
					<tr>
						<th>비밀번호 확인</th>
						<td><input type="password" name="pw_confirm" placeholder=""></td>
					</tr>
				</table>
				<div class="popup_btnWrap">
					<p><img src="${pageContext.request.contextPath}/resources/images/icon_plus.png" title="등록"></p>
				</div>
			</div><!-- popup_ownerRegister -->
			<div class="popup_repair">
				<h3>수리내역<input type="hidden" name="trIdx" value=""><img src="${pageContext.request.contextPath}/resources/images/icon_x.png" title="닫기"></h3>
				<table>
					<tr>
						<th>내용</th>
						<td><textarea></textarea></td>
					</tr>
				</table>
				<div class="popup_btnWrap">
					<p><img src="${pageContext.request.contextPath}/resources/images/icon_plus.png" title="등록"></p>
				</div>
			</div><!-- popup_ownerRegister -->
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
					<div class="formWrap">
						<div class="buiInfo">
							<h4>신규 건물 정보 입력</h4>
							<table>
								<tr>
									<th>건물명</th>
									<td><input type="text" name="bname"></td>
									<th>주소</th>
									<td colspan="5"><input type="text" name="baddr_old" placeholder="지번주소를 입력해주세요."><input type="text" name="baddr_new" placeholder="도로명주소를 입력해주세요."></td>
								</tr>
								<tr>
									<th>현관번호</th>
									<td><input type="text" name="bpw" placeholder="1층 현관 비밀번호"></td>
									<th>난방</th>
									<td><input type="text" name="heating" placeholder=""></td>
									<th>옵션</th>
									<td colspan="3"><input type="text" name="boption"></td>
								</tr>
								<tr>
									<th>준공일</th>
									<td><input type="text" name="completion_date"></td>
									<th>대지</th>
									<td><input type="text" name="site" class="numberOnly"><img class="imgM2" src="${pageContext.request.contextPath}/resources/images/m2.png"></td>
									<th>연면적</th>
									<td><input type="text" name="gross_area" class="numberOnly"><img class="imgM2" src="${pageContext.request.contextPath}/resources/images/m2.png"></td>
									<th>도로</th>
									<td><input type="text" name="road"></td>
								</tr>
								<tr>
									<th>건축주</th>
									<td><input type="text" name="oname"><input type="hidden" name="ono"></td> 
									<th>연락처</th>
									<td><input type="text" name="ophone" onKeyup="inputPhoneNumber(this);" maxlength="13"></td>
									<th>생년월일</th>
									<td><input type="text" name="obirth" onKeyup='inputBirthChk(this);' maxlength='10'></td>
									<th>건축주계정</th>
									<td><input type="hidden" name="ownerChkVal" value="x"><button id="ownerChk">계정확인&생성</button></td>
								</tr>
								<tr>
									<th>메모</th>
									<td colspan="7"><input type="text" name="memo"></td>
								</tr>
							</table>
						</div><!-- buiInfo end -->
						<div class="roomInfo">
							<div class="btn_addTrWrap">
								<p>+</p>
								<p>-</p>
							</div>
							<table>
								<tr>
									<th>입주</th>
									<th>타입</th>
									<th>구분</th>
									<th>호실</th>
									<th>이름</th>
									<th>연락처</th>
									<th>입주일</th>
									<th>퇴실일</th>
									<th>보증금</th>
									<th>월세</th>
									<th>PW</th>
									<th>희망금액</th>
									<th>판매유형</th>
									<th>중개인</th>
									<th>중개인연락처</th>
									<th>계약금</th>
									<th>수리내역</th>
								</tr>
								<tr class="roomInfoTr">
									<td>
										<select name="state">
											<option value="공실">공실</option>
											<option value="입주완료">입주완료</option>
											<option value="계약완료">계약완료</option>
										</select> 
									</td>
									<td>
										<select name="room_type">
											<option value="one">원룸</option>
											<option value="mitwo">미니투룸</option>
											<option value="two">투룸</option>
											<option value="three">쓰리룸</option>
											<option value="store">상가</option>
											<option value="owner">주인세대</option>
										</select> 
									</td>
									<td>
										<select name="pay_type">
											<option value="월세">월세</option>
											<option value="전세">전세</option> 
										</select>
									</td>
									<td><input type="text" name="rno" placeholder="101" class="numberOnly"></td>
									<td><input type="text" name="tenant"></td>
									<td><input type="text" name="phone" placeholder="010-1234-1234" onKeyup="inputPhoneNumber(this);" maxlength="13"></td>
									<td><input type="date" name="check_in" placeholder="2019-05-05" onKeyup='inputBirthChk(this);' maxlength='10'></td>
									<td><input type="date" name="check_out" placeholder="2019-05-05" onKeyup='inputBirthChk(this);' maxlength='10'></td>
									<td><input type="text" name="deposit" placeholder="300" class="numberOnly"></td>
									<td><input type="text" name="monthly_rent" placeholder="30" class="numberOnly"></td>
									<td><input type="text" name="rpw" value=""></td>
									<td><input type="text" name="hope_price" placeholder="300/30"></td>
									<td>
										<select name="selling_type">
											<option value="월세">월세</option>
											<option value="전세">전세</option>
											<option value="월세, 전세">월세, 전세</option>
										</select>
									</td>
									<td><input type="text" name="company"></td>
									<td><input type="text" name="company_call" placeholder='010-1234-1234' onKeyup='inputPhoneNumber(this);' maxlength='13'></td>
									<td><input type="text" name="downpayment"></td>
									<td><textarea name="repair"></textarea></td>
								</tr>
							</table>
							<div class="btn_registerWrap">
								<p>등 록</p>
								<p>다시 작성</p>
							</div>
						</div><!-- roomInfo end -->
					</div><!-- formWrap end -->
				</div><!-- section end -->
			</div><!-- sectionWrap end -->
			<div class="footer"></div>
		</div><!-- rightAside end -->
	</div><!-- allWrap end -->
</body>
</html>