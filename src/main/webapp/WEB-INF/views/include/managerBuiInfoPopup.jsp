<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
.popup_bg{
	position: fixed;
	top:0;
	left:0;
	width:100%;
	height:100%;
	background: #111;
	opacity: 0.5;
}
.popup_content > h2{
	width: 100%;
	color: #fff;
	background: #6c7981;
	padding: 10px 0;
	position: relative;
}
.popup_content > h2 > img{
	width: 25px;
	position: absolute;
	right: 25px;
	cursor: pointer;
	margin-top:5px;
}
.popup_buiUpdate{
	width: 1200px;
	background: #fefefe;
	margin:0 auto;
	margin-top:100px;
	position: relative;
	z-index: 999;
	text-align: center;
	padding-bottom: 1px;
}
.popup_buiUpdate > table{
	width: 1024px;
	margin: 25px auto;
}
.popup_buiUpdate > table tr{
	border-bottom: 5px solid #fefefe;
}
.popup_buiUpdate > table tr > th{
	background: #6c7981;
	width: 120px;
	color: #fff;
	font-size: 16px;
	letter-spacing: 4px;
}
.popup_buiUpdate > table tr > td{
	padding-right: 10px;
	text-align: center;
	font-size: 15px;
}
.popup_buiUpdate > table tr > td > input{
	width: 100%;
	font-size: 15px;
	padding: 8px 3px;
	border: 1px solid #cfcfcf;
}
.popup_buiUpdate > table tr > td > input[name='baddr_old']{
	width: 48%;
}
.popup_buiUpdate > table tr > td > input[name='baddr_new']{
	width: 49%;
	margin-left: 18px;
}
.popup_buiUpdate > table tr > td > #ownerChk{
	font-size: 14px;
	background: #037dd2;
	color: #fefefe;
	text-align: center;
	padding: 5px 15px;
	border-radius: 4px;
}
.popup_buiUpdate{
	display:none;
}
.popup_buiUpdate > .popup_buiUpdate_btn_wrap{
	width: 100%;
	margin: 15px auto;
}
.popup_buiUpdate > .popup_buiUpdate_btn_wrap > p{
	display: inline-block;
	padding:8px 17px;
	font-size:15px;
	margin-left:20px;
	cursor: pointer;
	background: #1797f7;
	color: #fff;
	border-radius: 15px;
	letter-spacing: 1px;
}

.popup_repair{
	display: none;
	width:500px;
	background: #fff;
	margin:0 auto;
	margin-top:100px;
	position: relative;
	z-index: 999;
	text-align: center;
}
.popup_repair > h2{ 
	width: 100%;
	font-size: 22px;
	color: #fff;
	padding: 10px 0;
	background: #6c7981;
	position: relative;
}
.popup_repair > h2 > img{
	width: 20px;
	position: absolute;
	right: 10px;
	cursor: pointer;
	margin-top:5px;
}
.popup_repair > table{
	width: 98%;
	margin: 0 auto;
}
.popup_repair > table tr{
	border-top: 10px solid #fff;
	box-shadow: 0px 0px 6px 0px gray;
}
.popup_repair > table tr > th{
	width: 100px;
	background: #6d7a81;
	text-align: center;
	font-size: 15px;
	color: #efefef;
}
.popup_repair > table tr > td{
	text-align: left;
}
.popup_repair > table tr > td > textarea{
	width:100%;
	resize: none;
	height:300px;
	border: 1px solid #efefef;
	font-size: 15px;
}
.popup_btnWrap{
	width: 100%;
	text-align: center;
	padding: 10px 0;
}
.popup_btnWrap > p{
	cursor: pointer;
	display: inline-block;
}
.popup_btnWrap > p > img{
	width: 40px;
}

