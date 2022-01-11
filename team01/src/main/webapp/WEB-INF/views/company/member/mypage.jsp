
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/WEB-INF/views/company/include/header.jsp"%>
<script>
$(function(){
	if("${memberData.profileimg}" == 'y'){
		
	$("#profileImg").attr("src","/member/company/profileImgLoad?eno=${loginData.eno}");
	
	}
	
	$("#infoModifyBtn").click(function(e){
		
		 var phoneData = "${memberData.phone}";
		 var firstBar = phoneData.indexOf("-");
		 var lastBar = phoneData.lastIndexOf("-");
		 var phone1 = phoneData.substring(0,firstBar);
		 var phone2 = phoneData.substring(firstBar+1,lastBar);
		 var phone3 = phoneData.substring(lastBar+1);
		 $("#phone1").val(phone1);
		 $("#phone2").val(phone2);
		 $("#phone3").val(phone3);
		 var introduce = "${memberData.introduce}";
		 introduce = introduce.replaceAll("<br/>","\r\n");
		 $("#introduce").val(introduce);
		 $("#modal-infoModify").trigger("click");
	});

	// 프로필 사진 선택 input
	$("#profileImgSelect").change(function(e){
		e.preventDefault();
		console.log("파일이 선택되었습니다.");
		file = $("#profileImgSelect")[0].files[0];
		console.log("file : " + file);
	
		var dotIndex = $(this).val().lastIndexOf(".");
		var extName = $(this).val().substring(dotIndex + 1).toUpperCase();
		
		if(extName != "JPG"){
			alert("JPG형식의 이미지만 가능합니다.");
			return;
		}
		 console.log("test");
		var formData = new FormData();
		formData.append("file", file);
		formData.append("eno", "${loginData.eno}");
		var url = "/member/company/profileImgAjax";
		
		if(file != null){
		//preview 프로필 사진 표시
			$.ajax({
				"processData" : false,
				"contentType" : false,
				"method" : "post",
				"url" : url,
				"data" : formData,
				"success" : function(filePath) {
					console.log("filePath : " + filePath); 
					$("#profilePreview").attr("src", "/member/company/displaySample?fileName="+filePath);
				}
			});
		}
	});
	
		
	$("#modifyRunBtn").click(function(e){
		e.preventDefault();
		var phone = $("#phone1").val() + '-' + $("#phone2").val() + '-' + $("#phone3").val();
		var introduce = $("#introduce").val().replace(/(?:\r\n|\n|\n)/g, '<br/>');
		
		var url = "/member/company/myDataModifyRun";
		var sData = {
				"eno" : "${memberData.eno}",
				"profileimg" : "${memberData.profileimg}",
				"phone" : phone,
				"introduce" : introduce
		};
		$.post(url, sData, function(rData){
			console.log(rData);
			if(rData == "success"){
				alert("수정되었습니다.");
				location.href = "/member/company/myPage";
			}
		});
	});
});
</script>

<!-- Product section-->
<section class="py-5">
	<div class="container px-4 px-lg-5 my-5">
		<div class="row gx-4 gx-lg-5 align-items-center">
						<div class="row">
					<div class="col-md-2"></div>
		
			<div class="col-md-2 text-center">
				<img id="profileImg" class="card-img-top mb-5 mb-md-0"
					src="https://dummyimage.com/600x700/dee2e6/6c757d.jpg" alt="..."  style="max-width:200px"/>
				<br> <br>
				<button type="button"
					class="btn btn-outline-dark flex-shrink-0 btn-sm" id="infoModifyBtn">회원 정보 수정</button>
				<br> <br>
				<button type="button"
					class="btn btn-outline-dark flex-shrink-0 btn-sm">내가 작성한 글</button>
					<br> <br>
				<button type="button"
					class="btn btn-outline-primary flex-shrink-0 btn-sm">메시지 함</button>
					<br> <br>
				<button type="button"
					class="btn btn-outline-danger flex-shrink-0 btn-sm">탈퇴하기</button>
			</div>
			<div class="col-md-6">
				<h1 class="display-5 fw-bolder">내 정보</h1>
				<br>
				<div class="col-md-12">
					<table class="table">
						<tr>
							<td>이름</td>
							<td>${memberData.username}</td>
						</tr>
						<tr>
							<td>사번</td>
							<td>${memberData.eno}</td>
						</tr>
						<tr>
							<td>성별</td>
							<td>${memberData.gender}</td>
						</tr>
						<tr>
							<td>전화번호</td>
							<td>${memberData.phone}</td>
						</tr>
						<tr>
							<td>직급</td>
							<td>${memberData.position}</td>
						</tr>
						<tr>
							<td>부서</td>
							<td>${memberData.department}</td>
						</tr>
						<tr>
							<td>가입일</td>
							<td>${memberData.regdate}</td>
						</tr>
						<tr>
							<td>자기소개</td>
							<td>${memberData.introduce}</td>
						</tr>
					</table>
				</div>

			</div>
			<div class="col-md-2"></div>
		</div>
	</div>
	</div>
</section>


<!-- 회원정보 수정 모달 -->

 <a id="modal-infoModify" href="#modal-container-infoModify" role="button" class="btn" data-toggle="modal" style="display:none">modifyModal</a>
			
			<div class="modal fade" id="modal-container-infoModify" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="myModalLabel">
								회원 정보 수정
							</h5> 
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">

							<div class="form-group text-center">
							
									<img id="profilePreview" class="card-img-top mb-5 mb-md-0" src="https://dummyimage.com/600x700/dee2e6/6c757d.jpg" alt="..."  style="max-width:200px"/>
								
								<div>
									<label for="profile">미리 보기<br>(JPG 형식의 이미지만 가능합니다.)</label>
									<input type="file" class="form-control-file" id="profileImgSelect" name="profileImg" />
								</div>
								
							</div>

							<div><label for="phone1"> 전화전호 </label></div>
							<div class="form-group input-group input-group-sm">
								 <input type="text" class="form-control" id="phone1" placeholder="010" maxlength="3"  /> -
								 <input type="text" class="form-control" id="phone2" placeholder="1234" maxlength="4" /> -
								 <input type="text" class="form-control" id="phone3" placeholder="5678" maxlength="4" />
							</div>
							<div><label for="introduce"> 자기소개 </label></div>
							<textarea class="form-control" rows="6" id="introduce" name="introduce"></textarea>
							
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary" id="modifyRunBtn">
								수정
							</button> 
							<button type="button" class="btn btn-secondary" id="modifyCancelBtn" data-dismiss="modal">
								취소
							</button>
						</div>
					</div>
					
				</div>
				
			</div>

<!-- /회원정보 수정 모달 -->


<%@ include file="/WEB-INF/views/include/footer.jsp"%>