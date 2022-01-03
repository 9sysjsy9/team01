<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function() {
		var regdate = $(".regdate").text();
		console.log("regdate: " + regdate);
		if (regdate != null || regdate != "") {
			regdate = changeDateString(regdate);
		}

		$(".askContent").click(function() {
			var ano = $(this).attr("data-ano");
			location.href = "/ask/ask_content?ano="+ano;
		});
		
		$(".page-link").click(function(e) {
			e.preventDefault();
			var page = $(this).attr("href");
			location.href = "/ask/ask_list?page=" + page;
		});

	});

	function changeDateString(timestamp) {
		var d = new Date(timestamp);
		var year = d.getFullYear();
		var month = d.getMonth() + 1;
		var date = d.getDate();
		var hour = d.getHours();
		var minute = d.getMinutes();
		var second = d.getSeconds();
		var dateString = year + "-" + month + "-" + date + " ";
		dateString += hour + ":" + minute + ":" + second;
		return dateString;
	};
</script>

<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
	<!-- Navbar Brand-->
	<a class="navbar-brand ps-3" href="index.html">Start Bootstrap</a>
	<!-- Sidebar Toggle-->
	<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
		id="sidebarToggle" href="#">
		<i class="fas fa-bars"></i>
	</button>
</nav>
<div id="layoutSidenav_content">
	<div class="container-fluid px-4">
		<h1 class="mt-4">고객문의</h1>
		<ol class="breadcrumb mb-4">
			<li class="breadcrumb-item active">원하는 기능를 선택하세요</li>
		</ol>
		<div class="row">
			<div class="col-xl-3 col-md-6">
				<div
					class="feature bg-primary bg-gradient text-white rounded-3 mb-3">
					<div class="card-body">문의하기</div>
					<div
						class="card-footer d-flex align-items-center justify-content-between">
						<a class="small text-white stretched-link"
							href="/ask/ask_regist_form">View Details</a>
						<div class="small text-white">
							<i class="fas fa-angle-right"></i>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xl-3 col-md-6">
				<div
					class="feature bg-primary bg-gradient text-white rounded-3 mb-3">
					<div class="card-body">자주하는 질문</div>
					<div
						class="card-footer d-flex align-items-center justify-content-between">
						<a class="small text-white stretched-link" href="#">View
							Details</a>
						<div class="small text-white">
							<i class="fas fa-angle-right"></i>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xl-3 col-md-6">
				<div
					class="feature bg-primary bg-gradient text-white rounded-3 mb-3">
					<div class="card-body">나의 문의</div>
					<div
						class="card-footer d-flex align-items-center justify-content-between">
						<a class="small text-white stretched-link" href="#">View
							Details</a>
						<div class="small text-white">
							<i class="fas fa-angle-right"></i>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xl-3 col-md-6">
				<div
					class="feature bg-primary bg-gradient text-white rounded-3 mb-3">
					<div class="card-body">고객센터</div>
					<div
						class="card-footer d-flex align-items-center justify-content-between">
						<a class="small text-white stretched-link" href="#">View
							Details</a>
						<div class="small text-white">
							<i class="fas fa-angle-right"></i>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="card-body">
			<table id="datatablesSimple" class="table">
				<thead>
					<tr>
						<th>ano</th>
						<th>title</th>
						<th>content</th>
						<th>regdate</th>
						<th>name</th>
						<th>email</th>
						<th>목록 보기</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="askproductVo">
						<tr>
							<th>${askproductVo.ano}</th>
							<td>${askproductVo.title}</td>
							<td>${askproductVo.content}</td>
							<td class="td regdate">${askproductVo.regdate}</td>
							<td>${askproductVo.name}</td>
							<td>${askproductVo.email}</td>
							<td><button type="button"
									class="btn btn-outline-dark btn-lg px-7 askContent"
									data-ano="${askproductVo.ano}" id="askContent">자세히 보기</button></td>
						</tr>
						<!--
							<form action="/ask/ask_content" method="get" id="frmAskContent" class="frmAskContent">
								<input type="hidden" name=ano value="${askproductVo.ano}">
								<input type="hidden" name=title value="${askproductVo.title}">
								<input type="hidden" name=content value="${askproductVo.content}"> 
								<input type="hidden" name=regdate value="${askproductVo.regdate}"> 
								<input type="hidden" name=name value="${askproductVo.name}"> 
								<input type="hidden" name=email value="${askproductVo.email}">
							</form>
							-->
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<nav>
					<ul class="pagination">
						<c:if test="${pt.startPage!=1}">
							<li class="page-item"><a class="page-link"
								href="${pt.startPage-10}">이전</a></li>
						</c:if>
						<c:forEach var="v" begin="${pt.startPage}" end="${pt.endPage}">
							<li class="page-item"><a class="page-link" href="${v}">${v}</a>
							<li class="page-item">
						</c:forEach>
						<li><a class="page-link" href="${pt.endPage+1}">다음</a></li>
					</ul>
				</nav>
			</div>
		</div>
	</div>
</div>

<footer class="py-4 bg-light mt-auto">
	<div class="container-fluid px-4">
		<div class="d-flex align-items-center justify-content-between small">
			<div class="text-muted">Copyright &copy; Your Website 2021</div>
			<div>
				<a href="#">Privacy Policy</a> &middot; <a href="#">Terms &amp;
					Conditions</a>
			</div>
		</div>
	</div>
</footer>



<%@ include file="/WEB-INF/views/include/footer.jsp"%>
