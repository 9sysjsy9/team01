<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width">
	<title>이벤트 리스너로 장바구니 수량 변경 및 자동 합계 구하기</title>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
	<link rel="stylesheet" href="/css/10-11.css" />
<!-- 	<script type="text/javascript" src="/js/10-11.js"></script>   -->
</head>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<script>
$(function() {
	
 	var sum_count = 0;
 	var sum_price = 0;
	$(".checkBasket").each(function(i){
		
		if ($(this).is(':checked')) {
			var order_count = $(".order_count"+(i+1)).val();
			console.log("order_count:" + order_count);
			var sum = $(".sum"+(i+1)).val();
			console.log("sum:" + sum);
			sum_count = sum_count + parseInt(order_count);
			sum_price = sum_price + parseInt(sum);
			console.log("sum:" + sum);
			$("#sum_p_num").text("상품갯수: "+sum_count+"개");
			$("#sum_p_price").text("합계금액: "+sum_price+"원");
		}
		
	});
	//
	
	$(".checkBasket").click(function() {
		var shoes_code = $(this).val();
		var checked = $(this).is(':checked');
		console.log("checked: "+checked);
		var url = "/user/changeBasketChecked";
		sData = {
			"shoes_code" : shoes_code,
			"checked" : checked
		};
		
		$.post(url, sData, function(rData) {
			if (rData == 'success') {
				console.log("rData: "+rData);
				var sum_count = 0;
			 	var sum_price = 0;
				$(".checkBasket").each(function(i){
					if ($(this).is(':checked')) {
						var order_count = $(".order_count"+(i+1)).val();
						console.log("order_count:" + order_count);
						var sum = $(".sum"+(i+1)).val();
						console.log("sum:" + sum);
						sum_count = sum_count + parseInt(order_count);
						sum_price = sum_price + parseInt(sum);
						console.log("sum:" + sum);
						$("#sum_p_num").text("상품갯수: "+sum_count+"개");
						$("#sum_p_price").text("합계금액: "+sum_price+"원");
					}
					
				});
			}
			
		});
		
	});
	
	
	$(".btnDeleteSelect").click(function() {
		var checkeds = $(".checkBasket:checked");
		var orderList = [];
		$.each(checkeds, function(i) {
			var shoes_code = $(this).val();
			console.log("shoes_code: "+shoes_code);
			orderList[i] = shoes_code;
		});
		$.ajax({
			  url : "/user/DeleteSelectedBasket",
			  type : "post",
			  data : {
				 orderList : orderList
			  },
			  success : function(rData){
			  	console.log("rData: "+rData);
			  	if (rData != 'fail') {
			  		location.href = "/user/user_basket";
			  	}
			  	
			  }
		});
		
	});
	
	
	$(".btnDeleteAll").click(function() {
		var checkBasket = $(".checkBasket");
		var orderList = [];
		$.each(checkBasket, function(i) {
			var shoes_code = $(this).val();
			console.log("shoes_code: "+shoes_code);
			orderList[i] = shoes_code;
		});
		$.ajax({
			  url : "/user/DeleteAllBasket",
			  type : "post",
			  data : {
				 orderList : orderList
			  },
			  success : function(rData){
			  	console.log("rData: "+rData);
			  	if (rData != 'fail') {
			  		location.href = "/user/user_basket";
			  	}
			  	
			  }
		});
		
	});
	
	
	$("#btnSelectedOrder").click(function() {
		var checkeds = $(".checkBasket:checked");
		var orderList = [];
		$.each(checkeds, function(i) {
			var shoes_code = $(this).val();
			console.log("shoes_code: "+shoes_code);
			orderList[i] = shoes_code;
		});
		console.log(orderList);
		$.ajax({
			  url : "/user/orderContent",
			  type : "post",
			  data : {
				 orderList : orderList
			  },
			  success : function(rData){
			  	console.log("rData: "+rData);
			  	if (rData != null) {
			  		location.href = "/user/goOrderContent";
			  	}
			  	
			  }
		});
		
	});
	
	$(".up").click(function() {
		var order_count = $(this).parent().prev().val();
		var shoes_code = $(this).attr("data-shoescode");
		var shoes_price = $(this).attr("data-shoesprice");
		var loop = $(this).attr("data-loop");
		var sum = $(".sum"+loop).val();
		order_count++;
		$(".sum"+loop).val(order_count*shoes_price);
		$(this).parent().prev().val(order_count);
		var url = "/user/changeBasketCount";
		sData = {
			"shoes_code" : shoes_code,
			"order_count" : order_count
		};
		$.post(url, sData, function(rData) {
			console.log("rData: "+rData);
			if (rData == 'success') {
				var sum_count = 0;
			 	var sum_price = 0;
				$(".checkBasket").each(function(i){
					
					if ($(this).is(':checked')) {
						var order_count = $(".order_count"+(i+1)).val();
						console.log("order_count:" + order_count);
						var sum = $(".sum"+(i+1)).val();
						console.log("sum:" + sum);
						sum_count = sum_count + parseInt(order_count);
						sum_price = sum_price + parseInt(sum);
						console.log("sum:" + sum);
						$("#sum_p_num").text("상품갯수: "+sum_count+"개");
						$("#sum_p_price").text("합계금액: "+sum_price+"원");
					}
					
				});
			}
		});
	});
	
	$(".down").click(function() {
		var order_count = $(this).parent().prev().val();
		var shoes_code = $(this).attr("data-shoescode");
		var shoes_price = $(this).attr("data-shoesprice");
		var loop = $(this).attr("data-loop");
		var sum = $(".sum"+loop).val();
		if (order_count > 1) {
			order_count--;
			$(".sum"+loop).val(order_count*shoes_price);
		}
		$(this).parent().prev().val(order_count);
		var url = "/user/changeBasketCount";
		sData = {
			"shoes_code" : shoes_code,
			"order_count" : order_count
		};
		$.post(url, sData, function(rData) {
			console.log("rData: "+rData);
			if (rData == 'success') {
				var sum_count = 0;
			 	var sum_price = 0;
				$(".checkBasket").each(function(i){
					
					if ($(this).is(':checked')) {
						var order_count = $(".order_count"+(i+1)).val();
						console.log("order_count:" + order_count);
						var sum = $(".sum"+(i+1)).val();
						console.log("sum:" + sum);
						sum_count = sum_count + parseInt(order_count);
						sum_price = sum_price + parseInt(sum);
						console.log("sum:" + sum);
						$("#sum_p_num").text("상품갯수: "+sum_count+"개");
						$("#sum_p_price").text("합계금액: "+sum_price+"원");
					}
					
				});
			}
		});
	});
	
});
</script>
<br>
<br>
<form name="orderform" id="orderform" method="post" class="orderform"
	action="/Page" onsubmit="return false;">

	<input type="hidden" name="cmd" value="order">
	<div class="basketdiv" id="basket">
		<div class="row head">
			<div class="subdiv">
				<div class="check">선택</div>
				<div class="img">이미지</div>
				<div class="pname">상품명</div>
			</div>
			<div class="subdiv">
				<div class="basketprice">가격</div>
				<div class="num">수량</div>
				<div class="sum">합계</div>
			</div>
			<div class="subdiv">

				<div class="basketcmd">삭제</div>
			</div>
			<div class="split"></div>
		</div>

		<c:forEach items="${list}" var="userBasketVo" varStatus="loop">
			<div class="row data">
				<div class="subdiv">
					<!-- 				
					<div class="check">
						<input type="checkbox" class="check" name="buy" value="${userBasketVo.shoes_code}" checked="checked"
							onclick="javascript:basket.checkItem();">&nbsp;
					</div>
					-->
					<div class="check">
						<input type="checkbox" class="checkBasket" name="buy" value="${userBasketVo.shoes_code}" 
						<c:if test="${userBasketVo.checked != false}">
						checked="checked"
						</c:if> 
						data-loop="${loop.count}">&nbsp;
					</div>
					<div class="img">
						<img src="/upload/displayThumbnailImage?fileName=${userBasketVo.shoes_image}">
					</div>
					<div class="pname">
						<span>${userBasketVo.shoes_name}</span>
					</div>
				</div>
				<div class="subdiv">
					<div class="basketprice">
						<input type="hidden" name="p_price" id="p_price1" class="p_price"
							value="${userBasketVo.shoes_price}">${userBasketVo.shoes_price}
					</div>
					<div class="num">
						<!-- 						 
						<div class="updown">
							<input type="text" name="p_num${loop.count}" id="p_num${loop.count}" size="2"
								maxlength="4" class="p_num" value="${userBasketVo.order_count}"
								onkeyup="javascript:basket.changePNum(${loop.count});"> 
							<span onclick="javascript:basket.changePNum(${loop.count});">
								<i class="fas fa-arrow-alt-circle-up up"></i>
							</span> 
							<span onclick="javascript:basket.changePNum(${loop.count});">
								<i class="fas fa-arrow-alt-circle-down down"></i>
							</span>
						</div>
						-->
						<div class="updown">
							<input type="text" name="order_count" size="1" readonly="readonly"
							 class="order_count${loop.count}" value="${userBasketVo.order_count}"> 
							<label>
							<i class="fas fa-arrow-alt-circle-up up" data-shoescode="${userBasketVo.shoes_code}" 
								data-shoesprice="${userBasketVo.shoes_price}" data-loop="${loop.count}"></i>
							<i class="fas fa-arrow-alt-circle-down down" data-shoescode="${userBasketVo.shoes_code}"
								data-shoesprice="${userBasketVo.shoes_price}" data-loop="${loop.count}"></i>
							</label>
						</div>
					</div>
					<div >
						<input type="text" size="2" class="sum${loop.count}" 
							readonly="readonly" value="${userBasketVo.shoes_price*userBasketVo.order_count}">
					</div>
				</div>
				<div class="subdiv">
					<div class="basketcmd">
						<!-- 						
						<a href="javascript:void(0)" class="abutton" 
						onclick="javascript:basket.delItem();">삭제</a>
						 -->
						<a href="/user/deleteBasket?shoes_code=${userBasketVo.shoes_code}" class="abutton">삭제</a>
					</div>
				</div>
			</div>
		</c:forEach>

	</div>

 	<div class="right-align basketrowcmd"> 
 		<!--
		<a href="javascript:void(0)" class="abutton"
			onclick="javascript:basket.delCheckedItem();">선택상품삭제</a> <a
			href="javascript:void(0)" class="abutton"
			onclick="javascript:basket.delAllItem();">장바구니비우기</a>
		-->
		<button type="button" class="btn btn-outline-dark btn-lg px-4 btnDeleteSelect">선택상품삭제</button>
		<button type="button" class="btn btn-outline-dark btn-lg px-4 btnDeleteAll">장바구니비우기</button>
	</div>

	<div class="bigtext right-align sumcount" id="sum_p_num">상품갯수: 개</div>
	<div class="bigtext right-align box blue summoney" id="sum_p_price">합계금액: 원</div>

	<div id="goorder" class="">
		<div class="clear"></div>
		<div class="buttongroup center-align cmd">
<!-- 			<a href="javascript:void(0);">선택한 상품 주문</a> -->
			<button type="button" id="btnSelectedOrder">선택한 상품 주문</button>
		</div>
	</div>
</form>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>





