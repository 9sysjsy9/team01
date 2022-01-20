<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/company/include/header.jsp"%>
<%@ include file="/WEB-INF/views/company/member/memberInfo.jsp"%>

<script>

if("${msg}" == "approve"){
	alert("사용 승인 되었습니다.")
}

$(function(){
	$(".approveBtn").click(function(e){
		e.preventDefault();
		var eno = $(this).attr("data-eno");
		var userid = $(this).attr("data-userid");
		var parent1 = $(this).parent(); //td
		var tr = $(this).parent().parent(); //tr
		
		var position = tr.find(".position").val();
		var department = tr.find(".department").val();
		var authority = tr.find(".authority").val();
		
		var url = "/member/company/memberApproveRun";
		var sData = {
				"eno" : eno,
				"userid" : userid,
				"position" : position,
				"department" : department,
				"authority" : authority
		}
		
		$.post(url, sData, function(rData){
			console.log(rData);
			if(rData == "success"){
				alert("사용 승인 되었습니다.");
				location.href="/member/company/memberApproveList";
			}
				
			
		})
		
		console.log(eno);
		console.log(position);
		console.log(department);
		console.log(authority);

	});
});
</script>

<!-- Product section-->
<section class="py-5">

	<div class="container px-4 px-lg-5 my-5">
		<div class="row gx-4 gx-lg-5 align-items-center">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<!-- 게시판 이름 -->
						<h1 class="display-5 fw-bolder" id="store">가입 승인</h1>
						<br>
					</div>
					<div class="col-md-2"></div>

				</div>
				<div class="row">
					<div class="col-md-2"></div>

					<div class="col-md-8">

						<table class="table table-hover">
							<thead>
								<tr>
									<th>사번</th>
									<th>아이디</th>
									<th>이름</th>
									<th>성별</th>

									<th>직급</th>
									<th>부서</th>
									<th>권한</th>
									<th>가입일</th>
									<th>승인</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach items="${approveList}" var="list">
							
							<tr>
									<td>${list.eno}</td>
									<td>${list.userid}</td>
									<td class="btnUsername" style="cursor:pointer" data-userid="${list.userid}">${list.username}</td>
									<td>
										<c:choose>
											<c:when test="${list.gender == 'f'}">
												여
											</c:when>
											<c:when test="${list.gender == 'm'}">
												남
											</c:when>
										</c:choose>
									
									
									</td>

									<td>
										<select class="position" name="position">
											<option value="사원">사원</option>
											<option value="대리">대리</option>
											<option value="차장">차장</option>
										</select>
									</td>
									<td>
										<select class="department" name="department">
											<option value="영업부">영업부</option>
											<option value="인사부">인사부</option>
											<option value="감사부">감사부</option>
											<option value="품질관리">품질관리</option>
										</select>
									</td>
									<td>
										<select class="authority" name="authority">
											<option value="1">일반</option>
											<option value="2">관리</option>
											<option value="3">전체</option>
										</select>
									</td>
									<td>${list.regdate}</td>
									<td>
										<button type="submit" data-eno="${list.eno}"  data-userid="${list.userid}" class="approveBtn btn btn-outline-dark flex-shrink-0 btn-sm" >승인</button>
									</td>
								</tr>
								
							</c:forEach>
								
							</tbody>
						</table>
					</div>
					<div class="col-md-2"></div>
				</div>

				<div class="row">
					<div class="col-md-12">
					</div>
				</div>

			</div>
		</div>
	</div>
</section>


<%@ include file="/WEB-INF/views/include/footer.jsp"%>