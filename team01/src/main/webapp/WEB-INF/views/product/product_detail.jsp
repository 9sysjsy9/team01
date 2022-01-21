<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Navigation-->
<script>
	$(function() {
		$("#count").change(function() {
			var order_count = $(this).val();
			console.log("order_count: " + order_count);
		});

		$(".cart").click(function() {
			var shoes_code = $(this).attr("data-shoes_code");
			var user_id = $(this).attr("data-user_id");
			var order_count = $("#count").val();
			console.log("shoes_code: " + shoes_code);
			console.log("user_id: " + user_id);
			console.log("order_count: " + order_count);
			var url = "/user/insertBasket";
			var sData = {
				"shoes_code" : shoes_code,
				"user_id" : user_id,
				"order_count" : order_count
			};
			$.post(url, sData, function(rData) {
				console.log("rData: " + rData);
				if (rData != 0) {
					$(".cartCount").text(rData);
				}
			});

		});

		$(".order").click(
				function() {
					var shoes_code = $(this).attr("data-shoes_code");
					var user_id = $(this).attr("data-user_id");
					var order_count = $("#count").val();
					console.log("shoes_code: " + shoes_code);
					console.log("user_id: " + user_id);
					console.log("order_count: " + order_count);

					if (user_id == null || user_id == "") {
						alert("로그인 정보가 필요합니다");
						location.href = "/user/login";
					} else {
						location.href = "/user/orderContent?shoes_code="
								+ shoes_code + "&user_id=" + user_id
								+ "&order_count=" + order_count;
					}

				});

	});
</script>



<!-- Product section-->
<section class="py-5">

	<div class="container px-4 px-lg-5 my-5">

		<c:if test="${!empty cart_count}">
			<div style="float: right; margin-right: 50px;">
				<ul class="nav nav-pills">
					<li class="nav-item"><a href="/user/user_basket"> <img
							src="/images/cart.png" width="50px"></a> <span
						class="badge badge-secondary cartCount"> ${cart_count} </span></li>
				</ul>
			</div>
		</c:if>
		<br>
		<br>
		<br>
		<div class="row gx-4 gx-lg-5 align-items-center">
			<div class="col-md-6">
				<img class="card-img-top mb-5 mb-md-0"
					src="/upload/displayImage?fileName=${productVo.shoes_image}" />
			</div>
			<div class="col-md-6">
				<div class="small mb-1">SKU: BST-498</div>
				<h1 class="display-5 fw-bolder">Shop item template</h1>
				<div class="fs-5 mb-5">
					<span class="text-decoration-line-through">$45.00</span> <span>$40.00</span>
				</div>
				<p >위험이 크고 압박감을 느끼는 상황에서 뛰어난 퍼포먼스를 보여줍니다. 르브론 19는 발을
					꼭 잡아주는 핏과 새로워진 쿠셔닝 시스템으로 이 에너지를 십분 활용합니다. 신발 끈이 끼워진 성형 오버레이가 발에 꼭
					맞는 내부 슬리브를 모아주며 신발 안에서의 발 움직임을 막아줍니다. 카라와 설포 주변의 쿠션감 있는 포드는 편안함을
					더해주고 무게는 줄여주어, 긴장감 넘치는 경기 중 선수들이 최대의 역량을 발휘할 수 있는 안정적인 착화감과 자신감을
					선사합니다.</p>
				<div class="d-flex">
					<select id="count">
						<c:forEach begin="1" end="${productVo.shoes_count}" var="i">
							<option value="${i}">${i}</option>
						</c:forEach>
					</select><i class="bi-cart-fill me-2"></i>

					<c:if test="${!empty userData.user_id}">
						<button class="btn btn-outline-dark flex-shrink-0 cart"
							type="button" data-shoes_code="${productVo.shoes_code}"
							data-user_id="${userData.user_id}">장바구니 담기</button>
					</c:if>
					<i class="bi-cart-fill me-2"></i>
					<button class="btn btn-outline-dark flex-shrink-0 order"
						type="button" data-shoes_code="${productVo.shoes_code}"
						data-user_id="${userData.user_id}">주문하기</button>
					<i class="bi-cart-fill me-2"></i>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Related items section-->
<section class="py-5 bg-light">
	<div class="container px-4 px-lg-5 mt-5">
		<h2 class="fw-bolder mb-4">Related products</h2>
		<div
			class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
			<div class="col mb-5">
				<div class="card h-100">
					<!-- Product image-->
					<img class="card-img-top"
						src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
					<!-- Product details-->
					<div class="card-body p-4">
						<div class="text-center">
							<!-- Product name-->
							<h5 class="fw-bolder">Fancy Product</h5>
							<!-- Product price-->
							$40.00 - $80.00
						</div>
					</div>
					<!-- Product actions-->
					<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
						<div class="text-center">
							<a class="btn btn-outline-dark mt-auto" href="#">View options</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col mb-5">
				<div class="card h-100">
					<!-- Sale badge-->
					<div class="badge bg-dark text-white position-absolute"
						style="top: 0.5rem; right: 0.5rem">Sale</div>
					<!-- Product image-->
					<img class="card-img-top"
						src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
					<!-- Product details-->
					<div class="card-body p-4">
						<div class="text-center">
							<!-- Product name-->
							<h5 class="fw-bolder">Special Item</h5>
							<!-- Product reviews-->
							<div
								class="d-flex justify-content-center small text-warning mb-2">
								<div class="bi-star-fill"></div>
								<div class="bi-star-fill"></div>
								<div class="bi-star-fill"></div>
								<div class="bi-star-fill"></div>
								<div class="bi-star-fill"></div>
							</div>
							<!-- Product price-->
							<span class="text-muted text-decoration-line-through">$20.00</span>
							$18.00
						</div>
					</div>
					<!-- Product actions-->
					<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
						<div class="text-center">
							<a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col mb-5">
				<div class="card h-100">
					<!-- Sale badge-->
					<div class="badge bg-dark text-white position-absolute"
						style="top: 0.5rem; right: 0.5rem">Sale</div>
					<!-- Product image-->
					<img class="card-img-top"
						src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
					<!-- Product details-->
					<div class="card-body p-4">
						<div class="text-center">
							<!-- Product name-->
							<h5 class="fw-bolder">Sale Item</h5>
							<!-- Product price-->
							<span class="text-muted text-decoration-line-through">$50.00</span>
							$25.00
						</div>
					</div>
					<!-- Product actions-->
					<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
						<div class="text-center">
							<a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col mb-5">
				<div class="card h-100">
					<!-- Product image-->
					<img class="card-img-top"
						src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
					<!-- Product details-->
					<div class="card-body p-4">
						<div class="text-center">
							<!-- Product name-->
							<h5 class="fw-bolder">Popular Item</h5>
							<!-- Product reviews-->
							<div
								class="d-flex justify-content-center small text-warning mb-2">
								<div class="bi-star-fill"></div>
								<div class="bi-star-fill"></div>
								<div class="bi-star-fill"></div>
								<div class="bi-star-fill"></div>
								<div class="bi-star-fill"></div>
							</div>
							<!-- Product price-->
							$40.00
						</div>
					</div>
					<!-- Product actions-->
					<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
						<div class="text-center">
							<a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>