.popup_roomUpdateComplete{
	width: 850px;
	background: #fefefe;
	margin:0 auto;
	margin-top:100px;
	position: relative;
	z-index: 999;
	text-align: center;
	padding-bottom: 1px;
}
.popup_roomUpdateComplete > table{
	width: 740px;
	margin: 20px auto;
}
.popup_roomUpdateComplete > table tr{
	border-bottom: 5px solid #fefefe;
}
.popup_roomUpdateComplete > table tr > th{
	background: #6c7981;
	width: 80px;
	color: #fff;
	font-size: 15px;
}
.popup_roomUpdateComplete > table tr > td{
	padding-right: 10px;
	font-size: 15px;
	text-align: left;
}
.popup_roomUpdateComplete > table tr > td > select{
	width: 100%;
	font-size: 15px;
	padding: 8px 3px;
	border: 1px solid #cfcfcf;
}
.popup_roomUpdateComplete > table tr > td > input{
	width: 100%;
	font-size: 15px;
	padding: 8px 3px;
	border: 1px solid #cfcfcf;
}
.popup_roomUpdateComplete > table tr > td > input[name='monthly_rent']{
	width: 58px;
	text-align: right;
	margin-right:8px;
}
.popup_roomUpdateComplete > table tr > td > input[name='deposit']{
	width: 58px;
	text-align: right;
	margin-right: 8px;
}
.popup_roomUpdateComplete{
	display:none;
}
.popup_roomUpdateComplete > .popup_roomUpdate_btn_wrap{
	width: 100%;
	margin: 15px auto;
}
.popup_roomUpdateComplete > .popup_roomUpdate_btn_wrap > p{
	display: inline-block;
	padding:8px 17px;
	font-size:15px;
	margin-left:20px;
	cursor: pointer;
	background: #1797f7;
	color: #fff;
	border-radius: 15px;
	letter-spacing: 1px;
}

.popup_roomUpdateEmpty{
	width: 800px;
	background: #fefefe;
	margin:0 auto;
	margin-top:100px;
	position: relative;
	z-index: 999;
	text-align: center;
	padding-bottom: 1px;
}
.popup_roomUpdateEmpty > table{
	width: 700px;
	margin: 20px auto;
}
.popup_roomUpdateEmpty > table tr{
	border-bottom: 5px solid #fefefe;
}
.popup_roomUpdateEmpty > table tr > th{
	background: #6c7981;
	width: 80px;
	color: #fff;
	font-size: 15px;
}
.popup_roomUpdateEmpty > table tr > td{
	text-align: left;
	padding-right: 10px;
	font-size: 15px;
}
.popup_roomUpdateEmpty > table tr > td > select{
	width: 100%;
	font-size: 15px;
	padding: 8px 3px;
	border: 1px solid #cfcfcf;
}
.popup_roomUpdateEmpty > table tr > td > input{
	width: 100%;
	font-size: 15px;
	padding: 8px 3px;
	border: 1px solid #cfcfcf;
}
.popup_roomUpdateEmpty > table tr > td > input[name='hope_price']{
	width: 105px;
	text-align: right;
	margin-right: 8px;
}
.popup_roomUpdateEmpty{
	display:none;
}
.popup_roomUpdateEmpty > .popup_roomUpdate_btn_wrap{
	width: 100%;
	margin: 15px auto;
}
.popup_roomUpdateEmpty > .popup_roomUpdate_btn_wrap > p{
	display: inline-block;
	padding:8px 17px;
	font-size:15px;
	margin-left:20px;
	cursor: pointer;
	background: #1797f7;
	color: #fff;
	border-radius: 15px;
	letter-spacing: 1px;
}

.popup_roomUpdateContractComp{
	width: 850px;
	background: #fefefe;
	margin:0 auto;
	margin-top:100px;
	position: relative;
	z-index: 999;
	text-align: center;
	padding-bottom: 1px;
}
.popup_roomUpdateContractComp > table{
	width: 740px;
	margin: 20px auto;
}
.popup_roomUpdateContractComp > table tr{
	border-bottom: 5px solid #fefefe;
}
.popup_roomUpdateContractComp > table tr > th{
	background: #6c7981;
	width: 80px;
	color: #fff;
	font-size: 15px;
}
.popup_roomUpdateContractComp > table tr > td{
	text-align: left;
	padding-right: 10px;
	font-size: 15px;
}
.popup_roomUpdateContractComp > table tr > td > select{
	width: 100%;
	font-size: 15px;
	padding: 8px 3px;
	border: 1px solid #cfcfcf;
}
.popup_roomUpdateContractComp > table tr > td > input{
	width: 100%;
	font-size: 15px;
	padding: 8px 3px;
	border: 1px solid #cfcfcf;
}
.popup_roomUpdateContractComp > table tr > td > input[name='deposit']{
	width: 105px;
	margin-right: 8px;
	text-align: right;
}
.popup_roomUpdateContractComp > table tr > td > input[name='monthly_rent']{
	width: 105px;
	margin-right: 8px;
	text-align: right;
}
.popup_roomUpdateContractComp > table tr > td > input[name='downpayment']{
	width: 105px;
	margin-right: 8px;
	text-align: right;
}
.popup_roomUpdateContractComp{
	display:none;
}
.popup_roomUpdateContractComp > .popup_roomUpdate_btn_wrap{
	width: 100%;
	margin: 15px auto;
}
.popup_roomUpdateContractComp > .popup_roomUpdate_btn_wrap > p{
	display: inline-block;
	padding:8px 17px;
	font-size:15px;
	margin-left:20px;
	cursor: pointer;
	background: #1797f7;
	color: #fff;
	border-radius: 15px;
	letter-spacing: 1px;
}

