<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/company/include/header.jsp"%>
<script>
$(function() {
	$(".title").click(function(e) {
		e.preventDefault();
		var hno = $(this).attr("href");
		console.log("hno:", hno);
		location.href = "/hire/company/regist_content?hno=" + hno;
	});
	$("#btnRegist").click(function(){
		var authority = ${loginData.authority };
		if(authority != 3){
			alert("권한이 없습니다.");
		} else {
			location.href = "/company/hire/regist_board";
		}
	});
	$("#btnDelete").click(function(){
		var authority = ${loginData.authority };
		if(authority != 3){
			alert("권한이 없습니다.");
		} else {
			location.href = "/hire/company/companyHire_all";
		}
	});
});
</script>
<style>
.btnDR {
	text-align: right;
	margin-top: 30px;
	margin-bottom: 30px;
}
.list {
	margin-top: 100px;
}
</style>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-3"></div>
		<div class="col-md-6">
			<div class="list">
				<h1 class="font-weight-light" style="margin-left: 50px;">지원자리스트</h1>
			</div>
			<div class="btnDR">
				<a class="btn btn-outline-danger flex-shrink-0" id="btnDelete">채용공고삭제</a>
				<a class="btn btn-outline-dark flex-shrink-0" id="btnRegist">채용공고 등록</a>
			</div>
			<table class="table">
				<thead>
					<thead>
						<tr>
							<th>#</th>
							<th>이름</th>
							<th>이메일</th>
							<th>전화번호</th>
							<th>분류</th>
							<th>확인</th>
						</tr>
					</thead>
					<c:forEach items="${list}" var="hireVo">
						<tr>
							<td>${hireVo.hno }</td>
							<td><a class="title" href="${hireVo.hno }">${hireVo.name }</a></td>
							<td>${hireVo.email }</td>
							<td>${hireVo.phonnum }</td>
							<td>${hireVo.career }</td>
							<td>${hireVo.result }</td>
						</tr>
					</c:forEach>
			</table>
		</div>
		<div class="col-md-3"></div>
	</div>
</div>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>