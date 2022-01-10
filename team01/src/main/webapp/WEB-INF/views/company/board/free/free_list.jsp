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
	});;
	
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
					<select>
						<option value="" selected>5줄 보기</option>
						<option value="">10줄 보기</option>
						<option value="">15줄 보기</option>
					</select>
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
										<td>${boardVo.username }</td>
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
				</div>
			</div>
		</div>
	</div>
</section>


<%@ include file="/WEB-INF/views/include/footer.jsp"%>