.popup_roomRegister{
	width: 850px;
	background: #fefefe;
	margin:0 auto;
	margin-top:100px;
	position: relative;
	z-index: 999;
	text-align: center;
	padding-bottom: 1px;
}
.popup_roomRegister > table{
	width: 740px;
	margin: 20px auto;
}
.popup_roomRegister > table tr{
	border-bottom: 5px solid #fefefe;
}
.popup_roomRegister > table tr > th{
	background: #6c7981;
	width: 80px;
	color: #fff;
	font-size: 15px;
}
.popup_roomRegister > table tr > td{
	text-align: left;
	padding-right: 10px;
	font-size: 15px;
}
.popup_roomRegister > table tr > td > select{
	width: 100%;
	font-size: 15px;
	padding: 8px 3px;
	border: 1px solid #cfcfcf;
}
.popup_roomRegister > table tr > td > input{
	width: 100%;
	font-size: 15px;
	padding: 8px 3px;
	border: 1px solid #cfcfcf;
}
.popup_roomRegister > table tr > td > input[name='deposit']{
	width: 105px;
	margin-right: 8px;
	text-align: right;
}
.popup_roomRegister > table tr > td > input[name='monthly_rent']{
	width: 105px;
	margin-right: 8px;
	text-align: right;
}
.popup_roomRegister > table tr > td > input[name='downpayment']{
	width: 105px;
	margin-right: 8px;
	text-align: right;
}
.popup_roomRegister > table tr > td > input[name='hope_price']{
	width: 105px;
	margin-right: 8px;
	text-align: right;
}
.popup_roomRegister > table tr > td > textarea{
	width: 100%;
	font-size: 15px;
	resize: none;
	border: 1px solid #cfcfcf;
}
.popup_roomRegister{
	display:none;
}
.popup_roomRegister > .popup_roomRegister_btn_wrap{
	width: 100%;
	margin: 15px auto;
}
.popup_roomRegister > .popup_roomRegister_btn_wrap > p{
	display: inline-block;
	padding:8px 17px;
	font-size:15px;
	margin-left:20px;
	cursor: pointer;
	background: #1797f7;
	color: #fff;
	border-radius: 15px;
	letter-spacing: 1px;
}

</style>
<script>
	$(function(){
		$(document).on("keyup", ".numberOnly", function(){
			$(this).val($(this).val().replace(/[^0-9]/g,""));
			
		});
	});
