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
	display: none
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

	$(".fileDrop").on("drop", function(e) {
		e.preventDefault();
		var div = $(this).next();
		var file = e.originalEvent.dataTransfer.files[0];
		console.log("file: " + file);
		var formData = new FormData();
		formData.append("file", file);
		var url = "/company/uploadAjax";

		$.ajax({
			"processData" : false,
			"contentType" : false,
			"method" : "post",
			"url" : url,
			"data" : formData,
			"success" : function(rData) {
				console.log("rData: "+rData);
				if (rData == "fail") {
					alert("잘못된 형식의 파일입니다.");
					return;
				}
				var underIndex = rData.indexOf("_");
				var fileName = rData.substring(underIndex + 1);
				var asd = '<a href="#" class="a_times">&times;</a>'+"<br>";
				asd += '<img src="/company/displayImage?fileName=' + rData+'">'+"<br>";
				asd += "<span>"+fileName+"</span><br>";
				div.append(asd);
			}
		});
		
	});
	
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
				<div class="fileDrop">
					<label class="label btn-outline-dark btn-lg px-2">파일을 드래그 하세요</label> <img class="card-img-top"
						src="https://dummyimage.com/700x350/dee2e6/6c757d.jpg" alt="..." />
				</div>
				<div class="label label-outline-light btn-lg px-2" id="uploadedList">
					
				</div>
			</div>
			<button type="button"
				class="btn btn-outline-dark btn-lg px-2 btnMoreImage">More
				Images/Close</button>
			<!-- Nested row for non-featured blog posts-->
			<div class="row">
				<div class="col-lg-6 MoreImage">
					<!-- Blog post-->
					<div class="card mb-4">
						<div class="fileDrop">
							<label>파일을 드래그 하세요</label> <img class="card-img-top"
								src="https://dummyimage.com/700x350/dee2e6/6c757d.jpg" alt="..." />
						</div>
					</div>
					<!-- Blog post-->
					<div class="card mb-4">
						<a href="#!"><img class="card-img-top"
							src="https://dummyimage.com/700x350/dee2e6/6c757d.jpg" alt="..." /></a>
						<div class="card-body">
							<a class="btn btn-primary" href="#!">이미지 업로드</a>
						</div>
					</div>
				</div>

				<div class="col-lg-6 MoreImage">
					<!-- Blog post-->
					<div class="card mb-4">
						<a href="#!"><img class="card-img-top"
							src="https://dummyimage.com/700x350/dee2e6/6c757d.jpg" alt="..." /></a>
						<div class="card-body">
							<a class="btn btn-primary" href="#!">이미지 업로드</a>
						</div>
					</div>
					<!-- Blog post-->
					<div class="card mb-4">
						<a href="#!"><img class="card-img-top"
							src="https://dummyimage.com/700x350/dee2e6/6c757d.jpg" alt="..." /></a>
						<div class="card-body">
							<a class="btn btn-primary" href="#!">이미지 업로드</a>
						</div>
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
					<li class="page-item"><a class="page-link" href="#!">4</a></li>
					<li class="page-item"><a class="page-link" href="#!">5</a></li>
					<li class="page-item"><a class="page-link" href="#!">6</a></li>
					<li class="page-item"><a class="page-link" href="#!">7</a></li>
					<li class="page-item"><a class="page-link" href="#!">8</a></li>
					<li class="page-item"><a class="page-link" href="#!">9</a></li>
					<li class="page-item disabled"><a class="page-link" href="#!">...</a></li>
					<li class="page-item"><a class="page-link" href="#!">99</a></li>
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
								<input type="checkbox" value="${shoesSizeVo.shoes_size}">
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
								<input type="checkbox" value="${shoesColorVo.shoes_color}">
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
								<input type="checkbox" value="${shoesCategoryVo.shoes_category}">
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
								<input type="checkbox" value="${shoesStyleVo.shoes_style}">
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
								<input type="checkbox" value="">
								${shoesStateVo.shoes_state}
							</div>
						</c:forEach>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/company/include/footer.jsp"%>
