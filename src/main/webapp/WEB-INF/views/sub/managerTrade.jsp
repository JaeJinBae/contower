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
	.menuWrap > ul > li:nth-child(5) > a{
		color: #fff;
	}
	.menuWrap > ul > li:nth-child(5) > .menuBg{
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
		position: relative;
	}
	.bigMapWrap{
		width: 480px;
		margin-top: 40px;
		text-align: center;
		position: absolute;
		left: 50%;
		margin-left: -240px;
	}
	.bigMapWrap > img{
		width: 100%;
	}
	.smallMapWrap{
		display: none;
		width: 480px;
		margin-top: 50px;
		position: absolute;
		left: 50%;
		margin-left: 35px;
	}
	.smallMapWrap > h3{
		text-align: center;
		font-weight: bold;
		margin-bottom: 50px;
	}
	.smallMapWrap > img{
		width: 100%;
	}
	
	.searchWrap{
		display: none;
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
		width: 1150px;
		margin: 0 auto;
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
		width: 48%;
		height:350px;
	}
	.tbl > .leftTbl{
		float: left;
	}
	.tbl > .rightTbl{
		float: right;
	}
	.tbl > table tr{
		
	}
	.tbl > table tr > th{
		color: #fff;
		font-size: 15px;
		border: 1px solid #fff;
	}
	.tbl > table tr:nth-child(1) > th{ 
		
	}
	.tbl > table tr > td{
		font-size: 15px;
		padding: 0 2px;
		text-align: center;
		color: #fff;
		border: 1px solid #fff;
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
				+ "<table class='leftTbl'><tr style='background:#ff622c;'><th>매매금액</th><td>"+this.trade_price+"만원</td></tr>"
				+ "<tr style='background:#f6a285;'><th>보증금</th><td>"+this.total_deposit+"만원</td></tr>"
				+ "<tr style='background:#febe7a;'><th>융자</th><td>"+this.financing+"만원</td></tr>"
				+ "<tr style='background:#f6a285;'><th>이자<br>(연"+this.interest_percent+"%)</th><td>2100만원</td></tr>"
				+ "<tr style='background:#febe7a;border-bottom:10px solid #fff;'><th>1년수익</th><td>6600만원</td></tr>"
				+ "<tr style='background:#2aa930;'><th>인수금액</th><td>"+this.trade_price+"</td></tr>"
				+ "<tr style='background:#87c68a;'><th>월수익</th><td>"+this.total_monthly_rent+"만원</td></tr>"
				+ "<tr style='background:#98cc96;'><th>연수익</th><td>4160만원</td></tr>"
				+ "<tr style='background:#87c68a;'><th>연수익률</th><td>11.12%</td></tr></table>"
				+ "<table class='rightTbl'><tr style='background:#cbaf7f;'><th>준공일</th><td>"+this.completion_date+"</td></tr>"
				+ "<tr style='background:#cbaf7f;'><th>대지</th><td>"+this.site+"㎥</td></tr>"
				+ "<tr style='background:#cbaf7f;'><th>연면적</th><td>"+this.gross_area+"㎥</td></tr>"
				+ "<tr style='background:#cbaf7f;'><th>도로</th><td>"+this.road+"</td></tr>"
				+ "<tr style='background:#cbaf7f;'><th>난방</th><td>"+this.heating+"</td></tr>"
				+ "<tr style='background:#cbaf7f;'><th>상가</th><td>"+this.cnt_store+"</td></tr>"
				+ "<tr style='background:#cbaf7f;'><th>원룸</th><td>"+this.cnt_one+"</td></tr>"
				+ "<tr style='background:#cbaf7f;'><th>미니투룸</th><td>"+this.cnt_mitwo+"</td></tr>"
				+ "<tr style='background:#cbaf7f;'><th>투룸</th><td>"+this.cnt_two+"</td></tr>"
				+ "<tr style='background:#cbaf7f;'><th>쓰리룸</th><td>"+this.cnt_three+"</td></tr>"
				+ "<tr style='background:#cbaf7f;'><th>주인세대</th><td>"+this.cnt_owner+"</td></tr>"
				+ "<tr style='background:#cbaf7f;'><th>합계</th><td>"+(Number(this.cnt_store)+Number(this.cnt_one)+Number(this.cnt_mitwo)+Number(this.cnt_two)+Number(this.cnt_three)+Number(this.cnt_owner))+"</td></tr></table></div>";
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
	//시도 지도 선택
	$(".bigMapWrap > map > area").click(function(e){
		e.preventDefault();
		var sido = $(this).prop("alt");
		$(".smallMapWrap").fadeOut();
		$(".bigMapWrap").animate({
			marginLeft:"-520px"
		}, 500, function(){
			
			$(".smallMapWrap > img").remove();
			$(".smallMapWrap > h3").remove();
			if(sido == "인천광역시"){
				$(".smallMapWrap").prepend("<h3>인천광역시</h3><img src='${pageContext.request.contextPath}/resources/images/incheon.png' usemap='#incheonMap'>");
			}else if(sido == "서울특별시"){
				$(".smallMapWrap").prepend("<h3>서울특별시</h3><img src='${pageContext.request.contextPath}/resources/images/seoul.png' usemap='#seoulMap'>");
			}else if(sido == "강원도"){
				$(".smallMapWrap").prepend("<h3>강원도</h3><img src='${pageContext.request.contextPath}/resources/images/gangwon.png' usemap='#gangwonMap'>");
			}else if(sido == "경기도"){
				$(".smallMapWrap").prepend("<h3>경기도</h3><img src='${pageContext.request.contextPath}/resources/images/gyeonggi.png' usemap='#gyeonggiMap'>");
			}else if(sido == "충청북도"){
				$(".smallMapWrap").prepend("<h3>충청북도</h3><img src='${pageContext.request.contextPath}/resources/images/chungbuk.png' usemap='#chungbukMap'>");
			}else if(sido == "충청남도"){
				$(".smallMapWrap").prepend("<h3>충청남도</h3><img src='${pageContext.request.contextPath}/resources/images/chungnam.png' usemap='#chungnamMap'>");
			}else if(sido == "경상북도"){
				$(".smallMapWrap").prepend("<h3>경상북도</h3><img src='${pageContext.request.contextPath}/resources/images/gyeongbuk.png' usemap='#gyeongbukMap'>");
			}else if(sido == "경상남도"){
				$(".smallMapWrap").prepend("<h3>경상남도</h3><img src='${pageContext.request.contextPath}/resources/images/gyeongnam.png' usemap='#gyeongnamMap'>");
			}else if(sido == "대전광역시"){
				$(".smallMapWrap").prepend("<h3>대전광역시</h3><img src='${pageContext.request.contextPath}/resources/images/daejeon.png' usemap='#daejeonMap'>");
			}else if(sido == "대구광역시"){
				$(".smallMapWrap").prepend("<h3>대구광역시</h3><img src='${pageContext.request.contextPath}/resources/images/daegu.png' usemap='#daeguMap'>");
			}else if(sido == "울산광역시"){
				$(".smallMapWrap").prepend("<h3>울산광역시</h3><img src='${pageContext.request.contextPath}/resources/images/ulsan.png' usemap='#ulsanMap'>");
			}else if(sido == "부산광역시"){
				$(".smallMapWrap").prepend("<h3>부산광역시</h3><img src='${pageContext.request.contextPath}/resources/images/busan.png' usemap='#busanMap'>");
			}else if(sido == "전라북도"){
				$(".smallMapWrap").prepend("<h3>전라북도</h3><img src='${pageContext.request.contextPath}/resources/images/jeonbuk.png' usemap='#jeonbukMap'>");
			}else if(sido == "전라남도"){
				$(".smallMapWrap").prepend("<h3>전라남도</h3><img src='${pageContext.request.contextPath}/resources/images/jeonnam.png' usemap='#jeonnamMap'>");
			}else if(sido == "광주광역시"){
				$(".smallMapWrap").prepend("<h3>광주광역시</h3><img src='${pageContext.request.contextPath}/resources/images/gwangju.png' usemap='#gwangjuMap'>");
			}else if(sido == "제주특별자치도"){
				
			}
			$("#selAddr").val(sido);
			$(".smallMapWrap").fadeIn();
			$("img[usemap]").rwdImageMaps();
		});
		
	});
	
	//시군구지도 선택
	$(document).on("click", ".smallMapWrap > map > area", function(e){
		e.preventDefault();
		var sido = $(".smallMapWrap > h3").text();
		var sigungu = $(this).prop("alt");
		
		$("#selAddr").val(sido+" "+sigungu);
		
		var s="";
		var k1 = sido+" "+sigungu;
    	
		var page=1;
		var perPageNum=10;
		var searchType="a";
		var keyword1=k1;
		
		var info = {page:page, perPageNum:perPageNum, searchType:searchType, keyword1:keyword1, keyword2:"", keyword3:""};
		draw_trade(info);
		
		$(".searchWrap > input[name='sido_sigungu']").val(sido+" "+sigungu);
		$(".searchWrap").css("display", "block");
	})
	
	//건물매매 조건 검색
	$(".searchWrap > button").click(function(){
		var s="";
		var k1="";
		var k2="";
		var k3="";
		
		var sido_sigungu = $(".sectionWrap > #selAddr").val();
    	var dong = $(".searchWrap > input[name='addr_dong']").val();
    	var tradePrice1 = $(".searchWrap > input[name='tradePrice1']").val();
    	var tradePrice2 = $(".searchWrap > input[name='tradePrice2']").val();
    	
    	k2 = tradePrice1;
    	k3 = tradePrice2;
    	
    	if(k1.length >2 && k2.length == 0){
    		s = "a";
    	}else if(k1.length >2 && k2.length > 1){
    		s = "at";
    	}
    	
		var page=1;
		var perPageNum=10;
		var searchType=s;
		var keyword1=k1;
		var keyword2=k2;
		var keyword3=k3;
		
		var info = {page:page, perPageNum:perPageNum, searchType:searchType, keyword1:keyword1, keyword2:keyword2, keyword3:keyword3};
		draw_trade(info);
	});
	
	//프린트 클릭
	$("#printBtn").click(function(){
		var printArea = document.getElementById("tblWrap").innerHTML;
		console.log(printArea);
		win = window.open(); 
		self.focus(); 
		win.document.open();
		
		win.document.write('<html><head><title>NO.1 부동산 관리 시스템 컨타워</title><style>');
		win.document.write('body, td {font-falmily: Verdana; font-size: 10pt;} table{width:100%;border:1px solid black; border-collapse:collapse;} td, th{border:1px solid black;font-size:10px;}');
		win.document.write('</style></haed><body><h3>NO.1 부동산 관리 시스템 컨타워</h3>');
		win.document.write(printArea);
 		win.document.write('</body></html>');
		win.document.close();
		win.print();
		win.close();
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
				<input id="selAddr" type="hidden" name="addr" value="">
				<div class="section">
					<div class="bigMapWrap">
						<img alt="" src="${pageContext.request.contextPath}/resources/images/sidoMap.png" usemap="#sidoMap">
						<map id="sidoMap" name="sidoMap">
							<area shape="rect" alt="인천광역시" title="인천광역시" coords="33,127,69,150" href="" target="" />
							<area shape="rect" alt="서울특별시" title="서울특별시" coords="91,156,124,175" href="" target="" />
							<area shape="rect" alt="강원도" title="강원도" coords="235,128,282,149" href="" target="" />
							<area shape="rect" alt="경기도" title="경기도" coords="112,192,158,211" href="" target="" />
							<area shape="rect" alt="충청북도" title="충청북도" coords="153,263,213,282" href="" target="" />
							<area shape="rect" alt="충청남도" title="충청남도" coords="64,312,122,330" href="" target="" />
							<area shape="rect" alt="대전광역시" title="대전광역시" coords="139,327,165,342" href="" target="" />
							<area shape="rect" alt="대구광역시" title="대구광역시" coords="281,394,308,409" href="" target="" />
							<area shape="rect" alt="울산광역시" title="울산광역시" coords="351,444,378,461" href="" target="" />
							<area shape="rect" alt="경상북도" title="경상북도" coords="268,312,328,332" href="" target="" />
							<area shape="rect" alt="경상남도" title="경상남도" coords="218,467,276,485" href="" target="" />
							<area shape="rect" alt="부산광역시" title="부산광역시" coords="309,486,336,504" href="" target="" />
							<area shape="rect" alt="광주광역시" title="광주광역시" coords="94,486,119,502" href="" target="" />
							<area shape="rect" alt="전라북도" title="전라북도" coords="107,416,167,434" href="" target="" />
							<area shape="rect" alt="전라남도" title="전라남도" coords="83,522,142,541" href="" target="" />
							<area shape="rect" alt="제주특별자치도" title="제주특별자치도" coords="333,623,361,640" href="" target="" />
						</map>
					</div><!-- bigMapWrap end -->
					<div class="smallMapWrap">
						<img src="${pageContext.request.contextPath}/resources/images/daegu.png" usemap="#daeguMap">
						
						<map id="incheonMap" name="incheonMap">
							<area shape="rect" alt="강화군" title="" coords="226,104,282,133" href="" target="" />
							<area shape="rect" alt="옹진군" title="" coords="37,244,98,271" href="" target="" />
							<area shape="rect" alt="서구" title="" coords="352,239,398,265" href="" target="" />
							<area shape="rect" alt="계양구" title="" coords="422,243,472,271" href="" target="" />
							<area shape="rect" alt="중구" title="" coords="228,310,277,333" href="" target="" />
							<area shape="rect" alt="동구" title="" coords="349,306,394,335" href="" target="" />
							<area shape="rect" alt="부평구" title="" coords="407,300,472,327" href="" target="" />
							<area shape="rect" alt="남구" title="" coords="372,340,413,365" href="" target="" />
							<area shape="rect" alt="남동구" title="" coords="418,352,470,377" href="" target="" />
							<area shape="rect" alt="연수구" title="" coords="371,381,423,404" href="" target="" />
						</map>
						<map id="seoulMap" name="seoulMap">
							<area shape="rect" alt="도봉구" title="" coords="293,46,342,67" href="" target="" />
							<area shape="rect" alt="노원구" title="" coords="348,97,405,121" href="" target="" />
							<area shape="rect" alt="강북구" title="" coords="260,88,312,110" href="" target="" />
							<area shape="rect" alt="은평구" title="" coords="178,101,229,127" href="" target="" />
							<area shape="rect" alt="종로구" title="" coords="222,156,272,181" href="" target="" />
							<area shape="rect" alt="성북구" title="" coords="277,152,327,179" href="" target="" />
							<area shape="rect" alt="중랑구" title="" coords="365,157,416,181" href="" target="" />
							<area shape="rect" alt="서대문구" title="" coords="172,187,237,210" href="" target="" />
							<area shape="rect" alt="동대문구" title="" coords="307,186,373,209" href="" target="" />
							<area shape="rect" alt="강서구" title="" coords="46,211,96,232" href="" target="" />
							<area shape="rect" alt="마포구" title="" coords="141,220,196,241" href="" target="" />
							<area shape="rect" alt="중구" title="" coords="250,217,288,238" href="" target="" />
							<area shape="rect" alt="성동구" title="" coords="303,234,353,258" href="" target="" />
							<area shape="rect" alt="광진구" title="" coords="359,233,412,256" href="" target="" />
							<area shape="rect" alt="강동구" title="" coords="422,233,482,260" href="" target="" />
							<area shape="rect" alt="용산구" title="" coords="230,257,280,282" href="" target="" />
							<area shape="rect" alt="양천구" title="" coords="82,273,131,294" href="" target="" />
							<area shape="rect" alt="영등포구" title="" coords="134,287,199,308" href="" target="" />
							<area shape="rect" alt="구로구" title="" coords="75,315,126,338" href="" target="" />
							<area shape="rect" alt="동작구" title="" coords="192,314,244,334" href="" target="" />
							<area shape="rect" alt="금천구" title="" coords="141,364,185,384" href="" target="" />
							<area shape="rect" alt="관악구" title="" coords="190,365,238,387" href="" target="" />
							<area shape="rect" alt="서초구" title="" coords="269,350,319,372" href="" target="" />
							<area shape="rect" alt="강남구" title="" coords="331,332,381,359" href="" target="" />
							<area shape="rect" alt="송파구" title="" coords="375,303,432,328" href="" target="" />
						</map>
						<map id="gangwonMap" name="gangwonMap">
							<area shape="rect" alt="철원군" title="" coords="85,53,135,77" href="" target="" />
							<area shape="rect" alt="양구군" title="" coords="180,92,233,115" href="" target="" />
							<area shape="rect" alt="고성군" title="" coords="276,69,324,90" href="" target="" />
							<area shape="rect" alt="화천군" title="" coords="110,109,160,131" href="" target="" />
							<area shape="rect" alt="춘천시" title="" coords="114,180,163,205" href="" target="" />
							<area shape="rect" alt="인제군" title="" coords="228,143,283,175" href="" target="" />
							<area shape="rect" alt="속초시" title="" coords="295,129,344,150" href="" target="" />
							<area shape="rect" alt="양양군" title="" coords="305,179,360,206" href="" target="" />
							<area shape="rect" alt="홍천군" title="" coords="169,233,221,256" href="" target="" />
							<area shape="rect" alt="강릉시" title="" coords="351,270,401,293" href="" target="" />
							<area shape="rect" alt="횡성군" title="" coords="170,302,225,326" href="" target="" />
							<area shape="rect" alt="평창군" title="" coords="251,301,306,326" href="" target="" />
							<area shape="rect" alt="원주시" title="" coords="122,359,173,385" href="" target="" />
							<area shape="rect" alt="영월군" title="" coords="241,405,294,429" href="" target="" />
							<area shape="rect" alt="정선군" title="" coords="301,361,354,385" href="" target="" />
							<area shape="rect" alt="동해시" title="" coords="385,336,436,363" href="" target="" />
							<area shape="rect" alt="삼척시" title="" coords="391,399,442,426" href="" target="" />
							<area shape="rect" alt="태백시" title="" coords="350,438,406,462" href="" target="" />
						</map>
						<map id="gyeonggiMap" name="gyeonggiMap">
							<area shape="rect" alt="연천군" title="" coords="169,68,223,89" href="" target="" />
							<area shape="rect" alt="포천시" title="" coords="243,121,298,144" href="" target="" />
							<area shape="rect" alt="동두천시" title="" coords="179,141,239,159" href="" target="" />
							<area shape="rect" alt="가평군" title="" coords="304,166,355,190" href="" target="" />
							<area shape="rect" alt="양주시" title="" coords="168,184,219,203" href="" target="" />
							<area shape="rect" alt="파주시" title="" coords="96,177,143,196" href="" target="" />
							<area shape="rect" alt="김포시" title="" coords="19,238,70,260" href="" target="" />
							<area shape="rect" alt="고양시" title="" coords="100,246,151,265" href="" target="" />
							<area shape="rect" alt="의정부시" title="" coords="177,214,240,237" href="" target="" />
							<area shape="rect" alt="남양주시" title="" coords="240,239,302,258" href="" target="" />
							<area shape="rect" alt="구리시" title="" coords="228,263,276,284" href="" target="" />
							<area shape="rect" alt="하남시" title="" coords="242,303,291,323" href="" target="" />
							<area shape="rect" alt="양평군" title="" coords="357,298,406,320" href="" target="" />
							<area shape="rect" alt="부천시" title="" coords="99,305,147,325" href="" target="" />
							<area shape="rect" alt="안양시" title="" coords="101,336,148,354" href="" target="" />
							<area shape="rect" alt="광명시" title="" coords="149,346,193,365" href="" target="" />
							<area shape="rect" alt="성남시" title="" coords="202,348,246,366" href="" target="" />
							<area shape="rect" alt="광주시" title="" coords="257,339,305,360" href="" target="" />
							<area shape="rect" alt="시흥시" title="" coords="74,360,122,378" href="" target="" />
							<area shape="rect" alt="의왕시" title="" coords="160,368,207,384" href="" target="" />
							<area shape="rect" alt="과천시" title="" coords="188,386,235,400" href="" target="" />
							<area shape="rect" alt="군포시" title="" coords="117,381,158,396" href="" target="" />
							<area shape="rect" alt="안산시" title="" coords="80,394,116,409" href="" target="" />
							<area shape="rect" alt="수원시" title="" coords="163,405,206,422" href="" target="" />
							<area shape="rect" alt="화성시" title="" coords="108,443,155,461" href="" target="" />
							<area shape="rect" alt="오산시" title="" coords="198,438,241,456" href="" target="" />
							<area shape="rect" alt="용인시" title="" coords="247,422,291,441" href="" target="" />
							<area shape="rect" alt="이천시" title="" coords="314,421,357,440" href="" target="" />
							<area shape="rect" alt="여주군" title="" coords="379,390,426,410" href="" target="" />
							<area shape="rect" alt="평택시" title="" coords="157,508,205,526" href="" target="" />
							<area shape="rect" alt="안성시" title="" coords="262,497,309,518" href="" target="" />
						</map>
						<map id="chungbukMap" name="chungbukMap">
							<area shape="rect" alt="당진군" title="" coords="151,56,195,81" href="" target="" />
							<area shape="rect" alt="태안군" title="" coords="20,100,66,125" href="" target="" />
							<area shape="rect" alt="서산시" title="" coords="92,104,142,127" href="" target="" />
							<area shape="rect" alt="예산군" title="" coords="184,128,234,154" href="" target="" />
							<area shape="rect" alt="아산시" title="" coords="243,96,290,117" href="" target="" />
							<area shape="rect" alt="천안시" title="" coords="322,89,369,112" href="" target="" />
							<area shape="rect" alt="홍성군" title="" coords="136,181,186,209" href="" target="" />
							<area shape="rect" alt="청양군" title="" coords="189,225,240,250" href="" target="" />
							<area shape="rect" alt="공주시" title="" coords="274,204,326,229" href="" target="" />
							<area shape="rect" alt="연기군" title="" coords="324,169,376,193" href="" target="" />
							<area shape="rect" alt="계룡시" title="" coords="329,249,379,275" href="" target="" />
							<area shape="rect" alt="보령시" title="" coords="138,270,189,294" href="" target="" />
							<area shape="rect" alt="부여군" title="" coords="208,293,257,317" href="" target="" />
							<area shape="rect" alt="논산시" title="" coords="307,307,356,330" href="" target="" />
							<area shape="rect" alt="서천군" title="" coords="167,344,221,366" href="" target="" />
							<area shape="rect" alt="금산군" title="" coords="396,343,449,367" href="" target="" />
						</map>
						<map id="chungnamMap" name="chungnamMap">
							<area shape="rect" alt="단양군" title="" coords="348,103,399,128" href="" target="" />
							<area shape="rect" alt="제천시" title="" coords="280,60,328,82" href="" target="" />
							<area shape="rect" alt="충주시" title="" coords="195,96,247,120" href="" target="" />
							<area shape="rect" alt="음성군" title="" coords="111,128,166,154" href="" target="" />
							<area shape="rect" alt="진천군" title="" coords="46,157,100,181" href="" target="" />
							<area shape="rect" alt="증평군" title="" coords="110,189,151,210" href="" target="" />
							<area shape="rect" alt="괴산군" title="" coords="168,189,219,216" href="" target="" />
							<area shape="rect" alt="청주시" title="" coords="55,235,103,256" href="" target="" />
							<area shape="rect" alt="청원군" title="" coords="47,282,101,305" href="" target="" />
							<area shape="rect" alt="보은군" title="" coords="128,305,179,327" href="" target="" />
							<area shape="rect" alt="옥천군" title="" coords="100,374,150,398" href="" target="" />
							<area shape="rect" alt="영동군" title="" coords="140,441,195,467" href="" target="" />
						</map>
						<map id="daejeonMap" name="daejeonMap">
							<area shape="rect" alt="대덕구" title="" coords="265,119,323,142" href="" target="" />
							<area shape="rect" alt="유성구" title="" coords="95,194,144,220" href="" target="" />
							<area shape="rect" alt="서구" title="" coords="126,343,166,368" href="" target="" />
							<area shape="rect" alt="중구" title="" coords="229,323,266,347" href="" target="" />
							<area shape="rect" alt="동구" title="" coords="320,252,361,281" href="" target="" />
						</map>
						<map id="daeguMap" name="daeguMap">
							<area shape="rect" alt="북구" title="" coords="245,120,281,141" href="" target="" />
							<area shape="rect" alt="동구" title="" coords="357,108,404,142" href="" target="" />
							<area shape="rect" alt="서구" title="" coords="213,186,254,212" href="" target="" />
							<area shape="rect" alt="중구" title="" coords="264,207,299,226" href="" target="" />
							<area shape="rect" alt="수성구" title="" coords="322,235,377,263" href="" target="" />
							<area shape="rect" alt="달서구" title="" coords="178,250,236,277" href="" target="" />
							<area shape="rect" alt="달성군" title="" coords="144,356,206,389" href="" target="" />
							<area shape="rect" alt="남구" title="" coords="244,239,296,267" href="" target="" />
						</map>
						<map id="ulsanMap" name="ulsanMap">
							<area shape="rect" alt="울주군" title="" coords="155,171,215,201" href="" target="" />
							<area shape="rect" alt="중구" title="" coords="294,154,334,180" href="" target="" />
							<area shape="rect" alt="북구" title="" coords="378,117,416,145" href="" target="" />
							<area shape="rect" alt="남구" title="" coords="327,212,365,237" href="" target="" />
							<area shape="rect" alt="동구" title="" coords="414,208,452,232" href="" target="" />
						</map>
						<map id="gyeongbukMap" name="gyeongbukMap">
							<area shape="rect" alt="울진군" title="" coords="367,53,416,80" href="" target="" />
							<area shape="rect" alt="봉화군" title="" coords="263,51,321,74" href="" target="" />
							<area shape="rect" alt="영주시" title="" coords="189,76,239,99" href="" target="" />
							<area shape="rect" alt="문경시" title="" coords="66,124,118,146" href="" target="" />
							<area shape="rect" alt="예천군" title="" coords="147,123,197,147" href="" target="" />
							<area shape="rect" alt="안동시" title="" coords="229,147,279,171" href="" target="" />
							<area shape="rect" alt="영양군" title="" coords="319,114,373,137" href="" target="" />
							<area shape="rect" alt="영덕군" title="" coords="373,180,424,204" href="" target="" />
							<area shape="rect" alt="상주시" title="" coords="53,210,105,233" href="" target="" />
							<area shape="rect" alt="의성군" title="" coords="191,223,242,247" href="" target="" />
							<area shape="rect" alt="청송군" title="" coords="314,217,368,240" href="" target="" />
							<area shape="rect" alt="구미시" title="" coords="132,276,184,298" href="" target="" />
							<area shape="rect" alt="김천시" title="" coords="45,314,97,339" href="" target="" />
							<area shape="rect" alt="칠곡군" title="" coords="153,329,202,354" href="" target="" />
							<area shape="rect" alt="군위군" title="" coords="208,286,260,310" href="" target="" />
							<area shape="rect" alt="영천시" title="" coords="284,324,334,350" href="" target="" />
							<area shape="rect" alt="포항시" title="" coords="355,282,409,308" href="" target="" />
							<area shape="rect" alt="성주군" title="" coords="97,369,150,391" href="" target="" />
							<area shape="rect" alt="고령군" title="" coords="112,424,161,443" href="" target="" />
							<area shape="rect" alt="경산시" title="" coords="249,391,301,412" href="" target="" />
							<area shape="rect" alt="경주시" title="" coords="366,381,414,408" href="" target="" />
							<area shape="rect" alt="청도군" title="" coords="234,442,286,464" href="" target="" />
						</map>
						<map id="gyeongnamMap" name="gyeongnamMap">
							<area shape="rect" alt="거창군" title="" coords="70,64,130,91" href="" target="" />
							<area shape="rect" alt="함양군" title="" coords="21,133,74,157" href="" target="" />
							<area shape="rect" alt="합천군" title="" coords="150,124,200,148" href="" target="" />
							<area shape="rect" alt="창녕군" title="" coords="245,138,293,160" href="" target="" />
							<area shape="rect" alt="밀양시" title="" coords="326,146,374,167" href="" target="" />
							<area shape="rect" alt="양산시" title="" coords="401,175,447,201" href="" target="" />
							<area shape="rect" alt="산청군" title="" coords="74,184,124,209" href="" target="" />
							<area shape="rect" alt="의령군" title="" coords="183,189,232,209" href="" target="" />
							<area shape="rect" alt="함안군" title="" coords="230,216,276,237" href="" target="" />
							<area shape="rect" alt="창원시" title="" coords="288,220,335,245" href="" target="" />
							<area shape="rect" alt="김해시" title="" coords="343,217,397,238" href="" target="" />
							<area shape="rect" alt="하동군" title="" coords="51,269,100,291" href="" target="" />
							<area shape="rect" alt="진주시" title="" coords="148,249,200,270" href="" target="" />
							<area shape="rect" alt="마산시" title="" coords="241,265,293,288" href="" target="" />
							<area shape="rect" alt="진해시" title="" coords="318,264,367,287" href="" target="" />
							<area shape="rect" alt="사천시" title="" coords="121,292,169,314" href="" target="" />
							<area shape="rect" alt="고성군" title="" coords="188,307,235,330" href="" target="" />
							<area shape="rect" alt="통영시" title="" coords="217,340,263,362" href="" target="" />
							<area shape="rect" alt="거제시" title="" coords="282,355,333,380" href="" target="" />
							<area shape="rect" alt="남해군" title="" coords="86,381,139,407" href="" target="" />
						</map>
						<map id="busanMap" name="busanMap">
							<area shape="rect" alt="기장군" title="" coords="362,115,416,138" href="" target="" />
							<area shape="rect" alt="금정구" title="" coords="258,153,312,178" href="" target="" />
							<area shape="rect" alt="북구" title="" coords="210,187,245,210" href="" target="" />
							<area shape="rect" alt="동래구" title="" coords="256,215,306,235" href="" target="" />
							<area shape="rect" alt="연제구" title="" coords="250,239,298,260" href="" target="" />
							<area shape="rect" alt="해운대구" title="" coords="315,235,378,258" href="" target="" />
							<area shape="rect" alt="수영구" title="" coords="288,265,335,287" href="" target="" />
							<area shape="rect" alt="부산진구" title="" coords="218,270,280,292" href="" target="" />
							<area shape="rect" alt="사상구" title="" coords="164,271,215,293" href="" target="" />
							<area shape="rect" alt="강서구" title="" coords="78,313,127,336" href="" target="" />
							<area shape="rect" alt="서구" title="" coords="200,311,231,328" href="" target="" />
							<area shape="rect" alt="동구" title="" coords="235,304,266,325" href="" target="" />
							<area shape="rect" alt="남구" title="" coords="278,307,310,329" href="" target="" />
							<area shape="rect" alt="사하구" title="" coords="166,346,211,369" href="" target="" />
							<area shape="rect" alt="중구" title="" coords="215,338,246,359" href="" target="" />
							<area shape="rect" alt="영도구" title="" coords="252,361,300,382" href="" target="" />
						</map>
						<map id="gwangjuMap" name="gwangjuMap">
							<area shape="rect" alt="광산구" title="" coords="116,198,174,228" href="" target="" />
							<area shape="rect" alt="북구" title="" coords="330,149,376,178" href="" target="" />
							<area shape="rect" alt="서구" title="" coords="248,236,297,269" href="" target="" />
							<area shape="rect" alt="남구" title="" coords="281,302,335,336" href="" target="" />
							<area shape="rect" alt="동구" title="" coords="378,267,426,303" href="" target="" />
						</map>
						<map id="jeonbukMap" name="jeonbukMap">
							<area shape="rect" alt="군산시" title="" coords="101,69,153,97" href="" target="" />
							<area shape="rect" alt="익산시" title="" coords="170,46,220,68" href="" target="" />
							<area shape="rect" alt="완주군" title="" coords="236,78,289,102" href="" target="" />
							<area shape="rect" alt="진안군" title="" coords="300,119,347,145" href="" target="" />
							<area shape="rect" alt="무주군" title="" coords="387,81,439,104" href="" target="" />
							<area shape="rect" alt="김제시" title="" coords="140,127,194,153" href="" target="" />
							<area shape="rect" alt="전주시" title="" coords="205,125,255,149" href="" target="" />
							<area shape="rect" alt="부안군" title="" coords="53,168,103,190" href="" target="" />
							<area shape="rect" alt="고창군" title="" coords="41,254,92,279" href="" target="" />
							<area shape="rect" alt="정읍시" title="" coords="134,201,186,227" href="" target="" />
							<area shape="rect" alt="임실군" title="" coords="228,219,278,243" href="" target="" />
							<area shape="rect" alt="장수군" title="" coords="313,214,369,236" href="" target="" />
							<area shape="rect" alt="순창군" title="" coords="200,278,249,300" href="" target="" />
							<area shape="rect" alt="남원시" title="" coords="289,278,342,303" href="" target="" />
						</map>
						<map id="jeonnamMap" name="jeonnamMap">
							<area shape="rect" alt="영광군" title="" coords="99,52,148,76" href="" target="" />
							<area shape="rect" alt="장성군" title="" coords="170,51,218,73" href="" target="" />
							<area shape="rect" alt="담양군" title="" coords="227,51,279,74" href="" target="" />
							<area shape="rect" alt="곡성군" title="" coords="300,68,349,92" href="" target="" />
							<area shape="rect" alt="구례군" title="" coords="369,81,416,102" href="" target="" />
							<area shape="rect" alt="함평군" title="" coords="109,94,162,117" href="" target="" />
							<area shape="rect" alt="무안군" title="" coords="96,159,151,180" href="" target="" />
							<area shape="rect" alt="나주시" title="" coords="162,146,211,167" href="" target="" />
							<area shape="rect" alt="화순군" title="" coords="244,138,292,167" href="" target="" />
							<area shape="rect" alt="순천시" title="" coords="330,147,380,174" href="" target="" />
							<area shape="rect" alt="광양시" title="" coords="406,149,458,174" href="" target="" />
							<area shape="rect" alt="목포시" title="" coords="86,193,135,215" href="" target="" />
							<area shape="rect" alt="영암군" title="" coords="141,204,189,227" href="" target="" />
							<area shape="rect" alt="장흥군" title="" coords="207,218,264,242" href="" target="" />
							<area shape="rect" alt="보성군" title="" coords="278,199,329,222" href="" target="" />
							<area shape="rect" alt="여수시" title="" coords="405,216,461,236" href="" target="" />
							<area shape="rect" alt="신안군" title="" coords="3,230,58,253" href="" target="" />
							<area shape="rect" alt="진도군" title="" coords="31,306,85,332" href="" target="" />
							<area shape="rect" alt="해남군" title="" coords="109,269,159,296" href="" target="" />
							<area shape="rect" alt="강진군" title="" coords="170,249,225,271" href="" target="" />
							<area shape="rect" alt="완도군" title="" coords="171,335,225,362" href="" target="" />
							<area shape="rect" alt="고흥군" title="" coords="313,272,364,297" href="" target="" />
						</map>
					</div><!-- smallMapWrap end -->
				</div><!-- section end -->
				<div class="contentWrap">
					<div class="searchWrap">
						<input type="text" name="sido_sigungu" value="" readonly>
						<input type="text" name="tradePrice1" placeholder="숫자만 입력하세요.">만원~<input type="text" name="tradePrice2" placeholder="숫자만 입력하세요.">만원
					<button>검 색</button>
						
						<img id="printBtn" alt="인쇄" title="정보인쇄" src="${pageContext.request.contextPath}/resources/images/icon_printer.png">
					</div>
					<div class="tblWrap">
						
					</div><!-- tblWrap end -->
					<div class="page"></div>
				</div><!-- contentWrap end -->
			</div><!-- sectionWrap end -->
		</div><!-- rightAside end -->
	</div><!-- allWrap end -->
</body>
</html>