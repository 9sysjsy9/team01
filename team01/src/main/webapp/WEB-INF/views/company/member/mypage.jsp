
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/WEB-INF/views/company/include/header.jsp"%>

<!-- Product section-->
<section class="py-5">
	<div class="container px-4 px-lg-5 my-5">
		<div class="row gx-4 gx-lg-5 align-items-center">
						<div class="row">
					<div class="col-md-2"></div>
		
			<div class="col-md-2 text-center">
				<img class="card-img-top mb-5 mb-md-0"
					src="https://dummyimage.com/600x700/dee2e6/6c757d.jpg" alt="..." />
				<br> <br>
				<button type="button"
					class="btn btn-outline-dark flex-shrink-0 btn-sm">회원 정보 수정</button>
				<br> <br>
				<button type="button"
					class="btn btn-outline-dark flex-shrink-0 btn-sm">내가 작성한 글</button>
			</div>
			<div class="col-md-6">
				<!--                         <div class="small mb-1">SKU: BST-498</div> -->
				<h1 class="display-5 fw-bolder">내 정보</h1>
				<!--                         <div class="fs-5 mb-5"> -->
				<!--                             <span class="text-decoration-line-through">$45.00</span> -->
				<!--                             <span>$40.00</span> -->
				<!--                         </div> -->
				<!--                         <p class="lead">Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium at dolorem quidem modi. Nam sequi consequatur obcaecati excepturi alias magni, accusamus eius blanditiis delectus ipsam minima ea iste laborum vero?</p> -->
				<br>
				<div class="col-md-12">
					<table class="table">
						<tr>
							<td>이름</td>
							<td>홍길동</td>
						</tr>
						
						<tr>
							<td>사번</td>
							<td>1006</td>

						</tr>
						
						<tr>
							<td>성별</td>
							<td>남자</td>

						</tr>
						
						<tr>
							<td>전화번호</td>
							<td>010-1234-5678</td>

						</tr>
						
						<tr>
							<td>직급</td>
							<td>사원</td>
						</tr>
						
						<tr>
							<td>부서</td>
							<td>영업부</td>
						</tr>
						
						<tr>
							<td>가입일</td>
							<td>2021/02/19</td>
						</tr>
						
						<tr>
							<td>자기소개</td>
							<td>안녕하시렵니까? 반가우시렵니까?</td>
						</tr>

					</table>
				</div>

			</div>
			<div class="col-md-2"></div>
		</div>
	</div>
	</div>
</section>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>