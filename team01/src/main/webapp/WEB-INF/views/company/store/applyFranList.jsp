<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/company/include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Product section-->
<section class="py-5">
	<div class="container px-4 px-lg-5 my-5">
		<div class="row gx-4 gx-lg-5 align-items-center">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<h1 class="display-5 fw-bolder" id="store">가맹 문의 관리</h1>
						<br>
					</div>
					<div class="col-md-2"></div>



				</div>
				<div class="row">
					<div class="col-md-2"></div>

					<div class="col-md-8">
						<select>
							<option value="a" selected>전체</option>
							<option value="y">완료</option>
							<option value="n">미완료</option>
						</select>

						<table class="table table-hover">
							<thead>
								<tr>
									<th>문의번호</th>
									<th>이메일</th>
									<th>연락처</th>
									<th>문의 일시</th>
									<th>답변 여부</th>
									<th>완료 일시</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="list" items="${applyList}">
									<tr>
										<td>${list.fno}</td>
										<td>${list.email}</td>
										<td>${list.phone}</td>
										<td>${list.regDate}</td>
										<td>${list.replyState}</td>
										<td>${list.replyDate}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>

					</div>
					<div class="col-md-2"></div>
				</div>
			</div>
		</div>
	</div>
</section>


<%@ include file="/WEB-INF/views/include/footer.jsp"%>