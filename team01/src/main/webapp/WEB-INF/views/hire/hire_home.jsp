<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<div class="container px-4 px-lg-5">
		<!-- Heading Row-->
		<div class="row gx-4 gx-lg-5 align-items-center my-5">
			<div class="col-lg-5">
				<h1 class="font-weight-light">진행 중인 채용공고</h1>
				<p></p>
				<a class="btn btn-outline-dark flex-shrink-0" href="hire_all">전체 공고 보기</a>
			</div>
		</div>
		<div class="card text-white bg-secondary my-5 py-4 text-center">
			<div class="card-body">
				<p class="text-white m-0">여러분들을 언제든지 환영합니다!</p>
			</div>
		</div>
		<div class="row gx-4 gx-lg-5">
			<div class="col-md-4 mb-5">
				<div class="card h-100">
					<div class="card-body">
						<h2 class="card-title">신입 채용</h2>
					</div>
					<div class="card-footer">
						<a class="btn btn-outline-dark flex-shrink-0" href="hire_new">신입채용공고 보기</a>
					</div>
				</div>
			</div>
			<div class="col-md-4 mb-5">
				<div class="card h-100">
					<div class="card-body">
						<h2 class="card-title">경력 채용</h2>
					</div>
					<div class="card-footer">
						<a class="btn btn-outline-dark flex-shrink-0" href="hire_experience">경력채용공고 보기</a>
					</div>
				</div>
			</div>
			<div class="col-md-4 mb-5">
				<div class="card h-100">
					<div class="card-body">
						<h2 class="card-title">인턴 채용</h2>
					</div>
					<div class="card-footer">
						<a class="btn btn-outline-dark flex-shrink-0" href="hire_intern">인턴채용공고 보기</a>
					</div>
				</div>
			</div>
			<div class="col-lg-5">
				<a class="btn btn-outline-dark flex-shrink-0" href="hire_regist">채용 지원하기</a>
			</div>
		</div>
	</div>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>