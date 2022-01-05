<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<script>
$(function(){
	$("#btnSearch").click(function(e){
		var name = $("#name").val();
		var email = $("#email").val();
		var sData = {
				"name" : name,
				"email": email
		};
		console.log("sData : " + sData);
		var url = "/hire/search_success";
		$.get(url, sData, function(rData){
			console.log("rData : " + rData);
			if (rData == "success") {
				$(".imgSuccess").attr("style", "visibility:visible");
				$(".imgFail").attr("style", "display:none");
				$(".imgStay").attr("style", "display:none");
			} else if (rData == "fail"){
				$(".imgFail").attr("style", "visibility:visible");
				$(".imgSuccess").attr("style", "display:none");
				$(".imgStay").attr("style", "display:none");
			} else {
				$(".imgStay").attr("style", "visibility:visible");
				$(".imgFail").attr("style", "display:none");
				$(".imgSuccess").attr("style", "display:none");
			}
			$("#modalSearch").trigger("click");
		});
	});
});
</script>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<div class="jumbotron">
				<h1>채용 조회</h1>
				<p>지원하신 이름과 이메을을 입력해주세요</p>
			</div>
		</div>
		<div class="col-md-2">
		</div>
	</div>
</div>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<form role="form">
				<div class="form-group">
					<label for="name">이름</label>
					<input type="text" class="form-control" id="name" required/>
				</div>
				<div class="form-group">
					<label for="email">이메일</label>
					<input type="text" class="form-control" id="email" required/>
				</div>
				<div>
					<a id="btnSearch" class="btn btn-outline-dark flex-shrink-0" href="#">조회하기</a>
				</div>
			</form>
		</div>
		<div class="col-md-2">
		</div>
	</div>
</div>
<!-- 모달창 -->
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			 <a id="modalSearch" href="#modal-container-456175" role="button" class="btn" data-toggle="modal"
			 	style="display:none"></a>
			<div class="modal fade" id="modal-container-456175" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-body">
							<img class="imgSuccess card-img-top mb-5 mb-md-0"
								style="visibility:hidden" src="/images/success.png" />
							<img class="imgFail card-img-top mb-5 mb-md-0"
								style="visibility:hidden" src="/images/fail.png" />
							<img class="imgStay card-img-top mb-5 mb-md-0"
								style="visibility:hidden" src="/images/stay.png" />
						</div>
						<div class="modal-footer">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>