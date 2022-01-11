<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

<style>
@import url("http://fonts.googleapis.com/earlyaccess/nanumgothic.css");

html {
	height: 100%;
}

body {
	width: 100%;
	height: 100%;
	margin: 0;
	padding-top: 80px;
	padding-bottom: 40px;
	font-family: "Nanum Gothic", arial, helvetica, sans-serif;
	background-repeat: no-repeat;
	background: linear-gradient(to bottom right, #0098FF, #6BA8D1);
}

.card {
	margin: 0 auto; /* Added */
	float: none; /* Added */
	margin-bottom: 10px; /* Added */
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
}

.form-signin .form-control {
	position: relative;
	height: auto;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	padding: 10px;
	font-size: 16px;
}
</style>

<script>
$(function() {
	
	$("#btn-Yes").click(function() {
		var user_id = $("#user_id").val();
		var user_pw = $("#user_pw").val();
		console.log("user_id: "+user_id);
		console.log("user_pw: "+user_pw);
		
		var url = "/user/loginRun";
		var sData = {
				"user_id" : user_id,
				"user_pw" : user_pw
		}
		$.post(url, sData, function(rData){
			console.log("rData: "+rData);
			
			if (rData == 'fail'){
				alert("아이디와 비밀번호를 확인해주세요.");
				location.href = "/user/login";
			} else {
				location.href = "/";
			}
		});
		
	});
	
});
</script>

<div class="card align-middle"
	style="width: 20rem; border-radius: 20px;">
	<div class="card-title" style="margin-top: 30px;">
		<h2 class="card-title text-center" style="color: #113366;">수영 슈즈</h2>
	</div>
	<div class="card-body">
		<form class="form-signin" method="post"
			onSubmit="logincall();return false">
			<h5 class="form-signin-heading" style="text-align: center">환영합니다</h5>
			<label for="inputEmail" class="sr-only">Your ID</label> <br> <input
				type="text" id="user_id" class="form-control" placeholder="Your ID"
				required autofocus> <br>
			<label for="inputPassword" class="sr-only">Password</label> <input
				type="password" id="user_pw" class="form-control"
				placeholder="Password" required><br>
			<div class="checkbox">
				<label> <input type="checkbox" value="remember-me">
					로그인 정보 기억하기
				</label>
			</div>
			<button id="btn-Yes" class="btn btn-lg btn-success btn-block" type="button">
				<b>로 그 인</b>
			</button>
			<a class="btn btn-lg btn-warning btn-block" href="/user/register">
				<b>회 원 가 입</b>
			</a>
		</form>

	</div>
</div>

<div class="modal"></div>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>