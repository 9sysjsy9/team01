<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

<script>
$(function() {
	//조회 버튼을 눌렀을때
	$("#btnCheckOrderCode").click(function() {
		var order_code = $("input[name=order_code]").val();
		console.log(order_code);
		var url = "/customer/checkOrderCode";
		
		var sData = {
				"order_code" : order_code
		};
		
		$.post(url, sData, function(rData){
			console.log(rData);
			if(rData == "1"){
				$("#spanMsg").html("등록된 주문 번호 입니다.")
				
				
				
								
				
			} else {
				$("#spanMsg").html("등록되지 않은 주문 번호 입니다.")
			}
			
		});
	});
	
// 	//문의하기 버튼 눌렀을때
// 	$("#askCsBtn").click(function(e){
// 		//전송할 데이터
// 		//주문번호, 문의카테고리, 문의내용, 문의제목
// 		var ask_title = $("#title").val(); //제목
// 		var ask_content = $("#content").val(); //내용
// 		var ask_cate = $("#cs_cate").val(); //카테고리
// 		var order_code = $("#checkOrderNum").attr("data-orderNum");
		
// 		var url = "/user/askRegistRun";
		
// 		var sData = {
// 				"ask_title" : ask_title,
// 				"ask_content" : ask_content,
// 				"ask_cate" : ask_cate,
// 				"order_code" : order_code,
				
// 		};//JSON 키:값 (값을 어떤이름(키) 로 보낼거냐)
		
// 		$.post(url, sData, function(rData){
// 			console.log(rData);
// 		});
		
// 	});
	
});
</script>

<div class="jumbotron" style="padding: 10px;"><br>
	<h1 style="padding-left: 110px;"><b>CS 접수 센터</b></h1>
	<h5 style="padding-left: 110px;">서비스 접수 전 아래 항목을 정확히 입력해주세요.</h5>
</div>

<div class="container-fluid" style="padding-left: 110px;">
	<div class="row">


		<div class="col-md-12">
			<form role="form" action="/customer/insertCsReceive" method="post">

			<table>
			
			<tr>
				<td>
					<label for="order_code">주문번호</label>

				</td>
				<td>
					<input type="text" id="order_code" name="order_code" />
					<button type="button" class="btn btn-sm btn-primary my-2 my-sm-0" id="btnCheckOrderCode" data-cs_num="#"> 조회</button>
					<span id="spanMsg"></span>
				</td>
			</tr>
			
			<tr>
				<td>
					<label for="cate">접수 유형</label>
				</td>
				<td>
					<select name="cate" id="cate">
						<option value="교환">교환</option>
						<option value="반품">반품</option>
						<option value="환불">환불</option>
						<option value="기타">기타</option>
					</select>
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
		<div style="padding-left: 70px;">
							<button type="submit" class="btn btn-primary" id="askCsBtn">문의하기</button>
							<a class="btn btn-primary" id="askCsBtn" href="/customer/csCheck">CS 접수 확인</a>
			</div>
			</form>
		</div>

	</div>
	<!-- class="container-fluid -->
</div>
<!-- class="container-fluid -->

<%@ include file="/WEB-INF/views/include/footer.jsp"%>