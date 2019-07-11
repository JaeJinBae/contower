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
	.tblWrap{
		width: 590px;
		margin: 0 auto;
	}
	.tblWrap > h3{
		font-size: 28px;
		margin: 20px 0;
	}
	.tblWrap > table{
		width: 100%;
		background: #fff;
		border: 1px solid lightgray;
	}
	.tblWrap > table tr{
		border-bottom: 2px solid lightgray;
	}
	.tblWrap > table tr > th{
		width: 160px;
		font-size: 15px;
		text-align: left;
		padding: 15px;
		padding-left: 23px;
		background: #fafafa;
	}
	.tblWrap > table tr > th > span{
		vertical-align: middle;
	}
	.tblWrap > table tr > td{
		font-size: 15px;
		padding: 10px;
	}
	.tblWrap > table tr > td > input{
		width: 80%;
		font-size: 15px;
		padding: 5px 13px;
		border:0; 
		border-bottom: 1px solid lightgray;
	}
	::placeholder {
		color: #999999;
		opacity: 1; /* Firefox */
	}

	:-ms-input-placeholder { /* Internet Explorer 10-11 */
		color: #999999;
	}

	::-ms-input-placeholder { /* Microsoft Edge */
		color: #999999;
	}
	.tblWrap > table tr > td > button{
		font-size: 14px;
		color: #55a1a1;
		padding: 7px 10px;
		margin-left: 15px;
		border: 1px solid #55a1a1;
	}
	.tblWrap > table tr > td > p{
		margin-top:7px;
		color: orange;
		font-size: 14px;
		margin-left: 10px;
	}
	.tblBtnWrap{
		width: 80%;
		margin: 0 auto;
		margin-top: 20px;
		text-align: center;
	}
	.tblBtnWrap > p{
		display: inline-block;
		width: 45%;
		font-size: 17px;
		letter-spacing: 1px;
		color: #fff;
		background: #475c6f;
		padding: 15px 0;
		cursor: pointer;
	}
	.tblBtnWrap > p:last-child{
		background: #fff;
		color: gray;
	}
	.btnWrap{
		width: 80%;
		margin: 0 auto;
		margin-top: 20px;
		text-align: center;
	}
	.btnWrap > p{
		display: inline-block;
		width: 45%;
		font-size: 17px;
		letter-spacing: 1px;
		color: #fff;
		background: #475c6f;
		padding: 15px 0;
		cursor: pointer;
	}
	.btnWrap > p:last-child{
		background: #efefef;
		color: gray;
	}
	
	.footer{
		width: 100%;
		height: 100px;
		background: #1797f8;
		box-shadow: 0px 0px 20px 0px gray;
	}
