<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<form action="/hire/regist_run" method="get">
	<section class="py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="row gx-4 gx-lg-5 align-items-center">
				<div class="col-md-6">
					<img class="card-img-top mb-5 mb-md-0"
						src="https://dummyimage.com/600x700/dee2e6/6c757d.jpg" alt="..." />
				</div>
				<div class="col-md-6">
					<h1 class="display-5 fw-bolder">채용 지원</h1>
					<div class="container-fluid">
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<label for="exampleInputEmail1"> 이름 </label> 
									<input type="text" class="form-control" name="name" required/>
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1"> 이메일 </label> 
									<input type="email" class="form-control" name="email" required/>
								</div>
								
								<div class="form-group">
									<label for="exampleInputPassword1"> 전화번호 </label> 
									<input type="text" class="form-control" name="phonnum" required/>
								</div>
								
								<div class="form-group">
									<label for="exampleInputPassword1"> 경력 </label><br>
										<input type="radio" style="margin-left:5px; margin-right: 10px;" 
											value="신입" name="career" required>신입
										<input type="radio" style="margin-left:20px; margin-right: 10px;" 
											value="경력" name="career" required>경력
										<input type="radio" style="margin-left:20px; margin-right: 10px;" 
										 	value="인턴" name="career" required>인턴
								</div>
								
								<div class="form-group">
									<label for="exampleInputPassword1"> 자기소개 </label> 
									<textarea rows="8" cols="50" class="form-control" id="exampleInputPassword1" 
										name="content" placeholder="간략한 자기소개 작성 바랍니다."></textarea>
								</div>
								
							</div>
							<div>
								<button class="btn btn-outline-dark flex-shrink-0" type="submit"
									style="margin-top:15px;"> 신청 </button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</form>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>