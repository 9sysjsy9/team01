<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/company/include/header.jsp"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


${csList}
<!-- Product section-->
<section class="py-5">

	<div class="container px-4 px-lg-5 my-5">
		<div class="row gx-4 gx-lg-5 align-items-center">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<!-- 게시판 이름 -->
						<h1 class="display-5 fw-bolder" id="store">CS문의 관리</h1>
					</div>
					<div class="col-md-2"></div>

				</div>
				<div class="row">
					<div class="col-md-2"></div>

					<div class="col-md-8">


						<table class="table table-hover">
							<thead>
								<tr>
									<th>No</th>
									<th>카테고리</th>
									<th>문의자</th>
									<th>문의제목</th>
									<th>문의일시</th>
								</tr>
							</thead>
							
							<tbody>
							
							<c:forEach items="${csList}" var="list">
							
								<tr>
									<td>${list.ano}</td>
									<td>${list.ask_cate}</td>
									<td>홍길동</td>
									<td>제품이 이상합니다.</td>
									<td>2010/10/10</td>
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