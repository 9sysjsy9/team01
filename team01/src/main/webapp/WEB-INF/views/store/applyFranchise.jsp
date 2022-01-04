<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/include/header.jsp"%>
<!-- 가맹 지원 모달  // display:none-->
<a id="modal-apply" href="#modal-container-apply" role="button"
	class="btn btn-outline-primary flex-shrink-0" data-toggle="modal"
	style="display: none">지원하기</a>

<div class="modal fade" id="modal-container-apply" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="myModalLabel">가맹점 문의</h5>
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<form role="form" action="/store/applyRegistRun" method="get" id="applyForm"> <!-- form 시작 -->
				<div class="modal-body">
					<div class="form-group">
						<label for="phone"> 연락처 </label> <input type="text"
							class="form-control" id="phone" name="phone"
							placeholder="010-1234-5678" required />
					</div>
					<div class="form-group">
						<label for="email"> 이메일 </label> <input type="email"
							class="form-control" id="email" name="email"
							placeholder="example@shoese.com" required />
					</div>
					<div class="form-group">
						<br> <label for="applyContent"> 문의 내용 </label><br>
						<textarea class="form-control" rows="6" id="applyContent"
							name="applyContent" placeholder="가맹 문의 사항을 입력해주세요." required></textarea>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-outline-primary flex-shrink-0" id="applyModalSubmitBtn">
						제출</button>
					<button type="button"
						class="btn btn-outline-secondary flex-shrink-0"
						data-dismiss="modal">닫기</button>
				</div>
			</form>
		</div>
	</div>
</div>
<!-- /가맹 지원 모달  -->

<!-- 지원 조회 모달  // display:none-->
<a id="modal-inquiry" href="#modal-container-inquiry" role="button"
	class="btn btn-outline-primary flex-shrink-0" data-toggle="modal"
	style="display: none">지원하기</a>

<div class="modal fade" id="modal-container-inquiry" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="myModalLabel">문의 조회</h5>
				<button type="button" class="close inquiryModalCloseBtn"
					data-dismiss="modal">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<form role="form" action="/store/applyRegistRun" method="get">
				<div class="modal-body">
					<div class="form-group">
						<label for="email"> 문의 이메일 </label> <input type="email"
							class="form-control" id="email" name="email"
							placeholder="example@shoese.com" required /> <br>
						<button id="inquiryBtn" type="button"
							class="btn btn-outline-primary flex-shrink-0">조회</button>
					</div>

					<div class="form-group hidden" style="display: none">
						<label for="phone"> 전화번호 </label> <input type="text"
							class="form-control" id="phone" name="phone"
							placeholder="010-1234-5678" readonly />
					</div>

					<div class="form-group hidden" style="display: none">
						<br> <label for="applyContent"> 문의 내용 </label><br>
						<textarea class="form-control" rows="6" id="applyContent"
							name="applyContent" placeholder="가맹 문의 사항을 입력해주세요." readonly></textarea>
					</div>

					<div class="form-group hidden" style="display: none">
						<br> <label for="applyContent"> 답변 내용 </label><br>
						<textarea class="form-control" rows="6" id="replyContent"
							placeholder="아직 답변이 등록되지 않았습니다." readonly></textarea>
					</div>
				</div>
				<div class="modal-footer">
					<button type="submit"
						class="btn btn-outline-primary flex-shrink-0 hidden"
						style="display: none">수정</button>
					<button type="button"
						class="btn btn-outline-secondary flex-shrink-0 inquiryModalCloseBtn"
						data-dismiss="modal">닫기</button>
				</div>
			</form>
		</div>
	</div>
</div>
<!-- /가맹 지원 모달  -->


<script>
	if ("${msg}" == "success") {
		alert("등록 되었습니다.");
	}

	$(function() {
		//문의하기 버튼 클릭
		$("#applyModalBtn").click(function(e) {
			e.preventDefault();
			$("#modal-apply").trigger("click");
		});

		//조회하기 버튼 클릭
		$("#inquiryModalBtn").click(function(e) {
			e.preventDefault();
			$("#modal-inquiry").trigger("click");
		});

		//조회하기 모달 조회 버튼 클릭
		$("#inquiryBtn").click(function(e) {
			e.preventDefault();

			var url = "/store/applyStateInquiry";
			//email 로 DB조회
			var sData = {
				"email" : $("#modal-container-inquiry").find("#email").val()
			}

			console.log("email:" + email);

			$.post(url, sData, function(rData) {
				console.log(rData);
				if (rData.email != null) {
					$(".hidden").find("#phone").val(rData.phone);
					$(".hidden").find("#applyContent").val(rData.applyContent);
					$(".hidden").find("#replyContent").val(rData.replyContent);
					$(".hidden").show(1000);
				} else {
					alert("등록된 문의가 없습니다.");
				}
			});

		});

		$(".inquiryModalCloseBtn").click(function(e) {
			$(".hidden").hide();
		});
		//지원 모달 창 제출 버튼 시 중복 체크
		$("#applyModalSubmitBtn").click(function(e){
			e.preventDefault();
			var url = "/store/checkApply";
			var sData = {
					"email" : $("#modal-container-apply").find("#email").val()
				};
			$.post(url, sData, function(rData){
				console.log(rData);
				if(rData == "impossible"){
					alert("이미 문의한 내용이 있습니다.");
				} else {
					$("#applyForm").submit();
				}
			});

		});
	});
</script>


<!-- Product section-->
<section class="py-5">
	<div class="container px-4 px-lg-5 my-5">
		<div class="row gx-4 gx-lg-5 align-items-center">
			<div class="col-md-6">
				<img class="card-img-top mb-5 mb-md-0"
					src="/images/applyFranchise.png" />
			</div>
			<div class="col-md-6">
				<h1 class="display-5 fw-bolder" id="store">가맹점 문의</h1>
				<div class="fs-5 mb-5"></div>
				<p class="lead" id="explain">수영슈즈는 합리적인 가격에 트렌디한 디자인의 슈즈브랜드로서, 전국 예비 가맹점주분들의 지원을 기다리고 있습니다.</p>
				<p class="lead" id="telApply">전화 문의 : 052-1234-5678</p>
				<p class="lead" id="netApply">인터넷 문의</p>
				<div class="d-flex">
					<button type="button" class="btn btn-outline-primary flex-shrink-0"
						id="applyModalBtn">문의하기</button>

					<button type="button" class="btn btn-outline-primary flex-shrink-0"
						id="inquiryModalBtn">조회하기</button>
				</div>
			</div>
		</div>
	</div>
</section>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>
