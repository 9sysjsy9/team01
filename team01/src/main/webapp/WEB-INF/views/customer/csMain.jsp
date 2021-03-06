<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
 

<div class="jumbotron" style="padding: 10px;"><br>
	<h1 style="padding-left: 110px;"><b>CS센터</b></h1>
	<p><h5 style="padding-left: 110px;">서비스 접수 전 아래의 공지사항을 확인해주세요.</h5></p>
</div>
<div style="background-color:#ffcc99; padding:10px;">
	<h4 style="padding-left: 130px;"><b>[ 교환, 반품 및 환불이 불가능한 경우 ]</b></h4>
	<p style="padding-left: 130px;">- 고객님의 책임 있는 사유로 상품등이 멸실 또는 훼손된 경우</p>  
	<p style="padding-left: 150px;">단,상품의 내용을 확인하기 위하여 포장 등을 훼손한 경우는 제외</p>
	<p style="padding-left: 130px;">- 포장을 개봉하였거나 포장이 훼손되어 상품가치가 상실된 경우</p>
	<p style="padding-left: 130px;">- 고객님의 사용 또는 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우.</p>
	<p style="padding-left: 130px;">- 시간의 경과에 의하여 재판매가 곤란할 정도로 상품등의 가치가 현저히 감소한 경우</p>
	<p style="padding-left: 130px;">※ 고객님의 변심으로 인한 교환, 반품을 하실 경우 상품반송 비용은 고객님 부담입니다.</p>
	<p style="padding-left: 150px;">(색상 교환, 사이즈 교환 등 포함)</p>
</div>
<br>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-4">
			<h2><center>교환</center></h2>
			<p><center>제품 수령 후 7일 이내 교환 요청을<br>
				해주셔야 합니다. 동일한 상품명의 <br>
				옵션으로만 교환 요청이 가능합니다.</center></p>
			<div style=" text-align: center;">
				<a class="btn btn-primary my-2 my-sm-0" 
					type="submit" style=" display: inline-block;" 
					href="/customer/csExchange">교환 접수 안내
				</a>
			</div>
		</div>
		<div class="col-md-4">
			<h2><center>반품</center></h2>
			<p><center>신청 시 택배사에서 고객님이 요청한 <br>
				회수지로 회수하러 가며, 고객님께서 <br>
				직접 택배사에 신청하셔서 교환 상품 <br>
				보내주실 수 있습니다.</center></p>
			<div style=" text-align: center;">
				<a class="btn btn-primary my-2 my-sm-0" 
					type="submit" style=" display: inline-block;" 
					href="/customer/csReturn">반품 접수 안내
				</a>
			</div>
		</div>
		<div class="col-md-4">
			<h2><center>환불</center></h2>
			<p><center>제품 수령 후 7일 이내 환불 요청을 <br>
				해주시고, 받아보셨던 상태 그대로 <br>
				재포장하여 반품 하셔야 합니다.</center></p>
			<div style=" text-align: center;">
				<a class="btn btn-primary my-2 my-sm-0" 
					type="submit" style=" display: inline-block;" 
					href="/customer/csRefund">환불 접수 안내
				</a>
			</div>
		</div>
	</div>
</div>
        
<%@ include file="/WEB-INF/views/include/footer.jsp"%>