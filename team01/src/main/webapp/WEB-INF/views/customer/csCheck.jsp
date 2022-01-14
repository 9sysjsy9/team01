<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="jumbotron" style="padding: 10px;">
				<br>
				<h1 style="padding-left: 110px;">
					<b>나의 주문 확인</b>
					<h5 style="padding-left:110px">현재 서비스 진행중인 내용을 확인하세요.</h5>

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
										<td><b>No</b></td>
										<td><b>항목</b></td>
										<td><b>주문번호</b></td>
										<td><b>진행상황</b></td>
									</tr>
								</thead>
								<tbody>
									<tr class="table-success">
										<td>1</td>
										<td>교환</td>
										<td>1234</td>
										<td>교환 진행 중</td>
									</tr>
									<tr class="table-warning">
										<td>2</td>
										<td>반품</td>
										<td>1235</td>
										<td>반품 완료</td>
									</tr>
									<tr class="table-danger">
										<td>3</td>
										<td>환불</td>
										<td>1236</td>
										<td>환불 완료</td>
									</tr>
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