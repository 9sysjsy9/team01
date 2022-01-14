<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ include file="/WEB-INF/views/company/include/header.jsp"%>
<form action="/company/hire/regist_board_run">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-4">
			</div>
			<div class="col-md-4">
				<h3 style="margin-top: 40px; margin-bottom: 40px;">채용 공고 등록하기</h3>
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
				<div>
					<div class="form-group">
						<label for="exampleInputPassword1"></label><br>
							<input type="radio" style="margin-left:5px; margin-right: 10px;" 
								value="[신입]" name="cate" required>신입
							<input type="radio" style="margin-left:20px; margin-right: 10px;" 
								value="[경력]" name="cate" required>경력
							<input type="radio" style="margin-left:20px; margin-right: 10px;" 
							 	value="[인턴]" name="cate" required>인턴
					</div>
				</div>
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