</style>
<script>
function get_managerInfo(mno){
	var dt;
	$.ajax({
		url:"${pageContext.request.contextPath}/getManagerInfo/"+mno,
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

function draw_managerInfo(mno){
	var json = get_managerInfo(mno);
	
	$(".tblWrap > table tr > td > input[name='id']").val(json.id);
	$(".tblWrap > table tr > td > input[name='name']").val(json.name);
	$(".tblWrap > table tr > td > input[name='birth']").val(json.birth);
	$(".tblWrap > table tr > td > input[name='phone']").val(json.phone);
	$(".tblWrap > table tr > td > input[name='mail']").val(json.mail);
	$(".tblWrap > table tr > td > input[name='company_name']").val(json.company_name);
	$(".tblWrap > table tr > td > input[name='company_num']").val(json.company_num);
	$(".tblWrap > table tr > td > input[name='company_ceo']").val(json.company_ceo);
}

function post_managerInfoUpdate(vo){
	$.ajax({
		url:"${pageContext.request.contextPath}/managerUpdate",
		type:"post",
		data : JSON.stringify(vo),
        dataType : 'json',
        contentType : 'application/json; charset=UTF-8',
		async:false,
		success:function(json){
			alert("정보 변경이 완료되었습니다.");
			$("#seName").val(json.name);
			$("#seMphone").val(json.phone);
			$(".myInfo > p").eq(0).text(json.name+"("+json.id+")님 환영합니다.");
		},
		error:function(request,status,error){
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}

$(function(){
	draw_managerInfo($("#seMno").val());
	
	$(".btnWrap > p").click(function(){
		var btnIdx = $(this).index();
		if(btnIdx ==0){
			var mno = $("#seMno").val();
			var name = $(".tblWrap > table tr > td > input[name='name']").val();
			var birth = $(".tblWrap > table tr > td > input[name='birth']").val();
			var phone = $(".tblWrap > table tr > td > input[name='phone']").val();
			var mail = $(".tblWrap > table tr > td > input[name='mail']").val();
			var pw = $(".tblWrap > table tr > td > input[name='pw']").val();
			var pwChk = $(".tblWrap > table tr > td > input[name='pwChk']").val();
			var company_name = $(".tblWrap > table tr > td > input[name='company_name']").val();
			var company_num = $(".tblWrap > table tr > td > input[name='company_num']").val();
			var company_ceo = $(".tblWrap > table tr > td > input[name='company_ceo']").val();
			
			if(pw != pwChk){
				alert("비밀번호가 일치하지 않습니다.");
				return false;
			}
			
			var vo = {mno:mno, name:name, birth:birth, phone:phone, mail:mail, pw:pw, company_name:company_name, company_num:company_num, company_ceo:company_ceo};
			
			post_managerInfoUpdate(vo);
		}else if(btnIdx == 1){
			location.replace("${pageContext.request.contextPath}/mMain");
		}
	});
});
</script>
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
					<div class="tblWrap"> 
						<h3>회원정보 수정</h3>
						<table>
							<tr>
								<th><span class="fc_red">* </span>아이디</th>
								<td><input type="text" name="id" placeholder="아이디를 입력해주세요." readonly></td>
							</tr>
							<tr>
								<th><span class="fc_red">* </span>비밀번호</th>
								<td><input type="password" name="pw" placeholder="비밀번호 변경을 원할 경우 입력해주세요."><p>비밀번호는 영문, 숫자, 특수문자를 합친 8자리 이상 가능합니다.</p></td>
							</tr>
							<tr>
								<th><span class="fc_red">* </span>비밀번호 확인</th>
								<td><input type="password" name="pwChk" placeholder="비밀번호 변경을 원할 경우 입력해주세요."></td>
							</tr>
							<tr>
								<th><span class="fc_red">* </span>이름</th>
								<td><input type="text" name="name" placeholder="이름을  입력해주세요."></td>
							</tr>
							<tr>
								<th><span class="fc_red">* </span>생년월일</th>
								<td><input type="text" name="birth" placeholder="ex) 1999-09-09"></td>
							</tr>
							<tr>
								<th><span class="fc_red">* </span>휴대전화</th>
								<td><input type="text" name="phone" placeholder="ex) 010-1111-2222"></td>
							</tr>
							<tr>
								<th><span class="fc_red">* </span>이메일</th>
								<td><input type="text" name="mail" placeholder="ex) contower@contower.com"><p>아이디 및 비밀번호 찾기에 사용되므로 정확하게 입력해주세요.</p></td>
							</tr>
							<tr>
								<th><span class="fc_red">* </span>상호</th>
								<td><input type="text" name="company_name" placeholder="사업자 상호를 입력해주세요."></td>
							</tr>
							<tr>
								<th><span class="fc_red">* </span>사업자등록번호</th>
								<td><input type="text" name="company_num" placeholder="사업자등록번호를 입력해주세요."></td>
							</tr>
							<tr>
								<th><span class="fc_red">* </span>대표자명</th>
								<td><input type="text" name="company_ceo" placeholder="대표자명을 입력해주세요."></td>
							</tr>
						</table>
						<div class="btnWrap">
							<p>수정</p>
							<p>취소</p>
						</div>
					</div><!-- tblWrap end -->
				</div><!-- section end -->
			</div><!-- sectionWrap end -->
			<div class="footer"></div>
		</div><!-- rightAside end -->
	</div><!-- allWrap end -->
</body>
</html>