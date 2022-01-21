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
	
	a:hover {
		color : red;
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
			location.href = "/company/board/anonymous/anonymous_content?bno="+move;
		}
	});
	
	$("#btnDelete").click(function(){
		var bno = $(this).attr("data-bno");
		console.log("bno:", bno);
		location.href = "/company/board/anonymous/anonymous_delete?bno="+bno;
	});
	
	$("#btnModify").click(function(){
		var bno = $(this).attr("data-bno");
		location.href = "/company/board/anonymous/anonymous_modify?bno="+bno;
	});
	
	$("#btnMenu").click(function(){
		location.href = "/company/board/anonymous/anonymous_list";
	});
	
	$(".btnCommentDelet").click(function(){
		var cno = $(this).attr("data-cno");
		var bno = "${boardVo.bno}";
		var writer = $(this).attr("data-userid");
		var loginId = "${loginData.userid }";
		if(writer == loginId || ${loginData.authority} == "3"){
			location.href = "/comment/deleteFreeComment?cno=" + cno + "&bno=" + bno; 
		} else {
			alert("직접 작성한 댓글이 아닙니다.");
		};
	});
	
});
</script>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-3">
		</div>
		<div class="col-md-6">
				<div class="form-group">
					<h1 class="display-5 fw-bolder" id="store"
						style="margin-bottom: 50px; margin-top: 50px;">대나무숲</h1>
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
				<div class="form-group" >익명</div>
				<hr>
				<div>${boardVo.content}</div>
				<hr>
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12">
							<table class="table">
							<tbody id="commentList">
							</tbody>
								<tbody>
									<c:forEach items="${list}" var="commentVo">
										<tr>
											<td style="width: 66px;padding-top: 25px;"><img src="/images/pp.png" width="40" height="40"></td>
											<td style="height: 98px; padding-top: 20px;">
												<dl>
													<dt data-userid="${commentVo.userid}">익명<br>
													</dt>
													<dd></dd>
													<dd>
														${commentVo.content}
													</dd>
													<dd>
														${commentVo.regdate} <a class="btnCommentDelet" 
														data-cno="${commentVo.cno }" data-userid="${commentVo.userid}">댓글삭제</a>
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
				<form action="/comment/insertAnonymousComment" method="post">
				<div>
				<input type="hidden" name="userid" value="${loginData.userid }">
				<input type="hidden" name="username" value="${loginData.username }">
				<input type="hidden" name="bno" value="${boardVo.bno}">
					<div class="row">
						<div class="col-md-8">
							<label>${loginData.username }(${loginData.userid })</label>
							<input type="text" class="form-control"
								placeholder="댓글을 입력하세요" id="c_content" name="content">
						</div>
						<div class="col-md-2" style="margin-top: 32px;">
							<button type="submit" class="btn btn-outline-primary"
								id="btnCommentInsert" data-bno="${boardVo.bno }">완료</button>
						</div>
					</div>
				</div>
				</form>
				<div>
					<div class="row">
						<div class="col-md-6">
							<div>
								<a class="btn btn-outline-primary" id="btnMenu" style="margin-top: 20px;">목록</a>
							</div>
						</div>
						<div class="col-md-6">
							<div class="move" style="margin-top: 20px;">
								<a class="btnMove btn btn-outline-primary" id="btnPrev" href="${boardMoveVo.prev}">이전</a>
								<a class="btnMove btn btn-outline-primary" id="btnNext" href="${boardMoveVo.next}">다음</a>
							</div>
						</div>
					</div>
				</div>
		</div>
		<div class="col-md-3"></div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>