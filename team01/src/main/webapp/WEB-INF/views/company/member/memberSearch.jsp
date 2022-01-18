<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/company/include/header.jsp"%>
<script>
$(function(){
	$(".btnD").click(function() {
		var department = $(this).val();
		location.href = "/member/company/search_department?department=" + department;
	});
});
</script>
<style>
.title {
	text-align: center;
}
</style>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-3"></div>
			<div class="title col-md-6">
				<h1>사원 찾기</h1>
			</div>
			<div class="col-md-3"></div>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-3"></div>
			
			<div class="col-md-6">

				<div style="text-align: center; margin-bottom: 30px;margin-top: 30px;">
					<button class="btnD btn btn-outline-dark flex-shrink-0" type="button" value="인사부">인사부</button>
					<button class="btnD btn btn-outline-dark flex-shrink-0" type="button" value="영업부">영업부</button>
					<button class="btnD btn btn-outline-dark flex-shrink-0" type="button" value="품질관리부">품질관리부</button>
					<button class="btnD btn btn-outline-dark flex-shrink-0" type="button" value="감사부">감사부</button>
				</div>
			<form id="frmSearch" action="/member/company/search_list" method="get">
				<div>
					<select name="department">
						<option value="department" selected>부서</option>
						<option>인사부</option>
						<option>영업부</option>
						<option>품질관리부</option>
						<option>감사부</option>
					</select> 
					
					<select name="position">
						<option value="position">직책</option>
						<option>사원</option>
						<option>대리</option>
						<option>차장</option>
						<option>부장</option>
					</select> 
					
					<select name="en">
						<option value="en">전체</option>
						<option value="eno">사번</option>
						<option value="username">이름</option>
					</select>

					<input type="text" name="keyword" id="keyword" placeholder="검색어 입력">
					<button type="submit" class="btn-sm btn-success">검색</button>
				</div>
			</form>
				<table class="table">
					<thead>
						<tr>
							<th>사번</th>
							<th>이름</th>
							<th>아이디</th>
							<th>전화번호</th>
							<th>이메일</th>
							<th>직책</th>
							<th>부서</th>
							<th>입사일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list }" var="memberVo">
							<tr>
								<td>${memberVo.eno }</td>
								<td>${memberVo.username }</td>
								<td>${memberVo.userid }</td>
								<td>${memberVo.phone }</td>
								<td>${memberVo.email }</td>
								<td>${memberVo.position }</td>
								<td>${memberVo.department }</td>
								<td>${memberVo.regdate }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
			</div>
			<div class="col-md-3"></div>
		</div>
	</div>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>