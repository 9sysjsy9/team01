<!-- 기능 담당자 : 고만재 -->
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
<link href="/css/styles.css" rel="stylesheet" />

<script>
//상태에 따른 결과 메시지
if("${msg}" == "fail"){
	alert("아이디와 비밀번호를 확인해주세요.")
} else if ("${msg}" == "registSuccess"){
	alert("정상적으로 등록 신청 되었습니다.")
} else if ("${msg}" == "waitingApprove"){
	alert("사용 승인 대기중 입니다.")
} else if ("${msg}" == "logout"){
	alert("로그아웃 되었습니다.")
}

$(function(){
//로그인 기능 구현
	var cookie_user_id = getLogin();
	if(cookie_user_id != "") {
		$("#userid").val(cookie_user_id);
		$("#idSaveCheck").attr("checked", true);
	}

	$("#loginBtn").on("click", function(){
		if($("#idSaveCheck").is(":checked")){
			saveLogin($("#userid").val());
		}else{
			saveLogin("");
		}
	});
});

//아이디 자동 저장 기능 구현
function saveLogin(id) {
	if(id != "") {
		setSave("userid", id, 7);
	}else{
		setSave("userid", id, -1);
	}
}

function setSave(name, value, expiredays) {
	var today = new Date();
	today.setDate( today.getDate() + expiredays );
	document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + today.toGMTString() + ";"
}

function getLogin() {
	var cook = document.cookie + ";";
	var idx = cook.indexOf("userid", 0);
	var val = "";

	if(idx != -1) {
		cook = cook.substring(idx, cook.length);
		begin = cook.indexOf("=", 0) + 1;
		end = cook.indexOf(";", begin);
		val = unescape(cook.substring(begin, end));
	}
	return val;
}

</script>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
	<div class="container">
		<a class="navbar-brand" href="#">사내 페이지</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link" href="/">나가기</a></li>
			</ul>
		</div>
	</div>
</nav>
	<!-- section-->
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
						<form role="form" action="/member/loginRun" method="post">
							<div class="form-group input-group-sm">
								<h1 class="display-5 fw-bolder" id="store">로그인</h1>
								<label for="userid"> ID </label> <input type="text" class="form-control" id="userid" name="userid" placeholder="Your ID" />
							</div>
							<div class="form-group input-group-sm">

								<label for="userpw"> Password </label> <input type="password" class="form-control" id="userpw" name="userpw" placeholder="Your Password" />
							</div>

							<div class="checkbox">
								<label> 
								<input type="checkbox" id="idSaveCheck"/> 기억하기
								</label>
							</div>
							<button type="submit" class="btn btn-outline-primary flex-shrink-0" id="loginBtn">로그인</button>
							<a href="/member/registForm" class="btn btn-outline-primary flex-shrink-0">가입요청</a>
						</form>
					</div>
				</div>
			</div>

			<div class="col-md-2"></div>
		</div>
	</div>
</section>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="/js/scripts.js"></script>
</body>
</html>

