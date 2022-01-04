<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
        
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="jumbotron">
				<h2>고객 센터 공지<br></h2>
				<p>수영 슈즈에 오신 것을 환영합니다.<br>
					아래의 공지사항을 확인해주세요.</p>
				<p>
					<a class="btn btn-primary btn-large" href="#">지난 공지 확인</a>
				</p>
			</div>
			<table class="table">
				<thead>
					<tr>
						<th>No.</th>
						<th>항목</th>
						<th>제목</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="noticeVo">
						<tr>
							<td>${noticeVo.notice_no}</td>
							<td>${noticeVo.notice_title}</td>
							<td>${noticeVo.notice_content}</td>
						</tr>
					</c:forEach>
				</tbody>
				
			</table>
			<nav>
				<ul class="pagination">
					<li class="page-item">
						<a class="page-link" href="#">Previous</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">1</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">2</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">3</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">4</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">5</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">Next</a>
					</li>
				</ul>
			</nav>
		</div>
	</div>
</div>
        
<%@ include file="/WEB-INF/views/include/footer.jsp"%>