</script>
	<div class="popup_bg">
	</div>
	<div class="popup_buiUpdate popup_content">
		<h2>건물정보 수정<img src="${pageContext.request.contextPath}/resources/images/icon_x.png" title="닫기"></h2>
		<table>
			<tr>
				<th>건물명</th>
				<td><input type="text" name="bname"><input type="hidden" name="bno"></td>
				<th>주소</th>
				<td colspan="5"><input type="text" name="baddr_old" placeholder="지번주소를 입력해주세요."><input type="text" name="baddr_new" placeholder="도로명주소를 입력해주세요."></td>
			</tr>
			<tr>
				<th>현관번호</th>
				<td><input type="text" name="bpw" placeholder="1층 현관 비밀번호"></td>
				<th>난방</th>
				<td><input type="text" name="heating" placeholder=""></td>
				<th>옵션</th>
				<td colspan="3"><input type="text" name="boption"></td>
			</tr>
			<tr>
				<th>준공일</th>
				<td><input type="text" name="completion_date"></td>
				<th>대지</th>
				<td><input type="text" name="site" class="numberOnly"></td>
				<th>연면적</th>
				<td><input type="text" name="gross_area" class="numberOnly"></td>
				<th>도로</th>
				<td><input type="text" name="road"></td>
			</tr>
			<tr>
				<th>건축주</th>
				<td><input type="text" name="oname"><input type="hidden" name="ono"></td> 
				<th>연락처</th>
				<td><input type="text" name="ophone"></td>
				<th>생년월일</th>
				<td><input type="text" name="obirth"></td>
				<th>건축주계정</th>
				<td id="ownerId"></td>
			</tr>
			<tr>
				<th>메모</th>
				<td colspan="7"><input type="text" name="memo"></td>
			</tr>
		</table>
		<div class="popup_buiUpdate_btn_wrap">
			<p>저장</p>
			<p>삭제</p>
		</div>
	</div><!-- popup_buiUpdate end -->
	
	<div class="popup_repair popup_content">
		<h2>수리내역<input type="hidden" name="trIdx" value=""><img src="${pageContext.request.contextPath}/resources/images/icon_x.png" title="닫기"></h2>
		<table>
			<tr>
				<th>내용</th>
				<td><textarea></textarea></td>
			</tr>
		</table>
		<div class="popup_btnWrap">
			<p><img src="${pageContext.request.contextPath}/resources/images/icon_plus.png" title="등록"></p>
		</div>
	</div><!-- popup_ownerRegister -->
	
	<div class="popup_roomRegister popup_content">
		<h2>방 추가<img src="${pageContext.request.contextPath}/resources/images/icon_x.png" title="닫기"></h2>
		<table>
			<tr>
				<th>입주</th>
				<td>
					<select name="state">
						<option value="공실">공실</option>
						<option value="입주완료">입주완료</option>
						<option value="계약완료">계약완료</option>
					</select> 
				</td>
				<th>타입</th>
				<td>
					<select name="room_type">
						<option value="one">원룸</option>
						<option value="mitwo">미니투룸</option>
						<option value="two">투룸</option>
						<option value="three">쓰리룸</option>
						<option value="store">상가</option>
						<option value="owner">주인세대</option>
					</select> 
				</td>
				<th>구분</th>
				<td>
					<select name="pay_type">
						<option value="월세">월세</option>
						<option value="전세">전세</option> 
					</select>
				</td>
			</tr>
			<tr>
				<th>호실</th>
				<td><input type="text" name="rno" placeholder="숫자만 입력" class="numberOnly"></td>
				<th>이름</th>
				<td><input type="text" name="tenant" value=""></td>
				<th>연락처</th>
				<td><input type="text" name="phone" placeholder="010-1234-1234" value=""></td>
			</tr>
			<tr>
				<th>입주일</th>
				<td><input type="date" name="check_in" placeholder="2019-05-05" value=""></td>
				<th>퇴실일</th>
				<td><input type="date" name="check_out" placeholder="2019-05-05" value=""></td>
				<th>보증금</th>
				<td><input type="text" name="deposit" placeholder="500" class="numberOnly">만원</td>
			</tr>
			<tr>
				<th>월세</th>
				<td><input type="text" name="monthly_rent" placeholder="35" class="numberOnly">만원</td>
				<th>PW</th>
				<td><input type="text" name="rpw" value=""></td>
				<th>희망금액</th>
				<td><input type="text" name="hope_price" placeholder="300/30" value="">만원</td>
			</tr>
			<tr>
				<th>계약금</th>
				<td><input type="text" name="downpayment" placeholder="10">만원</td>
				<th>중개인</th>
				<td><input type="text" name="company"></td>
				<th>중개인<br>연락처</th>
				<td><input type="text" name="company_call"></td>
			</tr>
			<tr>
				<th>판매유형</th>
				<td>
					<select name="selling_type">
						<option value="월세">월세</option>
						<option value="전세">전세</option>
						<option value="월세, 전세">월세, 전세</option>
					</select>
				</td>
				<th>수리내역</th>
				<td colspan="3"><textarea name="repair"></textarea></td>
			</tr>
		</table>
		<div class="popup_roomRegister_btn_wrap">
			<p>저장</p>
			<p>삭제</p>
		</div>
	</div><!-- popup_roomRegister end -->
	
	<div class="popup_roomUpdateComplete popup_content">
		<h2>방정보 수정<input type="hidden" name="no" value=""><img src="${pageContext.request.contextPath}/resources/images/icon_x.png" title="닫기"></h2>
		<table>
			<tr>
				<th>상태</th>
				<td>
					<select name="state">
						<option value="입주완료">입주완료</option>
						<option value="공실">공실</option>
						<option value="계약완료">계약완료</option>
					</select> 
				</td>
				<th>호실</th>
				<td><input type="text" name="rno" placeholder="101"  class="numberOnly"></td>
				<th>타입</th>
				<td>
					<select name="room_type">
						<option value="one">원룸</option>
						<option value="mitwo">미니투룸</option>
						<option value="two">투룸</option>
						<option value="three">쓰리룸</option>
						<option value="store">상가</option>
						<option value="owner">주인세대</option>
					</select> 
				</td>
				<th>구분</th>
				<td>
					<select name="pay_type">
						<option value="월세">월세</option>
						<option value="전세">전세</option> 
					</select>
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="tenant" value=""></td>
				<th>연락처</th>
				<td><input type="text" name="phone" placeholder="010-1234-1234" value=""></td>
				<th>월세</th>
				<td><input type="text" name="monthly_rent" placeholder="30" value="0" class="numberOnly">만원</td>
				<th>보증금</th>
				<td><input type="text" name="deposit" placeholder="300" value="0" class="numberOnly">만원</td>
			</tr>
			<tr>
				<th>입주일</th>
				<td colspan="2"><input type="date" name="check_in" placeholder="2019-05-05"></td>
				<th>퇴실일</th>
				<td colspan="2"><input type="date" name="check_out" placeholder="2019-05-05"></td>
			</tr>
		</table>
		<div class="popup_roomUpdate_btn_wrap">
			<p>저장</p>
			<p>삭제</p>
		</div>
	</div><!-- popup_roomUpdate end -->
	
	<div class="popup_roomUpdateEmpty popup_content">
		<h2>방정보 수정<input type="hidden" name="no" value=""><img src="${pageContext.request.contextPath}/resources/images/icon_x.png" title="닫기"></h2>
		<table>
			<tr>
				<th>상태</th>
				<td>
					<select name="state">
						<option value="공실">공실</option>
						<option value="입주완료">입주완료</option>
						<option value="계약완료">계약완료</option>
					</select> 
				</td>
				<th>타입</th>
				<td>
					<select name="room_type">
						<option value="one">원룸</option>
						<option value="mitwo">미니투룸</option>
						<option value="two">투룸</option>
						<option value="three">쓰리룸</option>
						<option value="store">상가</option>
						<option value="owner">주인세대</option>
					</select> 
				</td>
				<th>호실</th>
				<td><input type="text" name="rno" placeholder="101"  class="numberOnly"></td>
			</tr>
			<tr>
				<th>PW</th>
				<td><input type="text" name="rpw" value=""></td>
				<th>희망금액</th>
				<td><input type="text" name="hope_price" placeholder="300/30" value="">만원</td>
				<th>판매유형</th>
				<td>
					<select name="selling_type">
						<option value="월세">월세</option>
						<option value="전세">전세</option>
						<option value="월세, 전세">월세, 전세</option>
					</select>
				</td>
			</tr>
		</table>
		<div class="popup_roomUpdate_btn_wrap">
			<p>저장</p>
			<p>삭제</p>
		</div>
	</div><!-- popup_roomUpdate end -->
	
	<div class="popup_roomUpdateContractComp popup_content">
		<h2>방정보 수정<input type="hidden" name="no" value=""><img src="${pageContext.request.contextPath}/resources/images/icon_x.png" title="닫기"></h2>
		<table>
			<tr>
				<th>상태</th>
				<td>
					<select name="state">
						<option value="공실">공실</option>
						<option value="입주완료">입주완료</option>
						<option value="계약완료">계약완료</option>
					</select> 
				</td>
				<th>호실</th>
				<td><input type="text" name="rno" placeholder="101"  class="numberOnly"></td>
				<th>타입</th>
				<td>
					<select name="room_type">
						<option value="one">원룸</option>
						<option value="mitwo">미니투룸</option>
						<option value="two">투룸</option>
						<option value="three">쓰리룸</option>
						<option value="store">상가</option>
						<option value="owner">주인세대</option>
					</select> 
				</td>
				
			</tr>
			<tr>
				<th>구분</th>
				<td>
					<select name="pay_type">
						<option value="월세">월세</option>
						<option value="전세">전세</option>
					</select>
				</td>
				
				<th>입주일</th>
				<td><input type="date" name="check_in" placeholder="2019-05-05"></td>
				<th>퇴실일</th>
				<td><input type="date" name="check_out" placeholder="2019-05-05"></td>
			</tr>
			<tr>
				<th>보증금</th>
				<td><input type="text" name="deposit" placeholder="300" value="0" class="numberOnly">만원</td>
				<th>월세</th>
				<td><input type="text" name="monthly_rent" placeholder="30" value="0" class="numberOnly">만원</td>
				<th>계약금</th>
				<td><input type="text" name="downpayment" class="numberOnly">만원</td>
			</tr>
			<tr>
				<th>중개인</th>
				<td><input type="text" name="company"></td>
				<th>중개인<br>연락처</th>
				<td><input type="text" name="company_call"></td>
			</tr>
		</table>
		<div class="popup_roomUpdate_btn_wrap">
			<p>저장</p>
			<p>삭제</p>
		</div>
	</div><!-- popup_roomUpdate end -->
	