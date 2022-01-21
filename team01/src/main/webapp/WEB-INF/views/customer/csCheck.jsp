<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<script>
$(function(){
	

	$(".listTitle").click(function(e){
		e.preventDefault();
		
		console.log("클릭");
		
		$(this).next().toggle(500);
		$(this).next().next().toggle(500);
	});

});
</script>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="jumbotron" style="padding: 10px;">
				<br>
				<h1 style="padding-left: 110px;">
					<b>CS 접수 현황</b>
					<br>
					<b style="font-size: 20px;">현재 서비스 진행중인 내용을 확인하세요.</b>
				</h1>
				<p></p>
				
				<div class="container-fluid"
					style="padding-left: 110px; padding-right: 200px;">
					
					<div class="row">
						<div class="col-md-12">
							<table class="table">
								<thead>
									<tr>
										<td><b>No</b></td>
										<td><b>항목</b></td>
										<td><b>제목</b></td>
										<td><b>내용</b></td>
										<td><b>작성자</b></td>
										<td><b>주문번호</b></td>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${list}" var="csreceiveVo">
										<tr class="table-success listTitle">
											<td>${csreceiveVo.cs_num}</td>
											<td>${csreceiveVo.cate}</td>
											<td>${csreceiveVo.title}</td>
											<td>${csreceiveVo.content}</td>
											<td>${csreceiveVo.user_id}</td>
											<td>${csreceiveVo.order_code}</td>
										</tr>
							
										<tr style="display:none" class="content">
											<td colspan="4">문의 내용 : ${csreceiveVo.content}</td>
										</tr>
										
										<tr style="display:none" class="title">
											<td colspan="4">답변 내용 : ${csreceiveVo.reply}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<br>
				<div>
					<p style="padding-left: 110px;">
						<a class="btn btn-primary btn-large" 
							href="/product/product_index">다른 제품 쇼핑하기</a>
					</p>
				</div>

			</div>
			
			
		</div><!-- col -->
	</div><!-- row -->
</div><!-- container -->

<%@ include file="/WEB-INF/views/include/footer.jsp"%>