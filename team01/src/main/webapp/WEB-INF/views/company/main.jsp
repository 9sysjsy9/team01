<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/company/include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Product section-->
<style>
a{
text-decoration:none;
}
</style>
<section class="py-5">
	<div class="container">
		<div class="rowalign-items-center">
			<div class="container-fluid">
				<div class="container-fluid">
<!-- 세번쨰열 시작 -->	

            <div class="text-center">
                <h1>사내 페이지</h1>
                <p class="lead">수영 슈즈의 사원 전용 페이지 입니다.</p>
            </div>
					<div class="row">
						<div class="col-md-2"></div>
						
						<div class="col-md-4">
						<h4>마이 메뉴</h4>
							<div class="form-control"><a href="/message/company/receiveMessageList" style="text-decoration:none">확인하지 않은 메시지가 <b>${messageCount}</b>건 있습니다.</a></div>
						</div>
						<div class="col-md-4">
							<c:if test="${loginData.authority >= 2}">
							<h4>관리자 메뉴</h4>
							<div class="form-control"><a href="/store/company/applyFranList">답변하지 않은 가맹 지원이 <b>${applyCount}</b>건 있습니다.</a></div>
							<div class="form-control"><a href="/member/company/memberApproveList">확인하지 않은 가입 신청이 <b>${memberApproveCount}</b>건 있습니다.</a></div>
							</c:if>
						</div>
						<div class="col-md-2"></div>
					</div>
					
					<div class="row">
						<div class="col-md-2"></div>
						<div class="col-md-8"><hr></div>
						<div class="col-md-2"></div>
					</div>
					
<!-- 세번째열 끝 -->						
<!-- 첫번째 열 시작 -->
					<div class="row">
					
						<div class="col-md-2"></div>
						<div class="col-md-4">
						<h4>공지사항</h4>
							<table class="table table-sm table-hover table-bordered">
								<thead>
									<tr>
										<th >제목</th>
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
							<table class="table table-sm table-hover table-bordered">
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
							<table class="table table-sm table-hover table-bordered">
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
							<table class="table table-sm table-hover table-bordered">
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
					<div class="row">
						<div class="col-md-12"></div>
					</div>
				</div>

			</div>
		</div>
	</div>
</section>


<%@ include file="/WEB-INF/views/include/footer.jsp"%>