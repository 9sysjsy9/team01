<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/include/header.jsp"%>

        <!-- Product section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0" src="/images/applyFranchise.png"/></div>
                    <div class="col-md-6">
						<form role="form" action="/store/applyRegist">
						<div class="form-group">
							<label for="contact">
								연락처
							</label>
							<input type="text" class="form-control" id="contact" name="contact" required/>
						</div>
						
						<div class="form-group">
							<label for="email">
								이메일
							</label>
							<input type="email" class="form-control" id="email" name="email" required/>
						</div>
						<div class="form-group">
							 <br>
							<label for="inquiry">
								문의 내용
							</label><br>
							<textarea class="form-control" rows="12" name="inquiry" required></textarea>
						</div>
						<Br>
						<button type="submit" class="btn btn-outline-primary flex-shrink-0">
							지원하기
						</button>
					</form>
                    </div>
                </div>
            </div>
        </section>
     
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
