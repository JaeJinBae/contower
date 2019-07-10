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
<script src="${pageContext.request.contextPath}/resources/js/calendar.js"></script>
<style>
	.allWrap{
		width: 100%;
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
		margin: 0 auto;
		font-size: 25px;
		padding: 15px 0;
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
		width: 1100px;
		margin: 0 auto;
	}
	.formWrap{
		width: 100%;
	}
	.buiInfo{
		width: 100%;
		margin: 20px 0;
	}
	.buiInfo > table{
		width: 100%;
		min-width: 1100px;
	}
	.buiInfo > table tr{
		
	}
	.buiInfo > table tr > th{
		background: #7a93a9;
		width: 155px;
		/* line-height: 38px; */
		padding: 10px;
		color: #fff;
		font-size: 16px;
		letter-spacing: 4px;
		border: 1px solid lightgray;
	}
	.buiInfo > table tr > td{
		padding: 0 15px;
		border: 1px solid lightgray;
	}
	.buiInfo > table tr > td > input{
		width: 100%;
		font-size: 16px;
		padding: 2px 5px;
	}
	
	.roomInfo{
		width: 100%;
	}
	.roomInfo > table{
		width: 100%;
	}
	.roomInfo > table tr{
		
	}
	.roomInfo > table tr > th{
		background: #7a93a9;
		font-size: 15px;
		color: #fff;
		border: 1px solid lightgray;
		padding: 10px 0;
		letter-spacing: 1px;
	}
	.roomInfo > table tr > td{
		border: 1px solid lightgray;
		text-align: center;
		padding: 3px;
	}
	.roomInfo > table tr > td > select{
		font-size: 15px;
	}
	.roomInfo > table tr > td > input{
		font-size: 14px;
		width: 100%;
		padding: 2px;
	}
	.roomInfo > table tr > th:first-child{
		width: 90px;
	}
	.roomInfo > table tr > th:nth-child(2){
		width: 60px;
	}
	.roomInfo > table tr > th:nth-child(3){
		width: 60px;
	}
	.roomInfo > table tr > th:nth-child(4){
		width: 75px;
	}
	.roomInfo > table tr > th:nth-child(5){
		width: 135px;
	}
	.roomInfo > table tr > th:nth-child(6){
		width: 142px;
	}
	.roomInfo > table tr > th:nth-child(7){
		width: 142px;
	}
	.roomInfo > table tr > th:nth-child(8){
		width: 90px;
	}
	.roomInfo > table tr > th:nth-child(9){
		width: 90px;
	}
	.btn_addTrWrap{
		width: 100%;
		margin: 15px 0;
		text-align: right;
	}
	.btn_addTrWrap > p{
		display: inline-block;
		width: 70px;
		font-size: 15px;
		color: #fff;
		background: #105340;
		text-align: center;
		padding: 5px 0;
		border-radius: 4px;
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
	
	
	
	
	.footerWrap{
		width: 100%;
		height: 70px;
		background: #7b93a8;
	}
</style>
<script>
function post_buiInfo_update(vo){
	$.ajax({
		url:"${pageContext.request.contextPath}/buiInfoUpdate",
		type:"post",
		dataType:"text",
		data: vo,
		async:false,
		success:function(json){
			console.log(json);
			post_roomInfo_update();
		},
		error:function(request,status,error){
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}

function post_roomInfo_update(){
	var rArr = [];
	var rObj = {};
	
	var no;
	var bno = $(".buiInfo > #bno").val();
	var bname = $(".buiInfo > table tr:nth-child(1) > td > input[name='bname']").val();
	var state;
	var pay_type;
	var rno;
	var tenant;
	var phone;
	var check_in;
	var check_out;
	var deposit;
	var monthly_rent;
	var repair_record;
	
	$(".roomInfoTr").each(function(){
		no = $(this).find("td:nth-child(1) > input[name='no']").val();
		state = $(this).find("td:nth-child(1) > select").val();
		pay_type = $(this).find("td:nth-child(2) > select").val();
		rno = $(this).find("td:nth-child(3) > input").val();
		tenant = $(this).find("td:nth-child(4) > input").val();
		phone = $(this).find("td:nth-child(5) > input").val();
		check_in = $(this).find("td:nth-child(6) > input").val();
		check_out = $(this).find("td:nth-child(7) > input").val();
		deposit = $(this).find("td:nth-child(8) > input").val();
		monthly_rent = $(this).find("td:nth-child(9) > input").val();
		repair_record = $(this).find("td:nth-child(10) > input").val();
		if(deposit==""){
			deposit = 0;
		}
		if(monthly_rent==""){
			monthly_rent = 0;
		}

		rObj={no:no, bno:bno, bname:bname, state:state, pay_type:pay_type, rno:rno, tenant:tenant, phone:phone, check_in:check_in, check_out:check_out, deposit:deposit, monthly_rent:monthly_rent, repair_record:repair_record};
		rArr.push(rObj);
	});
	
	console.log(rArr);
	$.ajax({
		url:"${pageContext.request.contextPath}/roomUpdate",
		type:"post",
		data : JSON.stringify(rArr),
        dataType : 'text',
        contentType : 'application/json; charset=UTF-8',
		async:false,
		success:function(json){
			if(json == "ok"){
				alert("건물정보 수정이 완료되었습니다.");
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



function add_roomInfo_tbl_tr(){
	var str = "";
	str = "<tr class='roomInfoTr'><td><select name='state'><option value='공실'>공실</option><option value='입주완료'>입주완료</option><option value='계약완료'>계약완료</option>"
		+ "</select></td><td><select name='pay_type'><option value='월세'>월세</option><option value='전세'>전세</option></select></td>"
		+ "<td><input type='text' name='rno' placeholder='ex) 101'></td><td><input type='text' name='tenant'></td><td><input type='text' name='phone' placeholder='ex) 010-1234-1234'></td>"
		+ "<td><input type='date' name='check_in' placeholder='ex) 2019-05-05'></td><td><input type='date' name='check_out' placeholder='ex) 2019-05-05'></td>"
		+ "<td><input type='text' name='deposit' placeholder='만원단위 숫자만'></td><td><input type='text' name='monthly_rent' placeholder='만원단위 숫자만'></td>"
		+ "<td><input type='text' name='repair_record'></td></tr>";
	
	$(".roomInfo > table").append(str);
}


$(function(){
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
		}
	})
	
	//수정등록, 취소 클릭 
	$(document).on("click", ".btn_registerWrap > p", function(){
		var idxBtn = $(this).index();
		var bno = $(".buiInfo > #bno").val();
		if(idxBtn == 0){
			var bname = $(".buiInfo > table tr > td > input[name='bname']").val();
			var oname = $(".buiInfo > table tr > td > input[name='oname']").val();
			var ophone = $(".buiInfo > table tr > td > input[name='ophone']").val();
			var obirth = $(".buiInfo > table tr > td > input[name='obirth']").val();
			var baddr = $(".buiInfo > table tr > td > input[name='baddr']").val();
			var mno = $(".se > #seMno").val();
			var memo = $(".buiInfo > table tr > td > input[name='memo']").val();
			var complete_cnt = 0;
			var empty_cnt = 0;
			var deposit = 0;
			var total_deposit = 0;
			var monthly_rent = 0;
			var total_monthly_rent = 0;
			
			
			$(".roomInfoTr").each(function(){
				state = $(this).find("td:nth-child(1) > select").val();
				if(state == "입주완료"){
					complete_cnt++;
				}else{
					empty_cnt++;
				}
				
				deposit = $(this).find("td:nth-child(8) > input").val();
				if(deposit != ""){
					total_deposit += Number(deposit);
				}
				
				monthly_rent = $(this).find("td:nth-child(9) > input").val();
				if(monthly_rent != ""){
					total_monthly_rent += Number(monthly_rent);
				}
			});
			
			var vo = {bno:bno, complete_room:complete_cnt, empty_room:empty_cnt, total_monthly_rent:total_monthly_rent, total_deposit:total_deposit, ono:0, mno:mno , bname:bname, oname:oname, ophone:ophone, obirth:obirth, baddr:baddr, memo:memo};
			post_buiInfo_update(vo);
		}else{
			location.replace("${pageContext.request.contextPath}/mBuiInfo/"+bno);
			
		}
	});
});
</script>
<style>


</style>
</head>
<body>
	<div class="allWrap">
		<div class="headerWrap">
			<jsp:include page="../include/managerHeader.jsp"></jsp:include>
		</div>
		<div class="sectionWrap">
			<div class="sectionTitle">
				<p><img src="${pageContext.request.contextPath}/resources/images/icon_plus_cr.png"><span>건물 정보 수정</span><img src="${pageContext.request.contextPath}/resources/images/icon_line.png"></p>
			</div>
			<div class="section">
				<div class="formWrap">
					<div class="buiInfo">
						<input id="bno" type="hidden" name="bno" value="${buiVO.bno}">
						<table>
							<tr>
								<th>건물명</th>
								<td><input type="text" name="bname" value="${buiVO.bname}"></td>
								<th>건축주</th>
								<td><input type="text" name="oname" value="${buiVO.oname}"></td>
							</tr>
							<tr>
								<th>연락처</th>
								<td><input type="text" name="ophone" value="${buiVO.ophone}"></td>
								<th>생년월일</th>
								<td><input type="text" name="obirth" value="${buiVO.obirth}"></td>
							</tr>
							<tr>
								<th>주소</th>
								<c:choose>
								<c:when test="${buiVO.baddr_old eq ''}">
									<td colspan="3"><input type="text" name="baddr" value="${buiVO.baddr_new}"></td>
								</c:when>
								<c:otherwise>
									<td colspan="3"><input type="text" name="baddr" value="${buiVO.baddr_old}"></td>
								</c:otherwise>
							</c:choose>
								
							</tr>
							<tr>
								<th>메모</th>
								<td colspan="3"><input type="text" name="memo" value="${buiVO.memo}"></td>
							</tr>
						</table>
					</div><!-- buiInfo end -->
					<div class="roomInfo">
						<div class="btn_addTrWrap">
							<p>칸 추가</p>
							<p>칸 제거</p>
						</div>
						<table>
							<tr>
								<th>상태</th>
								<th>구분</th>
								<th>호실</th>
								<th>이름</th>
								<th>연락처</th>
								<th>입주일</th>
								<th>퇴실일</th>
								<th>보증금</th>
								<th>월세</th>
								<th>수리내역</th>
							</tr>
							<c:forEach var="item" items="${roomList}">
								<tr class="roomInfoTr">
									<td>
										<input type="hidden" name="no" value="${item.no}">
										<select name="state">
											<c:choose>
												<c:when test="${item.state eq '계약완료' }">
													<option value="공실">공실</option>
													<option value="입주완료">입주완료</option>
													<option value="계약완료" selected>계약완료</option>
												</c:when>
												<c:when test="${item.state eq '입주완료' }">
													<option value="공실">공실</option>
													<option value="입주완료" selected>입주완료</option>
													<option value="계약완료">계약완료</option>
												</c:when>
												<c:otherwise>
													<option value="공실" selected>공실</option>
													<option value="입주완료">입주완료</option>
													<option value="계약완료">계약완료</option>
												</c:otherwise>
											</c:choose>
										</select> 
									</td>
									<td>
										<select name="pay_type">
											<c:choose>
												<c:when test="${item.pay_type eq '월세' }">
													<option value="월세" selected>월세</option>
													<option value="전세">전세</option>
												</c:when>
												<c:otherwise>
													<option value="월세">월세</option>
													<option value="전세" selected>전세</option>
												</c:otherwise>
											</c:choose>
											 
										</select>
									</td>
									<td><input type="text" name="rno" placeholder="ex) 101" value="${item.rno}"></td>
									<td><input type="text" name="tenant" value="${item.tenant }"></td>
									<td><input type="text" name="phone" placeholder="ex) 010-1234-1234" value="${item.phone}"></td>
									<td><input type="date" name="check_in" placeholder="ex) 2019-05-05" value="${item.check_in}"></td>
									<td><input type="date" name="check_out" placeholder="ex) 2019-05-05" value="${item.check_out}"></td>
									<td><input type="text" name="deposit" placeholder="ex) 500만원" value="${item.deposit}"></td>
									<td><input type="text" name="monthly_rent" placeholder="ex) 35만원" value="${item.monthly_rent}"></td>
									<td><input type="text" name="repair_record" value="${item.repair_record}"></td>
								</tr>
							</c:forEach>
						</table>
						
						<div class="btn_registerWrap">
							<p>수정등록</p>
							<p>취소</p>
						</div>
					</div><!-- roomInfo end -->
				</div><!-- formWrap end -->
			</div><!-- section end -->
		</div>
		<div class="footerWrap">
			
		</div>
	</div>
</body>
</html>