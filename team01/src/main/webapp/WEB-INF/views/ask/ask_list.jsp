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
		$("#perPage").change(function() {
			var perPage = $(this).val();
			console.log("perPage: "+perPage);
			$("#frmPaging>input[name=page]").val("${pt.page}");
			$("#frmPaging>input[name=perPage]").val(perPage);
			$("#frmPaging").submit();
			//location.href = "/board3/list_all?page=${pt.page}&perPage="+perPage;
		});
		$("#btnSearch").click(function() {
			var searchType = $("#searchType").val();
			var keyword = $("#keyword").val();
			$("#frmPaging>input[name=page]").val("1");
			$("#frmPaging>input[name=searchType]").val(searchType);
			$("#frmPaging>input[name=keyword]").val(keyword);
			//$("#frmPaging").submit();
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
<%@include file="/WEB-INF/views/ask/include/paging_form.jsp" %>
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
		<h1 class="mt-4">???????????? ?????????</h1>
		<ol class="breadcrumb mb-4">
			<li class="breadcrumb-item active">????????? ????????? ???????????????</li>
		</ol>
		<div class="row">
			<div class="col-xl-3 col-md-6">
				<div
					class="feature bg-primary bg-gradient text-white rounded-3 mb-3">
					<div class="card-body">????????????</div>
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
					<div class="card-body">???????????? ??????</div>
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
					<div class="card-body">?????? ??????</div>
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
					<div class="card-body">????????????</div>
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

		<div class="row">
				<div class="col-md-12">
					<select id="perPage">
						<c:forEach var="v" begin="5" end="30" step="5">
							<option <c:if test="${v == pt.perPage}"> 
							selected
						</c:if> value="${v}">								
								${v}?????? ??????</option>
						</c:forEach>
					</select>
					<select id="searchType" name="searchType">
						<option value="t">??????</option>
						<option value="c">??????</option>
						<option value="w">?????????</option>
						<option value="tc">?????? + ??????</option>
					</select>
					<input type="text" placeholder="????????? ??????" name="keyword" id="keyword">
					<button type="button" class="btn btn-sm btn-success" 
					id="btnSearch">??????</button>
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
						<th>?????? ??????</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="askproductVo">
						<tr>
							<th>${askproductVo.ano}</th>
							<td>${askproductVo.ask_title}</td>
							<td>${askproductVo.ask_content}</td>
							<td class="td regdate">${askproductVo.ask_date}</td>
							<td>
							<c:choose>
							<c:when test="${userData.user_id == askproductVo.user_id}">
							${askproductVo.user_id}
							</c:when>
							<c:otherwise>
							********
							</c:otherwise>
							</c:choose>
							</td> 
							<td><button type="button"
									class="btn btn-outline-dark btn-lg px-7 askContent"
									data-ano="${askproductVo.ano}">????????? ??????</button></td>
						</tr>
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
								href="${pt.startPage-10}">??????</a></li>
						</c:if>
						<c:forEach var="v" begin="${pt.startPage}" end="${pt.endPage}">
							<li class="page-item"><a class="page-link" href="${v}">${v}</a>
							<li class="page-item">
						</c:forEach>
						<li><a class="page-link" href="${pt.endPage+1}">??????</a></li>
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
