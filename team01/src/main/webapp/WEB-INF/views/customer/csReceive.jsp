<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="/css/mystyle.css">
<script src="/js/myscript.js"></script>
<script>
$(function() {
	$("#modal-858514").click(function(e){
		e.preventDefault();
		$("#modal-858513").show();
	});
});
</script>

<!-- 조회 누르면 모달창이 나오며 모달창에서 주문 번호 입력하고 확인을 누르면 닫히는 모달창 -->


<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="jumbotron" style="padding: 10px;">
				<br>
				<h1 style="padding-left: 110px;">
					<b>교환 / 반품 / 환불</b>
				</h1>
				<p>
				<h5 style="padding-left: 110px;">아래의 양식에 정확히 입력해 주세요.</h5>
				</p>
				<br>
				<div>
					<header>
						<h2></h2>
					</header>
				</div>
			</div>

			<div class="jumbotron" class="harf_area" style="padding-left: 120px;""background-color:#EFFBF8;">
				<header class="n-section-title">
					<h4 class="tit">
						<b>서비스 접수</b>
					</h4>
					<br>
				</header>
				<table class="n-table table-row">
					<tbody style="font-size: 20px">
						<tr>
							<th scope="row">접수 유형</th>
							<td>
								<div class="bg-select" style="padding-left: 10px;">
									<select name="qa_kind" style="font-size: 20px">
										<option value="">항목 선택</option>
										<option value="1">교환</option>
										<option value="2">반품</option>
										<option value="3">환불</option>
										<option value="4">기타</option>
									</select>
								</div>
							</td>
						</tr>
					</tbody>
					<tbody>
						<tr>
							<th scope="row">주문 번호</th>
							<td class="order-check" style="padding-left: 10px;"><input
								type="text" name="ord_no" class="n-input" readonly="" value=""
								placeholder="조회버튼을 누르세요."> 
						
<!-- 조회 모달 필요 부분 시작 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ-->
							
								<a class="n-btn btn-sm btn-accent" name="" onclick=""
									class="table-warning find" id="modal-858514"
									href="#modal-container-858514"
									class="btn btn-primary my-2 my-sm-0 " data-toggle="modal"
									style="display: inline-block;" style="font-size: 20px"
									> 조회</a>
						</tr>
					</tbody>
					<tbody>
<!-- 조회 모달 필요 부분 끝 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ-->
						
<!-- 조회 모달 예문 시작 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
<div class="row">
		<div class="col-md-12">
			 <a id="modal-331105" href="#modal-container-331105" role="button" class="btn" data-toggle="modal"
			 	style="display:none">Launch demo modal</a>
			
			<div class="modal fade" id="modal-container-331105" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="myModalLabel">
								댓글 수정
							</h5> 
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
							<input type="hidden" id="modalCno">
							<label for="modalContent">댓글내용</label>
							<input type="text" class="form-control"
								id="modalContent">
							<label for="modalUserid">아이디</label>
							<input type="text" class="form-control"
								id="modalUserid">
						</div>
						<div class="modal-footer">
							 
							<button type="button" class="btn btn-primary"
								id="btnModalModify">수정완료</button> 
							<button type="button" class="btn btn-secondary" data-dismiss="modal"
								id="btnModalClose">닫기</button>
						</div>
					</div>
					
				</div>
				
			</div>
			
		</div>
	</div>

<!-- 조회 모달 예문 끝 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->

						<div class="modal fade" id="modal-container-858513" role="dialog"
							aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content" style="font-size: 20px">
									<div class="modal-header" style="background-color: #d2d2ff;">
										<h7 class="modal-title" id="myModalLabel"> <b>알림</b></h7>
										<button type="button" class="close" data-dismiss="modal">
											<span aria-hidden="true">X</span>
										</button>
									</div>
									<div class="modal-body" style="text-align: center"><b>조회 할 주문번호를 입력하세요.</b></div>
									<input type="text" class="n-input" name="user_nm" value="" style="text-align: center" placeholder="여기에 입력하세요.">
									<div class="modal-footer">
										<button type="button" class="btn btn-primary">확인</button>
										<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
									</div>
						<tr>
							<th scope="row" style="text-align: center">작 성 자</th>
							<td style="padding-left: 10px;"><input type="text"
								class="n-input" name="user_nm" value=""
								placeholder="작성자를 입력하세요."></td>
						</tr>
						<tr class="n-same-row">
							<th scope="row" style="text-align: center">휴대 전화</th>
							<td style="padding-left: 10px;"><input type="text"
								class="n-input" name="mobile" value="" placeholder="번호를 입력하세요."></td>
						</tr>
						<tr class="n-same-row">
							<th scope="row" style="text-align: center">이 메 일</th>
							<td style="padding-left: 10px;"><input type="text"
								class="n-input" name="email" value="" placeholder="이메일을 입력하세요."></td>
						</tr>
						<tr>
							<th scope="row" style="text-align: center">제 목</th>
							<td style="padding-left: 10px;"><input type="text"
								class="n-input" name="subject" value="" placeholder="제목을 입력하세요."></td>
						</tr>
						<tr class="n-same-row">
							<th scope="row">문의 내용</th>
							<td style="padding-left: 10px;"><textarea name="qa_msg"
									cols="70" rows="8" class="n-input" placeholder="내용을 입력하세요."></textarea></td>
						</tr>
						<tr>
							<th scope="row">사진 첨부
							<td class="file-upload" style="padding-left: 10px;">
								<ul class="file_show" id="file_show"></ul> <input type="file"
								id="input_file" multiple="multiple" />
							</td>
							</th>
						</tr>

					</tbody>
				</table>
			</div>
			<div class="container-fluid">
			
<!-- 저장 모달 시작 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->

				<div class="row">
					<div class="col-md-12" style="padding-left: 110px;">
						<a id="modal-858513" href="#modal-container-858513"
							class="btn btn-primary my-2 my-sm-0" " data-toggle="modal"
							style="display: inline-block;">저장</a> <a
							style="padding-left: 10px;"></a> <a
							class="btn btn-primary my-2 my-sm-0" type="submit"
							style="display: inline-block;" href="/customer/csCheck">접수 내역
							확인</a>
					</div>
					<div class="modal fade" id="modal-container-858513" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header" style="background-color: #d2d2ff;">
									<h7 class="modal-title" id="myModalLabel"> <b>알림</b></h7>
									<button type="button" class="close" data-dismiss="modal">
										<span aria-hidden="true">X</span>
									</button>
								</div>
								<div class="modal-body">입력한 내용으로 신청합니다.</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-primary">확인</button>
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">취소</button>
								</div>

<!-- 저장 모달 끝 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->

<!-- 주문번호 조회시 오라클 데이터불러오기 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
							</div>
						</div>
					</div>

				</div>

				<!-- 			<table class="table"> -->
				<!-- 				<tbody> -->
				<%-- 				<c:forEach items="${list}" var="csreceiveVo"> --%>
				<!-- 					<tr> -->
				<%-- 						<th>${csreceiveVo.csreceive_order}</th> --%>
				<%-- 						<th>${csreceiveVo.csreceive_name}</th> --%>
				<%-- 						<th>${csreceiveVo.csreceive_hp}</th> --%>
				<%-- 						<th>${csreceiveVo.csreceive_email}</th> --%>
				<%-- 						<th>${csreceiveVo.csreceive_title}</th> --%>
				<%-- 						<th>${csreceiveVo.csreceive_content}</th> --%>
				<%-- 				</c:forEach> --%>
				<!-- 				</tbody> -->
				<!-- 			</table> -->

			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/include/footer.jsp"%>