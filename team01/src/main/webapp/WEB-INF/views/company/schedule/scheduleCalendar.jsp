<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/company/include/header.jsp"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<style>
.body {
  display: flex;
  justify-content: center;
  min-height: 100vh;
}

 .header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.calendar {
  width: 800px;
  margin: 50px;
}

.year-month {
  font-size: 35px;
}

.nav {
  display: flex;
  border-radius: 5px;
}

.nav-btn {
  width: 75px;
  height: 30px;
  background-color: transparent;
  cursor: pointer;
}

  .days {
   text-align : center; 

}
	.dates {
}

.date {
  padding: 15px;
  text-align: right;
  height : 100px;
  width : 120px;
  cursor : pointer;
}

.scheduleDate {
  padding: 15px;
  text-align: center;
  width : 300px;
  max-width : 300px;
}

.content {
  padding: 15px;
  text-align: left;
  width : 300px;
  max-width : 300px;
}

.day:nth-child(7n + 1),
.date:nth-child(7n + 1) {
  color: #FF0000;
}

.day:nth-child(7n),
.date:nth-child(7n) {
  color: #0000FF;
}
</style>

${scheduleDataList}
<script>
var date = new Date();

//달력 표시
renderCalendar();


//이전 달 버튼
function prevMonth(){
	 date.setMonth(date.getMonth() - 1);
	 renderCalendar();
};
//다음 달 버튼	
function nextMonth(){
	date.setMonth(date.getMonth() + 1);
	renderCalendar();
};

//오늘 달
function goToday(){
	date = new Date;
	renderCalendar();
};


//달력 정보 불러오기
function renderCalendar(){
	var viewYear = date.getFullYear();
	var viewMonth = date.getMonth() + 1;

	//지난달의 마지막 날의 Date객체
	var prevLast = new Date(viewYear, viewMonth - 1, 0);
	var PLDate = prevLast.getDate(); //이전달의 마지막 일
	var PLDay = prevLast.getDay(); //이전달의 마지막 요일

	//현재달의 마지막 날의 Date객체
	var thisLast= new Date(viewYear, viewMonth, 0); //0을 기입하는경우 해당달의 미지막 날의 Date객체가 생성
	var TLDate = thisLast.getDate(); //금달의 마지막 일
	var TLDay = thisLast.getDay(); //금달의 마지막 요일

	var prevDates = []; //이전달의 날자들을 담아둘 배열

	
	var thisDates = [...Array(TLDate + 1).keys()].slice(1);
				//Array(n)으로 배열을 만들면 길이가 n인 배열이 생성됨 (이때 모든 요소들은 undefined)
				//모든 요소들이 empty 값이기 때문에 keys() 메서드를 이용하면 0 ~ n-1 까지의 Array Iterator가 생성됨
				//전개 구문을 통해 이 Array Iterator 를 배열로 만들어 내면 0부터 n-1까지의 배열을 얻어 낼수 있음
				//그래서 이번 달 마지막 날짜 + 1 을 n 에 전달해주고
				//제일 앞에 있는 0을 없에기위해 slice 메서드를 활용


				
	var nextDates = []; //다음달의 날자들을 담아둘 배열

	
// 	console.log("thisDates : " + thisDates);
	
	//이전 달을 표현할 날짜들을 생성하는데 지난달의 마지막 요일이 토요일(6)이라면 생성할 필요 없으므로 조건문 작성
	//0 부터 시작, 지난달 마지막 요일이 될 때까지 반복, 지난달의 마지막 날짜부터 1씩 줄어든 값을 unshift 메서드를 통해 prevDates 배열에 앞쪽으로 계속 채워넣는 방식
	if(PLDay != 6){
		for(var i = 0; i<PLDay + 1 ; i++){
			prevDates.unshift(PLDate - i);
		}
	}
// 	console.log("prevDates : " + prevDates);

	//다음 달은 이번 달 마지막 날짜의 요일을 기준으로 필요한 개수를 파악해서 1부터 1씩 증가시키며 nextDates 배열에 하나씩 채워 넣는 방식
	for(var i = 1 ; i < 7 - TLDay ; i++){
		nextDates.push(i);
	}
	
// 	console.log("nextDates : " + nextDates);
	
	var prevDatesAttr = []; //엘리먼트 추적을 위한 속성 배열
		for(var i = 0 ; i < prevDates.length ; i++){
			if((viewMonth - 1) == 0){
				prevDatesAttr[i] = (viewYear-1)+"_12_"+prevDates[i];
			} else {
				prevDatesAttr[i] = viewYear+"_"+(viewMonth-1)+"_"+prevDates[i];
			}
		}
	
	var thisDatesAttr = []; //엘리먼트 추적을 위한 속성 배열
		for(var i = 0 ; i < thisDates.length ; i++){
			thisDatesAttr[i] = viewYear+"_"+viewMonth+"_"+thisDates[i];
		}
	
	var nextDatesAttr = [];  //엘리먼트 추적을 위한 속성 배열
		for(var i = 0 ; i < nextDates.length ; i++){
			if((viewMonth + 1) == 13){
				nextDatesAttr[i] = (viewYear+1)+"_1_"+nextDates[i];
			} else {
				nextDatesAttr[i] = viewYear+"_"+(viewMonth+1)+"_"+nextDates[i];
			}
		}
	
// 		console.log("prevDatesAttr : " + prevDatesAttr);
// 		console.log("thisDatesAttr : " + thisDatesAttr);
// 		console.log("nextDatesAttr : " + nextDatesAttr);

	//concat 매서드를 통해서 세 배열을 합친 다음에, forEach 메서드로 전체 요소들을 돌면서, html코드로 데이터를 하나씩 수정 해준다
	var dates = prevDates.concat(thisDates, nextDates);
	var datesAttrs = prevDatesAttr.concat(thisDatesAttr, nextDatesAttr);
	

	
	//년_월_일 - viewYear/viewMonth/dates[i]
	for(var i = 0 ; i < dates.length ;  i++){ 
		if(i%7 == 6){ //한주의 끝 (토요일)
			dates[i] = "<td class='date btn-outline-info' data-date="+datesAttrs[i]+">" + dates[i] + "</td></tr>";
		} else if (i%7 == 0) { //한주의 시작(일요일)
			dates[i] = "<tr><td class='date btn-outline-warning' data-date="+datesAttrs[i]+">" + dates[i] + "</td>";
		} else { //(월화수목금)
			dates[i] = "<td class='date btn-outline-secondary' data-date="+datesAttrs[i]+">" + dates[i] + "</td>";
		}
	}
	
	console.log(dates);
	console.log(datesAttrs);
	
	//jQuery
	$(function(){
		$(".year-month").text(viewYear + "년" + (viewMonth) + "월");
		//.dates 태그의 innerHTML 프로퍼티에 dates배열에 join메서드를 호출한 결과를 할당
		$(".dates").html(dates.join(''));
		
		//달력 일자 클릭
	});
}

