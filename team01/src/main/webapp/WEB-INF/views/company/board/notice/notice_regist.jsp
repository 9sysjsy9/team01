<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/company/include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/company/board/pagingForm.jsp"%>
<!-- http://localhost/company/board/notice/notice_regist -->
<script>
$(function(){

//파일 첨부

	$(".noticeListBtn").click(function(e){
		e.preventDefault();
		var bno = $(this).attr("href");
		$("#pagingForm").attr("action","/company/board/notice/notice_list");
		$("#pagingForm > input[name=page]").val("${noticePagingDto.page}");
		$("#pagingForm > input[name=searchType]").val("${noticePagingDto.searchType}");
		$("#pagingForm > input[name=keyword]").val("${noticePagingDto.keyword}");
		$("#pagingForm").submit();
	});
		
//파일 첨부 삭제 프로세스-------------------------------------------
// $("#noticeRegistForm").click(function(e){
	
// });


$("#noticeRegistForm").submit(function(e) {
	
// 	console.log($(".file1")[0].files[0]);
// 	if($(".file")
// 	console.log($(".file2")[0].files[0]);
// 	e.preventDefault();
	
	$(".files").each(function(i) {
		var file = $(this)[0].files[0];
		if(file != null){
			console.log("file : ", file);
			$(this).attr("name", "files");
		}
	});
});

/*
	var files = [];
	var file;
	var formData = new FormData();
	
	 //1번 파일 담기
	$("#exportFile1").change(function(e){
		e.preventDefault();
		files[0] = $(this)[0].files[0];
	});
	 
	//2번 파일 담기
	$("#exportFile2").change(function(e){
		e.preventDefault();
		files[1] = $(this)[0].files[0];
	});
	
	//전송 실행 버튼
	$(".noticeRegistRunBtn").click(function(e){
// 		formData.delete("files");
		$(".files").each(function(i) {
			files[i] = $(this)[0].files[0];
			formData.append("files", files[i]);
		});
		console.log(files);
		
		console.log("files : ", files);
// 		formData.append("files", file);
// 		if(files.length > 0){
// 			for(var i = 0 ; i < files.length ; i++){
// 				formData.append("files", file);
				
// 			}
			
			
	 		var url = "/company/board/fileUploadAjax";
	 		
	 		$.ajax({
				"processData" : false,
				"contentType" : false,
				"method" : "post",
				"url" : url,
				"data" : formData,
				"success" : function(filePath){
					console.log("filePath : " + filePath);
				}
			});//ajax
// 		};
	});
		
		
// 		if(files.length){
// 			console.log("not null");
// 		} else {
// 			console.log("null");
// 		}
		

		
// 		console.log("formData(+) : "+ formData);
// 		console.log("formData(,) : ", formData);
		
// 		formData.forEach(function(files){ // 파일 갯수만큼
// 			console.log("files : ", files);
// 		});
		
		//파일이 둘다 null 이라면 파일은 전송 안함
		
*/



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
					
<form id="noticeRegistForm" method="POST" action="/company/board/notice/noticeRegistRun" enctype="multipart/form-data">
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
										<input type="file" class="form-control files"/>
										첨부 2
										<input type="file" class="form-control files"/>
									</td>
								</tr>
							</tbody>
						</table>
							<div style="text-align:right">
									<button type='button' class='noticeListBtn btn btn-outline-secondary flex-shrink-0 btn-sm'>목록</button>
								<c:if test="${loginData.authority == 3}">
									<button type='submit' class='noticeRegistRunBtn btn btn-outline-primary flex-shrink-0 btn-sm'>게시</button>
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