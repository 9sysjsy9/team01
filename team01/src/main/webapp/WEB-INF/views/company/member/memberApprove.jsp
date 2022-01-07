<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%@ include file="/WEB-INF/views/company/include/header.jsp"%>

<!-- Product section-->
<section class="py-5">

	<div class="container px-4 px-lg-5 my-5">
		<div class="row gx-4 gx-lg-5 align-items-center">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<!-- 게시판 이름 -->
						<h1 class="display-5 fw-bolder" id="store">가입 승인</h1>
					</div>
					<div class="col-md-2"></div>

				</div>
				<div class="row">
					<div class="col-md-2"></div>

					<div class="col-md-8">
						<select>
							<option value="" selected>5줄 보기</option>
							<option value="">10줄 보기</option>
							<option value="">15줄 보기</option>
						</select>

						<table class="table table-hover">
							<thead>
								<tr>
									<th>사번</th>
									<th>아이디</th>
									<th>이름</th>
									<th>성별</th>
									<th>이메일</th>
									<th>직급</th>
									<th>부서</th>
									<th>권한</th>
									<th>가입일</th>
									<th>승인</th>
								</tr>
							</thead>
							<tbody>
								<tr class="table">
									<td class="eno">1</td>
									<td class="userid">testid04</td>
									<td class="username">홍길동</td>
									<td class="gender">m</td>
									<td class="email">test01@test01.com</td>
									<td>
										<select>
											<option>사원</option>
											<option>대리</option>
											<option>차장</option>
										</select>
									</td>
									<td>
										<select>
											<option>영업</option>
											<option>인사</option>
											<option>감사</option>
											<option>품질관리</option>
										</select>
									</td>
									<td>
										<select>
											<option>일반</option>
											<option>관리</option>
											<option>전체</option>
										</select>
									</td>
									<td>2021/01/07</td>
									<td>
										<button type="button" class="btn btn-outline-primary flex-shrink-0">승인</button>
										<button type="button" class="btn btn-outline-primary flex-shrink-0">거절</button>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="col-md-2"></div>
				</div>

				<div class="row">
					<div class="col-md-12">
						<nav class="pagination-sm">
							<ul class="pagination">
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