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
<style>
	.allWrap{
		width:100%;
		height:100%;
		position: relative;
		padding-top: 10%;
		background: url("${pageContext.request.contextPath}/resources/images/loginBigBg.jpg") no-repeat;
		background-size: cover;
	}
	.section{
		width: 1100px;
		height: 680px;
		position: absolute;
		top: 50%;
		left: 50%;
		margin-top: -340px;
		margin-left: -550px; 
		box-shadow: 0px 0px 100px 25px #bbb;
	}
	.aside_left{
		width: 50%;
		height:100%;
		float:left;
		text-align: center;
		background: #0d87e4;
		position: relative;
	}
	.logoDiv{
		width: 100%;
		margin-bottom: 50px;
	}
	.logoDiv > img{
		margin-top: 90px;
	}
	.contentWrap{
		overflow: hidden;
		width: 57%;
		margin: 0 auto; 
	}
	.userSelectBtnWrap{
		float: left;
		box-shadow: -5px -10px 50px 6px #777;
	}
	.userSelectBtnWrap > p{
		padding: 20px 15px;
		font-size: 15px;
		border-radius: 10px 2px 2px 10px;
		cursor: pointer;
	}
	.userSelectBtnWrap > p:nth-child(1){
		color: #40a6f2;
		background: #fff;
	}
	.userSelectBtnWrap > p:nth-child(2){
		color: #fff;
		background: #0e93f7;
	}
	.formWrap{
		float: right;
	}
	.formWrap > table{
		width: 220px;
	}
	.formWrap > table tr{
		
	}
	.formWrap > table tr > th, .formWrap > table tr > td{
		padding: 7px 0;
	}
	.formWrap > table tr > th{
		width: 35px;
		font-size: 16px;
		color: #fff;
		letter-spacing: 2px;
		font-weight: bold;
		text-align: left;
	}
	.formWrap > table tr > td{
		padding-bottom: 5px;
	}
	.formWrap > table tr > td > input{
		width: 100%;
		border: 0;
		border-radius: 13px;
		font-size: 15px;
		padding: 7px;
	}
	.formBtnWrap{
		margin-top: 30px;
	}
	.formBtnWrap > p{
		font-size: 14px;
		text-align: center;
		margin-bottom: 5px;
	}
	.formBtnWrap > p > a{
		color: #fff;
	}
	.formBtnWrap > p:nth-child(3){
		width: 130px;
		margin: 0 auto;
		margin-top: 20px;
		background: #fff;
		font-size: 15px;
		font-weight: bold;
		color: #40a6f2;
		border-radius: 10px;
		padding: 10px 0;
		cursor: pointer;
	}
	
	
	.adsWrap{
		width: 100%;
		height: 175px;
		background: gray;
		position: absolute;
		bottom: 0;
	}
	.aside_right{
		float:right;
		width: 50%;
		height:100%;
		
	}
	.aside_right > img{
		width: 100%;
	}
</style>
<script>
function idpwchk(id, pw, type){
	var info = {id:id, pw:pw, type:type};
	$.ajax({
		url:"${pageContext.request.contextPath}/userIdPwChk",
		type:"post",
		data : JSON.stringify(info),
        dataType : 'text',
        contentType : 'application/json; charset=UTF-8',
		async:false,
		success:function(json){
			if(json!="ok"){
				alert("아이디 또는 비밀번호를 다시 확인하세요.");
			}else{
				if(type == "m"){
					location.replace("${pageContext.request.contextPath}/mMain");
				}else if(type == "o"){
					location.replace("${pageContext.request.contextPath}/owner/oMain");
				}
				
			}
		},
		error:function(request,status,error){
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
} 

$(function(){
	var ltype="m";
	$(".userSelectBtnWrap > p").click(function(){
		$(".userSelectBtnWrap > p").css({"color":"#fff", "background":"#0e93f7"});
		var idx = $(this).index();
		if(idx == 0){
			$(this).css({"color":"#40a6f2", "background":"#fff"});
			ltype="m";
		}else if(idx == 1){
			$(this).css({"color":"#40a6f2", "background":"#fff"});
			ltype="o";
		}
	});
	
	$(".formBtnWrap > p").eq(2).click(function(){
		var id = $(".formWrap > table tr > td > input[name='id']").val();
		var pw = $(".formWrap > table tr > td > input[name='pw']").val();
		var info = {id:id, pw:pw, type:ltype};
		
		idpwchk(id, pw, ltype);
	});
});
</script>
</head>
<body>
	<div class="allWrap">
		<div class="section">
			<div class="aside_left">
				<div class="loginWrap">
					<div class="logoDiv">
						<img src="${pageContext.request.contextPath}/resources/images/loginLogo.png">
					</div>
					<div class="contentWrap">
						<div class="userSelectBtnWrap">
							<p>관리자</p>
							<p>건물주</p>
						</div>
						<div class="formWrap">
							<table>
								<tr>
									<th>ID</th>
									<td><input type="text" name="id" placeholder=""></td>
								</tr>
								<tr>
									<th>PW</th>
									<td><input type="password" name="pw" placeholder=""></td>
								</tr>
							</table>
							<div class="formBtnWrap">
								<p><a href="${pageContext.request.contextPath}/signup">회원가입</a></p>
								<p><a href="${pageContext.request.contextPath}/findInfo">아이디/비밀번호 찾기</a></p>
								<p>로그인</p>
							</div><!-- formBtnWrap -->
						</div><!-- formWrap -->
					</div><!-- contentWrap -->
				</div><!-- loginWrap end -->
				<div class="adsWrap">
							
				</div><!-- adsWrap end -->
			</div><!-- aside_left end -->
			<div class="aside_right">
				<img src="${pageContext.request.contextPath}/resources/images/loginAsideRightImg.jpg">
			</div><!-- aside_right end -->
		</div><!-- section end -->
		
	</div>
</body>
</html>