$(function(){
	$(".date").click(function(e){
		var dateVal = $(this).attr("data-date");
		console.log(dateVal);
	});
});
//달력 정보 불러오기 끝
	


 </script>
<div class="body">

<div class="calendar">

			<div class="header">
				<div class="year-month">1</div>
				<div class="nav">
					<button class="btn btn-outline-dark flex-shrink-0 btn-sm nav-btn go-prev" onclick="prevMonth()">이전월</button>
					<button class="btn btn-outline-dark flex-shrink-0 btn-sm nav-btn go-today" onclick="goToday()">오늘</button>
					<button class="btn btn-outline-dark flex-shrink-0 btn-sm nav-btn go-next" onclick="nextMonth()">다음월</button>
				</div>
			</div>
<div>
			<table class="table table-bordered">
				<thead>
					<tr class="days">
						<th class="day">일</th>
						<th class="day">월</th>
						<th class="day">화</th>
						<th class="day">수</th>
						<th class="day">목</th>
						<th class="day">금</th>
						<th class="day">토</th>
					</tr>
				</thead>

				<tbody class="dates">
				
				</tbody>
			</table>
			</div>
			
</div>




<!-- 		<div class="calendar"> -->
		
<!-- 			<div class="header"> -->
<!-- 				<div class="year-month">1</div> -->
<!-- 				<div class="nav"> -->
<!-- 					<button class="btn btn-outline-dark flex-shrink-0 btn-sm nav-btn go-prev">이전월</button> -->
<!-- 					<button class="btn btn-outline-dark flex-shrink-0 btn-sm nav-btn go-today">오늘</button> -->
<!-- 					<button class="btn btn-outline-dark flex-shrink-0 btn-sm nav-btn go-next">다음월</button> -->
					
					
<!-- 				</div> -->
<!-- 			</div> -->
			
<!-- 			<div class="main"> -->
<!-- 				<div class="days"> -->
<!-- 					<div class="day">일</div> -->
<!-- 					<div class="day">월</div> -->
<!-- 					<div class="day">화</div> -->
<!-- 					<div class="day">수</div> -->
<!-- 					<div class="day">목</div> -->
<!-- 					<div class="day">금</div> -->
<!-- 					<div class="day">토</div> -->
<!-- 				</div> -->
<!-- 				<div class="dates"></div> -->
<!-- 			</div> -->
			

			
			
<!-- 		</div> -->
</div>
<%@ include file="/WEB-INF/views/company/include/footer.jsp"%>