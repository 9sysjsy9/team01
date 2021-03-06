<!-- 기능 담당자 : 고만재 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/company/include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/company/member/memberInfo.jsp"%>
    
<link rel="stylesheet" href="/css/calendar.css">

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

	var nextDates = []; //다음달의 날자들을 담아둘 배열

	if(PLDay != 6){
		for(var i = 0; i<PLDay + 1 ; i++){
			prevDates.unshift(PLDate - i);
		}
	}
// 	console.log("prevDates : " + prevDates);

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

	//concat 매서드를 통해서 세 배열을 합친 다음에, forEach 메서드로 전체 요소들을 돌면서, html코드로 데이터를 하나씩 수정 해준다
	var dates = prevDates.concat(thisDates, nextDates);
	var datesAttrs = prevDatesAttr.concat(thisDatesAttr, nextDatesAttr);

	//년_월_일 - viewYear/viewMonth/dates[i]
	for(var i = 0 ; i < dates.length ;  i++){ 
		if(i%7 == 6){ //한주의 끝 (토요일)
			dates[i] = "<td class='date btn-outline-info' id="+datesAttrs[i]+">" + dates[i] + "</td></tr>";
		} else if (i%7 == 0) { //한주의 시작(일요일)
			dates[i] = "<tr><td class='date btn-outline-warning' id="+datesAttrs[i]+">" + dates[i] + "</td>";
		} else { //(월화수목금)
			dates[i] = "<td class='date btn-outline-secondary' id="+datesAttrs[i]+">" + dates[i] + "</td>";
		}
	}
	
// 	console.log(dates);
// 	console.log(datesAttrs);
	
	//jQuery
	$(function(){
		$(".year-month").text(viewYear + "년" + (viewMonth) + "월");
		//.dates 태그의 innerHTML 프로퍼티에 dates배열에 join메서드를 호출한 결과를 할당
		$(".dates").html(dates.join(''));
		
		//달력 일자 클릭
	});

	var url = "/schedule/company/getMonthScheduleDataList";
	var syear = date.getFullYear();
	var smonth = (date.getMonth()+1);

	var sData = { 
			 "syear" : syear,
			 "smonth" : smonth
	};

	$.post(url, sData, function(rData){
// 		 console.log(rData);
		 
		 $(function(){	
			for(var i = 0 ; i < rData.length ; i++){
				$("#"+rData[i].syear+"_"+rData[i].smonth+"_"+rData[i].sdate+"").append("<div class='contentTitle'>"+rData[i].content+"</div>");
			};
		});
	});
}

