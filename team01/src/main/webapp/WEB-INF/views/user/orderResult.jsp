<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<style type="text/css">
#text_in_the_image {
	float: left;
	margin-top: 50px;
	margin-left: 130px;
	text-align: left;
}

#text_in_the_image h1 {
	font-size: 5em;
	font-family: 'Impact';
}

#text_in_the_image h3 {
	font-size: 3em;
	font-family: 'Copperplate';
}

#text_in_the_image p {
	font-size: 8em;
	font-family: 'Impact';
}

#text_in_the_image p span {
	text-align: center;
	font-family: 'Impact';
	color: red;
	text-shadow: 3px 4px 5px gray;
}

.products li {
	list-style: none;
}

.products li .scale {
	text-align: center;
	font-family: '나눔명조 Bold';
}

.nav li {
	cursor: pointer;
}
</style>
<br>
<br>
<br>

<div class="container">

	<c:set value="${orderDTO}" var="dto" />
	<div class="row" style="text-align: center;">
		<h1 class="page-header" style="margin-bottom: 50px;">주문이 완료되었습니다.</h1>
		<table class="table table-hover"
			style="margin: auto; border-bottom: 1px solid #D5D5D5;">
			<thead>
				<tr>
					<th colspan="2" style="text-align: center !important;">상품명</th>
					<th>가격</th>
					<th>수량</th>
					<th>옵션</th>
					<th>결제금액</th>
				</tr>
			</thead>
			<tbody style="text-align: left; vertical-align: middle;">
				<tr>
					<td style="text-align: center;"><img alt="thumbnail"
						src="/resources/upload${dto.fullname}" width="30%"> <input
						type="hidden" value="${dto.productId}" name="productId"
						id="productId"></td>
					<td>${dto.productName}<br>${dto.productInfo}</td>
					<td><fmt:formatNumber type="number" value="${dto.price}" />&nbsp;원</td>
					<td>${dto.order_Qty}</td>
					<td>${dto.selected_Opt}</td>
					<td><fmt:formatNumber type="number" value="${dto.totalAmount}" />&nbsp;원</td>
				</tr>
			</tbody>
		</table>
	</div>

	<hr>

	<div class="row" style="text-align: center;">

		<table class="table table-hover"
			style="margin: auto; border-bottom: 1px solid #D5D5D5;">
			<thead>
				<tr>
					<th>주문자</th>
					<th>배송지</th>
					<th>전화번호</th>
					<th>배송상태</th>
					<th>배송메세지</th>
				</tr>
			</thead>
			<tbody style="text-align: left;">
				<tr>
					<td>${dto.username}</td>
					<td>${dto.postcode}<br>${dto.useraddress}</td>
					<td>${dto.tel}</td>
					<td id="del_situ"></td>
					<td>${dto.deliver_msg}</td>
				</tr>
			</tbody>
		</table>
	</div>

	<div class="row" style="margin: 80px 0; text-align: center;">
		<button class="btn btn-default back_btn">쇼핑을 계속하기</button>
		<button class="btn btn-default mycart_btn">장바구니로 이동하기</button>
	</div>
</div>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>