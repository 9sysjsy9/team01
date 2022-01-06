<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/company/include/header.jsp"%>
<style>
.btn btn-outline-dark btn-lg px-4 {
	padding: 10px, margin: 10px
}
</style>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function() {

	});
</script>
<%@include file="/WEB-INF/views/company/product/include/paging_form.jsp"%>
<!-- Page content-->
<div class="container">
	<div class="row">
		<!-- Blog entries-->
		<div class="col-lg-8">
			<!-- Featured blog post-->
			<div class="card mb-4">
				<a href="#!"><img class="card-img-top"
					src="https://dummyimage.com/850x350/dee2e6/6c757d.jpg" alt="..." /></a>
				<div class="card-body">
					<a class="btn btn-primary" href="#!">Read more →</a>
				</div>
			</div>
			<!-- Nested row for non-featured blog posts-->
			<div class="row">
				<div class="col-lg-6">
					<!-- Blog post-->
					<div class="card mb-4">
						<a href="#!"><img class="card-img-top"
							src="https://dummyimage.com/700x350/dee2e6/6c757d.jpg" alt="..." /></a>
						<div class="card-body">
							<a class="btn btn-primary" href="#!">Read more →</a>
						</div>
					</div>
					<!-- Blog post-->
					<div class="card mb-4">
						<a href="#!"><img class="card-img-top"
							src="https://dummyimage.com/700x350/dee2e6/6c757d.jpg" alt="..." /></a>
						<div class="card-body">
							<a class="btn btn-primary" href="#!">Read more →</a>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<!-- Blog post-->
					<div class="card mb-4">
						<a href="#!"><img class="card-img-top"
							src="https://dummyimage.com/700x350/dee2e6/6c757d.jpg" alt="..." /></a>
						<div class="card-body">
							<a class="btn btn-primary" href="#!">Read more →</a>
						</div>
					</div>
					<!-- Blog post-->
					<div class="card mb-4">
						<a href="#!"><img class="card-img-top"
							src="https://dummyimage.com/700x350/dee2e6/6c757d.jpg" alt="..." /></a>
						<div class="card-body">
							<a class="btn btn-primary" href="#!">Read more →</a>
						</div>
					</div>
				</div>
			</div>
			<!-- Pagination-->
			<nav aria-label="Pagination">
				<hr class="my-0" />
				<ul class="pagination justify-content-center my-4">
					<li class="page-item disabled"><a class="page-link" href="#"
						tabindex="-1" aria-disabled="true">Newer</a></li>
					<li class="page-item active" aria-current="page"><a
						class="page-link" href="#!">1</a></li>
					<li class="page-item"><a class="page-link" href="#!">2</a></li>
					<li class="page-item"><a class="page-link" href="#!">3</a></li>
					<li class="page-item disabled"><a class="page-link" href="#!">...</a></li>
					<li class="page-item"><a class="page-link" href="#!">15</a></li>
					<li class="page-item"><a class="page-link" href="#!">Older</a></li>
				</ul>
			</nav>
		</div>
		<!-- Side widgets-->
		<div class="col-lg-4">
			<!-- Search widget-->
			<div class="card mb-4">
				<div class="card-header">사이즈</div>
				<div class="card-body">
					
					<!-- 
					<button class="btn btn-outline-dark btn-lg px-3"
						id="button-search" type="button">230</button>
					<button class="btn btn-outline-dark btn-lg px-3"
						id="button-search" type="button" style="padding: 10px;">235</button>
					<button class="btn btn-outline-dark btn-lg px-3"
						id="button-search" type="button" style="padding: 10px;">240</button>
					<button class="btn btn-outline-dark btn-lg px-3"
						id="button-search" type="button" style="padding: 10px;">245</button>
					<button class="btn btn-outline-dark btn-lg px-3"
						id="button-search" type="button" style="padding: 10px;">250</button>
					<button class="btn btn-outline-dark btn-lg px-3"
						id="button-search" type="button" style="padding: 10px;">255</button>
					<button class="btn btn-outline-dark btn-lg px-3"
						id="button-search" type="button" style="padding: 10px;">260</button>
					<button class="btn btn-outline-dark btn-lg px-3"
						id="button-search" type="button" style="padding: 10px;">265</button>
					<button class="btn btn-outline-dark btn-lg px-3"
						id="button-search" type="button" style="padding: 10px;">270</button>
					<button class="btn btn-outline-dark btn-lg px-3"
						id="button-search" type="button" style="padding: 10px;">275</button>
					<button class="btn btn-outline-dark btn-lg px-3"
						id="button-search" type="button" style="padding: 10px;">280</button>
					<button class="btn btn-outline-dark btn-lg px-3"
						id="button-search" type="button" style="padding: 10px;">285</button>
					<button class="btn btn-outline-dark btn-lg px-3"
						id="button-search" type="button" style="padding: 10px;">290</button>
					<button class="btn btn-outline-dark btn-lg px-3"
						id="button-search" type="button" style="padding: 10px;">295</button>
					<button class="btn btn-outline-dark btn-lg px-3"
						id="button-search" type="button" style="padding: 10px;">300</button>
					-->
				</div>
			</div>

			<!-- Side widget-->
			<div class="card mb-4">
				<div class="card-header">색상</div>
				<div class="card-body">
					<c:forEach items="${listColor}" var="shoesColorVo">
						<div>
							<input type="checkbox"> ${shoesColorVo.shoes_color}
						</div>
					</c:forEach>
				</div>
			</div>

			<!-- Categories widget-->
			<div class="card mb-4">
				<div class="card-header">카테고리</div>
				<div class="card-body">
					<c:forEach items="${listCategory}" var="shoesCategoryVo">
						<div>
							<input type="checkbox"> ${shoesCategoryVo.shoes_category}
						</div>
					</c:forEach>
				</div>
			</div>

			<!-- Categories widget-->
			<div class="card mb-4">
				<div class="card-header">스타일</div>
				<div class="card-body">
					<c:forEach items="${listStyle}" var="shoesStyleVo">
						<div>
							<input type="checkbox"> ${shoesStyleVo.shoes_style}
						</div>
					</c:forEach>
				</div>
			</div>

			<!-- Categories widget-->
			<div class="card mb-4">
				<div class="card-header">상태</div>
				<div class="card-body">
					<c:forEach items="${listState}" var="shoesStateVo">
						<div>
							<input type="checkbox"> ${shoesStateVo.shoes_state}
						</div>
					</c:forEach>
				</div>
			</div>

		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/company/include/footer.jsp"%>
