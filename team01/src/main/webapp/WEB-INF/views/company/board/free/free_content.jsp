<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ include file="/WEB-INF/views/company/include/header.jsp"%> 
<style>
	.move{
		text-align: right;
	}
	.btnMD{
		text-align: right;
	}
 	   
</style>
<script>
$(function(){
	$(".btnMove").click(function(e) {
		e.preventDefault();
		var move = $(this).attr("href");
		console.log("move : " + move);
		if(move == "0"){
			alert("페이지가 존재 하지 않습니다.");
		} else {
			location.href = "/company/board/free/free_content?bno="+move;
		}
	});
	
	$("#btnDelete").click(function(){
		var bno = $(this).attr("data-bno");
		console.log("bno:", bno);
		location.href = "/company/board/free/free_delete?bno="+bno;
	});
	
	$("#btnModify").click(function(){
		var bno = $(this).attr("data-bno");
		location.href = "/company/board/free/free_modify?bno="+bno;
	});
	
	$("#btnMenu").click(function(){
		location.href = "/company/board/free/free_list";
	});
	
	$("#btnCommentInsert").click(function() {
		var content = $("#c_content").val();
		var sData = {
				"content"	: content,
				"userid"	: "${boardVo.userid}",
				"username"	: "${boardVo.username}",
				"bno"		: "${boardVo.bno}"
		};
		console.log("sData", sData);
		var url = "/comment/insertComment";
		$.post(url, sData, function(rData) {
		});
	});
});
</script>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-3">
		</div>
		<div class="col-md-6">
			<form role="form">
				<div class="form-group">
					<h1 class="display-5 fw-bolder" id="store"
						style="margin-bottom: 50px; margin-top: 50px;">자유게시판</h1>
					<div>
						<h3>${boardVo.title }</h3>
					</div>	
				</div>
				<div>
					<c:if test="${loginData.userid == boardVo.userid}">
						<div class="btnMD">
							<a class="btn btn-outline-warning" id="btnModify" data-bno="${boardVo.bno }">수정</a>
							<a class="btn btn-outline-danger" id="btnDelete" data-bno="${boardVo.bno }">삭제</a>
						</div>
					</c:if>
				</div>
				<div class="form-group">${boardVo.username }</div>
				<hr>
				<div>${boardVo.content}</div>
				<hr>
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12">
							<table class="table">
								<tbody>
									<c:forEach items="${list }" var="commentVo">
										<tr>
											<td style="width: 66px;padding-top: 25px;"><img src="/images/pp.png" width="40" height="40"></td>
											<td style="height: 98px; padding-top: 20px;">
												<dl>
													<dt>
														${boardVo.username }(${boardVo.userid })<br>
													</dt>
													<dd></dd>
													<dd>
														${commentVo.content }
													</dd>
													<dd>
														${commentVo.regdate }
													</dd>
												</dl>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div>
					<div class="row">
						<div class="col-md-8">
							<label>${boardVo.username }(${boardVo.userid })</label>
							<input type="text" class="form-control"
								placeholder="댓글을 입력하세요" id="c_content">
						</div>
						<div class="col-md-2" style="margin-top: 32px;">
							<button type="button" class="btn btn-outline-primary"
								id="btnCommentInsert" data-bno="${boardVo.bno }">완료</button>
						</div>
					</div>
				</div>
				<div>
					<div class="row">
						<div class="col-md-6">
							<div>
								<a class="btn btn-outline-primary" id="btnMenu">목록</a>
							</div>
						</div>
						<div class="col-md-6">
							<div class="move">
								<a class="btnMove btn btn-outline-primary" id="btnPrev" href="${boardMoveVo.prev}">이전</a>
								<a class="btnMove btn btn-outline-primary" id="btnNext" href="${boardMoveVo.next}">다음</a>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
		<div class="col-md-3"></div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>