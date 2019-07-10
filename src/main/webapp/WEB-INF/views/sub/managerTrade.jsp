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
		width: 1100px;
		margin: 0 auto;
		padding: 15px 0;
	}
	.searchWrap{
		width: 100%;
		margin-bottom: 20px;
		overflow: hidden;
		font-size: 15px;
	}
	.searchWrap > select{
		font-size: 15px;
		padding: 3px 1px;
	}
	.searchWrap > input{
		font-size: 15px;
		padding: 3px 1px;
		width: 100px;
		text-align: right;
	}
	.searchWrap > input:nth-child(1){
		text-align: left;
	}
	.searchWrap > button{
		background: #105340;
		font-size: 15px;
		color: #fefefe;
		padding: 5px 10px;
		border-radius: 3px;
		margin-left: 15px;
	}
	.searchWrap > #printBtn{
		width: 33px;
		float: right;
		cursor: pointer;
	}
	.contentWrap{
		width: 100%;
	}
	.contentWrap > .tblWrap{
		width: 100%;
		overflow: hidden;
	}
	.tbl{
		width: 530px;
		margin-bottom: 30px;
		overflow: hidden;
	}
	.tbl > h2{
		width: 100%;
		text-align: center;
		font-size: 20px;
		font-weight: bold;
		background: #475c6f;
		padding: 12px 0;
		color: #fefefe;
	}
	.tbl:nth-child(odd){
		float: left;
	}
	.tbl:nth-child(even){
		float: right;
	}
	.tbl > table{
		width: 50%;
		height:350px;
		float:left;
	}
	.tbl > table tr{
		
	}
	.tbl > table tr > th{
		background: #7b93a8;
		color: #fefefe;
		font-size: 15px;
		border: 1px solid lightgray;
	}
	.tbl > table tr:nth-child(1) > th{ 
		
	}
	.tbl > table tr > td{
		font-size: 15px;
		padding: 0 2px;
		text-align: center;
		border: 1px solid lightgray;
	}
	
	
	
	.page{
		margin: 15px auto;
	}
	.page > ul{
		text-align: center;
	}
	.page ul li{
		margin:0 auto;
		list-style: none;
		display: inline-block;
		text-align:center;
		border:1px solid #e9e9e9;
		border-radius: 8px;
		margin: 0 1px;
		background: #fafafa;
	}
	.page ul li a{
		display:inline-block;
		width:35px;
		height:30px;
		font-size:1.1em;
		line-height: 30px;
	}
	.active1{
		background: #f88509 !important;
	}
	.active2{
		font-weight: bold;
		color:white;
	}

	.footerWrap{
		width: 100%;
		height: 70px;
		background: #7b93a8;
	}
