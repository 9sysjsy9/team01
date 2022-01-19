<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/company/include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Product section-->
<section class="py-5">

	<div class="container">
		<div class="rowalign-items-center">
			<div class="container-fluid">
				<div class="container-fluid">
<!-- 첫번째 열 시작 -->
					<div class="row">
						<div class="col-md-2"></div>
						<div class="col-md-4">
						<h4>공지사항</h4>
							<table class="table table-sm table-hover">
								<thead>
									<tr>
										<th>제목</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${noticeBoardList}" var="list">
									<tr>
										<td><a href="/company/board/notice/notice_content?bno=${list.bno}">${list.title}</a></td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="col-md-4">
						<h4>자유게시판</h4>
							<table class="table table-sm table-hover">
								<thead>
									<tr>
										<th>제목</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${freeBoardList}" var="list">
									<tr class="listTd">
										<td><a href="/company/board/free/free_content?bno=${list.bno}">${list.title}</a></td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="col-md-2"></div>
					</div>
					
<!-- 첫번째 열 끝 -->					
<!-- 두번째 열 시작 -->					
					<div class="row">
						<div class="col-md-2"></div>
						<div class="col-md-4">
						<h4>자료실</h4>
							<table class="table table-sm table-hover">
								<thead>
									<tr>
										<th>제목</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${pdsBoardList}" var="list">
									<tr class="listTd">
										<td><a href="/company/board/pds/pds_content?bno=${list.bno}">${list.title}</a></td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="col-md-4">
						<h4>익명게시판</h4>
							<table class="table table-sm table-hover">
								<thead>
									<tr>
										<th>제목</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${anonBoardList}" var="list">
									<tr class="listTd">
										<td><a href="/company/board/anonymous/anonymous_content?bno=${list.bno}">${list.title}</a></td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="col-md-2"></div>
					</div>
<!-- 두번째 열 끝 -->						
<!-- 세번쨰열 시작 -->	
					<div class="row">
						<div class="col-md-2"></div>
						<div class="col-md-4">
						<h4>새 메세지</h4>
							<table class="table table-sm table-hover">
								<thead>
									<tr>
										<th>제목</th>
										<th>글쓴이</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>제목임</td>
										<td>홍길동</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="col-md-4">
						<h4>새 가맹지원</h4>
							<table class="table table-sm table-hover">
								<thead>
									<tr>
										<th>제목</th>
										<th>글쓴이</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>제목임</td>
										<td>홍길동</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="col-md-2"></div>
					</div>
<!-- 세번째열 끝 -->						
					<div class="row">
						<div class="col-md-12"></div>
					</div>
				</div>

			</div>
		</div>
	</div>
</section>


<%@ include file="/WEB-INF/views/include/footer.jsp"%>