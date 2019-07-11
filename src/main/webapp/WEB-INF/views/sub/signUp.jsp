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
		font-size: 25px;
		color: #595959;
		font-family: sans-serif;
		margin: 20px 0;
	}
	.agreementWrap{
		width: 100%;
	}
	.agreementWrap > .agreementContent{
		width: 100%;
		height: 200px;
		background: #fff;
		padding: 15px;
	}
	.agreementBtnWrap{
		margin: 5px 0 20px 10px;
	}
	.agreementBtnWrap > label{
		font-size: 14px;
	}
	.agreementBtnWrap > label > input{
		vertical-align: middle;
	}
	.tblWrap{
		width: 100%;
	}
	.tblWrap > table{
		width: 100%;
		background: #fff;
	}
	.tblWrap > table tr{
		border-bottom: 2px solid lightgray;
	}
	.tblWrap > table tr > th{
		width: 155px;
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
	
	
	
	
	.footerWrap{
		width: 100%;
		height: 70px;
		background: #7b93a8;
	}
</style>
<script>
function inputBirthChk(obj) {
	var number = obj.value.replace(/[^0-9]/g, "");
	var birth = "";
	
	if(number.length < 5) {
		return number;
	} else if(number.length < 7) {
		birth += number.substr(0, 4);
		birth += "-";
		birth += number.substr(4);
	}else {
		birth += number.substr(0, 4);
		birth += "-";
		birth += number.substr(4, 2);
		birth += "-";
		birth += number.substr(6);
	}
	
	obj.value = birth;
}

function inputPhoneNumber(obj) {
	var number = obj.value.replace(/[^0-9]/g, "");
	var phone = "";
	
	if(number.length < 4) {
		return number;
	} else if(number.length < 7) {
		phone += number.substr(0, 3);
		phone += "-";
		phone += number.substr(3);
	} else if(number.length < 11) {
		phone += number.substr(0, 3);
		phone += "-";
		phone += number.substr(3, 3);
		phone += "-";
		phone += number.substr(6);
	} else {
		phone += number.substr(0, 3);
		phone += "-";
		phone += number.substr(3, 4);
		phone += "-";
		phone += number.substr(7);
	}
	obj.value = phone;
}

function managerIdChk(id){
	$.ajax({
		url:"${pageContext.request.contextPath}/managerIdChk",
		type:"post",
		data : id,
        dataType : 'text',
        contentType : 'application/json; charset=UTF-8',
		async:false,
		success:function(json){
			if(json == "ok"){
				alert("사용가능한 아이디입니다.");
				$(".tblWrap > table tr > td > input[name='idChk']").val("o");
			}else{
				alert("이미 사용중인 아이디입니다.");
			}
			
		},
		error:function(request,status,error){
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}

function post_managerSignUp(vo){
	$.ajax({
		url:"${pageContext.request.contextPath}/managerRegister",
		type:"post",
		data : JSON.stringify(vo),
        dataType : 'text',
        contentType : 'application/json; charset=UTF-8',
		async:false,
		success:function(json){
			if(json == "ok"){
				alert("회원가입이 완료되었습니다.\n가입하신 아이디로 로그인 후 이용하세요.");
				location.replace("${pageContext.request.contextPath}/");
			}else{
				alert("회원가입이 옳바르게 되지 않았습니다.\n새로고침(F5) 후 다시 이용하세요.\n(동일한 현상이 반복된다면 상담센터에 문의하세요.)");
			}
			
		},
		error:function(request,status,error){
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}

$(function(){
	//아이디 중복확인
	$(".tblWrap > table tr > td > button").click(function(){
		var id=$(".tblWrap > table tr > td > input[name='id']").val();
		if(id.length<6){
			alert("아이디를 형식에 맞게 입력하세요.");
			return false;
		}else{
			managerIdChk(id);
		}
	});
	
	//아이디에 입력 값 변했을 때 
	$(".tblWrap > table tr td > input[name='id']").change(function(){
		$(".tblWrap > table tr td > input[name='idChk']").val("x");
	});
	
	//버튼 클릭(회원가입, 취소)
	$(".tblBtnWrap > p").click(function(){
		var btn_idx = $(this).index();
		if(btn_idx == 0){
			var agreement = $(".agreementBtnWrap > label > input[type='checkbox']").prop("checked");
			console.log(agreement);
			var id = $(".tblWrap > table tr > td > input[name='id']").val();
			var idChk = $(".tblWrap > table tr > td > input[name='idChk']").val();
			var pw = $(".tblWrap > table tr > td > input[name='pw']").val();
			var pwChk = $(".tblWrap > table tr > td > input[name='pwChk']").val();
			var name = $(".tblWrap > table tr > td > input[name='name']").val();
			var birth = $(".tblWrap > table tr > td > input[name='birth']").val();
			var phone = $(".tblWrap > table tr > td > input[name='id']").val();
			var mail = $(".tblWrap > table tr > td > input[name='mail']").val();
			var company_name = $(".tblWrap > table tr > td > input[name='company_name']").val();
			var company_num = $(".tblWrap > table tr > td > input[name='company_num']").val();
			var company_ceo = $(".tblWrap > table tr > td > input[name='company_ceo']").val();
			
			
			if(agreement == false){
				alert("이용약관 및 개인정보처리 방침에 동의하지 않으면 가입이 되지않습니다.");
				return false;
			}
			if(id == "" || id.length < 6){
				alert("아이디를 형식에 맞게 입력하세요.");
				return false;
			}
			if(idChk == "x"){
				alert("아이디 중복확인을 하세요.");
				return false;
			}
			if(pw == "" || pw.lenth == 0){
				alert("비밀번호를 형식에 맞게 입력하세요.");
				return false;
			}
			if(pw != pwChk){
				alert("비밀번호가 일치하지 않습니다.");
				return false;
			}
			if(name == "" || name.length == 0){
				alert("이름을 입력하세요.");
				return false;
			}
			if(birth == "" || birth.length == 0){
				alert("생년월일을 입력하세요.");
				return false;
			}
			if(phone == "" || phone.length == 0){
				alert("휴대전화를 입력하세요.");
				return false;
			}
			if(mail == "" || mail.length == 0){
				alert("이메일을 입력하세요");
				return false;
			}
			if(company_name == "" || company_name.length == 0){
				alert("상호를 입력하세요.");
				return false;
			}
			if(company_num == "" || company_num.length == 0){
				alert("사업자등록번호를 입력하세요.");
				return false;
			}
			if(company_ceo == "" || company_ceo.length == 0){
				alert("대표자명을 입력하세요.");
				return false;
			}
			
			var vo = {mno:0, name:name, birth:birth, phone:phone, mail:mail, company_name:company_name, company_num:company_num, company_ceo:company_ceo, id:id, pw:pw};
			post_managerSignUp(vo);
			
		}else if(btn_idx == 1){
			location.href = "${pageContext.request.contextPath}/"; 
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
					<h3>NO.1 부동산 관리시스템<br> CONTOWER 회원가입</h3>
				</div>
				
				<div class="tblWrap">
					<table>
						<tr>
							<th><span class="fc_red">* </span>아이디</th>
							<td><input type="text" name="id" placeholder="아이디를 입력해주세요."><input type="hidden" name="idChk" value="x"><button>중복확인</button><p>아이디는 영문과 숫자를 합친 6자리 이상 가능합니다.</p></td>
						</tr>
						<tr>
							<th><span class="fc_red">* </span>비밀번호</th>
							<td><input type="password" name="pw" placeholder="비밀번호를 입력해주세요."><p>비밀번호는 영문, 숫자, 특수문자를 합친 8자리 이상 가능합니다.</p></td>
						</tr>
						<tr>
							<th><span class="fc_red">* </span>비밀번호 확인</th>
							<td><input type="password" name="pwChk" placeholder="동일한 비밀번호를  입력해주세요."></td>
						</tr>
						<tr>
							<th><span class="fc_red">* </span>이름</th>
							<td><input type="text" name="name" placeholder="이름을  입력해주세요."></td>
						</tr>
						<tr>
							<th><span class="fc_red">* </span>생년월일</th>
							<td><input type="text" name="birth" placeholder="ex) 1999-09-09" onKeyup='inputBirthChk(this);' maxlength='10'></td>
						</tr>
						<tr>
							<th><span class="fc_red">* </span>휴대전화</th>
							<td><input type="text" name="phone" placeholder="ex) 010-1111-2222" onKeyup="inputPhoneNumber(this);" maxlength="13"></td>
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
				</div><!-- tblWrap end -->
				<div class="agreementWrap">
					<div class="agreementContent">
						
					</div>
					<div class="agreementBtnWrap">
						<label>
							<input type="checkbox" name="">
							<span>이용약관 및 개인정보처리 방침에 동의합니다.</span>
						</label>
					</div>
				</div>
				<div class="tblBtnWrap">
					<p>회원가입</p>
					<p>취소</p>
				</div>
			</div><!-- section end -->
		</div><!-- sectionWrap -->
		<div class="footerWrap">
			
		</div>
	</div>
</body>
</html>