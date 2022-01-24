<!-- 기능 담당자 : 고만재 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/company/include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/company/board/pagingForm.jsp"%>
<script>
$(function(){
	//수정 폼 버튼
	$(".modifyRunBtn").click(function(e){
		e.preventDefault();
		$("#modifyForm").submit();
		console.log("수정 완료 버튼 클릭");
	});
	
	//목록 버튼
	$(".cancelBtn").click(function(e){
		console.log("취소 버튼 클릭")
		e.preventDefault();
		$("#pagingForm").attr("action","/company/board/notice/notice_content");
		$("#pagingForm > input[name=bno]").val("${content.bno}");
		$("#pagingForm > input[name=page]").val("${pagingDto.page}");
		$("#pagingForm > input[name=searchType]").val("${pagingDto.searchType}");
		$("#pagingForm > input[name=keyword]").val("${pagingDto.keyword}");
		$("#pagingForm").submit();
	});
	
});
</script>
<!-- section-->
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
<form id="modifyForm" method="POST" action="/company/board/notice/noticeModifyRun">
					<input type="hidden" name="bno" value="${content.bno}">
						<table class="table">
							<tbody>
								<tr>
									<td>제목
									 <input class="form-control" type="text" name="title" placeholder="제목을 입력하세요." value="${content.title}"> 
									</td>
								</tr>
								
								<tr>
									<td>
										내용<br>
										<textarea rows="10" class="form-control" name="content" placeholder="내용을 입력하세요.">${content.content}</textarea>
									</td>
								</tr>
							</tbody>
						</table>
							<div style="text-align:right">
									<button type='button' class='cancelBtn btn btn-outline-secondary flex-shrink-0 btn-sm'>취소</button>
								<c:if test="${loginData.authority == 3}">
									<button type='button' class='modifyRunBtn btn btn-outline-warning flex-shrink-0 btn-sm'>수정 완료</button>
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