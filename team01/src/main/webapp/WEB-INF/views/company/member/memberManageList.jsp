<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/WEB-INF/views/company/include/header.jsp"%>

<script>

if("${msg}" == "approve"){
	alert("사용 승인 되었습니다.")
}

$(function(){

});
</script>

<!-- Product section-->
<section class="py-5">

	<div class="container px-4 px-lg-5 my-5">
		<div class="row gx-4 gx-lg-5 align-items-center">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<!-- 게시판 이름 -->
						<h1 class="display-5 fw-bolder" id="store">사원 관리</h1>
						<br>
					</div>
					<div class="col-md-2"></div>

				</div>
				<div class="row">
					<div class="col-md-2"></div>

					<div class="col-md-8">

						<table class="table table-hover">
							<thead>
								<tr>
									<th>사번</th>
									<th>이름</th>
									<th>성별</th>
									<th>직급</th>
									<th>부서</th>
									<th>권한</th>
									<th>가입일</th>
									<th>상태</th>
									<th>관리</th>
								</tr>
							</thead>
							<tbody>
							
							 
							<c:forEach items="${memberManageList}" var="list">
							
							<tr>
									<td>${list.eno}</td>
									<td>${list.username}</td>
									<td>${list.gender}</td>
									<td>${list.position}</td>
									<td>${list.department}</td>
									<td>${list.authority}</td>
									<td>${list.regdate}</td>
									
									<td>
										상태
									</td>
									
									<td>
										<button type="submit" data-eno="${list.eno}" class="approveBtn btn btn-outline-dark flex-shrink-0 btn-sm" >관리</button>
									</td>
								</tr>
								
							</c:forEach>
							
							
							
							
							
								
							</tbody>
						</table>
					</div>
					<div class="col-md-2"></div>
				</div>

				<div class="row">
					<div class="col-md-12">
						<nav class="pagination-sm">
							<ul class="pagination justify-content-center">
								<li class="page-item"><a class="page-link" href="#">Previous</a>
								</li>
								<li class="page-item"><a class="page-link" href="#">1</a></li>
								<li class="page-item"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								<li class="page-item"><a class="page-link" href="#">4</a></li>
								<li class="page-item"><a class="page-link" href="#">5</a></li>
								<li class="page-item"><a class="page-link" href="#">Next</a>
								</li>
							</ul>
						</nav>
					</div>
				</div>

			</div>
		</div>
	</div>
</section>


<%@ include file="/WEB-INF/views/include/footer.jsp"%>