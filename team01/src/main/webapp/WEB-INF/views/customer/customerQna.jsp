<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<style>
	td{
		display : none
	}
</style>
<script src="https://code.jquery.com/jquery-latest.js"></script>

<script type="text/javascript">
$(function(){
	$(".ask").click(function(){
        $(this).next().children().toggle();
     });
	
});
</script>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="page-header">
				<h1>자주하는 질문</h1>
			</div>

			<p><br>1:1 문의 전에 자주 하는 질문들을 확인해주세요</p>
					<br>
		</div>
		<nav class="navbar navbar-expand-lg navbar-light bg-light">

			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1">
			</button>
			<a class="navbar-brand" href="#" >키워드를입력하세요.</a>
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="navbar-nav">
										
				</ul>
				<form class="form-inline">
					<input class="form-control mr-sm-2" type="text" />
					<button class="btn btn-primary my-2 my-sm-0" type="submit">
						Search</button>
				</form>
			</div>
		</nav>
		<table class="table">
			<thead>
				<tr>
					<th><br></th>
				</tr>
			</thead>
			<tbody>
				<tr class="table-warning ask" id="tr1">
					<th>재고가 없어요. 언제쯤 구매 가능할까요?</th>
				</tr>
				<tr>
					<td class="answer1">입점 업체의 품절 상품 재입고 여부 및 일정에 대하여 정확히 답변드리기는 어려우나,<br>
						상품코드 및 옵션 확인 후 상품 상세 페이지 내 상품문의 게시판을 통하여 문의해 주시면,<br> 재입고 일정
						확인이 가능한 상품에 한하여 안내 받으실 수 있습니다.
					</td>
				</tr>
				<tr class="table-warning ask">
					<th class="ask">배송 가능한 지역은 어떻게 되나요?</th>
				</tr>
				<tr>
					<td class="answer">현재 서울 지역과 경기, 인천 일부 지역만 가능합니다.<br> 빠른 시일 내 서울 및 경기,인천
						외 지역까지 가능하도록 최선을 다하겠습니다.
					</td>
				</tr>
				<tr class="table-warning ask">
					<th class="ask">배송 정책은 어떻게 되나요?</th>
				</tr>
				<tr>
					<td class="answer">1) 월~금요일<br>
						  - 자체배송은 당일 오전까지 결제완료 주문 건은 당일 출고되며, 오후 주문은 익일 출고 처리됩니다.<br>
						  - 주문을 따로 하실 경우, 각각 출고 됩니다.<br>
						2) 토요일<br>
						  - 토요일 출고는 없습니다.<br>
						3) 일요일 및 공휴일<br>
						  - 일요일 및 공휴일은 배송이 없습니다. 영업일에 확인 후 일괄적으로 출고됩니다.<br>
						  - 추석, 설날과 같은 연휴에는 주문량 및 택배사 배송 물량이 많아 배송 지연이 발생할 수 있습니다.<br>
						  - 상품 출고 후 택배사의 사정에 따라 1일 이상 배송이 소요됩니다.<br>
					</td>
				</tr>
				<tr class="table-warning ask">
					<th class="ask">매장 교환은 어떻게 하나요?</th>
				</tr>
				<tr>
					<td class="answer">1. 교환 신청<br>
						 - 주문 목록 > 주문 상세 : 교환 신청 버튼을 선택해 주세요.<br>
						2. 반송 방법 선택 - 매장 교환<br>
						 - 매장 교환 선택 후 교환 가능한 매장을 선택해 주세요.<br>
						 - 교환 가능한 매장 정보만 표시됩니다.<br>
						   (단 TAG(택) 제거, 상품 훼손 없이 지참)<br>
						3. 교환 신청 완료<br>
						 - 신청 완료 후 3일 이내 방문하여 교환을 진행해 주세요.<br>
						 - 3일이 지날 경우 교환 신청은 자동으로 취소됩니다.
					</td>
				</tr>
				<tr class="table-warning ask">
					<th class="ask">취소는 언제까지 가능한가요?</th>
				</tr>
				<tr>
					<td class="answer">'주문 취소는 상품준비 중 상태 이후로는 불가능할 수 있습니다.<br>
						주문한 상품의 정확한 출고 여부 확인 및 취소 가능 여부를 위해 <br>
						1:1 문의 또는 고객센터(1666-1234)로 문의해 주시길 바랍니다.<br>
						또한, 배송준비중인 상태에서는 취소가 불가능하며, <br>
						수령 후 배송비를 부담하여 환불만 가능하오니 참고 바랍니다.
					</td>
				</tr>
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