<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ include file="/WEB-INF/views/company/include/header.jsp"%>
<form action="/company/board/anonymous/regist_run" method="get">
<input type="hidden" name="bate">
<input type="hidden" name="userid" value="${loginData.userid }">
<input type="hidden" name="username" value="${loginData.username }">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-4">
			</div>
			<div class="col-md-4">
				<h3 style="margin-top: 40px; margin-bottom: 40px;">대나무숲 글쓰기</h3>
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
					<div class="form-group">
						<input type="text" class="form-control" id="title" name="title" 
						placeholder="제목을 입력해주세요" name="title"/>
					</div>
					<div class="form-group">
						<textarea rows="20" cols="80" placeholder="내용을 입력하세요" name="content"></textarea>
					</div>
					<button type="submit" class="btn btn-outline-dark flex-shrink-0" id="btnRegist">
						등록
					</button>
			</div>
			<div class="col-md-4">
			</div>
		</div>
	</div>
</form>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>