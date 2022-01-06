<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ include file="/WEB-INF/views/company/include/header.jsp"%> 
<style>
	.move{
		text-align: right;
	}
</style>
<script>
$(function(){
	$("#btnPrev").click(function(){
// 		location.href = "/free/free_content?bno=596";
	});
	
	$("#btnNext").click(function(){
		
	});
});
</script>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-3">
		</div>
		<div class="col-md-6">
			<form role="form">
				<div class="form-group">
					<h1 class="display-5 fw-bolder" id="store"
						style="margin-bottom: 50px; margin-top: 50px;">자유게시판</h1>
					<div>
						${boardVo.title }
					</div>	
				</div>
				<div class="form-group">${boardVo.username }</div>
				<hr>
				<div>${boardVo.content }</div>
				<hr>
				<div class="move">
					<a class="btnPrev btn btn-outline-primary" id="btnPrev">이전</a>
					<a class="btnNext btn btn-outline-primary" id="btnNext">다음</a>
				</div>
			</form>
		</div>
		<div class="col-md-3">
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>