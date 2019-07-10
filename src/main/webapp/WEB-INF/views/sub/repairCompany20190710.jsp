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
<script src="${pageContext.request.contextPath}/resources/js/jquery.rwdImageMaps.min.js"></script>
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
	.menuWrap > ul > li:nth-child(4) > a{
		color: #fff;
	}
	.menuWrap > ul > li:nth-child(4) > .menuBg{
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
		height: 800px;
		background: #ecf7ff;
		z-index: -1;
	}
	
	
	.sectionWrap{
		width: 100%;
		min-width: 1100px;
		min-height: 829px;
		clear: both;
		padding: 10px;
		padding-bottom: 100px;
	}
	.section{
		width: 100%;
		height: 785px;
		margin: 0 auto;
		padding-top: 50px;
		position: relative;
	}
	.bigIconWrap{
		width: 1100px;
		margin: 0 auto;
		margin-top: 50px;
		overflow: hidden;
	}
	.iconWrap{
		float: left;
		width: 150px;
		margin: 30px 105px;
		cursor: pointer;
	}
	.iconWrap > img{
		width: 100%;
	}
	.iconWrap > h4{
		width: 100%;
		text-align: center;
		padding-top: 15px;
		font-size: 20px;
	}
	
	.detailIconWrap{
		display: none;
		width: 1100px;
		margin: 0 auto;
		overflow: hidden;
	}
	.detailLeft{
		float: left;
		width: 135px;
		margin-right:15px;
	}
	.detailRight{
		float: right;
		width: 910px;
		padding-top:230px;
	}
	.detailLeft > .selectTitle{
		width: 100%;
		margin-bottom: 50px;
	}
	.detailLeft > .selectTitle > h3{
		width: 100%;
		margin-bottom:20px;
		font-weight: bold;
		text-align: center;
	}
	.detailLeft > .selectTitle > img{
		width: 100%;
	}
	.detailLeft > .underItem{
		width: 60px;
		margin: 0 auto;
		margin-bottom: 30px; 
		cursor: pointer;
	}
	.detailLeft > .underItem > img{
		width: 100%;
	}
	.detailLeft > .underItem > h4{
		width: 100%;
		text-align: center;
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
	
	.tblWrap{
		width: 100%;
	}
	.tblWrap > table{
		width: 100%;
		background: #fff;
	}
	.tblWrap > table tr > th{
		font-size: 15px;
		color: #fefefe;
		padding: 7px 0;
		background: #6c7981;
		border: 1px solid lightgray;
	}
	.tblWrap > table tr > td{
		font-size: 14px;
		text-align: center;
		border: 1px solid lightgray;
		padding: 5px 10px;
	}
	.tblWrap > table tr > td > p{
		font-size: 14px;
	}
	.tblWrap > table tr > td:nth-child(1){
		text-align: left;
		padding-left: 5px;
	}
	.tblWrap > table tr > td:nth-child(1) > p:nth-child(1){
		font-weight: bold;
		font-size: 16px;
		margin-bottom:5px;
	}
	.tblWrap > table tr > th:nth-child(1){
		width: 250px;
	}
	.tblWrap > table tr > th:nth-child(2){
		width: 100px;
	}
	.tblWrap > table tr > th:nth-child(3){
		width: 240px;
	}
	.tblWrap > table tr > th:nth-child(4){
		width: 250px;
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
		str += "<tr><td colspan='4' style='text-align:center;'>등록된 정보가 없습니다.</td></tr>";
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

function draw_detailContent(idx){
	var num = idx;
	var str = "";
	if(num == 0){
		str = "<div class='selectTitle'><h3>청소</h3><img src='${pageContext.request.contextPath}/resources/images/icon_clean2.png'></div>"
			+ "<div class='underItem'><img src='${pageContext.request.contextPath}/resources/images/icon_stair.png'><h4>계단</h4><input type='hidden' name='itemVal' value='계단'></div>"
			+ "<div class='underItem'><img src='${pageContext.request.contextPath}/resources/images/icon_room.png'><h4>룸</h4><input type='hidden' name='itemVal' value='룸'></div>"
			+ "<div class='underItem'><img src='${pageContext.request.contextPath}/resources/images/icon_washingMachine.png'><h4>세탁기</h4><input type='hidden' name='itemVal' value='세탁기'></div>"
			+ "<div class='underItem'><img src='${pageContext.request.contextPath}/resources/images/icon_airconditioner.png'><h4>에어컨</h4><input type='hidden' name='itemVal' value='에어컨'></div>";
	}else if(num == 1){
		str = "<div class='selectTitle'><h3>설비</h3><img src='${pageContext.request.contextPath}/resources/images/icon_tool2.png'></div>"
			+ "<div class='underItem'><img src='${pageContext.request.contextPath}/resources/images/icon_waterdrop.png'><h4>방수</h4><input type='hidden' name='itemVal' value='방수'></div>"
			+ "<div class='underItem'><img src='${pageContext.request.contextPath}/resources/images/icon_smell.png'><h4>악취제거</h4><input type='hidden' name='itemVal' value='악취제거'></div>"
			+ "<div class='underItem'><img src='${pageContext.request.contextPath}/resources/images/icon_pipe.png'><h4>배관</h4><input type='hidden' name='itemVal' value='배관'></div>";
	}else if(num == 2){
		str = "<div class='selectTitle'><h3>전기</h3><img src='${pageContext.request.contextPath}/resources/images/icon_electric2.png'></div>"
			+ "<div class='underItem'><img src='${pageContext.request.contextPath}/resources/images/icon_door.png'><h4>현관문</h4><input type='hidden' name='itemVal' value='현관문'></div>"
			+ "<div class='underItem'><img src='${pageContext.request.contextPath}/resources/images/icon_doorlock.png'><h4>도어락</h4><input type='hidden' name='itemVal' value='도어락'></div>"
			+ "<div class='underItem'><img src='${pageContext.request.contextPath}/resources/images/icon_electricrepair.png'><h4>전기공사</h4><input type='hidden' name='itemVal' value='전기공사'></div>"
			+ "<div class='underItem'><img src='${pageContext.request.contextPath}/resources/images/icon_led.png'><h4>LED등 교체</h4><input type='hidden' name='itemVal' value='LED등 교체'></div>";
	}else if(num == 3){
		str = "<div class='selectTitle'><h3>방역</h3><img src='${pageContext.request.contextPath}/resources/images/icon_mask2.png'></div>";
	}else if(num == 4){
		str = "<div class='selectTitle'><h3>가전</h3><img src='${pageContext.request.contextPath}/resources/images/icon_tv2.png'></div>";
	}else if(num == 5){
		str = "<div class='selectTitle'><h3>인테리어</h3><img src='${pageContext.request.contextPath}/resources/images/icon_interior2.png'></div>"
			+ "<div class='underItem'><img src='${pageContext.request.contextPath}/resources/images/icon_stair.png'><h4>도배</h4><input type='hidden' name='itemVal' value='도배'></div>"
			+ "<div class='underItem'><img src='${pageContext.request.contextPath}/resources/images/icon_room.png'><h4>가구</h4><input type='hidden' name='itemVal' value='가구'></div>";
	}
	$(".detailIconWrap > .detailLeft").html(str);
	$(".bigIconWrap").css("display","none");
	$(".detailIconWrap").css("display", "block");
	
	var info = {page:1, perPageNum:10, searchType:"n", keyword1:"", keyword2:"", keyword3:""};
	draw_repairCompany(info);
}
$(function(){
	
	$(document).on("mouseover", ".iconWrap", function(){
		var hoverPosi = $(this).find("h4").text();
		if(hoverPosi == "청소"){
			$(this).find("img").prop("src", "${pageContext.request.contextPath}/resources/images/icon_clean2.png");
			$(this).find("h4").css("color", "#1797f7");
		}else if(hoverPosi == "설비"){
			$(this).find("img").prop("src", "${pageContext.request.contextPath}/resources/images/icon_tool2.png");
			$(this).find("h4").css("color", "#1797f7");
		}else if(hoverPosi == "전기"){
			$(this).find("img").prop("src", "${pageContext.request.contextPath}/resources/images/icon_electric2.png");
			$(this).find("h4").css("color", "#1797f7");
		}else if(hoverPosi == "방역"){
			$(this).find("img").prop("src", "${pageContext.request.contextPath}/resources/images/icon_mask2.png");
			$(this).find("h4").css("color", "#1797f7");
		}else if(hoverPosi == "가전"){
			$(this).find("img").prop("src", "${pageContext.request.contextPath}/resources/images/icon_tv2.png");
			$(this).find("h4").css("color", "#1797f7");
		}else if(hoverPosi == "인테리어"){
			$(this).find("img").prop("src", "${pageContext.request.contextPath}/resources/images/icon_interior2.png");
			$(this).find("h4").css("color", "#1797f7");
		}
	});
	$(document).on("mouseout", ".iconWrap", function(){
		$(".iconWrap").eq(0).find("img").prop("src", "${pageContext.request.contextPath}/resources/images/icon_clean.png");
		$(".iconWrap").eq(1).find("img").prop("src", "${pageContext.request.contextPath}/resources/images/icon_tool.png");
		$(".iconWrap").eq(2).find("img").prop("src", "${pageContext.request.contextPath}/resources/images/icon_electric.png");
		$(".iconWrap").eq(3).find("img").prop("src", "${pageContext.request.contextPath}/resources/images/icon_mask.png");
		$(".iconWrap").eq(4).find("img").prop("src", "${pageContext.request.contextPath}/resources/images/icon_tv.png");
		$(".iconWrap").eq(5).find("img").prop("src", "${pageContext.request.contextPath}/resources/images/icon_interior.png");
		$(this).find("h4").css("color", "#333333");
	});
	
	$(document).on("click", ".iconWrap", function(){
		var idx = $(this).index();
		var selectTitle = $(this).find("h4").text();
		$("#selectVal").val(selectTitle);
		draw_detailContent(idx);
	})
	
	// ====================================================================================================================================================
		
	$(document).on("click", ".underItem", function(){
		var selectVal = $("#selectVal").val();
		var str = "";
		if(selectVal == "청소"){
			$(".underItem").eq(0).find("img").prop("src", "${pageContext.request.contextPath}/resources/images/icon_stair.png");
			$(".underItem").eq(1).find("img").prop("src", "${pageContext.request.contextPath}/resources/images/icon_room.png");
			$(".underItem").eq(2).find("img").prop("src", "${pageContext.request.contextPath}/resources/images/icon_washingMachine.png");
			$(".underItem").eq(3).find("img").prop("src", "${pageContext.request.contextPath}/resources/images/icon_airconditioner.png");
		}else if(selectVal == "설비"){
			$(".underItem").eq(0).find("img").prop("src", "${pageContext.request.contextPath}/resources/images/icon_waterdrop.png");
			$(".underItem").eq(1).find("img").prop("src", "${pageContext.request.contextPath}/resources/images/icon_smell.png");
			$(".underItem").eq(2).find("img").prop("src", "${pageContext.request.contextPath}/resources/images/icon_pipe.png");
		}else if(selectVal == "전기"){
			$(".underItem").eq(0).find("img").prop("src", "${pageContext.request.contextPath}/resources/images/icon_door.png");
			$(".underItem").eq(1).find("img").prop("src", "${pageContext.request.contextPath}/resources/images/icon_doorlock.png");
			$(".underItem").eq(2).find("img").prop("src", "${pageContext.request.contextPath}/resources/images/icon_electricrepair.png");
			$(".underItem").eq(3).find("img").prop("src", "${pageContext.request.contextPath}/resources/images/icon_led.png");
		}else if(selectVal == "인테리어"){
			$(".underItem").eq(0).find("img").prop("src", "${pageContext.request.contextPath}/resources/images/icon_stair.png");
			$(".underItem").eq(1).find("img").prop("src", "${pageContext.request.contextPath}/resources/images/icon_room.png");
		}
		
		var selImgSrc = $(this).find("img").prop("src");
		var src2 = selImgSrc.split(".png")[0]+"2.png";
		$(this).find("img").prop("src", src2);
		
		var selectItem = $(this).find("input[name='itemVal']").val();
		$("#selectUnderVal").val(selectItem);
		
	});
		
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
	
	//수리업체 searchWrap에서 버튼 클릭
	$(document).on("click", ".searchWrap > button", function(){
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
    	k3 = "";
    	
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
	
	//뒤로가기 누른 경우
	$(document).on("click", "#backBtn", function(){
		$(".detailIconWrap > .detailLeft").html("");
		$(".detailIconWrap").css("display", "none");
		$(".bigIconWrap").css("display","block");
	});
	
	//업체 리스트 테이블 페이지 클릭
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
		<div class="popupWrap">
			<div class="popup_bg"></div>
			
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
				<input id="selectVal" type="hidden" name="selectVal" value="">
				<div class="section">
					<div class="bigIconWrap">
						<div class="iconWrap">
							<img src="${pageContext.request.contextPath}/resources/images/icon_clean.png">
							<h4>청소</h4>
						</div>
						<div class="iconWrap">
							<img src="${pageContext.request.contextPath}/resources/images/icon_tool.png">
							<h4>설비</h4>
						</div>
						<div class="iconWrap">
							<img src="${pageContext.request.contextPath}/resources/images/icon_electric.png">
							<h4>전기</h4>
						</div>
						<div class="iconWrap">
							<img src="${pageContext.request.contextPath}/resources/images/icon_mask.png">
							<h4>방역</h4>
						</div>
						<div class="iconWrap">
							<img src="${pageContext.request.contextPath}/resources/images/icon_tv.png">
							<h4>가전</h4>
						</div>
						<div class="iconWrap">
							<img src="${pageContext.request.contextPath}/resources/images/icon_interior.png">
							<h4>인테리어</h4>
						</div>
					</div><!-- bigIconWrap -->
					<div class="detailIconWrap">
						<input id="selectUnderVal" type="hidden" name="selectUnderVal" value="">
						<div class="detailLeft">
							
							<div class="underItem">
								<img src="${pageContext.request.contextPath}/resources/images/icon_tv.png">
								<h4>asdf</h4>
							</div>
							<div class="underItem">
								<img src="${pageContext.request.contextPath}/resources/images/icon_tv.png">
								<h4>asdf</h4>
							</div>
							<div class="underItem">
								<img src="${pageContext.request.contextPath}/resources/images/icon_tv.png">
								<h4>asdf</h4>
							</div>
						</div><!-- detailLeft end -->
						<div class="detailRight">
							<div class="contentWrap">
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
									<button>검 색</button>
									<button id="backBtn">뒤로가기</button>
								</div><!-- searchWrap end -->
								<div class="tblWrap" id="tblWrap">
									<table>
									
									</table>
								</div>
								<div class="page">
								
								</div>
							</div><!-- contentWrap end -->
						</div><!-- detailRight end -->
					</div><!-- detailIconWrap end -->
				</div><!-- section end -->
			</div><!-- sectionWrap end -->
		</div><!-- rightAside end -->
	</div><!-- allWrap end -->
</body>
</html>