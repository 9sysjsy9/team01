<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script>
function check_enter(){
	if(event.keyCode == 13){
		event.returnValue = false;
	};
};

$(function() {
	//멤버 이름 버튼 > 멤버 정보 모달 표시 시작
	
	$("*").on("click",".btnUsername",function(e){
// 	$(".btnUsername").click(function(e){
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
			if(rData.gender == 'f'){
				$("#modalGender").text("여");
			} else if (rData.gender == 'm'){ 
				$("#modalGender").text("남");
			}
			
			$("#modalPhone").text(rData.phone);
			$("#modalPosition").text(rData.position);
			$("#modalDepartment").text(rData.department);
			$("#modalIntroduce").html(rData.introduce);
			
			$("#modalSendername").text("${loginData.username}");
			$("#modalReceivername").text(rData.username).attr("data-receiver",rData.userid);
			$("#modalMessageContent").val("");
			$("#modalMessageContent").val(rData.content).prop("readonly",false);
		});
		$("#modal-memberInfo").trigger("click");
	});
	//멤버 이름 버튼 > 멤버 정보 모달 표시 끝
	
	//멤버 정보 모달 - 메시지 보내기 버튼 > 메시지 발송 모달
	$("#sendMessageFormBtn").click(function(e){
		$("#messageReceiveRunBtn").show();
		$("#modal-messageForm").trigger("click");
	});
	
	//메시지 발송 모달- 전송 버튼 > 메시지 전송 후 alert 출력
	$("#messageReceiveRunBtn").click(function(e){
		e.preventDefault();
		
		var url = "/message/company/sendMessageRun";
		var content = $("#modalReceivername").attr("data-receiver").replace(/(?:\r\n|\n|\n)/g, ' ');
		var sData = {
				"sender" : "${loginData.userid}",
				"receiver" : content,
				"content" : $("#modalMessageContent").val()
		};
		$.post(url, sData, function(rData){
			if(rData = "success"){
				alert("메시지가 성공적으로 발송되었습니다.")
			}
		});
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
			<a id="modal-messageForm" href="#modal-container-sendMessage"
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
							<div class="form-group">
								<label> 발신인  : <span id="modalSendername"></span> </label>
							</div>
							<div class="form-group">
								<label> 수신인 : <span id="modalReceivername" data-receiver="#"></span> </label>
							</div>
							<div class="form-group">
								<label> 내용 </label>
								<textarea id="modalMessageContent" class="form-control" rows="6" placeholder="메시지를 입력해주세요." onkeypress="check_enter()"></textarea>
							</div>

						</div>
						<div class="modal-footer">
							<button type="button" id="messageReceiveRunBtn"
								class="btn btn-outline-primary flex-shrink-0 btn-sm" data-dismiss="modal">발송</button>
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

