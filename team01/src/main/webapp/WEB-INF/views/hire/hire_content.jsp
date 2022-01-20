<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<script>
$(function(){
	$("#btnBack").click(function(){
		location.href = "/hire/hire_all";
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
	.btnBack{
		text-align: right;
	}
</style>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-3">
		</div>
		<div class="col-md-6">
			<form role="form">
				<div class="form-group">
					<label>제목</label>
					<input type="text" class="form-control" readonly value="${hireBoardVo.title }"/>
				</div>
				<div class="form-group">
					<label>내용</label>
					<input type="text" class="form-control" readonly value="${hireBoardVo.content }"/>
				</div>
			</form>
			<div class="btnBack">
				<a class="btn btn-outline-primary" id="btnBack">이전</a>
			</div>
		</div>
		<div class="col-md-3">
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>