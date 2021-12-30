<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/include/header.jsp"%>

        <!-- Product section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-6">
                    <div id="maps" style="width:100%;height:700px;"></div>
                    </div>
                    <div class="col-md-6">
                    <br>
                        <div class="small mb-1">TEL : 052-123-4567</div>
                        <h1 class="display-5 fw-bolder">울산 1호점</h1>
                        <div class="fs-5 mb-5">
                        </div>
                        <p class="lead">울산 수영슈즈 1호점은 남구 남부경찰서 근처에 위치해 있습니다.</p>
                        <div class="d-flex">
                        
                            <button class="btn btn-outline-dark flex-shrink-0" type="button">
                                <i class="bi-cart-fill me-1"></i>
                                1호점
                            </button>  
                            <button class="btn btn-outline-dark flex-shrink-0" type="button">
                                <i class="bi-cart-fill me-1"></i>
                                2호점
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </section>


<!-- <div id="map" style="width:100%;height:350px;"></div> -->

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ed58432865ca847558cf89e98a614bb3"></script>
<script>
var mapContainer = document.getElementById('maps'), 
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), 
        level: 3
    };

// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
var map = new kakao.maps.Map(mapContainer, mapOption); 
</script>

        
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
