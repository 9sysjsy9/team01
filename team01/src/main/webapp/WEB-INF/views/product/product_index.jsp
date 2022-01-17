<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<header class="bg-dark py-5">
	<div class="container px-4 px-lg-5 my-5">
		<div class="text-center text-white">
			<h1 class="display-4 fw-bolder">Shop in style</h1>
			<p class="lead fw-normal text-white-50 mb-0">With this shop
				hompeage template</p>
		</div>
	</div>
</header>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function() {
		$(".page-link").click(function(e) {
			e.preventDefault();
			var page = $(this).attr("href");
			location.href = "/product/company/product_index?page=" + page;
		});

	});
</script>
<%@include file="/WEB-INF/views/product/include/paging_form.jsp"%>
<!-- Section-->
<section class="py-5">

	<div class="container px-4 px-lg-5 mt-5">

		<div class="xans-element- xans-product xans-product-normalmenu">
			<div class="sort">
				<select id="selArray" name="selArray"
					class="xans-element- xans-product xans-product-orderby"><option
						value="?cate_no=42&sort_method=5#Product_ListMenu"
						class="xans-record-">신상품</option>
					<option value="?cate_no=42&sort_method=1#Product_ListMenu"
						class="xans-record-">상품명</option>
					<option value="?cate_no=42&sort_method=3#Product_ListMenu"
						class="xans-record-">낮은가격</option>
					<option value="?cate_no=42&sort_method=4#Product_ListMenu"
						class="xans-record-">높은가격</option>
					<option value="?cate_no=42&sort_method=2#Product_ListMenu"
						class="xans-record-">제조사</option>
					<option value="?cate_no=42&sort_method=7#Product_ListMenu"
						class="xans-record-">사용후기</option>
				</select>
			</div>

		</div>

		<div class="container px-2 px-lg-2 mt-4"></div>

		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<nav class="navbar navbar-expand-lg navbar-light bg-light">

						<button class="navbar-toggler" type="button"
							data-toggle="collapse"
							data-target="#bs-example-navbar-collapse-1">
							<span class="navbar-toggler-icon"></span>
						</button>
						<a class="navbar-brand" href="#">Brand</a>
						<div class="collapse navbar-collapse"
							id="bs-example-navbar-collapse-1">
							<ul class="navbar-nav">
								<li class="nav-item active"><a class="nav-link" href="#">Man
										<span class="sr-only">(current)</span>
								</a></li>
								<li class="nav-item"><a class="nav-link" href="#">Woman</a>
								</li>
								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" href="http://example.com"
									id="navbarDropdownMenuLink" data-toggle="dropdown">Dropdown
										link</a>
									<div class="dropdown-menu"
										aria-labelledby="navbarDropdownMenuLink">
										<a class="dropdown-item" href="#">Action</a> <a
											class="dropdown-item" href="#">Another action</a> <a
											class="dropdown-item" href="#">Something else here</a>
										<div class="dropdown-divider"></div>
										<a class="dropdown-item" href="#">Separated link</a>
									</div></li>
							</ul>
							<form class="form-inline">
								<input class="form-control mr-sm-2" type="text" />
								<button class="btn btn-primary my-2 my-sm-0" type="submit">
									Search</button>
							</form>
							<ul class="navbar-nav ml-md-auto">
								<li class="nav-item active"><a class="nav-link" href="#">Link
										<span class="sr-only">(current)</span>
								</a></li>
								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" href="http://example.com"
									id="navbarDropdownMenuLink" data-toggle="dropdown">Dropdown
										link</a>
									<div class="dropdown-menu dropdown-menu-right"
										aria-labelledby="navbarDropdownMenuLink">
										<a class="dropdown-item" href="#">Action</a> <a
											class="dropdown-item" href="#">Another action</a> <a
											class="dropdown-item" href="#">Something else here</a>
										<div class="dropdown-divider"></div>
										<a class="dropdown-item" href="#">Separated link</a>
									</div></li>
							</ul>
						</div>
					</nav>
				</div>
			</div>
		</div>
		<div class="container px-4 px-lg-5 mt-5"></div>
		<div
			class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">

			<c:forEach items="${list}" var="productVo">
				<div class="col mb-5">
					<div class="card h-100">
<!-- 						
						<img class="card-img-top" 
						src="/product_images/shoes${productVo.shoes_code}.jpg" alt="..." /> 
 -->
						<img class="card-img-top"
							src="/upload/displayImage?fileName=${productVo.shoes_image}">
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 class="fw-bolder">${productVo.shoes_name}</h5>
								<!-- Product price-->
								$ ${productVo.shoes_price}
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto"
									href="/product/product_detail?shoes_code=${productVo.shoes_code}">정보보기</a>
								<a class="btn btn-outline-dark mt-auto" href="/user/user_basket">장바구니</a>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>

		</div>

		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<nav>
						<ul class="pagination">
							<c:if test="${pt.startPage!=1}">
								<li class="page-item"><a class="page-link"
									href="${pt.startPage-10}">이전</a></li>
							</c:if>
							<c:forEach var="v" begin="${pt.startPage}" end="${pt.endPage}">
								<li class="page-item"><a class="page-link" href="${v}">${v}</a>
								<li class="page-item">
							</c:forEach>
							<li><a class="page-link" href="${pt.endPage+1}">다음</a></li>
						</ul>
					</nav>
				</div>
			</div>
		</div>

	</div>
</section>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>
