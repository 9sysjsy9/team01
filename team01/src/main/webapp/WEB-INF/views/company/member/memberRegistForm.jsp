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
<script>

$(function(){
	var msg = "";

	
	$("#registRunBtn").click(function(e){
		var inputResult = true;
		$("#msgspan").text("");
		e.preventDefault();
		var phone = $("#phone1").val() + '-' + $("#phone2").val() + '-' + $("#phone3").val();
		$("#phone").val(phone);
		var userid = $("#userid").val();
		var userpw = $("#userpw").val();
		var chkuserpw = $("#chkuserpw").val();
		console.log("userpw : "+ userpw);
		console.log("chkuserpw : "+ chkuserpw);
		var username = $("#username").val();
		var eno = $("#eno").val();
		var gender = $("#gender").val();
		var email = $("#email").val();
		
		if(userid == "" || userid == null){
			msg = "아이디를 입력해 주세요.";
			inputResult = false;
		} else if (userpw == "" || userpw == null){
			msg = "비밀번호를 입력해 주세요.";
			inputResult = false;
		} else if (userpw != chkuserpw){
			msg = "패스워드가 일치하지 않습니다.";
			inputResult = false;
		} else if (eno == "" || eno == null){
			msg = "사번을 입력해 주세요.";
			inputResult = false;
		} else if (username == "" || username == null){
			msg = "이름을 입력해 주세요.";
			inputResult = false;
		}  else if (phone.length < 12){
			msg = "전화번호를 확인해 주세요.";
			inputResult = false;
		} else if (email == "" || email == null){
			msg = "이메일을 입력해 주세요.";
			inputResult = false;
		}
		
		
		//해당 변수의 값이 공백인 경우 비동기 전송하기위해 값 변환
		if(userid == ""){
			userid = " ";
		}
		if(eno == ""){
			eno = 0;
		}
		
		var url = "/member/checkState";
		var sData = {
				"eno" : eno,
				"userid" :userid
		}
		$.post(url, sData, function(rData){
			console.log(rData.checkId);
			console.log(rData.checkEno);
			
			if (rData.checkId > 0){
				msg = "사용중인 아이디 입니다.";
				inputResult = false;
			} else if (rData.checkEno > 0){
				msg = "가입된 사번 입니다.";
				inputResult = false;
			}
			
			$("#msgspan").text(msg);
			
			if(inputResult == true){		
				$("#memberRegistForm").submit();
			}
		});
	});
});
</script>
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
							<form role="form" action="/member/registRun" method="post" id="memberRegistForm">
							<input type="hidden" name="phone" id="phone">
							<div class="form-group">
									<h1 class="display-5 fw-bolder" id="store">가입 신청</h1>
									</div>
								<div class="form-group input-group-sm">
									<label for="userid"> 아이디 </label> <input
										type="text" class="form-control" id="userid" name="userid"
										placeholder="Your ID" maxlength="10"/>
								</div>
								
								<div class="form-group input-group-sm">
									<label for="userpw"> 패스워드 </label> <input
										type="password" class="form-control"
										id="userpw" name="userpw" placeholder="Your Password" maxlength="10" />
								</div>
								
								<div class="form-group input-group-sm" >
									<label for="chkuserpw"> 패스워드 확인
									 </label> <input
										type="password" class="form-control"
										id="chkuserpw" name="chkuserpw" placeholder="Your Password" maxlength="10"/>
								</div>
								
								<div class="form-group input-group-sm">
									<label for="eno"> 사번 </label> <input
										type="text" class="form-control" id="eno" name="eno"
										placeholder="Employee Id Num" maxlength="4" />
								</div>
								
								<div class="form-group input-group-sm">
									<label for="username"> 이름 </label> <input
										type="text" class="form-control" id="username" name="username"
										placeholder="Name" maxlength="14"/>
								</div>
														
								<div class="form-group input-group-sm">
									<label for="gender"> 성별 </label>
									
									<select class="form-control" name="gender" id="gender">
										<option value="m"> Male </option>
										<option value="f"> FeMale </option>
									</select>
									
								</div>
								
								<div><label for="phone1"> 전화전호 </label></div>
								<div class="form-group input-group input-group-sm">
									 <input
										type="text" class="form-control" id="phone1"
										placeholder="010" maxlength="3"  /> - <input
										type="text" class="form-control" id="phone2"
										placeholder="1234" maxlength="4" /> - <input
										type="text" class="form-control" id="phone3"
										placeholder="5678" maxlength="4" />
								</div>
								
								<div class="form-group input-group-sm">
									<label for="email"> 이메일 </label> <input
										type="email" class="form-control" id="email" name="email"
										placeholder="Email" maxlength="30" />
								</div>
								<span id="msgspan" style="color:red"> </span>
								<br>
								<button type="button"
									class="btn btn-outline-primary flex-shrink-0" id="registRunBtn">가입요청</button>


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

