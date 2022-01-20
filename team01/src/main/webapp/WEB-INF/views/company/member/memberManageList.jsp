<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/company/include/header.jsp"%>
<%@ include file="/WEB-INF/views/company/member/memberInfo.jsp"%>

<script>

$(function(){
	$(".manageBtn").click(function(){
			var url = "/member/company/memberInfo";
			var sData = {
				"userid" : $(this).attr("data-userid")
			}
			
			$.post(url, sData, function(rData){
				console.log(rData);
				$("#modalManageUsername").text(rData.username);
				$("#modalManageUserid").text(rData.userid);
				$("#modalManageUserid").attr("data-userid",rData.userid);
				$("#modalManageEno").text(rData.eno);
				$("input[name=userid]").val(rData.userid);
				
				$("#modalManageDepartment").val(rData.department).prop("selected",true);
				$("#modalManagePosition").val(rData.position).prop("selected",true);
				$("#modalManageAuthority").val(rData.authority).prop("selected",true);
				
				$("#modal-memberManage").trigger("click");
			});
			

	});
	
	$("#sendManageRunBtn").click(function(e){
		var result = confirm("변경하시겠습니까?");
		if(result){
			$("#sendManageForm").submit();
		} else {
			e.preventDefault();
		}
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
						<h1 class="display-5 fw-bolder" id="store">사원 관리</h1>
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
									<th>이름</th>
									<th>성별</th>
									<th>직급</th>
									<th>부서</th>
									<th>권한</th>
									<th>가입일</th>
									<th>관리</th>
								</tr>
							</thead>
							<tbody>
							
							 
							<c:forEach items="${memberManageList}" var="list">
							
							<tr>
									<td>${list.eno}</td>
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
									<td>${list.position}</td>
									<td>${list.department}</td>
									<td>
										<c:choose>
											<c:when test="${list.authority == '0'}">
												미승인
											</c:when>
											<c:when test="${list.authority == '1'}">
												일반
											</c:when>
											<c:when test="${list.authority == '2'}">
												관리
											</c:when>
											<c:when test="${list.authority == '3'}">
												전체
											</c:when>
										</c:choose>
									</td>
									<td>${list.regdate}</td>
									
									<td>
										<button type="button" data-userid="${list.userid}" class="manageBtn btn btn-outline-dark flex-shrink-0 btn-sm" >관리</button>
									</td>
								</tr>
								
							</c:forEach>
								
							</tbody>
						</table>
					</div>
					<div class="col-md-2"></div>
				</div>


			</div>
		</div>
	</div>
</section>
<!-- 관리 모달 시작 -->
			<a id="modal-memberManage" href="#modal-container-memberManage"
				role="button" class="btn" data-toggle="modal"  style="display:none">memberManageModal</a>
			<div class="modal fade" id="modal-container-memberManage" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
<form id="sendManageForm" action="/member/company/manageRun" method="POST">
					<input type="hidden" name="userid">
						<div class="modal-header">
							<h5 class="modal-title" id="myModalLabel">사원 관리</h5>
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
							<table class="table">
								<tr>
									<td>이름</td>
									<td id="modalManageUsername"></td>
								</tr>
								<tr>
									<td>아이디</td>
									<td id="modalManageUserid"></td>
								</tr>
								<tr>
									<td>사번</td>
									<td id="modalManageEno"></td>
								</tr>
								<tr>
									<td>직급</td>
									<td>
										<select id="modalManagePosition" name="position">
											<option value="사원">사원</option>
											<option value="대리">대리</option>
											<option value="차장">차장</option>
											<option value="미승인">미부여</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>부서</td>
									<td >
										<select  id="modalManageDepartment" name="department">
											<option value="영업부">영업부</option>
											<option value="인사부">인사부</option>
											<option value="감사부">감사부</option>
											<option value="품질관리">품질관리</option>
											<option value="미승인">미부여</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>권한</td>
									<td>
										<select id="modalManageAuthority" name="authority">
											<option value="1">일반</option>
											<option value="2">관리</option>
											<option value="3">전체</option>
											<option value="0">미부여</option>
										</select>
									</td>
									
								</tr>
							</table>
						</div>
						<div class="modal-footer">
							<button type="button"
								class="btn btn-outline-primary flex-shrink-0 btn-sm" id="sendManageRunBtn">변경 하기</button>
							<button type="button"
								class="btn btn-outline-dark flex-shrink-0 btn-sm"
								data-dismiss="modal">닫기</button>
						</div>
</form>
					</div>
				</div>
			</div>


<%@ include file="/WEB-INF/views/include/footer.jsp"%>