<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ include file="/WEB-INF/views/company/include/header.jsp"%> 
<script>
$(function(){
	$(".btnSuccess").click(function(e){
		e.preventDefault();
		var state = $(this).attr("data-state");
		if(state == "unknown"){
			alert("합격 통지가 완료되었습니다.");
			location.href = "/company/hire/modify_success?hno=${hireVo.hno}";
		} else if(state == "success"){
			alert("이미 합격 통지를 하셨습니다.");
		} else {
			alert("이미 불합격 통지를 하셨습니다.")
		}
	});
	$(".btnFail").click(function(e){
		e.preventDefault();
		var state = $(this).attr("data-state");
		if(state == "unknown"){
			alert("불합격 통지가 완료되었습니다.");
			location.href = "/company/hire/modify_fail?hno=${hireVo.hno}";
		} else if(state == "fail"){
			alert("이미 불합격 통지를 하셨습니다.");
		} else {
			alert("이미 합격 통지를 하셨습니다.")
		}
	});
});
</script>
<style>
	.tag{
	   text-align: right;
	}
	.tag2{
	   text-align: center;
	}
</style>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-3">
		</div>
		<div class="col-md-6">
			<form role="form">
				<div class="form-group">
					<label>지원자 이름</label>
					<input type="text" class="form-control" readonly value="${hireVo.name }"/>
				</div>
				<div class="form-group">
					 
					<label>자기소개</label>
					<input type="text" class="form-control" readonly value="${hireVo.content }"/>
				</div>
				
				<div class="tag">
					<a class="btn btn-outline-dark flex-shrink-0" href="regist_list">이전</a>
					<a class="btn btn-outline-danger flex-shrink-0"
						href="/hire/delete_list?hno=${hireVo.hno}">삭제</a>
				</div>
				
				<div class="tag2">
					<a class="btnSuccess btn btn-outline-primary" data-state="${hireVo.state }">합격</a>
					<a class="btnFail btn btn-outline-danger" data-state="${hireVo.state }">불합격</a>
				</div>
				 
			</form>
		</div>
		<div class="col-md-3">
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>