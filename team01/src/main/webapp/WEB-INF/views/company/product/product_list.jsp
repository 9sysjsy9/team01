<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/company/include/header.jsp"%>

<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(function() {
	$(".btnDelete").click(function() {
		var shoes_code = $(this).attr("data-shoes_code");
		var shoes_image = $(this).attr("data-shoes_image");
		location.href = "/company/delete_run?shoes_code="+shoes_code+"&shoes_image="+shoes_image;
	});
});
</script>
<%@include file="/WEB-INF/views/company/product/include/paging_form.jsp"%>
<div class="row gx-4 gx-lg-5 align-items-center my-5">
	<div class="col-lg-5">
		<h1 class="font-weight-light" style="margin-left: 50px;">제품 리스트</h1>
	</div>
</div>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-10">
			<div id="page-content-wrapper">
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<table class="table" border="1">
								<tr>
									<th>제품번호</th>
									<th>제품명</th>
									<th>제품사이즈</th>
									<th>제품색상</th>
									<th>제품수량</th>
									<th>제품분류</th>
									<th>제품가격</th>
									<th>제품종류</th>
									<th>제품상태</th>
									<th>제품이미지</th>
									<th>수정</th>
									<th>삭제</th>
								</tr>
								<c:forEach items="${list}" var="productVo">
									<tr>
										<td>${productVo.shoes_code}</td>
										<td>${productVo.shoes_name}</td>
										<td>${productVo.shoes_size}</td>
										<td>${productVo.shoes_color}</td>
										<td>${productVo.shoes_count}</td>
										<td>${productVo.shoes_category}</td>
										<td>${productVo.shoes_price}</td>
										<td>${productVo.shoes_style}</td>
										<td>${productVo.shoes_state}</td>
										<td>
											<img src="/company/displayThumbnailImage?fileName=${productVo.shoes_image}"><br>
											<a href="/company/download.do?fileName=${productVo.shoes_image}">이미지 다운로드</a>
										</td>
										<td><button type="button" class="btn btn-outline-light btn-lg px-2 btnModify" 
											data-shoes_code="${productVo.shoes_code}" data-shoes_image="${productVo.shoes_image}">수정</button></td>
										<td><button type="button" class="btn btn-outline-light btn-lg px-2 btnDelete" 
											data-shoes_code="${productVo.shoes_code}" data-shoes_image="${productVo.shoes_image}"> ✖️</button></td>
									</tr>
								</c:forEach>
						</table>
					</div>
					<div class="col-md-2"></div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/company/include/footer.jsp"%>
