<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%-- ${list} --%>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="jumbotron" style="padding: 10px;">
				<br>
				<h1 style="padding-left: 110px;">
					<b>나의 주문 확인</b>
					<h5 style="padding-left: 110px">현재 서비스 진행중인 내용을 확인하세요.</h5>

				</h1>
				<br>
				<p></p>
				<br>
				<div class="container-fluid"
					style="padding-left: 110px; padding-right: 200px;">
					<div class="row">
						<div class="col-md-12">
							<table class="table">
								<thead>
									<tr>
										<td><b>주문번호</b></td>
										<td><b>상품번호</b></td>
										<td><b>상품이름</b></td>
										<td><b>상품가격</b></td>
										<td><b>주문날짜</b></td>
										<td><b>진행상황</b></td>
									</tr>
								</thead>
								<tbody>
									<c:if test="${list != null}">
										<c:forEach items="${list}" var="orderProductVo">
											<tr>
												<td>${orderProductVo.order_code}</td>
												<td>${orderProductVo.order_shoescode}</td>
												<td>${orderProductVo.shoes_name}</td>
												<td>$ ${orderProductVo.shoes_price}</td>
												<td>${orderProductVo.order_regdate}</td>
											</tr>
										</c:forEach>
									</c:if>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<br>
				<div>
					<p style="padding-left: 110px;">
						<a class="btn btn-primary btn-large" href="/product/product_index">다른
							제품 쇼핑하기</a>
					</p>
				</div>

			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>





