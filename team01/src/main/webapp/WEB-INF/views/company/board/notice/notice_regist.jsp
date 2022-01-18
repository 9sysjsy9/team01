<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/company/include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- http://localhost/company/board/notice/notice_regist -->
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
									<td>제목
									 <input class="form-control" type="text" name="title" placeholder="제목을 입력하세요."> 
									</td>
								</tr>
								
								<tr>
									<td>
										내용<br>
										<textarea rows="10" class="form-control" name="content"></textarea>
									</td>
								</tr>
							</tbody>
						</table>
							<div style="text-align:right">
								<c:if test="${loginData.authority == 3}">
									<button type='button' class='btn btn-outline-primary flex-shrink-0 btn-sm'>게시</button>
								</c:if>
							</div>
							
							
					</div>
					<div class="col-md-2">
					</div>
				</div>


			</div>
		</div>
	</div>
</section>


<%@ include file="/WEB-INF/views/include/footer.jsp"%>