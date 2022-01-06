<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ include file="/WEB-INF/views/company/include/header.jsp"%>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-4">
		</div>
		<div class="col-md-4">
			<h3 style="margin-top: 40px; margin-bottom: 40px;">자유 게시판 글쓰기</h3>
		</div>
		<div class="col-md-4">
		</div>
	</div>
</div>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-4">
		</div>
		<div class="col-md-4">
			<form role="form">
				<div class="form-group">
					<input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력해주세요"/>
				</div>
				<div class="form-group">
					<textarea rows="20" cols="80" placeholder="내용을 입력하세요"></textarea>
				</div>
				
				
				<button type="submit" class="btn btn-outline-dark flex-shrink-0">
					등록
				</button>
			</form>
		</div>
		<div class="col-md-4">
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>