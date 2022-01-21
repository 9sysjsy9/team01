<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/WEB-INF/views/include/header.jsp"%>

<script>
$(function() {
	//조회 버튼을 눌렀을때
// 	$("#checkOrderNum").click(
// 			function() {
// 				var order_code = $("input[name=order_code]").val();

// 				var url = "/user/checkOrderNum";

// 				var sData = {
// 					"order_code" : order_code
// 				};

// 				$.post(url, sData, function(rData) {

// 					if (rData.user_id != null) {
// 						//조회 상태 표시
// // 						$("#spanMsg").text(
// // 								rData.user_id + "/" + rData.order_regdate
// // 										+ "/" + rData.order_shoescode);
// 						//주문 번호 데이터 저장
// // 						$("#checkOrderNum").attr("data-orderNum",
// // 								order_code);
// 						//휴대전화, 이메일 표시
// 						$("#phone").val(rData.user_phone);
// 						$("#email").val(rData.user_email);

// 						console.log(rData);

// 					} else {
// 						$("#spanMsg").text("주문 번호를 확인해 주세요");
// 						$("#phone").val("");
// 						$("#email").val("");
// 					}

// 				});
// 			});

// 	//문의하기 버튼 눌렀을때
// 	$("#askCsBtn").click(function(e) {
// 		//전송할 데이터
// 		//주문번호, 문의카테고리, 문의내용, 문의제목
// 		var ask_title = $("#title").val(); //제목
// 		var ask_content = $("#content").val(); //내용
// 		var ask_cate = $("#cs_cate").val(); //카테고리
// 		var order_code = $("#checkOrderNum").attr("data-orderNum");

// 		var url = "/user/askRegistRun";

// 		var sData = {
// 			"ask_title" : ask_title,
// 			"ask_content" : ask_content,
// 			"ask_cate" : ask_cate,
// 			"order_code" : order_code,

// 		};//JSON 키:값 (값을 어떤이름(키) 로 보낼거냐)

// 		$.post(url, sData, function(rData) {
// 			console.log(rData);
// 		});

// 	});
	
	
// 	비밀번호 인증 버튼 눌렀을때
	$("#btnPwChk").click(function() {
		var pw = $("#pw").val();
		console.log("pw:" + pw);
		var url = "/user/pwChk";
		var sData = {"pw" : pw};
		$.post(url, sData, function(rData) {
			console.log(rData);
			if (rData == "" || rData == "null") {
				alert("비밀번호 불일치");
				return;
			} else {
				$("#user_name").val(rData.user_name);
				$("#user_pw").val(rData.user_pw);
				$("#chkuser_pw").val(rData.user_pw);
				$("#user_addr").val(rData.user_addr);
				$("#user_email").val(rData.user_email);
				var nums = rData.user_phone.split("-");
				$("#phone1").val(nums[0]);
				$("#phone2").val(nums[1]);
				$("#phone3").val(nums[2]);
				
				$("#divForm").slideDown(1000);
				$("#divPwChk").slideUp(1000);
			}
		});
		
	});
	
// 	수정완료 버튼 눌렀을때
	$("#userModifyRunBtn").click(function(e) {
		e.preventDefault();
		var phone1 = $("#phone1").val();
		var phone2 = $("#phone2").val();
		var phone3 = $("#phone3").val();
		var user_phone = phone1 + "-" + phone2 + "-" + phone3;
		console.log(user_phone);
		$("#user_phone").val(user_phone);
 		
		$("#updateForm").submit();
// 		var input_form = "<input type='hidden' name='user_phone' value='" + user_phone + "'>";
// 		$("#updateForm").prepend(input_form);
// 		return false;
	});

});
</script>



<div class="jumbotron" style="padding: 10px;">
	<br>
	<h1 style="padding-left: 110px;">
		<b>나의 정보</b>
	</h1>
	
	<h5 style="padding-left: 110px;">나의 정보를 입력 및 변경 할 수 있습니다.</h5>
	
</div>

<div class="container-fluid" style="padding-left: 110px;">
	<div class="row">

		
		<div class="col-md-12" id="divPwChk">
			<table>
				<tr>
					<td colspan="2">
						<h6 style="padding-left: 10px; font-size: 17px; color: #5800fd;">※
						회원님의 정보보호를 위해 비밀번호를 다시 한번 입력해주세요. ※</h6>
					</td>
				</tr>
				<tr>
					<td style="text-align: center">
						<label for="exampleInputEmail1">아이디</label></td>
					<td>${sessionScope.userData.user_id}</td>
				</tr>
				<tr>
					<td style="text-align: center"> 
						<label for="title">기존비밀번호</label></td>
					<td>
						<input type="password" size="12" id="pw">
						<input type="button" id="btnPwChk" class="btn btn-sm btn-primary my-2 my-sm-0" 
 								value="비밀번호 인증">
					</td>
								
				</tr>
			</table>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12" id="divForm" style="display:none;">
			<form id="updateForm" method="post" action="/user/changeUserInfo">
   				<input type="hidden" name="user_id" value="${sessionScope.userData.user_id}">
   				<input type="hidden" name="user_phone" id="user_phone">
		      <table style="padding: 5px 0 5px 0;">
		         <tbody><tr height="2" bgcolor="#FFC8C3">
		            <td colspan="2"></td>
		         </tr>
		
		      	<tr>
		            <th>아이디</th>
		            <td>${sessionScope.userData.user_id }</td>
		         </tr>
		         <tr>
		            <th>이름</th>
		            <td><input type="text" name="user_name" id="user_name"></td>
		         </tr>
		         
		         <tr>
		            <th>비밀번호</th>
		            <td><input type="password" name="user_pw" id="user_pw">
		            	<b><span style="font-size: 14px; color: #5800fd;"> 영문/숫자포함 6자 이상</span></b></td>
		         </tr>
		         
		         <tr>
		            <th>비밀번호 확인</th>
		            <td><input type="password" name="chkuser_pw" id="chkuser_pw"></td>
		         </tr>
		         
		          <tr>
		            <th>주소</th>
		            <td><input type="text" name="user_addr" id="user_addr" style="width:550px;"></td>
		         </tr>
		
		         <tr>
		            <th>이메일</th>
		            <td><input type="text" name="user_email" id="user_email">
		 			</td>
		         </tr>
		
		         <tr>
		            <th>핸드폰 번호</th>
		            <td><input type="text" id="phone1" maxlength="3" style="width:50px;"> 
		         	   - <input type="text" id="phone2" maxlength="4" style="width:60px;"> 
		               - <input type="text" id="phone3" maxlength="4" style="width:60px;"></td>
		         </tr>
		         
		
		         <tr height="2" bgcolor="#FFC8C3">
		            <td colspan="2"></td>
		         </tr>
		         <tr>
		            <td colspan="2" align="center"><br> 
		            
		            	<button type="button" class="btn btn-warning" id="userModifyRunBtn">수정 완료</button>
		            	<a type="reset" class="btn btn-secondary" href="/">수정 취소</a>
		           	</td>
		         </tr>
		      </tbody></table>
		   </form>
		</div>
	</div>
	
		

	
	<!-- class="container-fluid -->
</div>
<!-- class="container-fluid -->

<%@ include file="/WEB-INF/views/include/footer.jsp"%>