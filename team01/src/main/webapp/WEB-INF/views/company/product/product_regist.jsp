<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/company/include/header.jsp"%>
<style>
.btn btn-outline-dark btn-lg px-4 {
	padding: 10px, margin: 10px
}

.hide {
	display: none
}

.MoreImage {
	/* 	display: none */
	
}
</style>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function() {
		$(".qask").click(function() {
			$(this).next().toggle();
		});
		$(".btnMoreImage").click(function() {
			$(".MoreImage").toggle();
		});

		$(".fileDrop").on("dragenter dragover", function(e) {
			e.preventDefault();
		});
		
		$(".shoes_sizeCheckbox").click(function() {
			var asd = $(this).val();
			$("#frmProduct>input[name=shoes_size]").val(asd);
		});
		$(".shoes_colorCheckbox").click(function() {
			var asd = $(this).val();
			$("#frmProduct>input[name=shoes_color]").val(asd);
		});
		$(".shoes_categoryCheckbox").click(function() {
			var asd = $(this).val();
			$("#frmProduct>input[name=shoes_category]").val(asd);
		});
		$(".shoes_styleCheckbox").click(function() {
			var asd = $(this).val();
			$("#frmProduct>input[name=shoes_style]").val(asd);
		});
		$(".shoes_stateCheckbox").click(function() {
			var asd = $(this).val();
			$("#frmProduct>input[name=shoes_state]").val(asd);
		});
		$(".btnshoes_name").click(function() {
			var asd = $(this).prev().val();
			$("#frmProduct>input[name=shoes_name]").val(asd);
		});
		$(".btnshoes_count").click(function() {
			var asd = $(this).prev().val();
			$("#frmProduct>input[name=shoes_count]").val(asd);
		});
		$(".btnshoes_price").click(function() {
			var asd = $(this).prev().val();
			$("#frmProduct>input[name=shoes_price]").val(asd);
		});
		$("#btnProductAdd").click(function() {
			$("#frmProduct").submit();
		});

		$(".fileDrop").on("drop", function(e) {
			e.preventDefault();
			var div = $(this).next();
			var file = e.originalEvent.dataTransfer.files[0];
			console.log("file: " + file);
			var formData = new FormData();
			formData.append("file", file);
			var url = "/upload/uploadAjax";

			$.ajax({
				"processData" : false,
				"contentType" : false,
				"method" : "post",
				"url" : url,
				"data" : formData,
				"success" : function(rData) {
					console.log("rData: " + rData);
					if (rData == "fail") {
						alert("잘못된 형식의 파일입니다.");
						return;
					}
					var underIndex = rData.indexOf("_");
					var fileName = rData.substring(underIndex + 1);
					var asd = '<div class="divUploaded">';
					asd += '<img src="/company/displayThumbnailImage?fileName='
						+ rData + '">' + "<br>";
					asd += '<label class="label label-outline-dark btn-lg px-2">' + fileName + "</label>";
					asd += '<button type="button" class="btn btn-outline-light btn-lg px-2 btnDelete" data-rdata="'+rData+'"> ✖️</button>'+ "<br>";
					asd += '</div>';
					div.append(asd);
					$("#frmProduct>input[name=shoes_image]").val(rData);
				}
			});

		});
		
		
		$(".uploadedList").on("click", ".btnDelete", function() {
			var asd = $(this).parent();
			var filename = $(this).attr("data-rdata");
			console.log("filename: "+filename);
			var url = "/upload/deleteAllFile?fileName=" + filename;
			
			$.get(url, function(rData) {
				console.log("rData: "+ rData);
				if (rData == true) {
					asd.remove();
				}
			});
			
		});

	});
