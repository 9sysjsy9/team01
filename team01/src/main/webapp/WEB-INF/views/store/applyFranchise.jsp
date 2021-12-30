<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/include/header.jsp"%>

        <!-- Product section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0" src="https://dummyimage.com/600x700/dee2e6/6c757d.jpg" alt="..." /></div>
                    <div class="col-md-6">
<form role="form">
						<div class="form-group">
							 
							<label for="exampleInputEmail1">
								지원자 이름
							</label>
							<input type="email" class="form-control" id="exampleInputEmail1" />
						</div>
						<div class="form-group">
							 <br>
							<label for="exampleInputPassword1">
								지원서
							</label><br>
							<textarea class="form-control" rows="15"></textarea>
						</div>
						<Br>
						<button type="submit" class="btn btn-primary">
							지원하기
						</button>
					</form>
                    </div>
                </div>
            </div>
        </section>
     
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
