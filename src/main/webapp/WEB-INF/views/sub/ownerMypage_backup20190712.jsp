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
	.tblWrap{
		width: 550px;
		margin: 0 auto;
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
		width: 140px;
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

	.footerWrap{
		width: 100%;
		height: 70px;
		background: #7b93a8;
	}
</style>
<script>
function get_ownerInfo(ono){
	var dt;
	$.ajax({
		url:"${pageContext.request.contextPath}/owner/getOwnerInfo/"+ono,
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

function draw_ownerInfo(ono){
	var json = get_ownerInfo(ono);
	
	$(".tblWrap > table tr > td > input[name='id']").val(json.id);
	$(".tblWrap > table tr > td > input[name='name']").val(json.name);
	$(".tblWrap > table tr > td > input[name='birth']").val(json.birth);
	$(".tblWrap > table tr > td > input[name='phone']").val(json.phone);
	$(".tblWrap > table tr > td > input[name='mail']").val(json.mail);
}

function post_ownerInfoUpdate(vo){
	$.ajax({
		url:"${pageContext.request.contextPath}/owner/ownerUpdate",
		type:"post",
		data : JSON.stringify(vo),
        dataType : 'json',
        contentType : 'application/json; charset=UTF-8',
		async:false,
		success:function(json){
			console.log(json);
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
	
	draw_ownerInfo($("#seOno").val());
	
	$(".btnWrap > p").click(function(){
		var btnIdx = $(this).index();
		if(btnIdx ==0){
			var ono = $("#seOno").val();
			var name = $(".tblWrap > table tr > td > input[name='name']").val();
			var birth = $(".tblWrap > table tr > td > input[name='birth']").val();
			var phone = $(".tblWrap > table tr > td > input[name='phone']").val();
			var mail = $(".tblWrap > table tr > td > input[name='mail']").val();
			var pw = $(".tblWrap > table tr > td > input[name='pw']").val();
			var pwChk = $(".tblWrap > table tr > td > input[name='pwChk']").val();
			
			
			var vo = {ono:ono, name:name, birth:birth, phone:phone, mail:mail, pw:pw};
			
			post_ownerInfoUpdate(vo);
		}else if(btnIdx == 1){
			location.replace("${pageContext.request.contextPath}/owner/oMain");
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
			<jsp:include page="../include/ownerHeader.jsp"></jsp:include>
		</div>
		<div class="sectionWrap">
			<div class="sectionTitle">
				<p><img src="${pageContext.request.contextPath}/resources/images/icon_plus_cr.png"><span>개인정보수정</span><img src="${pageContext.request.contextPath}/resources/images/icon_line.png"></p>
			</div>
			<div class="section">
				<div class="tblWrap">
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
					</table>
					<div class="btnWrap">
						<p>수정</p>
						<p>취소</p>
					</div>
				</div><!-- tblWrap end -->
			</div><!-- section end -->
		</div>
		<div class="footerWrap">
			
		</div>
	</div>
</body>
</html>