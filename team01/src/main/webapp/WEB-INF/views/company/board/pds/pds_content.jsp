<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/company/include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/company/member/memberInfo.jsp"%>
<%@ include file="/WEB-INF/views/company/board/pagingForm.jsp"%>

<script>
$(function(){

	//목록 버튼
	$(".listBtn").click(function(e){
		console.log("목록 버튼 클릭")
		e.preventDefault();
		$("#pagingForm").attr("action","/company/board/pds/pds_list");
		$("#pagingForm > input[name=page]").val("${pagingDto.page}");
		$("#pagingForm > input[name=searchType]").val("${pagingDto.searchType}");
		$("#pagingForm > input[name=keyword]").val("${pagingDto.keyword}");
		$("#pagingForm").submit();
	});
	
	//삭제 버튼
	$(".deleteRunBtn").click(function(e){
		var result = confirm("삭제 하시겠습니까?");
		if(result){
			location.href = "/company/board/pds/pdsDeleteRun/"+${content.bno};
		};
	});
	//수정 버튼
	$(".modifyBtn").click(function(e){
// 		location.href = "/company/board/notice/notice_modify/"+${noticeContent.bno};
		$("#pagingForm").attr("action","/company/board/pds/pds_modify");
		$("#pagingForm > input[name=bno]").val("${content.bno}");
		$("#pagingForm > input[name=page]").val("${pagingDto.page}");
		$("#pagingForm > input[name=searchType]").val("${pagingDto.searchType}");
		$("#pagingForm > input[name=keyword]").val("${pagingDto.keyword}");
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
						<h1 class="display-5 fw-bolder" id="store">자료실</h1>
					</div>
					<div class="col-md-2"></div>

				</div>
				<div class="row">
					<div class="col-md-2"></div>

					<div class="col-md-8">
					
<form id="contentForm" method="POST" action="/company/board/pds/pdsRegistRun">
					<input type="hidden" name="userid" value="${loginData.userid}">
						<table class="table">

							<tbody>
								<tr>
									<td>
										<h4>${content.title}</h4>
									 	<div><span style="cursor: pointer" class="btnUsername" data-userid="${content.userid}">${content.username}</span> | <span>${content.regdate}</span></div> 
									</td>
								</tr>
								

								
								<tr>
									<td>
										
										<textarea rows="10" class="form-control" name="content" placeholder="내용이 없습니다." readonly>${content.content}</textarea>
									</td>
								</tr>
								
								<tr>
									<td>첨부파일 :
										<c:forEach items="${content.files}" var="file">
										
											<span> <a href="/company/board/fileDownload?filename=${file}">${file}</a></span>
										
										</c:forEach>
									
									</td>
								</tr>
							</tbody>
						</table>
							<div style="text-align:right">
									<button type='button' class='listBtn btn btn-outline-secondary flex-shrink-0 btn-sm'>목록</button>
								<c:if test="${loginData.userid == content.userid}">
									<button type='button' class='modifyBtn btn btn-outline-warning flex-shrink-0 btn-sm'>수정</button>
								</c:if>
								<c:if test="${loginData.userid == content.userid || loginData.authority >= 3}">
									<button type='button' class='deleteRunBtn btn btn-outline-danger flex-shrink-0 btn-sm'>삭제</button>
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