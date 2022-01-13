<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/WEB-INF/views/include/header.jsp"%>

<script>
$(function() {
	//조회 버튼을 눌렀을때
	$("#checkOrderNum").click(function() {
		var order_code = $("input[name=order_code]").val();
		
		var url = "/user/checkOrderNum";
		
		var sData = {
				"order_code" : order_code
		};
		
		$.post(url, sData, function(rData){
			
			if(rData.user_id != null){
				//조회 상태 표시
				$("#spanMsg").text(rData.user_id + "/" + rData.order_regdate  + "/" + rData.order_shoescode);
				//주문 번호 데이터 저장
				$("#checkOrderNum").attr("data-orderNum",order_code);
				//휴대전화, 이메일 표시
				$("#phone").val(rData.user_phone);
				$("#email").val(rData.user_email);
								
				console.log(rData);
				
			} else {
				$("#spanMsg").text("주문 번호를 확인해 주세요");
				$("#phone").val("");
				$("#email").val("");
			}
			
		});
	});
	
	//문의하기 버튼 눌렀을때
	$("#askCsBtn").click(function(e){
		//전송할 데이터
		//주문번호, 문의카테고리, 문의내용, 문의제목
		var ask_title = $("#title").val(); //제목
		var ask_content = $("#content").val(); //내용
		var ask_cate = $("#cs_cate").val(); //카테고리
		var order_code = $("#checkOrderNum").attr("data-orderNum");
		
		var url = "/user/askRegistRun";
		
		var sData = {
				"ask_title" : ask_title,
				"ask_content" : ask_content,
				"ask_cate" : ask_cate,
				"order_code" : order_code,
				
		};//JSON 키:값 (값을 어떤이름(키) 로 보낼거냐)
		
		$.post(url, sData, function(rData){
			console.log(rData);
		});
		
	});
	
});
</script>

<div class="container-fluid">
	<div class="row">


		<div class="col-md-12">
			<form role="form">

			<table>
			<tr>
				<td>
					<label for="exampleInputEmail1">접수 유형</label>
				</td>
				<td>
					<select name="cs_cate" id="cs_cate">
						<option value="0">항목 선택</option>
						<option value="교환">교환</option>
						<option value="반품">반품</option>
						<option value="환불">환불</option>
						<option value="기타">기타</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>
					<label for="checkOrderNum">주문 번호</label>

				</td>
				<td>
					<input type="text" id="order_code" name="order_code" />
					<button type="button" class="btn btn-sm btn-primary my-2 my-sm-0" id="checkOrderNum" data-orderNum="#"> 조회</button>
					<span id="spanMsg"></span>
				</td>
			</tr>
			
			<tr>
				<td>
					<label for="phone">휴대 전화</label>
				</td>
				<td>
					<input type="text" id="phone" name="phone" readonly/>
				</td>
			</tr>
			
			<tr>
				<td>
					<label for="email">이메일</label>
				</td>
				<td>
					<input type="email" id="email" name="email" readonly/>
				</td>
			</tr>
			
			<tr>
				<td>
					<label for="title">제목</label>
				</td>
				<td>
					<input type="text" id="title" name="title"/>
				</td>
			</tr>
			
			<tr>
				<td>
					<label for="content">문의 내용</label>
				</td>
				<td>
					<textarea rows="6" cols="30" id="content" name="content"></textarea>
				</td>
			</tr>

<!-- 			<tr> -->
<!-- 				<td> -->
<!-- 				 <label for="exampleInputEmail1">사진 첨부</label> -->
<!-- 				</td> -->
<!-- 				<td> -->
<!-- 					<input type="file" class="form-control-file" id="exampleInputFile" /> -->
<!-- 				</td> -->
<!-- 			</tr> -->
			
		</table>
							<button type="submit" class="btn btn-primary" id="askCsBtn">문의하기</button>
			</form>
		</div>

	</div>
	<!-- class="container-fluid -->
</div>
<!-- class="container-fluid -->

<%@ include file="/WEB-INF/views/include/footer.jsp"%>