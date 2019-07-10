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
		padding: 15px;
	}
	.searchWrap{
		width: 100%;
		margin-bottom: 20px;
		overflow: hidden;
	}
	.searchWrap > select{
		font-size: 15px;
	}
	.searchWrap > input{
		font-size: 15px;
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
	}
	.contentWrap > .tblWrap > table{
		width: 100%;
	}
	.contentWrap > .tblWrap > table tr > th{
		font-size: 15px;
		color: #fefefe;
		padding: 7px 0;
		background: #7a93a9;
		border: 1px solid lightgray;
	}
	.contentWrap > .tblWrap > table tr > td{
		font-size: 14px;
		text-align: center;
		border: 1px solid lightgray;
		padding: 5px;
	}
	.contentWrap > .tblWrap > table tr > td > p{
		font-size: 14px;
	}
	.contentWrap > .tblWrap > table tr > td:nth-child(1){
		text-align: left;
		padding-left: 5px;
	}
	.contentWrap > .tblWrap > table tr > td:nth-child(1) > p:nth-child(1){
		font-weight: bold;
		font-size: 16px;
		margin-bottom:5px;
	}
	.contentWrap > .tblWrap > table tr > th:nth-child(1){
		width: 230px;
	}
	.contentWrap > .tblWrap > table tr > th:nth-child(2){
		width: 150px;
	}
	.contentWrap > .tblWrap > table tr > th:nth-child(3){
		width: 240px;
	}
	.contentWrap > .tblWrap > table tr > th:nth-child(4){
		width: 450px;
	}
	.rcContent{
		width: 100%;
		height: 60px;
		overflow: auto;
	}
	.rcContent > div{
		width: 100%;
		display: inline-block;
		vertical-align: middle;
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
function get_repairCompanyAll(info){
	var dt;
	$.ajax({
		url:"${pageContext.request.contextPath}/getRepairCompanyAll",
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
	var str = "";
	
	$(sigungu).each(function(){
		str += "<option value='"+this.sigungu_name+"'>"+this.sigungu_name+"</option>";
	});
	$(".searchWrap > select[name='addr_sigungu']").html(str);
}

function draw_repairCompany(info){
	var json = get_repairCompanyAll(info); 
	var rtype = "";
	var str = "";
	str = "<tr><th>업체명</th><th>출장지역</th><th>종류</th><th>설명</th></tr>";
	if(json.list.length == 0){
		str += "<tr><td colspan='4'>등록된 정보가 없습니다.</td></tr>";
		$(".contentWrap > .tblWrap > table").html(str);
	}else{
		$(json.list).each(function(){
			str += "<tr><td><p>"+this.name+"</p><p>"+this.callnum+"</p><p>"+this.addr+"</p></td><td>"+this.business_area+"</td><td><p>"+this.repairtype+"</p></td><td><div class='rcContent'><div>"+this.content+"</div></div></td></tr>";
		});
		$(".contentWrap > .tblWrap > table").html(str);
		
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
	draw_repairCompany(info);
	
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
    	var rtype = $(".searchWrap > input[name='repairtype']").val();
    	
    	if(sido == "도시 선택"){
    		sido = "";
    	}
    	
    	k1 = sido;
    	k2 = sigungu;
    	k3 = rtype;
    	
    	if(k1.length == 0 && k3.length == 0){
    		s = "n";
    	}else if(k1.length > 0 && k3.length == 0){
    		s = "a";
    	}else if(k1.length == 0 && k3.length > 1){
    		s = "r";
    	}else if(k1.length > 0 && k3.length > 1){
    		s = "ar";
    	}
    	
		var page=1;
		var perPageNum=10;
		var searchType=s;
		var keyword1=k1;
		var keyword2=k2;
		var keyword3=k3;
		
		var info = {page:page, perPageNum:perPageNum, searchType:searchType, keyword1:keyword1, keyword2:keyword2, keyword3:keyword3};
		draw_repairCompany(info);
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
			<jsp:include page="../include/ownerHeader.jsp"></jsp:include>
		</div>
		<div class="sectionWrap">
			<div class="sectionTitle">
				<p><img src="${pageContext.request.contextPath}/resources/images/icon_plus_cr.png"><span>수리/시공업체</span><img src="${pageContext.request.contextPath}/resources/images/icon_line.png"></p>
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
					<input type="text" name="repairtype" placeholder="ex) 하수구">
					<button>검 색</button>
				</div><!-- searchWrap end -->
				<div class="contentWrap">
					<div class="tblWrap" id="tblWrap">
						<table>
							
							
						</table>
					</div>
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