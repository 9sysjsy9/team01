<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<head>


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>사내 홈페이지</title>
<!-- Favicon-->
<link rel="icon" type="/image/x-icon" href="/assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/css/styles.css" rel="stylesheet" />
</head>
<body>
<script>

console.log("${loginData}");

$(function(){
	$("#msgimg").click(function(e){
		e.preventDefault();
		console.log("이미지 클릭");
	});
});
</script>
	<!-- Responsive navbar-->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="#">직원 전용</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="/company/main">홈</a></li>
					<li class="nav-item"><a class="nav-link" href="/company/board/notice/notice_list">공지사항</a></li>
					<li class="nav-item"><a class="nav-link" href="/member/company/search_member">사원찾기</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">게시판</a>
						<ul class="dropdown-menu dropdown-menu-end"
							aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#">건의 사항</a></li>
							<li><a class="dropdown-item" href="/company/board/free/free_list">자유 게시판</a></li>
							<li><a class="dropdown-item" href="/company/board/anonymous/anonymous_list">대나무 숲</a></li>
							<li><a class="dropdown-item" href="/company/board/pds/pds_list">자료실</a></li>
						</ul></li>
			<c:if test="${loginData.authority >= 2}">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">제품관리</a>
						<ul class="dropdown-menu dropdown-menu-end"
							aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="/product/company/product_list">제품목록</a></li>
							<li><a class="dropdown-item" href="/product/company/product_regist">제품등록</a></li>
							<li><a class="dropdown-item" href="#">파손/불량</a></li>
						</ul></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">고객관리</a>
						<ul class="dropdown-menu dropdown-menu-end"
							aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="/hire/company/regist_list">채용문의 관리</a></li>
							<li><a class="dropdown-item" href="/store/company/applyFranList?replyState=a">가맹문의 관리</a></li>
							<li><a class="dropdown-item" href="#">제품문의 관리</a></li>
							<li><a class="dropdown-item" href="/customer/company/csList">CS문의 관리</a></li>
						</ul></li>
			</c:if>
			<c:if test="${loginData.authority >= 3}">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">관리자메뉴</a>
						<ul class="dropdown-menu dropdown-menu-end"
							aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="/member/company/memberApproveList">가입 승인</a></li>
							<li><a class="dropdown-item" href="/member/company/memberManageList">사원 관리</a></li>
						</ul></li>
			</c:if>
					<li class="nav-item"><a class="nav-link" href="/schedule/company/scheduleCalendar">회사일정</a></li>
					<li class="nav-item">
						<a class="nav-link active" href="/member/company/myPage">${loginData.username}<img src="/images/msgoff.png" style="width:20px" id="msgimg"></a>
						
					</li>

					<li class="nav-item"><a class="nav-link" href="/member/logout">로그아웃</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<br>
	<br>
	<br>
