<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/company/include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/company/member/memberInfo.jsp"%>
<%@ include file="/WEB-INF/views/company/board/pagingForm.jsp"%>

<script>
 $(function(){
 	$("#registForm").click(function(e){
 		e.preventDefault();
 		$("#pagingForm").attr("action","/company/board/myboard/myboard_list");
 		$("#pagingForm > input[name=page]").val("${pagingDto.page}");
 		$("#pagingForm > input[name=searchType]").val("${pagingDto.searchType}");
 		$("#pagingForm > input[name=keyword]").val("${pagingDto.keyword}");
 		$("#pagingForm").submit();
 	});
	
 	$(".page-link").click(function(e){
 		e.preventDefault();
 		var page = $(this).attr("href");
 		$("#pagingForm").attr("action","/company/board/myboard/myboard_list");
 		$("#pagingForm > input[name=page]").val(page);
 		$("#pagingForm > input[name=searchType]").val("${pagingDto.searchType}");
 		$("#pagingForm > input[name=keyword]").val("${pagingDto.keyword}");
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
						<h1 class="display-5 fw-bolder" id="store">내 게시물</h1>
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
									<th>게시판</th>
									<th>제목</th>
									<th>작성일</th>
									<th>조회수</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${boardList}" var="list">
								<tr>
									<td>${list.bno}</td>
									<td>
									
										<c:choose>
											<c:when test="${list.bcate == 'f'}">
												자유게시판
											</c:when>
											<c:when test="${list.bcate == 'n'}">
												공지시항
											</c:when>
											<c:when test="${list.bcate == 'a'}">
												대나무 숲
											</c:when>
											<c:when test="${list.bcate == 'p'}">
												자료실
											</c:when>
										</c:choose>
									</td>
									
									<td><a class="aTitle" href="
									
										<c:choose>
											<c:when test="${list.bcate == 'f'}">
												/company/board/free/free_content?bno=
											</c:when>
											<c:when test="${list.bcate == 'n'}">
												/company/board/notice/notice_content?bno=
											</c:when>
											<c:when test="${list.bcate == 'a'}">
												/company/board/anonymous/anonymous_content?bno=
											</c:when>
											<c:when test="${list.bcate == 'p'}">
												/company/board/pds/pds_content?bno=
											</c:when>
										</c:choose>
										
									${list.bno}" type="button">${list.title}</a></td>
										
									
									<td>${list.regdate}</td>
									<td>${list.viewcnt}</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					
					<div class="col-md-2"></div>
					
<!-- 페이징 시작 -->
	<div class="row">
		<div class="col-md-12">
			<nav class="pagination-sm">
				<ul class="pagination justify-content-center">
				
				
					<li class="page-item">
						<c:if test="${pagingDto.startPage != 1}">
							<a class="page-link" href="${pagingDto.startPage - 1}">이전</a>
						</c:if>
					</li>
					
					<c:forEach var="page" begin="${pagingDto.startPage}" end="${pagingDto.endPage}">
						<li 
							<c:choose>
								<c:when test="${pagingDto.page == page}">
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
						<c:if test="${pagingDto.endPage != pagingDto.totalPage}">
							<a class="page-link" href="${pagingDto.endPage + 1}">다음</a>
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
		<form class="form-inline justify-content-center" action="/company/board/myboard/myboard_list" method="get">
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