</script>
<%@include file="/WEB-INF/views/company/product/include/paging_form.jsp"%>
<!-- Page content-->
<div class="container">
	<form action="/product/company/regist_run" id="frmProduct">
		<input type="hidden" name="shoes_name"> <input type="hidden"
			name="shoes_size"> <input type="hidden" name="shoes_color">
		<input type="hidden" name="shoes_count"> <input type="hidden"
			name="shoes_category"> <input type="hidden"
			name="shoes_price"> <input type="hidden" name="shoes_style">
		<input type="hidden" name="shoes_state"> <input type="hidden"
			name="shoes_image">
	</form>
	<div class="row">
		<div class="col-lg-7">
			<!-- Featured blog post-->
			<div class="card mb-4">
				<div class="fileDrop">
					<label class="label label-outline-dark btn-lg px-2">파일을 드래그
						하세요</label> <img class="card-img-top"
						src="https://dummyimage.com/700x350/dee2e6/6c757d.jpg" alt="..." />
				</div>
				<div class="card-body uploadedList"></div>
			</div>

			<button type="button"
				class="btn btn-outline-dark btn-lg px-2 btnMoreImage">열기 /
				닫기</button>
			<!-- Nested row for non-featured blog posts-->

			<div class="row">

				<div class="col-lg-6 MoreImage">
					<!-- Blog post-->
					<div class="card mb-4">
						<div class="fileDrop">
							<label class="label label-outline-dark btn-lg px-2">파일을
								드래그 하세요</label> <img class="card-img-top"
								src="https://dummyimage.com/700x350/dee2e6/6c757d.jpg" alt="..." />
						</div>
						<div class="card-body uploadedList"></div>
					</div>

					<!-- Blog post-->
					<div class="card mb-4">
						<div class="fileDrop">
							<label class="label label-outline-dark btn-lg px-2">파일을
								드래그 하세요</label> <img class="card-img-top"
								src="https://dummyimage.com/700x350/dee2e6/6c757d.jpg" alt="..." />
						</div>
						<div class="card-body uploadedList"></div>
					</div>
				</div>

				<div class="col-lg-6 MoreImage">
					<!-- Blog post-->
					<div class="card mb-4">
						<div class="fileDrop">
							<label class="label label-outline-dark btn-lg px-2">파일을
								드래그 하세요</label> <img class="card-img-top"
								src="https://dummyimage.com/700x350/dee2e6/6c757d.jpg" alt="..." />
						</div>
						<div class="card-body uploadedList"></div>
					</div>

					<!-- Blog post-->
					<div class="card mb-4">
						<div class="fileDrop">
							<label class="label label-outline-dark btn-lg px-2">파일을
								드래그 하세요</label> <img class="card-img-top"
								src="https://dummyimage.com/700x350/dee2e6/6c757d.jpg" alt="..." />
						</div>
						<div class="card-body uploadedList"></div>
					</div>
				</div>

			</div>
			<!-- Pagination-->
			<nav aria-label="Pagination" class="MoreImage">
				<hr class="my-0" />
				<ul class="pagination justify-content-center my-4">
					<li class="page-item disabled"><a class="page-link" href="#"
						tabindex="-1" aria-disabled="true">이전</a></li>
					<li class="page-item active" aria-current="page"><a
						class="page-link" href="#!">1</a></li>
					<li class="page-item"><a class="page-link" href="#!">2</a></li>
					<li class="page-item"><a class="page-link" href="#!">3</a></li>
					<li class="page-item disabled"><a class="page-link" href="#!">...</a></li>
					<li class="page-item"><a class="page-link" href="#!">9</a></li>
					<li class="page-item"><a class="page-link" href="#!">다음</a></li>
				</ul>
			</nav>
		</div>
		<!-- Side widgets-->
		<div class="col-lg-4">
			<!-- Search widget-->
			<div class="card mb-4">
				<div class="card-header">사이즈</div>
				<div class="card-body">
					<div class="table-warning qask">
						<label>보기 / 접기</label>
					</div>
					<div class="hide">
						<c:forEach items="${listSize}" var="shoesSizeVo">
							<div>
								<input type="checkbox" class="shoes_sizeCheckbox"
									value="${shoesSizeVo.shoes_size}">
								${shoesSizeVo.shoes_size}
							</div>
						</c:forEach>
					</div>
				</div>
			</div>

			<!-- Side widget-->
			<div class="card mb-4">
				<div class="card-header">색상</div>
				<div class="card-body">
					<div class="table-warning qask">
						<label>보기 / 접기</label>
					</div>
					<div class="hide">
						<c:forEach items="${listColor}" var="shoesColorVo">
							<div>
								<input type="checkbox" class="shoes_colorCheckbox"
									value="${shoesColorVo.shoes_color}">
								${shoesColorVo.shoes_color}
							</div>
						</c:forEach>
					</div>
				</div>
			</div>

			<!-- Categories widget-->
			<div class="card mb-4">
				<div class="card-header">카테고리</div>
				<div class="card-body">
					<div class="table-warning qask">
						<label>보기 / 접기</label>
					</div>
					<div class="hide">
						<c:forEach items="${listCategory}" var="shoesCategoryVo">
							<div>
								<input type="checkbox" class="shoes_categoryCheckbox"
									value="${shoesCategoryVo.shoes_category}">
								${shoesCategoryVo.shoes_category}
							</div>
						</c:forEach>
					</div>
				</div>
			</div>

			<!-- Categories widget-->
			<div class="card mb-4">
				<div class="card-header">스타일</div>
				<div class="card-body">
					<div class="table-warning qask">
						<label>보기 / 접기</label>
					</div>
					<div class="hide">
						<c:forEach items="${listStyle}" var="shoesStyleVo">
							<div>
								<input type="checkbox" class="shoes_styleCheckbox"
									value="${shoesStyleVo.shoes_style}">
								${shoesStyleVo.shoes_style}
							</div>
						</c:forEach>
					</div>
				</div>
			</div>

			<!-- Categories widget-->
			<div class="card mb-4">
				<div class="card-header">상태</div>
				<div class="card-body">
					<div class="table-warning qask">
						<label>보기 / 접기</label>
					</div>
					<div class="hide">
						<c:forEach items="${listState}" var="shoesStateVo">
							<div>
								<input type="checkbox" class="shoes_stateCheckbox"
									value="${shoesStateVo.shoes_state}">
								${shoesStateVo.shoes_state}
							</div>
						</c:forEach>
					</div>
				</div>
			</div>

			<!-- Categories widget-->
			<div class="card mb-4">
				<div class="card-header">제품명</div>
				<div class="card-body">
					<div class="table-warning qask">
						<label>보기 / 접기</label>
					</div>
					<div class="hide">
						<div>
							<input type="text">
							<button type="button" class="btnshoes_name">완료</button>
						</div>
					</div>
				</div>
			</div>

			<!-- Categories widget-->
			<div class="card mb-4">
				<div class="card-header">제품수량</div>
				<div class="card-body">
					<div class="table-warning qask">
						<label>보기 / 접기</label>
					</div>
					<div class="hide">
						<div>
							<input type="number">
							<button type="button" class="btnshoes_count">완료</button>
						</div>
					</div>
				</div>
			</div>

			<!-- Categories widget-->
			<div class="card mb-4">
				<div class="card-header">제품가격</div>
				<div class="card-body">
					<div class="table-warning qask">
						<label>보기 / 접기</label>
					</div>
					<div class="hide">
						<div>
							<input type="number">
							<button type="button" class="btnshoes_price">완료</button>
						</div>
					</div>
				</div>
			</div>

			<button class="btn btn-outline-dark btn-lg px-2" id="btnProductAdd">제품
				등록</button>

		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/company/include/footer.jsp"%>
