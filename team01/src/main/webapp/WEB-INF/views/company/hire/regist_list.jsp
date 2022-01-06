<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/company/include/header.jsp"%>
<script>
$(function(){
	$(".title").click(function(e) {
		e.preventDefault();
		var hno = $(this).attr("href");
		console.log("hno:", hno);
		location.href = "/hire/company/regist_content?hno="+hno;
	});
});
</script>
<div class="row gx-4 gx-lg-5 align-items-center my-5">
	<div class="col-md-2"></div>
		<div class="col-lg-5" >
			<h1 class="font-weight-light" style="margin-left:50px;">지원자 리스트</h1>
		</div>
	<div class="col-md-2"></div>
</div>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-10">
			<div id="page-content-wrapper">
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<table class="table">
							<thead>
								<c:forEach  items="${list}" var="hireVo">
									<tr>
										<td>${hireVo.hno }</td>
										<td><a class="title" href="${hireVo.hno }">${hireVo.name }</a></td>
										<td>${hireVo.email }</td>
										<td>${hireVo.phonnum }</td>
										<td>${hireVo.career }</td>
									</tr>
								</c:forEach>
							</thead>
						</table>
					</div>
				<div class="col-md-2"></div>
				</div>
			</div>
		</div>
	</div>
</div>
	
<%@ include file="/WEB-INF/views/include/footer.jsp"%>