<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<div id="gnb">
	<div class="text-right">
		<c:choose>
			<c:when test="${login.userid != null}">
				<span class="glyphicon glyphicon-heart-empty" style="color: white;"
					aria-hidden="true"></span>
				<span id="login_log" style="border-bottom: 1px solid white;">${login.userid}
					님, 환영합니다.</span>
				<span class="glyphicon glyphicon-heart-empty" style="color: white;"
					aria-hidden="true"></span>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<c:if test="${login.userid == 'admin'}">
					<button id="go_to_adminPage">관리자 페이지</button>
				</c:if>
				<button id="mycart_btn">장바구니</button>
				<button id="mypage_btn">마이페이지</button>
				<button id="logout_btn">로그아웃</button>
				<input type="hidden" value="${login.userid}" id="login_userid">
			</c:when>

			<c:otherwise>
				<button onclick="location.href='/member/login'">로그인</button>
				<button onclick="location.href='/member/insert'">회원가입</button>
			</c:otherwise>
		</c:choose>

	</div>
</div>
<br>
<div class="container">
	<form action="/order/orderResult" method="post">
		<c:set value="${productInfo}" var="dto" />
		<c:set value="2500" var="del_fee" />
		<div class="row qnas" style="text-align: center;">
			<h1 class="page-header">주문하기</h1>
			<table class="table table-hover"
				style="width: 70%; margin: auto; border-bottom: 1px solid #D5D5D5;">
				<thead>
					<tr>
						<th style="text-align: center;"></th>
						<th>상품명</th>
						<th>가격</th>
						<th>수량</th>
					</tr>
				</thead>
				<tbody>
				<c:if test="${list != null}">
				<c:forEach items="${list}" var="userBasketVo">
					<tr>
						<td><img alt="thumbnail"
							src="/upload/displayThumbnailImage?fileName=${userBasketVo.shoes_image}" width="40%"> 
							<input type="hidden" value="${dto.productId}" name="productId" id="productId">
						</td>
						<td>${userBasketVo.shoes_name}</td>
						<td>${userBasketVo.shoes_price}원</td>
						<td>${userBasketVo.order_count}</td>
					</tr>
				</c:forEach>
				</c:if>
				</tbody>
			</table>
		</div>

		<div class="row" style="text-align: center; margin: 80px 0;">
			<c:set value="${memberInfo}" var="vo" />
			<h1 class="page-header">주문정보 확인</h1>
			<h4 style="color: red;">주문자 정보와 배송지가 다른 경우 직접 입력해주세요.</h4>
		</div>
		<div class="row">
			<div class="form-horizontal">
				<div class="form-group">
					<label for="inputId" class="col-sm-2 control-label">ID</label>
					<div class="col-sm-10">
						<input class="form-control" id="inputId" placeholder="ID"
							name="userid" value="${vo.userid}" readonly>
					</div>
				</div>

				<div class="form-group">
					<label for="inputName" class="col-sm-2 control-label">Name</label>
					<div class="col-sm-10">
						<input class="form-control" id="inputName" placeholder="Name"
							name="username" value="${vo.username}">
					</div>
				</div>
				<div class="form-group">
					<label for="inputAdd" class="col-sm-2 control-label">Address</label>
					<div class="col-sm-10">
						<input type="text" id="postcode" name="postcode"
							value="${vo.postcode}">&nbsp; <input type="button"
							class="btn btn-default btn-sm" id="searchAdd" value="우편번호 찾기"><br>
						<input class="form-control" type="text" id="roadAddress"
							name="useraddress" value="${vo.useraddress}"> <input
							class="form-control" type="text" id="detailAddress"
							name="detailAddress" placeholder="상세주소">
					</div>
				</div>
				<div class="form-group">
					<label for="inputEmail" class="col-sm-2 control-label">Email</label>
					<div class="col-sm-10">
						<input type="email" class="form-control" id="inputEmail"
							placeholder="Email" name="email" value="${vo.email}">
					</div>
				</div>
				<div class="form-group">
					<label for="inputTel" class="col-sm-2 control-label">Tel</label>
					<div class="col-sm-10">
						<input type="tel" class="form-control" id="inputTel"
							placeholder="Tel" name="tel" value="${vo.tel}">
					</div>
				</div>
				<div class="form-group">
					<label for="inputTel" class="col-sm-2 control-label">배송
						메세지</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="deliver_msg"
							placeholder="배송 메세지" name="deliver_msg">
					</div>
				</div>
			</div>
		</div>
		<!-- class=row -->

		<div class="row" style="text-align: center; margin: 80px 0;">
			<h1 class="page-header">결제수단 확인</h1>
			<div style="text-align:center;">
				<input type="radio" name="cal_info" value="transfer"><label
					style="margin-right: 50px;">&nbsp;계좌이체</label> <input type="radio"
					name="cal_info" value="no_bankingBook"><label
					style="margin-right: 50px;">&nbsp;무통장 입금</label> <input
					type="radio" name="cal_info" value="tel_billing"><label
					style="margin-right: 50px;">&nbsp;핸드폰 결제</label> <input
					type="radio" name="cal_info" value="card"><label>&nbsp;카드
					결제</label>
			</div>
			<hr>
			<div class="row" style="text-align: center; margin: 50px 0;">
				<label>상품가격 :&nbsp; <span id="price"></span>&nbsp;원
				</label> <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
				<label>배송비 :&nbsp;<span id="del_fee"></span>&nbsp;원
				</label> <span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span>
				<label style="font-size: 1.5em;">총 결제금액 : <span
					id="totalprice"></span>&nbsp;원 <input type="hidden" id="amount"
					name="totalAmount">
				</label>
			</div>
			<div>
				<button class="btn btn-default cal-btn" type="submit">결제하기</button>
				<button class="btn btn-default back_btn">돌아가기</button>
			</div>
		</div>
	</form>
</div>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>