<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/include/header.jsp"%>


<!-- Product section-->
<section class="py-5">
	<div class="container px-4 px-lg-5 my-5">
		<div class="row gx-4 gx-lg-5 align-items-center">
			<div class="col-md-6">
				<img class="card-img-top mb-5 mb-md-0"
					src="/images/applyFranchise.png" />
			</div>
			<div class="col-md-6">
				<form role="form" action="/store/applyRegistRun" method="get">

					<div class="form-group">
						<label for="email"> 지원한 이메일 </label> <input type="email"
							class="form-control" id="email" name="email"
							placeholder="example@shoese.com" required />
					</div>
					<br>
					<button type="submit" class="btn btn-outline-primary flex-shrink-0">
						조회하기</button>

				</form>
			</div>
		</div>
	</div>
</section>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>