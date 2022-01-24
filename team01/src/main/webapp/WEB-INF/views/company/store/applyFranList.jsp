<!-- 기능 담당자 : 고만재 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/company/include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% String replyState = request.getParameter("replyState"); %>

<script>
//답변 상태 구분
	$(function() {
		$("#replyState").val("<%=replyState%>").prop("selected", true);
		$("#replyState").change(function(e){
			location.href = "/store/company/applyFranList?replyState="+$("#replyState").val();
		});
		
		$("th").click(function(){
			alert("test");
		});
		// 조회버튼 (메일 주소 버튼) 클릭시 내용 modal창 표시 
		$(".applyInquiryLink").click(function(e) {
			e.preventDefault();
			var url = "/store/company/applyInquiry";
			var sData = {
				"fno" : $(this).attr("href")
			};
			$.post(url, sData, function(rData) {
				console.log(rData);
				if(rData.replyState == "y"){
					console.log("내용있음");
					$("#replyContent").prop("readonly",true);
					$("#applyRegistRunBtn").hide();
					$("#applyRegistModifyBtn").show();
				} else {
					console.log("내용없음");
					$("#replyContent").prop("readonly",false);
					$("#applyRegistRunBtn").show();
					$("#applyRegistModifyBtn").hide();
				}
				$("#applyForm").find("#fnoLabel").text("#" + rData.fno);
				$("#applyForm").find("#fno").val(rData.fno);
				$("#applyForm").find("#phone").val(rData.phone);
				$("#applyForm").find("#email").val(rData.email);
				$("#applyForm").find("#applyContent").val(rData.applyContent);
				$("#applyForm").find("#replyContent").val(rData.replyContent);
				$("#modal-inquiry").trigger("click");
			});
		});
		//답변 수정 버튼 클릭시 등록하기 버튼 show
		$("#applyRegistModifyBtn").click(function(e){
			e.preventDefault();
			$("#applyRegistRunBtn").show();
			$("#applyRegistModifyBtn").hide();
			$("#replyContent").prop("readonly",false);
		});
		
		$("#applyRegistRunBtn").click(function(e){
			e.preventDefault();
			$("#applyForm").submit();
		});
		
	});
</script>

<section class="py-5">
	<div class="container px-4 px-lg-5 my-5">
		<div class="row gx-4 gx-lg-5 align-items-center">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<h1 class="display-5 fw-bolder" id="store">가맹 문의 관리</h1>
						<br>
					</div>
					<div class="col-md-2"></div>
				</div>
				<div class="row">
					<div class="col-md-2"></div>

					<div class="col-md-8">
						<select id="replyState">
							<option value="a" selected>전체</option>
							<option value="y">완료</option>
							<option value="n">미완료</option>
						</select>
						<table class="table table-hover">
							<thead>
								<tr>
									<th>#</th>
									<th>이메일</th>
									<th>연락처</th>
									<th>문의 일시</th>
									<th>답변 여부</th>
									<th>완료 일시</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="list" items="${applyList}">
									<tr>
										<td>${list.fno}</td>
										<td><a href="${list.fno}" class="applyInquiryLink">${list.email}</a></td>
										<td>${list.phone}</td>
										<td>${list.regDate}</td>
										<td>
											<c:choose>
												<c:when test="${list.replyState == 'n'}">
													미완료
												</c:when>
												<c:when test="${list.replyState == 'y'}">
													완료
												</c:when>
											</c:choose>
										</td>
										<td>${list.replyDate}</td>
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
<!-- 내용 조회 및 답변 모달 -->
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<a style="display:none" id="modal-inquiry" href="#modal-container-inquiry" role="button"
				class="btn" data-toggle="modal">조회</a>
			<div class="modal fade" id="modal-container-inquiry" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="myModalLabel">지원 조회</h5>
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<form role="form" action="/store/company/replyRegistRun" method="post"
							id="applyForm">
							<input type="hidden" name="fno" id="fno">
							<!-- form 시작 -->
							<div class="modal-body">
								<div class="form-group">
									<label id="fnoLabel"># </label>
								</div>
								<div class="form-group">
									<label for="phone"> 연락처 </label> <input type="text"
										class="form-control" id="phone" name="phone"
										placeholder="010-1234-5678" readonly />
								</div>
								<div class="form-group">
									<label for="email"> 이메일 </label> <input type="email"
										class="form-control" id="email" name="email"
										placeholder="example@shoese.com" readonly />
								</div>
								<div class="form-group">
									<label for="applyContent"> 문의 내용 </label><br>
									<textarea class="form-control" rows="6" id="applyContent"
										name="applyContent" placeholder="입력된 내용이 없습니다." readonly></textarea>
								</div>
								<div class="form-group">
									<label for="applyContent"> 답변 내용 </label><br>
									<textarea class="form-control" rows="6" id="replyContent"
										name="replyContent" placeholder="등록된 답변이 없습니다."></textarea>
								</div>
							</div>
							<div class="modal-footer">
								<button id="applyRegistRunBtn" type="button" class="btn btn-outline-primary btn-sm">답변등록</button>
								<button id="applyRegistModifyBtn" type="button" class="btn btn-outline-primary btn-sm">답변수정</button>
								<button type="button" class="btn btn-outline-secondary btn-sm"
									data-dismiss="modal">닫기</button>
							</div>
						</form>
					</div>

				</div>

			</div>

		</div>
	</div>
</div>
<!-- 기능 담당자 : 끝-->
<!-- Product section-->



<%@ include file="/WEB-INF/views/include/footer.jsp"%>