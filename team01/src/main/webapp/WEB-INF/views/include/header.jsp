<!-- 기능 담당자 : 고만재 -->
<!-- 권한별 메뉴 구분 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>SooyounhShoese</title>
<link rel="icon" type="/image/x-icon" href="/assets/favicon.ico" />
<link href="/css/styles.css" rel="stylesheet" />
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top">
		<div class="container">
			<a class="navbar-brand" href="#">SooYoungShoese</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="/">홈</a></li>

					<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">채용안내</a>
						<ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="/hire/hire_home">채용공고</a></li>
							<li><a class="dropdown-item" href="/hire/hire_regist">채용지원</a></li>
							<li><a class="dropdown-item" href="/hire/hire_search">채용조회</a></li>
						</ul></li>
					<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">매장안내</a>
						<ul class="dropdown-menu dropdown-menu-end"
							aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="/store/findStore">매장찾기</a></li>
							<li><a class="dropdown-item" href="/store/applyFranchise">가맹점
									문의</a></li>
						</ul></li>
					<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">제품안내</a>
						<ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="/product/product_index">제품정보</a></li>
							<li><a class="dropdown-item" href="/ask/ask_list">제품문의</a></li>
						</ul></li>

					<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">고객센터</a>
						<ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="/customer/notice">공지사항</a></li>
							<li><a class="dropdown-item" href="/customer/qna">질문과 답변</a></li>
							<li><a class="dropdown-item" href="/customer/csMain">CS센터</a></li>
						</ul></li>
					
					<c:if test="${userData != null}">	
						<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">마이페이지</a>
							<ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="/user/mine">나의 정보</a></li>
							<li><a class="dropdown-item" href="/user/orderList">주문 확인</a></li>
							<li><a class="dropdown-item" href="/user/user_basket">장바구니</a></li>
						</ul></li>
					</c:if>	
						
					<li class="nav-item"><a class="nav-link" href="/company/main">사원 메뉴</a></li>
					<li class="nav-item"><a class="nav-link" href="/user/login">로그인</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<br>
	<br>
	<br>
	
	<script>
	
	console.log("${userData}");
	</script>