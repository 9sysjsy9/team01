<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/include/header.jsp"%>
<section id="banner">
	<div class="content">
		<input type="checkbox"> 체크박스
		<!-- 내용 시작 -->
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<form role="form">
						<div class="form-group">

							<label for="exampleInputEmail1"> Email address </label> <input
								type="email" class="form-control" id="exampleInputEmail1" />
						</div>
						<div class="form-group">

							<label for="exampleInputPassword1"> Password </label> <input
								type="password" class="form-control" id="exampleInputPassword1" />
						</div>
						<div class="form-group">

							<label for="exampleInputFile"> File input </label> <input
								type="file" class="form-control-file" id="exampleInputFile" />
							<p class="help-block">Example block-level help text here.</p>
						</div>
						<div class="checkbox">

							<label> <input type="checkbox" /> Check me out
							</label>
						</div>
						<button type="submit" class="btn btn-primary">Submit</button>
					</form>
				</div>
			</div>
		</div>
		<!-- /내용 끝 -->
	</div>
</section>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
