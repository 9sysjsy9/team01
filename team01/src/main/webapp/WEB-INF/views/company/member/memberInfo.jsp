<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script>
$(function() {
	$(".btnUsername").click(function(e) {
		e.preventDefault();
		console.log("클릭됨");
		console.log($(this).attr("data-userid"));
		var url = "/member/company/memberInfo"
		var sData = {
			"userid" : $(this).attr("data-userid")
		}
		$.post(url,sData,function(rData) {

			if (rData.profileimg == 'y') {
				$("#profileImg").attr("src","/member/company/profileImgLoad?eno="+ rData.eno);
			} else {
				$("#profileImg").attr("src","https://dummyimage.com/600x700/dee2e6/6c757d.jpg");
			}
			
			console.log(rData);
			$("#modalUsername").text(rData.username);
			$("#modalEno").text(rData.eno);
			$("#modalGender").text(rData.gender);
			$("#modalPhone").text(rData.phone);
			$("#modalPosition").text(rData.position);
			$("#modalDepartment").text(rData.department);
			$("#modalIntroduce").html(rData.introduce);
		});
		$("#modal-memberInfo").trigger("click");
	});
	
	$("#sendMessageFormBtn").click(function(e){
		console.log("메시지보내기 버튼 클릭");
		$("#modal-sendMessage").trigger("click");
		
	});
});
</script>
<!-- 사원정보 보기 모달 -->
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<a id="modal-memberInfo" href="#modal-container-memberInfo"
				role="button" class="btn" data-toggle="modal" style="display: none">memberInfoModal</a>

			<div class="modal fade" id="modal-container-memberInfo" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="myModalLabel">사원 정보</h5>
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">

							<div class="form-group text-center">
								<img id="profileImg" class="card-img-top mb-5 mb-md-0"
									src="https://dummyimage.com/600x700/dee2e6/6c757d.jpg"
									style="max-width: 150px" /> <br>
								<br>
							</div>

							<table class="table">
								<tr>
									<td>이름</td>
									<td id="modalUsername"></td>
								</tr>
								<tr>
									<td>사번</td>
									<td id="modalEno"></td>
								</tr>
								<tr>
									<td>성별</td>
									<td id="modalGender"></td>
								</tr>
								<tr>
									<td>전화번호</td>
									<td id="modalPhone"></td>
								</tr>
								<tr>
									<td>직급</td>
									<td id="modalPosition"></td>
								</tr>
								<tr>
									<td>부서</td>
									<td id="modalDepartment"></td>
								</tr>
								<tr>
									<td>자기소개</td>
									<td id="modalIntroduce">${memberData.introduce}</td>
								</tr>
							</table>
						</div>
						<div class="modal-footer">
							<button type="button"
								class="btn btn-outline-primary flex-shrink-0 btn-sm" id="sendMessageFormBtn" data-dismiss="modal">메시지
								보내기</button>
							<button type="button"
								class="btn btn-outline-dark flex-shrink-0 btn-sm"
								data-dismiss="modal">닫기</button>
						</div>


					</div>

				</div>

			</div>
		</div>
	</div>
</div>
<!-- /사원정보 보기 모달 -->

<!-- 메시비 보내기 모달 -->
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<a id="modal-sendMessage" href="#modal-container-sendMessage"
				role="button" class="btn" data-toggle="modal" style="display: none">sendMessageModal</a>

			<div class="modal fade" id="modal-container-sendMessage"
				role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="myModalLabel">메시지 보내기</h5>
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
							<div>
								<label> 발신인  : <span>test01</span> </label>
							</div>
							<div>
								<label> 수신인 : <span>test02</span> </label>
							</div>

<!-- 							<table> -->
<!-- 								<tr> -->
<!-- 									<td>발신 : </td> -->
<!-- 									<td id="modalSender">ㅁㄴㅇㄹ</td> -->
<!-- 								</tr> -->
<!-- 								<tr> -->
<!-- 									<td>수신 : </td> -->
<!-- 									<td id="modalReceiver">ㅁㄴㅇㄹ</td> -->
<!-- 								</tr> -->

<!-- 								<tr> -->
<!-- 									<td>내용</td> -->
<%-- 									<td id="content">${memberData.introduce}</td> --%>
<!-- 								</tr> -->
<!-- 							</table> -->
						</div>
						<div class="modal-footer">
							<button type="button"
								class="btn btn-outline-primary flex-shrink-0 btn-sm">메시지
								보내기</button>
							<button type="button"
								class="btn btn-outline-dark flex-shrink-0 btn-sm"
								data-dismiss="modal">닫기</button>
						</div>


					</div>

				</div>

			</div>
		</div>
	</div>
</div>

<!-- /메시비 보내기 모달 -->

