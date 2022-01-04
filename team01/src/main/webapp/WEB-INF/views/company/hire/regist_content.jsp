<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ include file="/WEB-INF/views/company/include/header.jsp"%> 

<div class="container-fluid">
	<div class="row">
		<div class="col-md-3">
		</div>
		<div class="col-md-6">
			<form role="form">
				<div class="form-group">
					<label for="exampleInputEmail1">지원자 이름</label>
					<input type="text" class="form-control" id="exampleInputEmail1" readonly value="${hireVo.name }"/>
				</div>
				<div class="form-group">
					 
					<label for="exampleInputPassword1">
						자기소개
					</label>
					<input type="text" class="form-control" id="exampleInputPassword1" readonly value="${hireVo.content }"/>
				</div>
				
				<div>
					<a class="btn btn-outline-dark flex-shrink-0" href="regist_list">이전</a>
					<a class="btnDelete btn btn-outline-dark flex-shrink-0" 
						href="/hire/delete_list?hno=${hireVo.hno}">삭제</a>
				</div>
			</form>
		</div>
		<div class="col-md-3">
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>