<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/company/include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/company/member/memberInfo.jsp"%> 
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
										class="list-group-item list-group-item-action list-group-item-light p-3"
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
														<td style="cursor: pointer" class="btnUsername" data-userid="${messageVoData.receiver}">${messageVoData.receiver}</td>
														<td style="cursor: pointer">${messageVoData.content}</td>
														<td>${messageVoData.senddate}</td>
														<td>${messageVoData.readstate}</td>
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