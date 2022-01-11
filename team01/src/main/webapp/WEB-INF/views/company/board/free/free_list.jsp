<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ include file="/WEB-INF/views/company/include/header.jsp"%> 
<script>
$(function(){
	$("#btnRegist").click(function(){
		location.href = "/company/board/free/free_regist";
	});
	
	$(".title").click(function(e) {
		e.preventDefault();
		var bno = $(this).attr("href");
		location.href = "/company/board/free/free_content?bno="+bno;
	});
	
	$(function(){
		$(".page-link").click(function(e) {
			e.preventDefault();
			var page = $(this).attr("href");
			location.href = "/company/board/free/free_list?page=" + page;
		});
	});
	
	$(function(){
		$(".btnUsername").click(function(e) {
			console.log("클릭");
		});
	});
	
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
			<h1 class="display-5 fw-bolder" id="store">자유게시판</h1></div>
			<div class="col-md-2"></div>
			</div>
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<table class="table table-hover">
							<thead>
								<tr>
									<th>#</th>
									<th>제목</th>
									<th>글쓴이</th>
									<th>작성일</th>
									<th>조회수</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach  items="${list}" var="boardVo">
									<tr class="table">
										<td>${boardVo.bno }</td>
										<td><a class="title" href="${boardVo.bno }">${boardVo.title }</a></td>
										<td class="btnUsername" data-userid="${boardVo.userid}">${boardVo.username }</td>
										<td>${boardVo.regdate }</td>
										<td>${boardVo.viewcnt }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div>
							<button type="button" class="btn btn-outline-dark flex-shrink-0" id="btnRegist">
								등록
							</button>
						</div> 
					</div>
					<div class="col-md-2"></div>
					<nav>
						<ul class="pagination justify-content-center">
							<c:if test="${pagingDto.startPage != 1}">
							<li class="page-item">
								<a class="page-link" href="${pagingDto.startPage - 1}">이전</a>
							</li>
							</c:if>
							<c:forEach var="v" begin="${pagingDto.startPage}" 
											   end="${pagingDto.endPage}">
							<li 
								<c:choose>
									<c:when test="${pagingDto.page == v}">
										class="page-item active"
									</c:when>
									<c:otherwise>
										class="page-item"
									</c:otherwise>
								</c:choose>
							>
								<a class="page-link" href="${v}">${v}</a>
							</li>
							</c:forEach>
							<c:if test="${pagingDto.endPage < pagingDto.totalPage}">
							<li class="page-item">
								<a class="page-link" href="${pagingDto.endPage + 1}">다음</a>
							</li>
							</c:if>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
</section>


<%@ include file="/WEB-INF/views/include/footer.jsp"%>