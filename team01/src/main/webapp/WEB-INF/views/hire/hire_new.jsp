<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<div class="row gx-4 gx-lg-5 align-items-center my-5">
	<div class="col-lg-5" >
		<h1 class="font-weight-light" style="margin-left:50px;">진행 중인 채용공고</h1>
	</div>
</div>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2">
			<div class="border-end bg-white" id="sidebar-wrapper">
				<div class="list-group list-group-flush">
					<a class="list-group-item list-group-item-action list-group-item-light p-3"href="hire_all">전체 보기</a>
					<a class="list-group-item list-group-item-action list-group-item-light p-3"href="hire_new">신입 채용</a>
					<a class="list-group-item list-group-item-action list-group-item-light p-3"href="hire_experience">경력 채용</a>
					<a class="list-group-item list-group-item-action list-group-item-light p-3"href="hire_intern">인턴 채용</a>
				</div>
			</div>
		</div>
		<div class="col-md-10">
			<div id="page-content-wrapper">
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<table class="table">
							<thead>
								<c:forEach  items="${list}" var="hireVo">
									<tr>
										<td>${hireVo.bno }</td>
										<td>${hireVo.cate }</td>
										<td><a href="${hireVo.title }">${hireVo.title }</a></td>
										<td>${hireVo.regdate }</td>
										<td>${hireVo.writer }</td>
									</tr>
								</c:forEach>
							</thead>
						</table>
					<nav>
						<ul class="pagination">
							<li class="page-item"><a class="page-link" href="#">Previous</a>
							</li>
							<li class="page-item"><a class="page-link" href="#">1</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#">4</a></li>
							<li class="page-item"><a class="page-link" href="#">5</a></li>
							<li class="page-item"><a class="page-link" href="#">Next</a>
							</li>
						</ul>
					</nav>
				</div>
				<div class="col-md-2"></div>
				</div>
			</div>
		</div>
	</div>
</div>
	
<%@ include file="/WEB-INF/views/include/footer.jsp"%>