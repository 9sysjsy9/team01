<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>


<style>
body { 
   margin: 0 auto; 
   width: 800px; 
} 

</style>

<script>
$(function() {
	
	
	$("#btnCheck").on("click", function() {
		var user_id = $(this).prev().val();
		console.log("user_id: "+user_id);
		
	});
	
	//회원가입 버튼 클릭
	$("#userRegistRunBtn").click(function(e){
		var user_id = $("#user_id").val();
		var user_pw = $("#user_pw").val();
		var user_name = $("#user_name").val();
		
		var user_phone = $("#phone1").val() + "-" + $("#phone2").val() + "-" +$("#phone3").val();
		
		var user_email = $("#user_email").val();
		var user_addr = $("#user_addr").val();
		
		console.log(user_id);
		console.log(user_pw);
		console.log(user_name);
		console.log(user_email);
		console.log(user_phone);
		console.log(user_addr);
		
		var url = "/user/userRegistRun";
		
		var sData = {
			"user_id" : user_id, 	
			"user_pw" : user_pw, 	
			"user_name" : user_name, 	
			"user_phone" : user_phone, 	
			"user_email" : user_email,
			"user_addr" : user_addr 	
		};
		
		$.post(url, sData, function(rData){
			console.log(rData);
			
			if(rData == "success"){
				alert("정상적으로 가입 되었습니다.");
				location.href = "/user/login";
			}
			
		});

	});
		
});

</script>

 <br>
   <br>
            <h2>
            <b>수영슈즈 회원가입</b>
         </h2>
         <h6>- 아래 항목을 정확히 입력하세요.</h6>
   <form name="write_form_member" method="post">
   
      <table style="padding: 5px 0 5px 0;">
         <tr height="2" bgcolor="#FFC8C3">
            <td colspan="2"></td>
         </tr>

      
         <tr>
            <th>이름</th>
            <td><input type="text" name="user_name" id="user_name"></td>
         </tr>
         <tr>
            <th>아이디</th>
            <td><input type="text" name="cursor:pointer" id="user_id"> 
            <button id="btnCheck" class="btn btn-info m-btn-air btn-sm"
            	>아이디 중복체크</button></td>
         </tr>
         <tr>
            <th>비밀번호</th>
            <td><input type="password" name="user_pw" id="user_pw"> 영문/숫자포함 6자 이상</td>
         </tr>
         
         <tr>
            <th>비밀번호 확인</th>
            <td><input type="password" name="chkuser_pw" id="chkuser_pw"></td>
         </tr>
         
          <tr>
            <th>주소</th>
            <td><input type="text" name="user_addr" id="user_addr"></td>
         </tr>

         <tr>
            <th>이메일</th>
            <td><input type='text' name="email" id="user_email">
 			</td>
         </tr>

         <tr>
            <th>핸드폰 번호</th>
            <td><input type="text" name="phone1" id="phone1" maxlength="3"> 
         	   - <input type="text" name="phone2" id="phone2" maxlength="4"> 
               - <input type="text" name="phone3" id="phone3" maxlength="4"></td>
         </tr>
         

         <tr height="2" bgcolor="#FFC8C3">
            <td colspan="2"></td>
         </tr>
         <tr>
            <td colspan="2" align="center"><br> 
            
            	<button type="button" class="btn btn-warning" id="userRegistRunBtn">회원 가입</button>
            	<button type="reset" class="btn btn-secondary" >가입 취소</button>
           	</td>
         </tr>
      </table>
   </form>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>

