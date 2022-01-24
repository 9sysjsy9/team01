<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/company/include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/company/member/memberInfo.jsp"%>

<script>
$(function(){
	//내용 상세 보기
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
	
	//삭제 보기
	$(".btnDelete").click(function(e){
		var mno = $(this).attr("data-mno");
		console.log("mno:" + mno);
		var url = "/message/company/messageDeleteRun";
		
		var sData = {
				"mno" : mno,
				"reader" : "sender"
		};
		
		$.post(url, sData, function(rData){
			console.log("btnDelete rData:" + rData)
			if(rData == "success"){
				alert("메시지가 메시지함에서 삭제 되었습니다.")
			}
			location.href = "/message/company/sendMessageList";
		});
	});
	
	//발신취소 버튼
	$(".btnSendCancel").click(function(e){
		var thisbtn = $(this);
		var mno = $(this).attr("data-mno");
		console.log("mno:" + mno);
		var url = "/message/company/messageSendCancel";
		
		var sData = {
				"mno" : mno,
		};
		$.post(url, sData, function(rData){
			console.log(rData);
			if(rData == "success"){
				thisbtn.addClass("disabled");
				thisbtn.parent().prev().text("발신취소");
				alert("발신취소 처리 되었습니다.")
			}
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
													<th>발신취소</th>
													<th>삭제</th>
													
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
															<c:when test="${messageVoData.readstate == 'n'}">읽지않음</c:when>
															<c:otherwise>발신취소</c:otherwise>
															</c:choose>
														</td>
														
														<td class="sendCancel">
															<c:choose>
																<c:when test="${messageVoData.readstate == 'y'}">
																	<button type="button" class="btn btn-sm active btn-outline-secondary disabled">발신취소</button>
																</c:when>
																<c:when test="${messageVoData.readstate == 'n'}">
																	<button type="button" data-mno="${messageVoData.mno}" class="btnSendCancel btn btn-outline-secondary flex-shrink-0 btn-sm">발신취소</button>
																</c:when>
																<c:otherwise>
																	<button type="button" class="btn btn-sm active btn-outline-secondary disabled">발신취소</button>
																</c:otherwise>
															</c:choose>
														</td>
														
														<td>
															<button type="button" data-mno="${messageVoData.mno}" class="btnDelete btn btn-outline-danger flex-shrink-0 btn-sm">삭제</button>
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