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
	
</style>
<script>


$(function(){
	
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
		</div><!-- rightAside end -->
	</div><!-- allWrap end -->
</body>
</html>