</style>
<script>
function get_tradeAll(info){
	var dt;
	$.ajax({
		url:"${pageContext.request.contextPath}/getTradeAll",
		type: "post",
		data:JSON.stringify(info),
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

function get_sigunguBySido(sido_no){
	var dt;
	$.ajax({
		url:"${pageContext.request.contextPath}/sigunguBySido/"+sido_no,
		type: "get",
		dataType:"json",
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

function draw_sigungu(sido_no){
	var sigungu = get_sigunguBySido(sido_no);
	var str = "<option value=''>시군구 선택</option>";
	
	$(sigungu).each(function(){
		str += "<option value='"+this.sigungu_name+"'>"+this.sigungu_name+"</option>";
	});
	$(".searchWrap > select[name='addr_sigungu']").html(str);
}

function draw_trade(info){
	var json = get_tradeAll(info); 
	var rtype = "";
	var str = "";
	str = "";
	var addrArr=[];
	
	if(json.list.length == 0){
		str += "<p style='width:100%; border:1px solid lightgray; padding:15px; font-size:18px; text-align:center;'>등록된 물건이 없습니다.</p>";
		$(".contentWrap > .tblWrap").html(str);
	}else{
		$(json.list).each(function(){
			addrArr = this.baddr.split(" ");
			str += "<div class='tbl'><h2>"+addrArr[2]+" 건물 ("+this.bno+")</h2>"
				+ "<table><tr><th rowspan='5'>건물현황</th><th>준공일</th><td>"+this.completion_date+"</td></tr>"
				+ "<tr><th>대지</th><td>"+this.site+"㎥</td></tr>"
				+ "<tr><th>연면적</th><td>"+this.gross_area+"㎥</td></tr>"
				+ "<tr><th>도로</th><td>"+this.road+"</td></tr>"
				+ "<tr><th>난방</th><td>"+this.heating+"</td></tr>"
				+ "<tr><th rowspan='6'>방현황</th><th>상가</th><td>"+this.cnt_store+"</td></tr>"
				+ "<tr><th>원룸</th><td>"+this.cnt_one+"</td></tr>"
				+ "<tr><th>미니투룸</th><td>"+this.cnt_mitwo+"</td></tr>"
				+ "<tr><th>투룸</th><td>"+this.cnt_two+"</td></tr>"
				+ "<tr><th>쓰리룸</th><td>"+this.cnt_three+"</td></tr>"
				+ "<tr><th>주인세대</th><td>"+this.cnt_owner+"</td></tr>"
				+ "<tr><th colspan='2'>합계</th><td>"+(Number(this.cnt_store)+Number(this.cnt_one)+Number(this.cnt_mitwo)+Number(this.cnt_two)+Number(this.cnt_three)+Number(this.cnt_owner))+"</td></tr></table>"
				+ "<table><tr><th rowspan='8'>수익정보</th><th>매매금액</th><td>"+this.trade_price+"</td></tr>"
				+ "<tr><th>보증금</th><td>"+this.total_deposit+"만원</td></tr>"
				+ "<tr><th>융자</th><td>"+this.financing+"만원</td></tr>"
				+ "<tr><th>1년수익</th><td>6600만원</td></tr>"
				+ "<tr><th>이자<br>(연"+this.interest_percent+"%)</th><td>2100만원</td></tr>"
				+ "<tr><th>월수익</th><td>"+this.total_monthly_rent+"만원</td></tr>"
				+ "<tr><th>연수익</th><td>4160만원</td></tr>"
				+ "<tr><th>연수익률</th><td>11.12%</td></tr></table></div>";
		});
		$(".contentWrap > .tblWrap").html(str);
		
		str = "<ul>";
		if(json.pageMaker.prev){
			str += "<li><a href='page="+(json.pageMaker.startPage-1)+"&perPageNum=10&searchType="+json.pageMaker.cri.searchType+"&keyword1="+json.pageMaker.cri.keyword1+"&keyword2="+json.pageMaker.cri.keyword2+"&keyword3="+json.pageMaker.cri.keyword3+"'>&laquo;</a></li>";
		}
		for(var i=json.pageMaker.startPage; i<=json.pageMaker.endPage; i++){
			
			if(json.pageMaker.cri.page == i){
				str += "<li class='active1'><a class='active2' href='page="+i+"&perPageNum=10&searchType="+json.pageMaker.cri.searchType+"&keyword1="+json.pageMaker.cri.keyword1+"&keyword2="+json.pageMaker.cri.keyword2+"&keyword3="+json.pageMaker.cri.keyword3+"'>"+i+"</a></li>";
			}else{
				str += "<li><a href='page="+i+"&perPageNum=10&searchType="+json.pageMaker.cri.searchType+"&keyword1="+json.pageMaker.cri.keyword1+"&keyword2="+json.pageMaker.cri.keyword2+"&keyword3="+json.pageMaker.cri.keyword3+"'>"+i+"</a></li>"
			}
		}
		if(json.pageMaker.next){
			str += "<li><a href='page="+(json.pageMaker.endPage+1)+"&perPageNum=10&searchType="+json.pageMaker.cri.searchType+"&keyword1="+json.pageMaker.cri.keyword1+"&keyword2="+json.pageMaker.cri.keyword2+"&keyword3="+json.pageMaker.cri.keyword3+"'>&raquo;</a></li>";
		}
		str += "</ul>";
		
		$(".contentWrap > .page").html(str);
	}
	
	
	
}

$(function(){
	//처음 테이블 생성
	var info = {};
	draw_trade(info);
	
	
	$(".searchWrap > select[name='addr_sido']").change(function(){
		var idx = $(this).val();
		if(idx == 0){
			$(".searchWrap > select[name='addr_sigungu']").html("<option value=''>시군구 선택</option>");
		}else if(idx == 8){
			$(".searchWrap > select[name='addr_sigungu']").html("<option value=''>시군구 선택</option>");
		}else{
			draw_sigungu(idx);
		}
	});
	
	//공실 조건 검색.
	$(".searchWrap > button").click(function(){
		var s=""; 
		var k1="";
		var k2="";
		var k3="";
		
		var sido = $(".searchWrap > select[name='addr_sido'] > option:selected").text();
    	var sigungu = $(".searchWrap > select[name='addr_sigungu']").val();
    	var dong = $(".searchWrap > input[name='dong']").val();
    	var tradePrice1 = $(".searchWrap > input[name='tradePrice1']").val();
    	var tradePrice2 = $(".searchWrap > input[name='tradePrice2']").val();
    	
    	if(sido == "도시 선택"){
    		sido = "";
    		k1="";
    	}
    	if(sigungu.length == 0){
    		if(sido == "도시 선택"){
    			k1="";
    		}else{
    			k1=sido;
    		}
    	}else{
    		if(dong.trim().length > 1){
    			k1=sido+" "+sigungu+" "+dong;
    		}
    	}
    	if(sido=="세종특별자치시"){
    		if(dong.trim().length > 1){
    			k1=sido+" "+dong;
    		}else{
    			k1=sido;
    		}
    	}
    	
    	
    	k2 = tradePrice1;
    	k3 = tradePrice2;
    	console.log(k1+"\n"+k1.length);
    	if(k1.length < 2 && k2.length == 0 && k3.length ==0){
    		s = "n";
    	}else if(k1.length > 2 && k2.length==0 && k3.length == 0){
    		s = "a";
    	}else if(k1.length < 2 && (k2.length > 1 || k3.length > 1)){
    		s = "t";
    	}else if(k1.length > 2 && k2.length > 1 && k3.length > 1){
    		s = "at";
    	}
    	console.log(s);
		var page=1;
		var perPageNum=10;
		var searchType=s;
		var keyword1=k1;
		var keyword2=k2;
		var keyword3=k3;
		
		var info = {page:page, perPageNum:perPageNum, searchType:searchType, keyword1:keyword1, keyword2:keyword2, keyword3:keyword3};
		draw_trade(info);
	});
	
	//공실 테이블 페이지 클릭
	$(document).on("click", ".page > ul > li > a", function(e){
		e.preventDefault();
		var page="";
		var perPageNum="";
		var searchType="";
		var keyword1="";
		var keyword2="";
		var keyword3="";
		
		var href_txt = $(this).attr("href");
		var splitList = href_txt.split("&");
		
		for(var i=0; i<splitList.length; i++){
			if(i==0){
				page=splitList[i].split("=")[1];
			}else if(i==1){
				perPageNum=splitList[i].split("=")[1];
			}else if(i==2){
				searchType = splitList[i].split("=")[1];
			}else if(i==3){
				keyword1 = splitList[i].split("=")[1];
			}else if(i==4){
				keyword2 = splitList[i].split("=")[1];
			}else if(i==5){
				keyword3 = splitList[i].split("=")[1];
			}
		}
		
		var info = {page:page, perPageNum:perPageNum, searchType:searchType, keyword1:keyword1, keyword2:keyword2, keyword3:keyword3};
		draw_repairCompany(info);
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
				<p><img src="${pageContext.request.contextPath}/resources/images/icon_plus_cr.png"><span>건물매매</span><img src="${pageContext.request.contextPath}/resources/images/icon_line.png"></p>
			</div>
			<div class="section">
				<div class="searchWrap">
					<select name="addr_sido">
						<option value="">도시 선택</option>
						<option value="1">서울특별시</option>
						<option value="2">부산광역시</option> 
						<option value="3">대구광역시</option>
						<option value="4">인천광역시</option>
						<option value="5">광주광역시</option>
						<option value="6">대전광역시</option> 
						<option value="7">울산광역시</option>
						<option value="8">세종특별자치시</option>
						<option value="9">경기도</option>
						<option value="10">강원도</option>
						<option value="11">충청북도</option>
						<option value="12">충청남도</option>
						<option value="13">전라북도</option>
						<option value="14">전라남도</option>
						<option value="15">경상북도</option>
						<option value="16">경상남도</option>
						<option value="17">제주특별자치도</option>
					</select>
					<select name="addr_sigungu">
						<option value="">시군구 선택</option>
					</select>
					<input type="text" name="dong" placeholder="동을 입력하세요.">
					<input type="text" name="tradePrice1" placeholder="숫자만 입력하세요.">만원~<input type="text" name="tradePrice2" placeholder="숫자만 입력하세요.">만원
					<button>검 색</button>
				</div><!-- searchWrap end -->
				<div class="contentWrap">
					<div class="tblWrap" id="tblWrap">
						

					</div><!-- tblWrap end -->
					<div class="page">
					
					</div>
				</div>
			</div><!-- section end -->
		</div>
		<div class="footerWrap">
			
		</div>
	</div>
</body>
</html>