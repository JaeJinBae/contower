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
	.m2{
		width: 20px;
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
		text-align: center;
	}
	.updateBtnDiv > p:first-child{
		width: 64px;
		margin-bottom:10px;
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
	.tblBottom > table tr > th > button{
		font-size: 16px;
		color: #fefefe;
	}
	.mrrBtn{
		display: none;
		float: right;
		padding: 3px 6px;
		border-radius: 3px;
		margin-left: 8px;
	}
	#mrrUpdateBtn{
		background: #19915a;
	}
	#mrrUpdateCancelBtn{
		background: #e17719;
	}
	#prevMrr{
		margin-right: 20px;
	}
	#nextMrr{
		margin-left: 20px;
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
	#monthlyRent_record tr:nth-child(2) > th{
		cursor: pointer;
	}
	#monthlyRent_record tr > td > input{
		display: none;
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

function get_monthlyRentRecordByYear(info){
	var dt;
	$.ajax({
		url:"${pageContext.request.contextPath}/owner/getMonthlyRentRecord",
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

function draw_monthlyRentRecord(year){
	var bno = $(".tblTop > table tr > td > input[name='bno']").val();
	var info = {year:year, bno:bno};
	var json = get_monthlyRentRecordByYear(info);
	
	var str = "<tr><th colspan='13'><button id='prevMrr'>◀</button><span class='mryear'>"+year+"</span>년 월세납입현황"
			+ "<button id='nextMrr'>▶</button><button id='mrrUpdateCancelBtn' class='mrrBtn'>취소</button><button id='mrrUpdateBtn' class='mrrBtn'>저장</button></th>"
			+ "</tr><tr><th>호실＼월</th><th>1월</th><th>2월</th><th>3월</th><th>4월</th><th>5월</th>"
			+ "<th>6월</th><th>7월</th><th>8월</th><th>9월</th><th>10월</th><th>11월</th><th>12월</th></tr>";
	$(json).each(function(){
		str += "<tr class='tblContentTr'>"
			+ "<th>"+this.rno+"호<input type='hidden' name='rno' value='"+this.rno+"'></th><td><p>"+this.january+"</p><input type='text' name='january' value='"+this.january+"'></td>"
			+ "<td><p>"+this.february+"</p><input type='text' name='february' value='"+this.february+"'></td>"
			+ "<td><p>"+this.march+"</p><input type='text' name='march' value='"+this.march+"'></td><td><p>"+this.april+"</p><input type='text' name='april' value='"+this.april+"'></td>"
			+ "<td><p>"+this.may+"</p><input type='text' name='may' value='"+this.may+"'></td>"
			+ "<td><p>"+this.june+"</p><input type='text' name='june' value='"+this.june+"'></td><td><p>"+this.july+"</p><input type='text' name='july' value='"+this.july+"'></td>"
			+ "<td><p>"+this.august+"</p><input type='text' name='august' value='"+this.august+"'></td>"
			+ "<td><p>"+this.september+"</p><input type='text' name='september' value='"+this.september+"'></td><td><p>"+this.october+"</p><input type='text' name='october' value='"+this.october+"'></td>"
			+ "<td><p>"+this.november+"</p><input type='text' name='november' value='"+this.november+"'></td><td><p>"+this.december+"</p><input type='text' name='december' value='"+this.december+"'></td></tr>";
	});
	$("#monthlyRent_record").html(str);
}

function post_monthlyRentRecordUpdate(arr){
	$.ajax({
		url:"${pageContext.request.contextPath}/owner/monthlyRentRecordUpdate",
		type:"post",
		data : JSON.stringify(arr),
        dataType : 'text',
        contentType : 'application/json; charset=UTF-8',
		async:false,
		success:function(json){
			if(json == "ok"){
				alert("월세 납입현황이 수정되었습니다.");
				
				draw_monthlyRentRecord($(".mryear").text());
			}
		},
		error:function(request,status,error){
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}


$(function(){ 
	//표 드래그
	$(".tblBottom > table").draggable();
	
	var date = new Date();
	
	//월세 납입현황 표 생성
	draw_monthlyRentRecord(date.getFullYear());
	
	//건물정보 수정 클릭
	$(".updateBtnDiv > p").eq(0).click(function(){
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
				console.log('삭제');
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
	
	$(document).on("click", "#prevMrr", function(){
		var nowYear = date.getFullYear();
		var minYear = nowYear - 1;
		var selectYear = Number($(".mryear").text());
		var prevYear = selectYear-1;
		
		if(selectYear == minYear){
			return false;
		}else{
			draw_monthlyRentRecord(prevYear);
		}
	});
	
	$(document).on("click", "#nextMrr", function(){
		var maxYear = date.getFullYear();
		var selectYear = Number($(".mryear").text());
		var nextYear = selectYear+1;
		
		if(selectYear == maxYear){
			return false;
		}else{
			draw_monthlyRentRecord(nextYear);
		}
	});
	
	var selMon = "";
	
	$(document).on("click", "#monthlyRent_record tr:nth-child(2) > th", function(){
		selMon = $(this).text();
		$("#monthlyRent_record .tblContentTr > td > p").css("display", "block");
		$("#monthlyRent_record .tblContentTr > td > input").css("display", "none");
		var tdNum = 0;
		if($(this).index() == 0){
			return false;
		}else{
			$(".mrrBtn").css("display", "inline");
			tdNum = $(this).index()+1;
			$("#monthlyRent_record .tblContentTr > td:nth-child("+tdNum+") > p").css("display", "none");
			$("#monthlyRent_record .tblContentTr > td:nth-child("+tdNum+") > input").css("display", "block");
		}
	});
	
	$(document).on("click", "#mrrUpdateCancelBtn", function(){
		var y = $(".mryear").text();
		draw_monthlyRentRecord(y);
		selMon = "";
	});
	
	$(document).on("click", "#mrrUpdateBtn", function(){
		var bno = $(".tblTop > table tr > td > input[name='bno']").val();
		var rno = 0;
		var record_year = $(".mryear").text();
		var mValue = "";
		
		var arrSplit = selMon.split("월");
		var month = Number(arrSplit[0])-1;
		var arr = [];
		var vo = {};
		
		$("#monthlyRent_record .tblContentTr").each(function(){
			rno = $(this).find("th > input[name='rno']").val();
			mValue = $(this).find("td").eq(month).find("input").val();
			
			vo = {bno:bno, rno:rno, record_year:record_year, mValue:mValue, month:month+1};
			arr.push(vo);
		});
		console.log(arr);
		post_monthlyRentRecordUpdate(arr);
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
			<jsp:include page="../include/ownerHeader.jsp"></jsp:include>
		</div>
		<div class="sectionWrap">
			<div class="sectionTitle">
				<p><img src="${pageContext.request.contextPath}/resources/images/icon_plus_cr.png"><span>보유건물상세</span><img src="${pageContext.request.contextPath}/resources/images/icon_line.png"></p>
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
							<th>준공일</th>
							<td>${buiVO.completion_date}</td>
							<th>관리인</th>
							<td>${managerVO.name}</td>
							<th>연락처</th>
							<td>${managerVO.phone}</td>
						</tr>
					</table>
					<div class="updateBtnDiv">
						<p>수정</p>
						<p>매매등록</p>
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
							<th colspan="11">종합현황</th>
						</tr>
						<tr>
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
					<table id="monthlyRent_record">
						
					</table>
					<table>
						<tr>
							<th colspan="2">공실현황</th>
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
							<th colspan="9">입주완료 현황</th>
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
							<c:if test="${item.state eq '입주완료'}">
								<c:set var="cnt" value="${cnt+1}"></c:set>
							</c:if>
						</c:forEach>
						<c:choose>
							<c:when test="${cnt==0}">
								<tr>
									<td colspan="9">입주완료된 방이 없습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="item" items="${roomList}">
									<c:if test="${item.state eq '입주완료'}">
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
							<th colspan="3">수리내역</th>
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