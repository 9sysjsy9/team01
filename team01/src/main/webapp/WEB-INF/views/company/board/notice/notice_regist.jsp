<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/company/include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/company/board/pagingForm.jsp"%>
<!-- http://localhost/company/board/notice/notice_regist -->
<script>
$(function(){
	
//파일 첨부

	var formData = new FormData();
	 console.log("formData", formData)
	$("#exportFile1").change(function(e){
		e.preventDefault();
		file1 = $("#exportFile1")[0].files[0];
		console.log("file1 : " + file1);
		formData.append("file1", file1);
		/*
		var url = "/company/board/notice/uploadFileAjax";
		if(file != null){
			$.ajax({
				"processData" : false,
				"contentType" : false,
				"method" : "post",
				"url" : url,
				"data" : formData,
				"success" : function(filePath){
					console.log("filePath : " + filePath);
				}
			});
		}
		*/
		console.log("formData : " + formData);
		console.log("formData", formData);
	});
	
	$("#exportFile2").change(function(e){
		e.preventDefault();
		file2 = $("#exportFile2")[0].files[0];
		console.log("file2 : " + file2);
		formData.append("file2", file2);
		console.log("formData : " + formData);
	});
	
	
	$(".noticeListBtn").click(function(e){
		e.preventDefault();
		var bno = $(this).attr("href");
		$("#pagingForm").attr("action","/company/board/notice/notice_list");
		$("#pagingForm > input[name=page]").val("${noticePagingDto.page}");
		$("#pagingForm > input[name=searchType]").val("${noticePagingDto.searchType}");
		$("#pagingForm > input[name=keyword]").val("${noticePagingDto.keyword}");
		$("#pagingForm").submit();
	});
	
	
	$(".noticeRegistRunBtn").click(function(e){
		e.preventDefault();
		$("#noticeRegistForm").submit();
		console.log("게시 버튼 클릭");
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
							<tbody>
								<tr>
									<td>제목
									 <input class="form-control" type="text" name="title" placeholder="제목을 입력하세요."> 
									</td>
								</tr>
								
								<tr>
									<td>
										내용<br>
										<textarea rows="10" class="form-control" name="content" placeholder="내용을 입력하세요."></textarea>
									</td>
								</tr>
								<tr>
									<td>첨부 1<span></span>
										<input type="file" class="form-control" id="exportFile1"/>
										첨부 2
										<input type="file" class="form-control" id="exportFile2"/>
									</td>
								</tr>
							</tbody>
						</table>
							<div style="text-align:right">
									<button type='button' class='noticeListBtn btn btn-outline-secondary flex-shrink-0 btn-sm'>목록</button>
								<c:if test="${loginData.authority == 3}">
									<button type='button' class='noticeRegistRunBtn btn btn-outline-primary flex-shrink-0 btn-sm'>게시</button>
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