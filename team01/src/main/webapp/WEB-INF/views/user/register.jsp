<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>

<style>
body { 
   margin: 0 auto; 
   width: 800px; 
} 

#wrapper { 
width: 200px; 
margin: 0 auto; 
border: 1px solid #000; 
} 
</style>

<script>
$(function() {
	$("#btnCheck").on("click", function() {
		var user_id = $(this).prev().val();
		console.log("user_id: "+user_id);
		
	});
	
	

});
/** 우편번호 찾기 */
function execDaumPostcode() {
   daum.postcode.load(function() {
      new daum.Postcode({
         oncomplete : function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            $("#postcode").val(data.zonecode);
            $("#address").val(data.roadAddress);
         }
      }).open();
   });
}
</script>

<html lang="en">
 <head>
  <meta charset="UTF-8">
 
  <title>회원 가입</title>
 </head>
 <body><br><br>
 <br>
   <br>
   <form name="write_form_member" method="post">
      <table width="940" style="padding: 5px 0 5px 0;">
         <tr height="2" bgcolor="#FFC8C3">
            <td colspan="2"></td>
         </tr>
         <h2>
            <b>수영슈즈 회원가입</b>
         </h2>
         <h6>- 아래 항목을 정확히 입력하세요.</h6>
         <br>
         <tr>
            <th>이름</th>
            <td><input type="text" name="mbname"></td>
         </tr>
         <tr>
            <th>아이디</th>
            <td><input type="text" name="cursor:pointer"> 
            <button id="btnCheck" class="btn btn-info m-btn--air"
            	>아이디 중복체크</button></td>
         </tr>
         <tr>
            <th>비밀번호</th>
            <td><input type="password" name="mbpw"> 영문/숫자포함 6자 이상</td>
         </tr>
         <tr>
            <th>비밀번호 확인</th>
            <td><input type="password" name="mbpw_re"></td>
         </tr>
         <tr>
            <th>비밀번호 힌트/답변</th>
            <td><select name='pwhint' size='1' class='select'>
                  <option value=''>선택하세요</option>
                  <option value='30'>졸업한 초등학교 이름은?</option>
                  <option value='31'>제일 친한 친구의 핸드폰 번호는?</option>
                  <option value='32'>아버지 성함은?</option>
                  <option value='33'>어머니 성함은?</option>
                  <option value='34'>어릴 적 내 별명은?</option>
                  <option value='35'>가장 아끼는 물건은?</option>
                  <option value='36'>좋아하는 동물은?</option>
                  <option value='37'>좋아하는 색깔은?</option>
                  <option value='38'>좋아하는 음식은?</option>
            </select>
         </tr>
         <tr>
            <th>답변</th>
            <td><input type='text' name='pwhintans'></td>
         </tr>
         <tr>
            <th>이메일</th>
            <td><input type='text' name="email">@ <input
               type='text' name="email_dns"> <select name="emailaddr">
                  <option value="">직접입력</option>
                  <option value="daum.net">daum.net</option>
                  <option value="empal.com">empal.com</option>
                  <option value="gmail.com">gmail.com</option>
                  <option value="hanmail.net">hanmail.net</option>
                  <option value="msn.com">msn.com</option>
                  <option value="naver.com">naver.com</option>
                  <option value="nate.com">nate.com</option>
            </select></td>
         </tr>
         <tr>
            <th rowspan="2">주소</th>
            <td>
               
                     <input type="text" name="postcode"
                        id="postcode" placeholder="우편번호" readonly />
                 
                     <button type="button" class="btn btn-info m-btn--air"
                        onclick="execDaumPostcode()">주소 찾기</button>
                  
                  
              </td>
             </tr>
          <tr>
               	
               <td>
                     <input type="text" 
                        name="address" id="address" placeholder="도로명 주소" readonly />
                  
                     <input type="text" 
                        name="detailAddress" placeholder="상세 주소" size="60" required />
                  </td>

            
         </tr>
         <tr>
            <th>전화번호</th>
            <td><input type="text" name="cel1"> 
            	- <input type="text" name="cel2_1" title="전화번호"> 
                - <input type="text" name="cel2_2"></td>
         </tr>
         <tr>
            <th>핸드폰 번호</th>
            <td><input type="text" name="tel_h1"> 
         	   - <input type="text" name="tel_h2_1"> 
               - <input type="text" name="tel_h2_2"></td>
         </tr>
         <tr>
            <th>직업</th>
            <td><select name='job' size='1'>
                  <option value=''>선택하세요</option>
                  <option value='39'>학생</option>
                  <option value='40'>컴퓨터/인터넷</option>
                  <option value='41'>언론</option>
                  <option value='42'>공무원</option>
                  <option value='43'>군인</option>
                  <option value='44'>서비스업</option>
                  <option value='45'>교육</option>
                  <option value='46'>금융/증권/보험업</option>
                  <option value='47'>유통업</option>
                  <option value='48'>예술</option>
                  <option value='49'>의료</option>
            </select></td>
         </tr>
         <tr>
            <th>메일/sns 정보 수신</th>
            <td class="s"><input type="radio" name="chk_mail" checked>
               수신 <input type="radio" name="chk_mail" value="4"> 수신거부</td>
         </tr>
         <tr>
            <th>관심분야</th>
            <td><input type='checkbox' name='interest[]' value='17'>
               운동화 <input type='checkbox' name='interest[]' value='18'> 구두
               <input type='checkbox' name='interest[]' value='19'> 로퍼 <input
               type='checkbox' name='interest[]' value='20'> 캐쥬얼 <input
               type='checkbox' name='interest[]' value='21'> 기능성 <input
               type='checkbox' name='interest[]' value='22'> 수제화</td>
         </tr>
         <tr>
            <th>가입경로</th>
            <td><select name='location' size='1'>
                  <option value=''>선택하세요</option>
                  <option value='23'>네이버검색</option>
                  <option value='24'>구글검색</option>
                  <option value='25'>기타검색엔진</option>
                  <option value='26'>카페or동호회를 통해</option>
                  <option value='27'>지인의소개</option>
                  <option value='28'>기타</option>
            </select></td>
         </tr>

         <tr>
            <th>정보공개여부</th>
            <td><select name='chk_open' size='0'>
                  <option value=''>선택하세요</option>
                  <option value='5'>모두공개</option>
                  <option value='6'>비공개</option>
            </select></td>
         </tr>

         <tr height="2" bgcolor="#FFC8C3">
            <td colspan="2"></td>
         </tr>
         <tr>
            <td colspan="2" align="center"><br> 
            	<input type="submit" class="btn btn-warning" value="회원 가입">
            	<input type="reset" class="btn btn-secondary" value="가입 취소"></td>
         </tr>
      </table>
   </form>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>

