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
<script src="${pageContext.request.contextPath}/resources/js/ownerCalendar.js"></script>
<style>
	.allWrap{
		width: 100%;
		position: relative;
	}
	.popupWrap{
		display: none;
		position: fixed;
		width: 100%;
		height: 100%;
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
		background: #f3f3f3;
		margin:0 auto;
		margin-top:100px;
		position: relative;
		z-index: 999;
		text-align: center;
	}
	.popup_memoRegister > h3{ 
		width: 100%;
		font-size: 25px;
		color: #fff;
		padding: 15px 0;
		background: #475c6f;
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
		font-size: 15px;
		padding: 7px 12px; 
		border-radius: 4px;
	}
	.popup_btnWrap > p:nth-child(1){
		background: #1e866a;
		color: #efefef;
	}
	.popup_btnWrap > p:nth-child(2){
		background: lightgray;
		color: #333;
	}
	
	.popup_memoUpdate{
		display: none;
		width:350px;
		background: #f3f3f3;
		margin:0 auto;
		margin-top:100px;
		position: relative;
		z-index: 999;
		text-align: center;
	}
	.popup_memoUpdate > h3{ 
		width: 100%;
		font-size: 25px;
		color: #fff;
		padding: 15px 0;
		background: #475c6f;
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
	
	.headerWrap{
		width: 100%;
		height: 70px;
		background: #475c6f;
		
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
		margin-bottom: 70px;
	}
	#calendarWrap {
		float:left;
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
		margin-left: 25px;
	}
	.noticeChkInOut > h4{
		width: 100%;
		background: #7b93a8;
		color: #fff;
		text-align: center;
		padding: 7px;
		font-size: 17px;
	}
	.noticeChkInOut > .tblWrap{
		width: 100%;
		max-height: 150px;
		overflow: auto;
		border: 1px solid lightgray;
	}
	.noticeChkInOut > .tblWrap > table{
		width: 100%;
	}
	.noticeChkInOut > .tblWrap > table tr{
		
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
	.noticeChkInOut > .tblWrap > table .noticeContentTr:nth-child(odd){
		background: #efefef;
	}
	.noticeChkOutWrap{
		margin-top:15px;
	}
	
	.memoWrap{
		display: none;
		width: 100%;
		margin-top: 15px;
		background: #efefef;
	}
	.memoTitle{
		width: 100%;
		background: #7b93a8;
	}
	.memoTitle > h4{
		width: 100%;
		text-align: center;
		color: #fff;
		padding: 7px 0;
		font-size: 17px;
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
	}
	.memoBtnWrap{
		width: 100%;
		text-align: center;
		padding: 5px 0;
	}
	.memoBtnWrap > p{
		display: inline-block;
		font-size: 15px;
		padding: 8px 10px;
		cursor: pointer;
		color: #fff;
		border-radius: 3px;
	}
	.memoBtnWrap > p:nth-child(1){
		background: #064acb;
	}
	.memoBtnWrap > p:nth-child(2){
		background: #366ed8;
		margin: 0 3px;
	}
	.memoBtnWrap > p:nth-child(3){
		background: #f3a953;
	}
	
	.asideBottom{
	
	}
	.asideBottom > table{
		border: 1px solid lightgray;
	}
	.asideBottom > table tr{
	
	}
	.asideBottom > table tr > th{
		font-size: 15px;
		border: 1px solid lightgray;
	}
	.asideBottom > table tr > td{
		font-size: 15px;
		text-align: center;
		padding: 7px 0;
		border: 1px solid lightgray;
	}
	.asideBottom > table tr:first-child{
		background: #475c6f;
	}
	.asideBottom > table tr:first-child > th{
		color: #fff;
		font-size: 18px;
		padding: 5px;
	}
	.asideBottom > table tr:nth-child(2){
		background: #7b93a8;
	}
	.asideBottom > table tr:nth-child(2) > th{
		color: #fff;
		padding: 6px 0;
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
	.mbListTr:nth-child(even){
		background: #efefef;
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
	.footerWrap{
		width: 100%;
		height: 70px;
		background: #7b93a8;
	}
</style>
<script>


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


function draw_table_ownBuilding(ono){
	var buiList = get_BuildingByOno(ono);
	var str = "";
	var cntNum = 1;
	var addr = "";
	if(buiList.length == 0){
		str = "<tr><td colspan='9'>보유중인 건물이 존재하지 않습니다.</td></tr>";
	}else{
		$(buiList).each(function(){
			if(this.baddr_old == "" || this.baddr_old == null || this.baddr_old == "null"){
				addr = this.baddr_new;
			}else{
				addr = this.baddr_old;
			}
			str += "<tr class='mbListTr'><td>"+cntNum+"<input type='hidden' name='bno' value='"+this.bno+"'></td><td><a href='${pageContext.request.contextPath}/owner/oBuiInfo/"+this.bno+"'>"+this.bname+"</a></td>"
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
				str += "<tr class='noticeContentTr'><td><span class='fc_green'>입주</span> "+this.check_in+" "+"<a href='${pageContext.request.contextPath}/owner/oBuiInfo/"+this.bno+"'> "+this.bname+"</a> "+this.rno+"호</td></tr>";
				//달력표시
				cTag = $(".c_"+this.check_in+" > .calNoticeWrap");
				if(cTag.find(".icon_in_house").length <= 0){
					cTag.append("<img class='icon_in_house' src='${pageContext.request.contextPath}/resources/images/icon_in_house.png'>");
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
				str += "<tr class='noticeContentTr'><td><span class='fc_red'>퇴실</span>  "+this.check_out+"<a href='${pageContext.request.contextPath}/owner/oBuiInfo/"+this.bno+"'> "+this.bname+"</a> "+this.rno+"호</td></tr>";
				//달력표시
				cTag = $(".c_"+this.check_out+" > .calNoticeWrap");
				if(cTag.find(".icon_out_house").length <= 0){
					cTag.append("<img class='icon_out_house' src='${pageContext.request.contextPath}/resources/images/icon_out_house.png'>");
				}
			});
		}
		
		$(".noticeChkOutWrap > .tblWrap > table").html(str);
	}
	
}

$(function(){
	var today = new Date();
	draw_table_ownBuilding($("#seOno").val());
	drawCalendar(today);
	
	
	//달력 이전달 클릭
	$("#prevMonth > p").click(function(){
		var selectDate = $("#sYearMonth > input[name='selectDate']").val();
		var splitDateInfo = selectDate.split("-");
		var nowDate = new Date(splitDateInfo[0], Number(splitDateInfo[1])-1, 1);
		var prevDate = new Date(nowDate.setDate(nowDate.getDate()-1));
		drawCalendar(prevDate);
	});
	
	//달력 다음달 클릭
	$("#nextMonth > p").click(function(){
		var selectDate = $("#sYearMonth > input[name='selectDate']").val();
		var splitDateInfo = selectDate.split("-");
		var nowDate = new Date(splitDateInfo[0], Number(splitDateInfo[1])+1, 1);
		var nextDate = new Date(nowDate.setDate(nowDate.getDate()-1));
		drawCalendar(nextDate);
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
		</div>
		<div class="headerWrap">
			<jsp:include page="../include/ownerHeader.jsp"></jsp:include>
		</div>
		<div class="sectionWrap">
			<div class="section">
				<div class="asideTop">
					<div id="calendarWrap">
						<table>
							<tr id="calendar1tr">
								<td id="prevMonth" colspan="2"><p>◀</p></td>
								<td id="sYearMonth" colspan="3"><p></p><input type='hidden' name='selectDate' value=''></td>
								<td id="nextMonth" colspan="2"><p>▶</p></td>
							</tr>
							<tr id="calendar2tr">
								<td><p>일</p></td>
								<td><p>월</p></td>
								<td><p>화</p></td>
								<td><p>수</p></td>
								<td><p>목</p></td>
								<td><p>금</p></td>
								<td><p>토</p></td>
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
							<th colspan="9">현재 보유 중인 건물은 총 <span>3</span>채입니다.</th>
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
		</div>
		<div class="footerWrap">
			
		</div>
	</div>
</body>
</html>