//JQuery
$(function(){
	
	var syear  = 0; //조회 및 등록 날짜 데이터
	var smonth = 0;
	var sdate = 0;
	
	$(".dates").on("click",".date", function(e){
		
		var dateVal = $(this).attr("id"); //yyyy_MM_dd
		console.log(dateVal);
		var underIndex1 = dateVal.indexOf("_");
		var underIndex2 = dateVal.lastIndexOf("_");
		
		syear = dateVal.substring(0,underIndex1);
		smonth = dateVal.substring(underIndex1 + 1,underIndex2);
		sdate = dateVal.substring(underIndex2 + 1);
		
		var url = "/schedule/company/getDateScheduleDataList";
		var sData = { 
				 "syear" : syear,
				 "smonth" : smonth,
				 "sdate" : sdate
		};
		
		$.post(url, sData, function(rData){
// 			 console.log(rData);
			 $(".contentViewModalTable").empty();
			 $("#contentViewModalLabel").text(syear+"/"+smonth+"/"+sdate);
			 for(var i = 0 ; i < rData.length ; i++){
				 $(".contentViewModalTable").append("<tr><td class='btnUsername table-active' data-userid="+rData[i].userid+" data-dismiss='modal' style='cursor:pointer'>작성자 : "+rData[i].username+"</td></tr>");
				 $(".contentViewModalTable").append("<tr><td class=''>"+rData[i].content+"</td></tr>");
				//로그인 정보가 일치할 경우, 권한이 3이상일경우  수정, 삭제 버튼 활성화
				
				
				
				//작성자가 일치하거나, 로그인 권한이 3이상인 경우
				if(rData[i].userid == "${loginData.userid}" || ${loginData.authority >= 3}){
					var tr = "";
					
					//작성자가 일치할 경우 수정버튼 추가
				 	if(rData[i].userid == "${loginData.userid}"){
				 		tr += "<button type='button' class='scheduleModifyBtn btn btn-outline-warning flex-shrink-0 btn-sm' data-dismiss='modal'>수정 </button>";
				 	};
				 	
				 	//삭제 버튼 추가
				 	$(".contentViewModalTable").append("<tr><td style='text-align:right' data-sno="+rData[i].sno+">"+ tr +
				 			"<button type='button' class='scheduleDeleteBtn btn btn-outline-danger flex-shrink-0 btn-sm'> 삭제</button></td></tr>"
				 	);
				};
			 };
			 
			 $("#modal-contentViewModal").trigger("click");
			 
			 //일정 등록 모달 일자 정보 표시
			 $("#modalRegistDate").text(syear+"/"+smonth+"/"+sdate);
		});
	});

	
//일정 추가 버튼
	$(".scheduleRegistBtn").click(function(){
		$("#modal-scheduleRegistModal").trigger("click");
		//내용 작성란 내용 비우기
		$("#modalRegistContent").val("");
	});
	
	$(".scheduleRegistRunBtn").click(function(){
		var content = $("#modalRegistContent").val().replace(/(?:\r\n|\r|\n)/g, ' ');
		var url = "/schedule/company/scheduleRegistRun";
		var sData = { 
			"userid" : "${loginData.userid}",
			"syear" : syear,
			"smonth" : smonth,
			"sdate" : sdate,
			"content" : content
		};
		$.post(url, sData, function(rData){
// 			console.log(rData);
			renderCalendar();
			alert("일정이 추가 되었습니다.");
		});
	});

//일정 수정 버튼
	$(".contentViewModalTable").on("click",".scheduleModifyBtn",function(e){
// 		console.log("data-sno : " + $(this).parent().attr("data-sno"));
		var sno = $(this).parent().attr("data-sno");
		var url = "/schedule/company/getDateScheduleData/"+sno;
		$.post(url, function(rData){
// 			console.log(rData);
			$("#modalModifyDate").text(rData.syear+"/"+rData.smonth+"/"+rData.sdate);
			$("#modalModifyContent").val(rData.content);
			$(".scheduleModifyRunBtn").attr("data-sno",rData.sno);
		});
		
		$("#modal-scheduleModifyModal").trigger("click");
	});
	
	$(".scheduleModifyRunBtn").click(function(e){
		var result = confirm("수정 하시겠습니까?");
		if(result){
			var url = "/schedule/company/scheduleModifyRun";
			var content = $("#modalModifyContent").val().replace(/(?:\r\n|\r|\n)/g, ' ');
			var sData = {
					"sno" : $(".scheduleModifyRunBtn").attr("data-sno"),
					"content" : content
			};
			
			$.post(url, sData, function(rData){
				console.log(rData);
				if(rData == "success"){
					alert("수정 되었습니다.");
					renderCalendar();
					$("#modal-scheduleModifyModal").trigger("click");
				};
			});
		}
	});


//일정 삭제 버튼
	$(".contentViewModalTable").on("click",".scheduleDeleteBtn",function(e){
// 		console.log("data-sno : " + $(this).parent().attr("data-sno"));
		var result = confirm("삭제 하시겠습니까?");
		var sno = $(this).parent().attr("data-sno");
		if(result){
			var url = "/schedule/company/scheduleDeleteRun/"+sno;
			$.post(url, function(rData){
				if(rData == "success"){
					alert("삭제 되었습니다.");
					renderCalendar();
					$("#modal-contentViewModal").trigger("click");
				};
			});
		};
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
</div>
<!----------------------------------------------- 모달 태그 리스트 ----------------------------------------------->
<!-- content 확인 모달 -->
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			 <a id="modal-contentViewModal" href="#modal-container-contentViewModal" role="button" class="btn" data-toggle="modal" style="display:none">dateModal</a>
			
			<div class="modal fade" id="modal-container-contentViewModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="contentViewModalLabel">
								2022년 1월 2일
							</h5> 
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button><br>
						</div>
						
						<div class="modal-body">
							<div class="row">
								<div class="col-md-12">
									<table class="table table-bordered">
										<tbody class="contentViewModalTable">
										</tbody>
									</table>
								</div>						
							</div>
						</div>
						
						<div class="modal-footer">
							<button type="button" class="scheduleRegistBtn btn btn-outline-primary flex-shrink-0 btn-sm"  data-dismiss="modal">일정 추가</button> 
							<button type="button" class="btn btn-outline-dark flex-shrink-0 btn-sm" data-dismiss="modal">닫기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- /content 확인 모달 -->


<!-- schduleData 추가  시작-->
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			 <a id="modal-scheduleRegistModal" href="#modal-container-scheduleRegistModal" role="button" class="btn" data-toggle="modal" style="display:none">RegistModal</a>
			
			<div class="modal fade" id="modal-container-scheduleRegistModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">
								새 일정 등록
							</h5> 
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button><br>
						</div>
						
						<div class="modal-body">
						
						<!--  -->
							<div class="form-group">
								<label> 일자  : <span id="modalRegistDate"></span> </label>
							</div>
							<div class="form-group">
								<label> 일정 내용 </label>
								<textarea id="modalRegistContent" class="form-control" rows="6" placeholder="내용을 입력해주세요." onkeypress="check_enter()"></textarea>
							</div>
						<!--  -->
						</div>
						<div class="modal-footer">
							<button type="button" class="scheduleRegistRunBtn btn btn-outline-primary flex-shrink-0 btn-sm" data-dismiss="modal">등록</button> 
							<button type="button" class="btn btn-outline-dark flex-shrink-0 btn-sm" data-dismiss="modal">취소</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- /schduleData 추가 끝-->

<!-- schduleData 수정 시작-->
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			 <a id="modal-scheduleModifyModal" href="#modal-container-scheduleModifyModal" role="button" class="btn" data-toggle="modal" style="display:none" >ModifyModal</a>
			
			<div class="modal fade" id="modal-container-scheduleModifyModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">
								일정 수정
							</h5> 
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button><br>
						</div>
						
						<div class="modal-body">
						
						<!--  -->
							<div class="form-group">
								<label> 일자  : <span id="modalModifyDate"></span> </label>
							</div>
							<div class="form-group">
								<label> 일정 내용 </label>
								<textarea id="modalModifyContent" class="form-control" rows="6" placeholder="내용을 입력해주세요." onkeypress="check_enter()"></textarea>
							</div>
						<!--  -->
						</div>
						<div class="modal-footer">
							<button type="button" class="scheduleModifyRunBtn btn btn-outline-warning flex-shrink-0 btn-sm" data-sno="#">수정</button> 
							<button type="button" class="btn btn-outline-dark flex-shrink-0 btn-sm" data-dismiss="modal">취소</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- /schduleData 수정 끝-->
<%@ include file="/WEB-INF/views/company/include/footer.jsp"%>