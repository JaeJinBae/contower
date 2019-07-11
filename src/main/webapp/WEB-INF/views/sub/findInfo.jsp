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
		background: #f5f1ef;
	}
	.sectionWrap{
		width: 100%;
		padding: 50px 0;
	}
	.section{
		width: 700px;
		margin: 0 auto;
	}
	.topLogo{
		width: 100%;
		text-align: center;
	}
	.topLogo > img{
		width:300px;
	}
	.topLogo > h3{
		/* font-weight: bold; */
		color: #595959;
		font-family: sans-serif;
		margin: 20px 0;
		font-size: 25px;
	}
	
	.tblWrap{
		width: 600px;
		margin: 0 auto;
		background: #fff;
		padding: 10px 15px;
	}
	.tblWrap > p{
		text-align: center;
		font-size: 14px;
	}
	.tblFindId{
		width: 100%;
	}
	.tblFindId > h4{
		color: #595959;
		margin: 0 10px;
		padding: 15px 0 15px 0;
	}
	.tblFindId > table{
		width: 100%;
	}
	.tblFindId > table tr{
		border-bottom: 1px solid lightgray;
	}
	.tblFindId > table tr:first-child{
		border-top: 2px solid lightgray;
	}
	.tblFindId > table tr:last-child{
		border-bottom: 2px solid lightgray;
	}
	.tblFindId > table tr > th{
		width: 150px;
		font-size: 15px;
		background: #fafafa;
	}
	.tblFindId > table tr > td{
		font-size: 15px;
		padding: 10px 15px;
	}
	.tblFindId > table tr > td > input{
		font-size: 15px;
		padding: 5px 10px;
	}
	.tblFindId > table tr:nth-child(2) > td > input:first-child{
		width:65px;
	}
	.tblFindId > table tr:nth-child(2) > td > input:nth-child(2){
		width:120px;
	}
	.tblFindId > table tr:nth-child(2) > td > input:last-child{
		width:120px;
	}
	.tblFindId > table tr:nth-child(3) > td > input:first-child{
		width:140px;
	}
	.tblFindId > table tr:nth-child(3) > td > input:last-child{
		width:140px;
	}
	.tblFindId > .tblFindIdBtnWrap{
		width: 100%;
		text-align: center;
	}
	.tblFindId > .tblFindIdBtnWrap > p{
		display:inline-block;
		width:125px;
		text-align: center;
		margin: 15px auto;
		padding: 10px 15px;
		font-size: 16px;
		color: #fff;
		background: #475c6f;
		cursor: pointer;
	}
	
	
	.tblFindPw{
		width: 100%;
	}
	.tblFindPw > h4{
		color: #595959;
		margin: 0 10px;
		padding: 15px 0 15px 0;
	}
	.tblFindPw > table{
		width: 100%;
	}
	.tblFindPw > table tr{
		border-bottom: 1px solid lightgray;
	}
	.tblFindPw > table tr:first-child{
		border-top: 2px solid lightgray;
	}
	.tblFindPw > table tr:last-child{
		border-bottom: 2px solid lightgray;
	}
	.tblFindPw > table tr > th{
		width: 150px;
		font-size: 15px;
		background: #fafafa;
	}
	.tblFindPw > table tr > td{
		font-size: 15px;
		padding: 10px 15px;
	}
	.tblFindPw > table tr > td > input{
		font-size: 15px;
		padding: 5px 10px;
	}
	.tblFindPw > table tr:nth-child(3) > td > input:first-child{
		width:65px;
	}
	.tblFindPw > table tr:nth-child(3) > td > input:nth-child(2){
		width:120px;
	}
	.tblFindPw > table tr:nth-child(3) > td > input:last-child{
		width:120px;
	}
	.tblFindPw > table tr:nth-child(4) > td > input:first-child{
		width:140px;
	}
	.tblFindPw > table tr:nth-child(4) > td > input:last-child{
		width:140px;
	}
	.tblFindPw > .tblFindPwBtnWrap{
		width: 100%;
		text-align: center;
	}
	.tblFindPw > .tblFindPwBtnWrap > p{
		display:inline-block;
		width:125px;
		text-align: center;
		margin: 15px auto;
		padding: 10px 15px;
		font-size: 16px;
		color: #fff;
		background: #475c6f;
		cursor: pointer;
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
	
	
	
	
	
	.footerWrap{
		width: 100%;
		height: 70px;
		background: #7b93a8;
	}
</style>
<script>

$(function(){
	$(".tblFindId > .tblFindIdBtnWrap > p").click(function(){
		var btnIdx = $(this).index();
		if(btnIdx == 0){
			
		}else if(btnIdx ==1){
			location.replace("${pageContext.request.contextPath}/");
		}
	});
	
	$(".tblFindPw > .tblFindPwBtnWrap > p").click(function(){
		var btnIdx = $(this).index();
		if(btnIdx == 0){
			
		}else if(btnIdx ==1){
			location.replace("${pageContext.request.contextPath}/");
		}
	});
});
</script>
<style>

</style>
</head>
<body>
	<div class="allWrap">
		<div class="sectionWrap">
			<div class="section">
				<div class="topLogo">
					<img src="${pageContext.request.contextPath}/resources/images/logo2.png">
					<h3>NO.1 부동산 관리시스템<br>아이디/비밀번호 찾기</h3>
				</div>
				<div class="tblWrap">
					<p class="fc_orange">입력하신 정보는 아이디/비밀번호 찾기 이외에 목적으로 사용되지 않습니다.</p>
					<div class="tblFindId">
						<h4>아이디 찾기</h4>
						<table>
							<tr>
								<th>이름</th>
								<td><input type="text" name="name"></td>
							</tr>
							<tr>
								<th>휴대전화</th>
								<td><input type="text" name="phone1"> - <input type="text" name="phone1"> - <input type="text" name="phone1"></td>
							</tr>
							<tr>
								<th>이메일</th>
								<td><input type="text" name="mail1"> @ <input type="text" name="mail2"></td>
							</tr>
						</table>
						<div class="tblFindIdBtnWrap">
							<p>아이디 찾기</p>
							<p>뒤로가기</p>
						</div>
						
					</div><!-- tblFindId end -->
					<div class="tblFindPw">
						<h4>비밀번호 찾기</h4>
						<table>
							<tr>
								<th>아이디</th>
								<td><input type="text" name="id"></td>
							</tr>
							<tr>
								<th>이름</th>
								<td><input type="text" name="name"></td>
							</tr>
							<tr>
								<th>휴대전화</th>
								<td><input type="text" name="phone1"> - <input type="text" name="phone1"> - <input type="text" name="phone1"></td>
							</tr>
							<tr>
								<th>이메일</th>
								<td><input type="text" name="mail1"> @ <input type="text" name="mail2"></td>
							</tr>
						</table>
						<div class="tblFindPwBtnWrap">
							<p style="width:135px;">비밀번호 찾기</p>
							<p>뒤로가기</p>
						</div>
					</div><!-- tblFindPw end -->
				</div><!-- tblWrap end -->
			</div><!-- section end -->
		</div>
		<div class="footerWrap">
			
		</div>
	</div>
</body>
</html>