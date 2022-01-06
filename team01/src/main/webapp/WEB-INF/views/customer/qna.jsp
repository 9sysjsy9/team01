<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<style>

	.qask {
		cursor: pointer;
	}
	.qanswer{
		display : none
	}
	
	.qask > th, .qanswer > td {
		padding-left: 110px;
	}
	
</style>

	

<script src="https://code.jquery.com/jquery-latest.js"></script>

<script type="text/javascript">
$(function(){
	$(".qask").click(function(){
        $(this).next().fadeToggle(500);
     });
});
</script>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="page-header">
				<h1 style="padding-left: 110px;"><b><br>질문과 답변</b></h1>
			</div>

			<p><br><h5 style="padding-left: 110px;">1:1 문의 전에 자주 하는 질문들을 확인해주세요</h5></p>
					<br><br><br>
		</div>
		<nav class="navbar navbar-expand-lg navbar-light bg-light">

			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1">
			</button>
			<a class="navbar-brand" href="#" style="padding-left: 110px;">자주하는 질문</b></a>
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="navbar-nav">
										
				</ul>
				<form class="form-inline">
					<input class="form-control mr-sm-2" type="text" />
					<button class="btn btn-primary my-2 my-sm-0" type="submit">
						검색</button>
				</form>
			</div>
		</nav>
		<table class="table">
			<thead>
				<tr>
					<th><br></th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${list}" var="faqVo">
				<tr class="table-warning qask">
					<th style="padding-left: 110px;">${faqVo.faq_title}</th>
				</tr>
				<tr class="qanswer">
					<td>${faqVo.faq_content}
					</td>
				</tr>
			
			</c:forEach>
				
			</tbody>
		</table>
		<nav>
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
		</nav>
	</div>
</div>
</div>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>