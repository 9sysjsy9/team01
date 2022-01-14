<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%-- ${list} --%>
<div class="row gx-4 gx-lg-5 align-items-center my-5"
	style="text-align: center;">
	<div class="col-lg-5">
		<h1 class="font-weight-light" style="margin-left: 50px;">${userData.user_name} 님의 주문목록</h1>
	</div>
</div>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-10">
			<div id="page-content-wrapper">
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<table class="table" border="1">
							<tbody>
								<tr>
									<th>주문번호</th>
									<th>상품번호</th>
									<th>주문날짜</th>
									<th>상품가격</th>
								</tr>
								<c:if test="${list != null}">
									<c:forEach items="${list}" var="orderProductVo">
										<tr>
											<td>${orderProductVo.order_code}</td>
											<td>${orderProductVo.order_shoescode}</td>
											<td>${orderProductVo.order_regdate}</td>
											<td>${orderProductVo.shoes_price}</td>
										</tr>
									</c:forEach>
								</c:if>
							</tbody>
						</table>
					</div>
					<div class="col-md-2"></div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>





