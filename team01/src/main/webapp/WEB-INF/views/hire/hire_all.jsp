<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

<script>
$(function(){
	$(".page-link").click(function(e) {
		e.preventDefault();
		var page = $(this).attr("href");
		location.href = "/hire/hire_all?page=" + page;
	});
	
	$(".title").click(function(e) {
		e.preventDefault();
		var bno = $(this).attr("href");
		location.href = "/hire/hire_content?bno="+bno;
	});
});
</script>
<%@include file="/WEB-INF/views/hire/include/paging_form.jsp" %>
<div class="row gx-4 gx-lg-5 align-items-center my-5">
	<div class="col-lg-5" >
		<h1 class="font-weight-light" style="margin-left:50px;">진행 중인 채용공고</h1>
	</div>
</div>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2">
			<div class="border-end bg-white" id="sidebar-wrapper">
				<div class="list-group list-group-flush">
					<a class="list-group-item list-group-item-action list-group-item-light p-3"href="hire_all">전체 보기</a>
					<a class="list-group-item list-group-item-action list-group-item-light p-3"href="hire_new">신입 채용</a>
					<a class="list-group-item list-group-item-action list-group-item-light p-3"href="hire_experience">경력 채용</a>
					<a class="list-group-item list-group-item-action list-group-item-light p-3"href="hire_intern">인턴 채용</a>
				</div>
			</div>
		</div>
		<div class="col-md-10">
			<div id="page-content-wrapper">
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<table class="table">
							<thead>
								<tr>
									<th>#</th>
									<th>분류</th>
									<th>제목</th>
									<th>등록일</th>
									<th>등록자</th>
								</tr>
							</thead>
							<c:forEach  items="${list}" var="hireboardVo">
									<tr>
										<td>${hireboardVo.bno }</td>
										<td>${hireboardVo.cate }</td>
										<td><a class="title" href="${hireboardVo.bno }">${hireboardVo.title }</a></td>
										<td>${hireboardVo.regdate }</td>
										<td>${hireboardVo.writer }</td>
									</tr>
								</c:forEach>
						</table>
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
				<div class="col-md-2"></div>
				</div>
			</div>
		</div>
	</div>
</div>
	
<%@ include file="/WEB-INF/views/include/footer.jsp"%>