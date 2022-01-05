<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<style>
.content {
	display: none
}
</style>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(function() {
		$(".nask").click(function() {
			$(this).next().children().toggle();
		});
	});
</script>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="jumbotron">
				<h1><b>
					공지 사항</b><br>
				</h1>
				<p>
					<br><h5>수영 슈즈에 오신 것을 환영합니다. 아래의 공지사항을 확인해주세요.</h5>
				</p>
			</div>
			<table class="table">
				<thead>
					<tr>
						<th>No.</th>
						<th>제목</th>
						<th>날짜</th>
					</tr>
				</thead>
				<tbody>
<%-- 					<c:forEach items="${list}" var="noticeVo"> --%>
<!-- 						<tr class="notice"> -->
<%-- 							<td>${noticeVo.notice_no}</td> --%>
<%-- 							<td>${noticeVo.notice_title}</td> --%>
<%-- 							<td>${noticeVo.notice_date}</td> --%>
<!-- 						</tr> -->
					<tr class="table-warning nask">
						<th>1</th> 
						<th>수영슈즈 물류센터 방역 배송 안내</th>
						<th>2022-01-05</th> 
					</tr>
					<tr>
<!-- 					<td class="content" colspan="3"> -->
						<td></td> 
						<td class="nanswer">
							최근 신종 코로나바이러스 감염증(코로나19) 확진자 급증에 따라 추가 확산을 방지하고<br> 
							회원님께 안심 배송을 위해 수영슈즈 물류센터 방역을 시행하고 있음을 알려드립니다.<br><br>
							
							[방역 배송 실시 안내]<br> 
							△ 주 1회 이상 물류센터 방역 작업 진행 <br>
							△ 센터 내 전 직원 마스크 착용 의무화 <br>
							△ 센터 아침 출근 시 체온 체크 및 손 소독 실시 <br>
							△ 동선 곳곳 손 세정제, 체온계 비치해 상시 이용 및 체크 <br>
							△ 작업 인원 전원 외부 식당 이용 금지, 시간대별 식사로 거리두기 <br>
							△ 작업 인원 전원 휴게실 및 집합 장소 등에서 거리두기 시행 <br>
							△ 외부인 물류 센터 출입 통제 중(출입 시 방문 기록 및 체온 체크 중) <br><br>
							
							철저한 관리와 방역을 통해 회원님의 소중한 상품과 물류 작업자의 안전을 위해 최선의 <br>
							노력을 다하고 있습니다. 회원님과 배송기사의 안전을 위해 비대면 배송을 권장해 드립니다. <br>
							다소 불편하시더라도 경비실, 택배함, 문 앞 배송 등 전달로 소중한 회원님의 안전을 지켜주세요.
						</td>
						
					</tr>
					<tr class="table-warning nask">
						<th>2</th> 
						<th>배송 및 교환/반품 비용에 대한 개정안내</th>
						<th>2022-01-07</th> 
					</tr>
					<tr>
						<th></th> 
						<td class="nanswer">
							최근 CJ대한통운을 포함한 여러 택배사의 택배요금 인상이 되어 수영슈즈에서도 불가피하게<br> 
							배송료 인상이 됨을 안내드립니다.<br>
							
							기존 택배비 2,500원 에서 > 3,000원 으로 인상됩니다.<br>
							
							감사합니다.
						</td>
					</tr>
<%-- 					</c:forEach> --%>
				</tbody>

			</table>
			<nav>
				<ul class="pagination">
					<li class="page-item"><a class="page-link" href="#">Previous</a>
					</li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">4</a></li>
					<li class="page-item"><a class="page-link" href="#">5</a></li>
					<li class="page-item"><a class="page-link" href="#">Next</a></li>
				</ul>
			</nav>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>





