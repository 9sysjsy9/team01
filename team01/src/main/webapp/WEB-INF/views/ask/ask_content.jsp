<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>


<script>
function changeDateString(timestamp){
	var d = new Date(timestamp);
    var year = d.getFullYear();
    var month = d.getMonth() + 1;
    var date = d.getDate();
    var hour = d.getHours();
    var minute = d.getMinutes();
    var second = d.getSeconds();
    var dateString = year + "-" + month + "-"+date+" ";
    dateString += hour +":"+minute+":"+second;
    return dateString;
};
$(function() {
	$("#btnDelete").click(function() {
		var ano = $(this).attr("data-ano");
		location.href = "/ask/ask_delete_run?ano="+ano;
	});
	$("#btnModify").click(function() {
		$(".modify").prop("readonly", false);
		$("#btnModifyOk").fadeIn(500);
		$(this).fadeOut(500);		
	});
});
</script>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="jumbotron">
				<h2>고객문의 상세보기</h2>
				<p>
					<a class="btn btn-primary btn-large" href="/ask/ask_list">문의목록</a>
				</p>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<form id="myForm" action="/ask/ask_modify_run" method="get">
				<div class="form-group">
					<label for="ano">문의 번호</label> <input type="text"
						class="form-control" id="ano" name="ano" required="required"
						value="${askProductVo.ano}" readonly="readonly" />
				</div>
				<div class="form-group">
					<label for="ask_title">제목</label> <input type="text"
						class="form-control modify" id="ask_title" name="ask_title"
						required="required" value="${askProductVo.ask_title}"
						readonly="readonly" />
				</div>
				<div class="form-group" style="vertical-align: left;">
					<label for="ask_content">내용</label> <input type="text"
						class="form-control modify" id="ask_content" name="ask_content"
						required="required" value="${askProductVo.ask_content}"
						readonly="readonly" />
				</div>
				<div class="form-group">
					<label for="name">아이디</label> <input type="text"
						class="form-control" id="user_id" name="user_id"
						<c:choose>
							<c:when test="${userData.user_id == askProductVo.user_id}">
							value="${askProductVo.user_id}"
							</c:when>
							<c:otherwise>
							value="********"
							</c:otherwise>
							</c:choose>
						readonly="readonly" />
				</div>
				<c:if test="${userData.user_id == askProductVo.user_id}">
				<button type="button" class="btn btn-warning" id="btnModify">수정</button>
				<button type="submit" class="btn btn-success" id="btnModifyOk"
					style="display: none">수정완료</button>
				<button type="button" class="btn btn-danger" id="btnDelete"
					data-ano="${askProductVo.ano}">삭제</button>
				</c:if>
			</form>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>