<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<script src="/js/myscript.js"></script>
<script>
$(function() {
	
});
</script>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="jumbotron">
				<h2>문의 양식</h2>
				<p>
					<a class="btn btn-primary btn-large" href="/ask/ask_list">목록으로</a>
				</p>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<form role="form" action="/ask/ask_regist_run" id="frmRegist"
				method="post">
				<div class="form-group">
					<label for="title">글제목</label>
					<input type="text" class="form-control" 
						id="title" name="title" required="required"/>
				</div>
				<div class="form-group">
					<label for="content">글내용</label>
					<textarea class="form-control" 
						id="content" name="content"></textarea>
				</div>
				<div class="form-group">
					<label for="content">이름</label>
					<input type="text" class="form-control" 
						id="name" name="name">
				</div>
				<div class="form-group">
					<label for="content">이메일</label>
					<input type="text" class="form-control" 
						id="email" name="email">
				</div>
				<div style="clear:both;">
					<button type="submit" class="btn btn-primary">
						작성 완료
					</button>
				</div>
			</form>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>