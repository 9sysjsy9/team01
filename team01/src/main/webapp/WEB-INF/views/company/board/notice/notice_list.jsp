<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/company/include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/company/member/memberInfo.jsp"%>
<%@ include file="/WEB-INF/views/company/board/pagingForm.jsp"%>

<script>
$(function(){
	$("#noticeRegistForm").click(function(e){
		e.preventDefault();
		$("#pagingForm").attr("action","/company/board/notice/notice_regist");
		$("#pagingForm > input[name=page]").val("${noticePagingDto.page}");
		$("#pagingForm > input[name=searchType]").val("${noticePagingDto.searchType}");
		$("#pagingForm > input[name=keyword]").val("${noticePagingDto.keyword}");
		$("#pagingForm").submit();
	});
	
	$(".aTitle").click(function(e){
		e.preventDefault();
		var bno = $(this).attr("href");
// 		location.href = "/company/board/notice/notice_content/"+bno;
		$("#pagingForm").attr("action","/company/board/notice/notice_content");
		$("#pagingForm > input[name=bno]").val(bno);
		$("#pagingForm > input[name=page]").val("${noticePagingDto.page}");
		$("#pagingForm > input[name=searchType]").val("${noticePagingDto.searchType}");
		$("#pagingForm > input[name=keyword]").val("${noticePagingDto.keyword}");
		$("#pagingForm").submit();
	});
	
	$(".page-link").click(function(e){
		e.preventDefault();
		var page = $(this).attr("href");
// 		location.href = "/company/board/notice/notice_list?page="+page;
		$("#pagingForm").attr("action","/company/board/notice/notice_list");
		$("#pagingForm > input[name=page]").val(page);
		$("#pagingForm > input[name=searchType]").val("${noticePagingDto.searchType}");
		$("#pagingForm > input[name=keyword]").val("${noticePagingDto.keyword}");
		$("#pagingForm").submit();
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
						<h1 class="display-5 fw-bolder" id="store">공지사항</h1>
					</div>
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
									<th>작성자</th>
									<th>작성일</th>
									<th>조회수</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${noticeList}" var="list">
								<tr>
									<td>${list.bno}</td>
									<td><a class="aTitle" href="${list.bno}" type="button">${list.title}</a></td>
									<td style="cursor: pointer" class="btnUsername" data-userid="${list.userid}" >${list.username}</td>
									<td>${list.regdate}</td>
									<td>${list.viewcnt}</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
							<div style="text-align:right">
								<c:if test="${loginData.authority == 3}">
									<button id="noticeRegistForm" type='button' class='btn btn-outline-primary flex-shrink-0 btn-sm'>글쓰기</button>
								</c:if>
							</div>
					</div>
					
					<div class="col-md-2"></div>
					
<!-- 페이징 시작 -->
	<div class="row">
		<div class="col-md-12">
			<nav class="pagination-sm">
				<ul class="pagination justify-content-center">
				
				
					<li class="page-item">
						<c:if test="${noticePagingDto.startPage != 1}">
							<a class="page-link" href="${noticePagingDto.startPage - 1}">이전</a>
						</c:if>
					</li>
					
					<c:forEach var="page" begin="${noticePagingDto.startPage}" end="${noticePagingDto.endPage}">
					
						<li 
							<c:choose>
								<c:when test="${noticePagingDto.page == page}">
									class="page-item active"
								</c:when>
								<c:otherwise>
									class="page-item"
								</c:otherwise>
							</c:choose>
						>
								<a class="page-link" href="${page}">${page}</a>
							</li>
							
					</c:forEach>
					
					<li class="page-item">
						<c:if test="${noticePagingDto.endPage != noticePagingDto.totalPage}">
							<a class="page-link" href="${noticePagingDto.endPage + 1}">다음</a>
						</c:if>
					</li>
					
				</ul>
			</nav>
		</div>
	</div>
<!-- 페이징 끝 -->

<!-- 검색 시작 -->
<div class="row">
<div class="col-md-2"></div>
	<div class="col-md-8" >
		<form class="form-inline justify-content-center" action="/company/board/notice/notice_list" method="get">
			<select class="form-control mr-sm-2" name="searchType">
				<option value="t">제목</option>
				<option value="c">내용</option>
				<option value="tc">제목+내용</option>
			</select>
			<input class="form-control mr-sm-2" type="text" placeholder="검색어" name="keyword">
			<button class="form-control my-2 my-sm-0 btn btn-outline-secondary flex-shrink-0 " type="submit">검색</button>
		</form>
	</div>
<div class="col-md-2"></div>
</div>
<!-- 검색 끝-->



					
				</div>
			</div>
		</div>
	</div>
</section>


<%@ include file="/WEB-INF/views/include/footer.jsp"%>