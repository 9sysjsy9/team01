<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/WEB-INF/views/include/header.jsp"%>

<script>
	$(function() {
		//조회 버튼을 눌렀을때
		$("#checkOrderNum").click(
				function() {
					var order_code = $("input[name=order_code]").val();

					var url = "/user/checkOrderNum";

					var sData = {
						"order_code" : order_code
					};

					$.post(url, sData, function(rData) {

						if (rData.user_id != null) {
							//조회 상태 표시
							$("#spanMsg").text(
									rData.user_id + "/" + rData.order_regdate
											+ "/" + rData.order_shoescode);
							//주문 번호 데이터 저장
							$("#checkOrderNum").attr("data-orderNum",
									order_code);
							//휴대전화, 이메일 표시
							$("#phone").val(rData.user_phone);
							$("#email").val(rData.user_email);

							console.log(rData);

						} else {
							$("#spanMsg").text("주문 번호를 확인해 주세요");
							$("#phone").val("");
							$("#email").val("");
						}

					});
				});

		//문의하기 버튼 눌렀을때
		$("#askCsBtn").click(function(e) {
			//전송할 데이터
			//주문번호, 문의카테고리, 문의내용, 문의제목
			var ask_title = $("#title").val(); //제목
			var ask_content = $("#content").val(); //내용
			var ask_cate = $("#cs_cate").val(); //카테고리
			var order_code = $("#checkOrderNum").attr("data-orderNum");

			var url = "/user/askRegistRun";

			var sData = {
				"ask_title" : ask_title,
				"ask_content" : ask_content,
				"ask_cate" : ask_cate,
				"order_code" : order_code,

			};//JSON 키:값 (값을 어떤이름(키) 로 보낼거냐)

			$.post(url, sData, function(rData) {
				console.log(rData);
			});

		});

	});
</script>

<div class="jumbotron" style="padding: 10px;">
	<br>
	<h1 style="padding-left: 110px;">
		<b>나의 정보</b>
	</h1>
	<p>
	<h5 style="padding-left: 110px;">나의 정보를 입력 및 변경 할 수 있습니다.</h5>
	</p>
</div>

<div class="container-fluid" style="padding-left: 110px;">
	<div class="row">


		<div class="col-md-12">
			<form role="form">

				<table>
					<tr>
						<td style="text-align:center"><label for="exampleInputEmail1">아이디</label></td>
						<td><label type="text" id="title" name="title" /></td>
					</tr>
					<tr>
						<td style="text-align:center"><label for="checkOrderNum">기존 비밀번호</label></td>
						<td><input type="text" id="order_code" name="order_code" />
							<button type="button" class="btn btn-sm btn-primary my-2 my-sm-0"
								id="checkOrderNum" data-orderNum="#">인증</button> <span
							id="spanMsg"></span></td>
					<div>
						<p>
						<h7 style="padding-left: 10px; font-size: 17px; color: #5800fd;">※ 회원님의 정보보호를 위해 비밀번호를 다시 한번 입력해주세요. ※</h7>
						</p>
					</div>
					</tr>
					<tr>
						<td style="text-align:center"><label for="title">새 비밀번호</label></td>
						<td><input type="text" id="title" name="title" /></td>
					</tr>
					<tr>
						<td style="text-align:center"><label for="checkOrderNum">새 비밀번호 확인</label></td>
						<td><input type="text" id="order_code" name="order_code" />
							
					</tr>

					<tr>
						<td style="text-align:center"><label for="phone">휴대 전화</label></td>
						<td><input type="text" id="phone" name="phone" readonly /></td>
					</tr>

					<tr>
						<td style="text-align:center"><label for="email">이메일</label></td>
						<td><input type="email" id="email" name="email" readonly /></td>
					</tr>
					<tr>
						<td style="text-align:center"><label for="content">나의 소개</label></td>
						<td><textarea rows="6" cols="30" id="content" name="content"></textarea>
						</td>
					</tr>

					<!-- 			<tr> -->
					<!-- 				<td> -->
					<!-- 				 <label for="exampleInputEmail1">사진 첨부</label> -->
					<!-- 				</td> -->
					<!-- 				<td> -->
					<!-- 					<input type="file" class="form-control-file" id="exampleInputFile" /> -->
					<!-- 				</td> -->
					<!-- 			</tr> -->

				</table>
				<br>
				<div style="padding-left: 125px;">
					<button type="submit" class="btn btn-primary" id="askCsBtn">확인</button>
					<a type="submit" class="btn btn-primary" id="askCsBtn"
						href="/customer/csCheck">변경하기</a>
				</div>
			</form>
		</div>

	</div>
	<!-- class="container-fluid -->
</div>
<!-- class="container-fluid -->

<%@ include file="/WEB-INF/views/include/footer.jsp"%>