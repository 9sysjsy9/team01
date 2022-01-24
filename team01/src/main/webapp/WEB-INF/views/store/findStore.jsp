<!-- 기능 담당자 : 고만재 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/include/header.jsp"%>

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ed58432865ca847558cf89e98a614bb3"></script>
<script>
//카카오맵 API 초기 설정
	var mapContainer = document.getElementById('maps'), mapOption = {
		center : new kakao.maps.LatLng(35.535020788165546, 129.31083000438102),
		level : 3
	};
	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new kakao.maps.Map(mapContainer, mapOption);
	var marker = new kakao.maps.Marker({
		// 지도 중심좌표에 마커를 생성합니다 
		position : map.getCenter()
	});
	// 지도에 마커를 표시합니다
	marker.setMap(map);

//매장 조회 버튼
$(function(){
	//2호점 매장 정보 조회
	$(".secondStoreBtn").click(function(e){
		// 이동할 위도 경도 위치를 생성합니다 
		var moveLatLon = new kakao.maps.LatLng(37.498941, 127.032887);
		// 지도 중심을 부드럽게 이동시킵니다
		// 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
		map.panTo(moveLatLon);
		var marker = new kakao.maps.Marker({
			// 지도 중심좌표에 마커를 생성합니다 
			position : map.getCenter()
		});
		marker.setMap(map);
		
		$("#phone").text("TEL : 02-123-4567");
		$("#store").text("강남 2호점");
		$("#explain").text("수영슈즈 2호점은 서울 강남 역삼역 근처에 위치해 있습니다.");
		
		$("#address").text("주소 : 서울특별시 강남구 강남구 테헤란로14길 6");
	});
	
	//1호점 매장 정보 조회
	$(".firstStoreBtn").click(function(e){
		// 이동할 위도 경도 위치를 생성합니다 
		var moveLatLon = new kakao.maps.LatLng(35.535020788165546,
				129.31083000438102);
		// 지도 중심을 부드럽게 이동시킵니다
		// 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
		map.panTo(moveLatLon);
		$("#phone").text("TEL : 052-123-4567");
		$("#store").text("울산 1호점");
		$("#explain").text("수영슈즈 1호점은 울산 남구 남부경찰서 근처에 위치해 있습니다.");
		$("#address").text("주소 : 울산 남구 삼산로35번길 19");
	});
});
	
</script>

<!-- section-->
<section class="py-5">
	<div class="container px-4 px-lg-5 my-5">
		<div class="row gx-4 gx-lg-5 align-items-center">
			<div class="col-md-6">
				<div id="maps" style="width: 100%; height: 700px;"></div>
			</div>
			<div class="col-md-6">
				
				<div class="small mb-1" id="phone">TEL : 052-123-4567</div>
				<h1 class="display-5 fw-bolder" id="store">울산 1호점</h1>
				<div class="fs-5 mb-5"></div>
				<p class="lead" id="explain">수영슈즈 1호점은 울산 남구 남부경찰서 근처에 위치해 있습니다.</p>
				<p class="lead" id="address">주소 : 울산 남구 삼산로35번길 19</p>
				<div class="d-flex">

					<button class="firstStoreBtn btn btn-outline-primary flex-shrink-0" type="button" onclick="panTo1()">
						<i class="bi-cart-fill me-1"></i> 1호점 </button>
					<button class="secondStoreBtn btn btn-outline-primary flex-shrink-0" type="button" onclick="panTo2()">
						<i class="bi-cart-fill me-1"></i> 2호점 </button>
				</div>
			</div>
		</div>
	</div>
</section>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>
