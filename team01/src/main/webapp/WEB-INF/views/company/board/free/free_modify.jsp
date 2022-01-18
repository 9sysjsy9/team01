<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ include file="/WEB-INF/views/company/include/header.jsp"%> 
<style>
	.btnMC {
		text-align: right;
	}
</style>
<script>
$(function(){
	$(function(){
		$("#btnCancel").click(function(){
			var bno = $(this).attr("data-bno");
			location.href = "/company/board/free/free_content?bno="+bno;
		});
		
		$("#btnModify").click(function(){
			var bno = $(this).attr("data-bno"); 
			var title = $("#title").val();
			var content = $("#content").val();
			console.log(bno,title,content);
			location.href = "/company/board/free/free_modify_run?bno=" + bno + "&title=" + title + "&content=" + content;
		});
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
						<h3>
							<input type="text" value="${boardVo.title }" id="title" name="title"></input>
						</h3>
					</div>	
				</div>
				<div ${boardVo.username }></div>
				<hr>
				<div>
					<input type="text" value="${boardVo.content }" id="content" name="content"></input>
				</div>
				<hr>
				<div class="btnMC">
					<a class="btn btn-outline-warning" id="btnModify" data-bno="${boardVo.bno }">수정</a>
					<a class="btn btn-outline-danger" id="btnCancel" data-bno="${boardVo.bno }">취소</a>
				</div>
			</form>
		</div>
		<div class="col-md-3">
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>