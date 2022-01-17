<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/company/include/header.jsp"%>
<script>
$(function(){
	$("#btnSearch").click(function() {
		var searchType1 = $("#searchType1").val();
		var searchType2 = $("#searchType2").val();
		var searchType3 = $("#searchType3").val();
		var keyword = $("#keyword").val();
		console.log("타입" + searchType1);
		console.log("타입" + searchType2);
		console.log("타입" + searchType3);
		console.log("키" + keyword);
	});
	$(".btn").click(function() {
		var department = $(this).val();
		console.log("부서:" + department);
		location.href = "/member/company/search_department?department=" + department;
	});
});
</script>
<style>
.title {
	text-align: center;
}
</style>
<form action="/company/company/search_member">
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
					<button class="btn btn-outline-dark flex-shrink-0" type="button" value="인사부">인사부</button>
					<button class="btn btn-outline-dark flex-shrink-0" type="button" value="영업부">영업부</button>
					<button class="btn btn-outline-dark flex-shrink-0" type="button" value="품질관리부">품질관리부</button>
					<button class="btn btn-outline-dark flex-shrink-0" type="button" value="감사부">감사부</button>
				</div>
				<div>
					<select name="department" id="searchType1">
						<option selected value="전체">부서</option>
						<option value="인사부">인사부</option>
						<option value="영업부">영업부</option>
						<option value="품질관리부">품질관리부</option>
						<option value="감사부">감사부</option>
					</select> 
					
					<select name="position" id="searchType2">
						<option selected value="전체">직책</option>
						<option value="사원">사원</option>
						<option value="대리">대리</option>
						<option value="차장">차장</option>
						<option value="부장">부장</option>
					</select> 
					
					<select name="en" id="searchType3">
						<option selected value="전체">전체</option>
						<option value="사번">사번</option>
						<option value="이름">이름</option>
					</select>

					<input type="text" name="keyword" id="keyword" placeholder="검색어 입력">
					<button type="submit" class="btn btn-sm btn-success" id="btnSearch">검색</button>
				</div>
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
</form>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>