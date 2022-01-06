<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
<!-- Favicon-->
<link rel="icon" type="/image/x-icon" href="/assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/css/styles.css" rel="stylesheet" />
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="#">사내 페이지</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link" href="/">나가기</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- Product section-->
	<section class="py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="row gx-4 gx-lg-5 align-items-center">
				<div class="col-md-2"></div>


				<div class="col-md-4">
					<img class="card-img-top mb-5 mb-md-0" src="/images/login.jpg" />
				</div>


				<div class="col-md-4">
					<div class="row">
						<div class="col-md-12">
							<form role="form" action="/company/member/loginRun">
								<div class="form-group">
									<h1 class="display-5 fw-bolder" id="store">로그인</h1>
									<label for="userid"> ID </label> <input
										type="text" class="form-control" id="userid" name="userid"
										placeholder="Your ID" />
								</div>
								<div class="form-group">

									<label for="userpw"> Password </label> <input
										type="password" class="form-control"
										id="userpw" name="userpw" placeholder="Your Password" />
								</div>

								<div class="checkbox">
									<label> <input type="checkbox" /> 기억하기
									</label>
								</div>
								<button type="submit"
									class="btn btn-outline-primary flex-shrink-0">로그인</button>
								<button type="button"
									class="btn btn-outline-primary flex-shrink-0">가입요청</button>
							</form>

						</div>


					</div>
				</div>

				<div class="col-md-2"></div>
			</div>
		</div>
	</section>


	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="/js/scripts.js"></script>
</body>
</html>

