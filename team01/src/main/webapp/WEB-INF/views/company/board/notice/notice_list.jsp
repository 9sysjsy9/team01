<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/company/include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
$(function(){
	$("#noticeRegistForm").click(function(e){
		location.href = "/company/board/notice/notice_regist";
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
								<tr class="table">
									<td>1</td>
									<td>공지사항 제목 입니다.</td>
									<td>김갑수</td>
									<td>2010/09/10</td>
									<td>10</td>
								</tr>
							</tbody>
						</table>
							<div style="text-align:right">
								<c:if test="${loginData.authority == 3}">
									<button id="noticeRegistForm" type='button' class='btn btn-outline-primary flex-shrink-0 btn-sm'>글쓰기</button>
								</c:if>
							</div>
					</div>

					
					<div class="col-md-2">
					</div>
				</div>


			</div>
		</div>
	</div>
</section>


<%@ include file="/WEB-INF/views/include/footer.jsp"%>