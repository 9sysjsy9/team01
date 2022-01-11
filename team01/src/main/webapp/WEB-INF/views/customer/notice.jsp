<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<style>
	.title {
			cursor: pointer;
		}
	.content {
		display: none
	}
	.title > th, .content > td {
		padding-left: 110px;
	}
</style>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
$(function(){
	$(".title").click(function(){
        $(this).next().children().fadeToggle(500);
     });
});
</script>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="jumbotron" style="padding: 10px;"><br>
				<h1 style="padding-left: 110px;"><b>공지 사항</b><br>
				</h1>
				<br>
<!-- 				<p> -->
				<h5 style="padding-left: 110px;">수영 슈즈에 오신 것을 환영합니다. 
					아래의 공지사항을 확인해주세요.</h5>
<!-- 					</p> -->
					
			</div>
			<table class="table">
			
			<tbody>
			<c:forEach items="${list}" var="noticeVo">
				<tr class="table-warning title">
					<th style="padding-left: 130px">
						${noticeVo.notice_no}</th>
					<th>${noticeVo.notice_title}</th>
					<th style="padding-right: 130px">
						${noticeVo.notice_date}</th>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td class="content">${noticeVo.notice_content}</td>
				</tr>
			</c:forEach>
			</tbody>
			</table>
			<div class="col-md-12">
				<ul class="pagination justify-content-center">
					<li class="page-item"><a class="page-link" href="#">이전</a>
					</li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">4</a></li>
					<li class="page-item"><a class="page-link" href="#">5</a></li>
					<li class="page-item"><a class="page-link" href="#">다음</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>





