<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/company/include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/company/member/memberInfo.jsp"%>

<script>
$(function(){
	$(".btnContent").click(function(e){
		$("#messageReceiveRunBtn").hide();
		var url = "/message/company/getMessageData"
		var sData = {
				"mno" : $(this).attr("data-mno"),
				"reader" : "sender"
		};
		
		$.post(url, sData, function(rData){
			console.log(rData);
			
			$("#modalSendername").text("${loginData.username}")
			$("#modalReceivername").text(rData.receivername);
			$("#modalMessageContent").val(rData.content).prop("readonly",true);
			
			$("#modal-messageForm").trigger("click");
		});
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

						<div class="d-flex" id="wrapper">
							<!-- Sidebar-->
							<div class="bg-white" id="sidebar-wrapper">
								<div class="list-group">
									<a
										class="list-group-item list-group-item-action list-group-item-light p-3"
										href="/message/company/receiveMessageList">수<br>신<br>함
									</a> <a
										class="list-group-item list-group-item-action list-group-item-dark p-3"
										href="/message/company/sendMessageList">발<br>신<br>함
									</a>

								</div>
							</div>
							<!-- Page content wrapper-->
							<!-- Page content-->
							<div class="container-fluid">
								<h1 class="display-5 fw-bolder">보낸 메시지</h1>


								<div class="row">
									<div class="col-md-12">

										<table class="table table-hover">
											<thead>
												<tr>
													<th>받는사람</th>
													<th>내용</th>
													<th>날짜</th>
													<th>읽음</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${sendMessageList}" var="messageVoData">
													<tr>
														<td style="cursor: pointer" class="btnUsername" data-userid="${messageVoData.receiver}">${messageVoData.receivername}</td>
														<td style="cursor: pointer" class="btnContent" data-mno="${messageVoData.mno}">${messageVoData.content}...</td>
														<td>${messageVoData.senddate}</td>
														<td class="readState">
															<c:choose>
															<c:when test="${messageVoData.readstate == 'y'}">읽음</c:when>
															<c:otherwise>읽지않음</c:otherwise>
															</c:choose>
														</td>
													</tr>
													</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-2"></div>
				</div>
			</div>
		</div>
	</div>
</section>




<%@ include file="/WEB-INF/views/include/footer.jsp"%>