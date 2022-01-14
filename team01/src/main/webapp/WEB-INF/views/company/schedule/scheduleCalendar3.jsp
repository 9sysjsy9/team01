<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/company/include/header.jsp"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<style>
.body {
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
}
/*  */
.calendar {
  width: 800px;
  margin: 50px;
}

 /*  */
 
 .header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.year-month {
  font-size: 35px;
}

.nav {
  display: flex;
/*   border: 1px solid #333333; */
  border-radius: 5px;
}

.nav-btn {
  width: 75px;
  height: 30px;
/*   border: none; */
/*   font-size: 16px; */
/*   line-height: 34px; */
  background-color: transparent;
  cursor: pointer;
}

.go-today {
  width: 75px;
/*    border-left: 1px solid #333333;  */
/*    border-right: 1px solid #333333;  */
}
  
  /*  */
  
  .days {
  display: flex;
  margin: 25px 0 10px;
}

.day {
  width: calc(100% / 7);
  text-align: center;
}

.dates {
  display: flex;
  flex-flow: row wrap;
  height: 800px;
  border-top: 1px solid #333333;
  border-right: 1px solid #333333;
}

.date {
  width: calc(100% / 7);
  padding: 15px;
  text-align: right;
  border-bottom: 1px solid #333333;
  border-left: 1px solid #333333;
}


/*  */

.day:nth-child(7n + 1),
.date:nth-child(7n + 1) {
  color: #D13E3E;
}

.day:nth-child(7n),
.date:nth-child(7n) {
  color: #396EE2;
}
</style>


<script>

 
$(function(){
	

	const date = new Date();
	const viewYear = date.getFullYear();
	const viewMonth = date.getMonth() + 1;

	//지난달의 마지막 날의 Date객체
	const prevLast = new Date(viewYear, viewMonth - 1, 0);
	const PLDate = prevLast.getDate(); //이전달의 마지막 일
	const PLDay = prevLast.getDay(); //이전달의 마지막 요일

	//현재달의 마지막 날의 Date객체
	const thisLast= new Date(viewYear, viewMonth, 0); //0을 기입하는경우 해당달의 미지막 날의 Date객체가 생성
	const TLDate = thisLast.getDate(); //금달의 마지막 일
	const TLDay = thisLast.getDay(); //금달의 마지막 요일

	const prevDates = []; //이전달의 날자들을 담아둘 배열 
	const thisDates = [...Array(TLDate + 1).keys()].slice(1); 
				//Array(n)으로 배열을 만들면 길이가 n인 배열이 생성됨 (이때 모든 요소들은 undefined)
				//모든 요소들이 empty 값이기 때문에 keys() 메서드를 이용하면 0 ~ n-1 까지의 Array Iterator가 생성됨
				//전개 구문을 통해 이 Array Iterator 를 배열로 만들어 내면 0부터 n-1까지의 배열을 얻어 낼수 있음
				//그래서 이번 달 마지막 날짜 + 1 을 n 에 전달해주고
				//제일 앞에 있는 0을 없에기위해 slice 메서드를 활용
	const nextDates = []; //다음달의 날자들을 담아둘 배열 
	console.log(thisDates);

	//이전 달을 표현할 날짜들을 생성하는데 지난달의 마지막 요일이 토요일(6)이라면 생성할 필요 없으므로 조건문 작성
	//0 부터 시작, 지난달 마지막 요일이 될 때까지 반복, 지난달의 마지막 날짜부터 1씩 줄어든 값을 unshift 메서드를 통해 prevDates 배열에 앞쪽으로 계속 채워넣는 방식
	if(PLDay != 6){
		for(let i = 0; i<PLDay + 1 ; i++){
			prevDates.unshift(PLDate - i);
		}
	}

	//다음 달은 이번 달 마지막 날짜의 요일을 기준으로 필요한 개수를 파악해서 1부터 1씩 증가시키며 nextDates 배열에 하나씩 채워 넣는 방식
	for(let i = 1 ; i < 7 - TLDay ; i++){
		nextDates.push(i);
	}


	//concat 매서드를 통해서 세 배열을 합친 다음에, forEach 메서드로 전체 요소들을 돌면서, html코드로 데이터를 하나씩 수정 해준다
	const dates = prevDates.concat(thisDates, nextDates);
	
	
		dates.forEach((date, i) => {
			dates[i] = "<div class='date'>" + date + "</div>";
		});
	
	
	
	$(".year-month").text(viewYear + "년" + (viewMonth) + "월");
	
	//.dates 태그의 innerHTML 프로퍼티에 dates배열에 join메서드를 호출한 결과를 할당
	$(".dates").html(dates.join(''));
});

 </script>
<div class="body">


<div>

			<table class="table">
				<thead>
					<tr>
						<th>일</th>
						<th>월</th>
						<th>화</th>
						<th>수</th>
						<th>목</th>
						<th>금</th>
						<th>토</th>
					</tr>
				</thead>
				
				<tbody>
				
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>				
					</tr>

				</tbody>
			</table>
			
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