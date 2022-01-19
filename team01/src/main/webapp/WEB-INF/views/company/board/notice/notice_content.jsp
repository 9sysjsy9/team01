<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/company/include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/company/member/memberInfo.jsp"%>
<%@ include file="/WEB-INF/views/company/board/pagingForm.jsp"%>
<!-- http://localhost/company/board/notice/notice_regist -->
<script>
$(function(){

	//목록 버튼
	$(".noticeListBtn").click(function(e){
		console.log("목록 버튼 클릭")
		e.preventDefault();
// 		location.href = "/company/board/notice/notice_list";
		$("#pagingForm").attr("action","/company/board/notice/notice_list");
		$("#pagingForm > input[name=page]").val("${noticePagingDto.page}");
		$("#pagingForm > input[name=searchType]").val("${noticePagingDto.searchType}");
		$("#pagingForm > input[name=keyword]").val("${noticePagingDto.keyword}");
		$("#pagingForm").submit();
	});
	
	//삭제 버튼
	$(".noticeDeleteRunBtn").click(function(e){
		var result = confirm("삭제 하시겠습니까?");
		if(result){
			location.href = "/company/board/notice/noticeDeleteRun/"+${noticeContent.bno};
		};
	});
	//수정 버튼
	$(".noticeModifyBtn").click(function(e){
// 		location.href = "/company/board/notice/notice_modify/"+${noticeContent.bno};
		$("#pagingForm").attr("action","/company/board/notice/notice_modify");
		$("#pagingForm > input[name=bno]").val("${noticeContent.bno}");
		$("#pagingForm > input[name=page]").val("${noticePagingDto.page}");
		$("#pagingForm > input[name=searchType]").val("${noticePagingDto.searchType}");
		$("#pagingForm > input[name=keyword]").val("${noticePagingDto.keyword}");
		$("#pagingForm").submit();
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
						<h1 class="display-5 fw-bolder" id="store">공지사항</h1>
					</div>
					<div class="col-md-2"></div>

				</div>
				<div class="row">
					<div class="col-md-2"></div>

					<div class="col-md-8">
					
<form id="noticeRegistForm" method="POST" action="/company/board/notice/noticeRegistRun">
					<input type="hidden" name="userid" value="${loginData.userid}">
						<table class="table">
<!-- 							<thead> -->
<!-- 								<tr> -->
<!-- 									<th>제목 -->
<!-- 									 <input class="form-control" type="text" name="title">  -->
<!-- 									</th> -->
<!-- 								</tr> -->
<!-- 							</thead> -->
							<tbody>
								<tr>
									<td>
										<h4>${noticeContent.title}</h4>
<%-- 									 	<input class="form-control" type="text" name="title" value="${noticeContent.title}" readonly> --%>
									 	<div><span style="cursor: pointer" class="btnUsername" data-userid="${noticeContent.userid}">${noticeContent.username}</span> | <span>${noticeContent.regdate}</span></div> 
									</td>
								</tr>
								

								
								<tr>
									<td>
										
										<textarea rows="10" class="form-control" name="content" placeholder="내용이 없습니다." readonly>${noticeContent.content}</textarea>
									</td>
								</tr>
								
								<tr>
									<td>첨부파일 : <span></span>
									</td>
								</tr>
							</tbody>
						</table>
							<div style="text-align:right">
									<button type='button' class='noticeListBtn btn btn-outline-secondary flex-shrink-0 btn-sm'>목록</button>
								<c:if test="${loginData.userid == noticeContent.userid}">
									<button type='button' class='noticeModifyBtn btn btn-outline-warning flex-shrink-0 btn-sm'>수정</button>
									<button type='button' class='noticeDeleteRunBtn btn btn-outline-danger flex-shrink-0 btn-sm'>삭제</button>
								</c:if>
							</div>
</form>
					</div>
					<div class="col-md-2">
					</div>
					
					
				</div>


			</div>
		</div>
	</div>
</section>


<%@ include file="/WEB-INF/views/include/footer.jsp"%>