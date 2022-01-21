<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<script>
$(function() {
	$("#checkOrderNum").click(function() {
		var order_code = $(this).prev().val();
		var url = "/orderProduct/getOrderCodeCount";
		var sData = {
				"order_code" : order_code
		};
		$.post(url, sData, function(rData) {
			console.log("rData: "+rData);
			if (rData > 0) {
				$("#spanMsg").text("주문코드 확인됨");
			} else {
				$("#spanMsg").text("주문코드가 존재하지 않습니다.");
			}
		});
		console.log("order_code: "+order_code);
	});
	
	$("#btnAsk").click(function() {
		$("#frmInsertOrderProduct").submit();
	});
	
});
</script>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<form id="frmInsertOrderProduct" method="post" action="/ask/ask_regist_run">
				<table class= "table">
					<tbody>
						<tr>
							<td><label for="ask_cate">접수 유형</label></td>
							<td><select name="ask_cate" id="ask_cate">
									<option value="0">항목 선택</option>
									<option value="교환">교환</option>
									<option value="반품">반품</option>
									<option value="환불">환불</option>
									<option value="기타">기타</option>
							</select></td>
						</tr>
						<tr>
							<td><label for="order_code">주문 번호</label></td>
							<td><input type="text" id="order_code" name="order_code"/>
								<button type="button"
									class="btn btn-sm btn-primary my-2 my-sm-0" id="checkOrderNum">
									조회</button> <span id="spanMsg"></span></td>
						</tr>

						<tr>
							<td><label for="user_id">아이디</label></td>
							<td><input type="text" id="user_id" name="user_id" readonly
								<c:if test="${!empty userData.user_id}">
						value="${userData.user_id}" 
						</c:if> readonly="readonly"/></td>
						</tr>

						<tr>
							<td><label for="ask_title">제목</label></td>
							<td><input type="text" id="ask_title" name="ask_title" /></td>
						</tr>

						<tr>
							<td><label for="ask_content">문의 내용</label></td>
							<td><textarea rows="6" cols="30" id="ask_content" name="ask_content"></textarea>
							</td>
						</tr>
					</tbody>
				</table>
				<button type="button" class="btn btn-primary" id="btnAsk">문의하기</button>
				<a type="submit" class="btn btn-primary" href="#">취소</a>
			</form>
		</div>

	</div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>