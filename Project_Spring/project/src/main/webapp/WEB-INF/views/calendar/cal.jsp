<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"  %>
<!DOCTYPE html>
<html lang="ko">
	<%@ include file="../include/head.jsp" %>
	
	<!-- 풀캘린더 cdn -->
	<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.2/main.min.css' rel='stylesheet' />
	<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.2/main.min.js'></script>
	<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.2/locales-all.min.js'></script>
	
 	<style>
	#calendar {
			margin: 50px auto;
	}
	#edit-color {
		color:#D25565;
		margin-left: 16px;
	}
	.fc-day-mon
	.fc-day-sun {color:#e31b23}	/* 일요일 색상 변경 */
	.fc-day-sat {color:#0726d0}	/* 토요일 색상 변경 */  
	
	.fc-list-day > th > .fc-theme-bootstrap5-shaded{
		background-color: #ababac !important; 
	}
	.fc-dayGridMonth-button, .fc-prev-button{
		margin-right: 2px;
	}

 	 </style>
	
	
	<body>
	
		<!-- 여기가 헤더부분 -->
		<%@ include file="../include/header.jsp" %>
		
		<div id="layoutSidenav">
			<!--  사이드 메뉴부분 include 함 -->
			<%@ include file="../include/sidemenu.jsp" %>
		
		    
		
		
		<!-- 콘테이너 -->
		<div id="layoutSidenav_content">
		
			<div id='calendar' class="col-8"></div>
		
			<%@include file="../include/footer3.jsp" %>
			
		</div><!-- 콘테이너 -->
		
		
		<!-- 일정 추가 MODAL -->
		
        <div class="modal fade" tabindex="-1" role="dialog" id="eventModal">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" style="margin 0 auto;"></h4>
                        
                    </div>
                    <div class="modal-body">
                    	
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-title">일정명</label>
                                <input class="inputModal" type="text" name="edit-title" id="edit-title"
                                    required="required" />
                            </div>
                        </div>
                        
                        
                        
                        
                        <div class="row edit-div">
                            <div class="col-xs-12" style="margin-top: 5px;">
                                <label class="col-xs-4" for="edit-color">색상</label>
                                <select class="inputModal" name="color" id="edit-color">
                                    <option value="#D25565" style="color:#D25565;">빨간색</option>
                                    <option value="#9775fa" style="color:#9775fa;">보라색</option>
                                    <option value="#ffa94d" style="color:#ffa94d;">주황색</option>
                                    <option value="#74c0fc" style="color:#74c0fc;">파란색</option>
                                    <option value="#f06595" style="color:#f06595;">핑크색</option>
                                    <option value="#63e6be" style="color:#63e6be;">연두색</option>
                                    <option value="#a9e34b" style="color:#a9e34b;">초록색</option>
                                    <option value="#4d638c" style="color:#4d638c;">남색</option>
                                </select>
                            </div>
                        </div>
                        
                    </div>
                    <div class="modal-footer modalBtnContainer-addEvent">
                   		<button type="button" class="btn btn-primary" id="save-event">저장</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal" id="closeEvent-add">취소</button>
                    </div>
                    <div class="modal-footer modalBtnContainer-modifyEvent">
                        <button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal" id="closeEvent-modify">취소</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
        	
		
		
		<script>
		<!-- 캘린더 헤더 아이콘 색변경 -->
		$(function(){
			$(".fc-prev-button").removeClass("btn-primary").addClass("hong_btn_blue");
			$(".fc-today-button").removeClass("btn-primary").addClass("hong_btn_blue");
			$(".fc-next-button").removeClass("btn-primary").addClass("hong_btn_blue");
			$(".fc-dayGridMonth-button").removeClass("btn-primary").addClass("hong_btn_blue");
			$(".fc-listMonth-button").removeClass("btn-primary").addClass("hong_btn_blue");
			
			$('.fc-listMonth-button').unbind();
			$('.fc-listMonth-button').on('click',function(){
				//$(".fc-dayGridMonth-button").removeClass("active");
				$(".fc-dayGridMonth-button").removeClass("btn-primary").addClass("hong_btn_blue");
				$(".fc-listMonth-button").removeClass("btn-primary").addClass("hong_btn_blue");
		  	});
			
			$('.fc-dayGridMonth-button').unbind();
			$('.fc-dayGridMonth-button').on('click',function(){
				//$(".fc-dayGridMonth-button").removeClass("active");
				$(".fc-dayGridMonth-button").removeClass("btn-primary").addClass("hong_btn_blue");
				$(".fc-listMonth-button").removeClass("btn-primary").addClass("hong_btn_blue");
		  	});
			
		});
		
		
				
		
		  document.addEventListener('DOMContentLoaded', function () {
		    var calendarEl = document.getElementById('calendar');
		    
		    
		    
    		//var arr = new Array();
	    	var listLength = '${fn:length(cal_list)}';

	    	<c:forEach items="${cal_list}" var="p">
	    		schedule 		= '${p.schedule}'
	    		schedule_date 	= '${p.schedule_date}'
    			schedule_end	= '${p.schedule_end}'
    			schedule_color 	= '${p.schedule_color}'
	    	</c:forEach>
	    	
			
		    var calendar = new FullCalendar.Calendar(calendarEl, {
		    	
		      timeZone			: 'local',
		      themeSystem		: 'bootstrap5',
		      locale			: 'ko',
		      headerToolbar 	: { //headerToolbar : 달력위의 기능 관리
							        left: 'prev,next today',
							        center: 'title',
							        right: 'dayGridMonth,listMonth'
		      },
  		      height			: 800,
  		      aspectRatio		: 1.35,  // 반응형
		      expandRows		: true,	  // 반응형
		      selectable		: true,   // 날짜선택 드래그
		      weekNumbers		: false, // 주번호 삭제
		      dayMaxEvents		: true, // 같은시간 이벤트많을때 높이제한
		      unselectAuto		: true, // 다른곳클릭하면 드래그된거 사라지게
		      displayEventTime	: false,
		      displayEventEnd	: false,
		      editable			: true,
		      timeFormat		: 'HH:mm',
		      minTime			: '00:00:00',
		      maxTime			: '24:00:00',
		      allDaySlot		: true,
		      
		      events: [
		    	 	<c:forEach items="${cal_list}" var="p">
		    		{
		    			title	: '${p.schedule}',
		    			start	: '${p.schedule_date}',
		    			end		: '${p.schedule_end}',
		    			color	: '${p.schedule_color}'
		    		},
		    		</c:forEach>
		    		
		    		
		    		/* ,
		    		{
		    			id: 2,
		    			title: 'Test2',
		    			start: '2022-08-11',
		    			end: '2022-08-14'
		    		},
		    		{
		    			id: 3,
		    			title:  schedule,
		    			start:	schedule_date,
		    			color:	schedule_color
		    		}
		    		 */
		    		
		    		
		    		
		    	],
		      
		      // select : 달력에서 날짜칸 눌렀을때의 기능 관리
		      select : function(arg){
		    	  	$('.modal-title').html('새로운 일정');
		    	  	$('#edit-title').val('');
		    	  	//수정, 삭제 버튼 숨기기
		    	  	$('.modalBtnContainer-addEvent').show();
		    	  	$('.modalBtnContainer-modifyEvent').hide();
		    	  	$('.edit-div').show();
		    	  	
		    	  	
		    	  	$('#eventModal').modal('show');
		    	  	
		    	  	// 취소버튼 클릭시
		    	  	$('#closeEvent-add').unbind();
		    	  	$('#closeEvent-add').on('click',function(){
		    	  		$('#eventModal').modal('hide');
		    	  	});
		    	  	
		    	 	// 일정저장버튼 클릭시
		    	 	
		    	  	$('#save-event').unbind();
		    	  	$('#save-event').on('click',function(){
		    	  		
		    	  		var editTitle	= $('#edit-title').val();
		    	  		console.log(editTitle);
		    	  		if(editTitle == ""){
		    	  			alert("내용을 입력해주세요");
		    	  			return;
		    	  		}
		    	  		var editColor 	= $('#edit-color').val();
		    	  		
		    	  		// start
		    	  		var year		= arg.start.getYear() + 1900;
		    	  		var month		= arg.start.getMonth() + 1;
		    	  		var date		= arg.start.getDate();
		    	  		var start 		= year + "/0" + month + "/0" + date;
						
		    	  		if( month < 10 && date < 10 ) {
							
							start =	year + "/0" + month + "/0" + date;
						}else if( month >= 10 && date < 10 ) {
							
							start = year + "/" + month + "/0" + date;
						}else if( month >= 10 && date >= 10 ) {
							
							start = year + "/" + month + "/" + date;
						}else if( month < 10 && date >= 10 )	{
							
							start = year + "/0" + month + "/" + date;
						}
		    	  		
		    	  		// end
		    	  		
		    	  		var eyear		= arg.end.getYear() + 1900;
		    	  		var emonth		= arg.end.getMonth() + 1;
		    	  		var edate		= arg.end.getDate();
		    	  		var end 		= eyear + "/0" + emonth + "/0" + edate;
		    	  		
						if( emonth < 10 && edate < 10 ) {
							
							end =	eyear + "/0" + emonth + "/0" + edate;
						}else if( month >= 10 && date < 10 ) {
							
							end = eyear + "/" + emonth + "/0" + edate;
						}else if( emonth >= 10 && edate >= 10 ) {
							
							end = eyear + "/" + emonth + "/" + edate;
						}else if( emonth < 10 && edate >= 10 )	{
							
							end = eyear + "/0" + emonth + "/" + edate;
						} 
		
		    	  			
		    	  			
		    	  		
		    	  		/* console.log(year);
		    	  		console.log(month); 
		    	  		console.log(date);
		    	  		console.log(start); */
		    	  		
		    	  		calendar.addEvent({
		    	  			title			:	editTitle,
		    	  			start			: 	arg.start,
		    	  			allDay			: 	arg.allDay,
		    	  			color			: 	editColor,
		    	  			end				: 	arg.end
		    	  		});
		    	  		
		    	  		
		    	  		
		    	  		$('#eventModal').modal('hide');
		    	  		
		    	  		
		    	  		var eventData = {
		    	  			title		:	editTitle,
		    	  			start		:	start,
		    	  			end			:	end,
		    	  			color		: 	editColor,
		    	  			textColor	: 	'#ffffff'
		    	  		};
		    	  	
		    	  		
						//console.log( JSON.stringify( eventData ) );		    	  		
		    	  		
		    	  		
		    	  		$.ajax({
		    	  			type	:	"post",
		    	  			url		: 	'calendar_insert',
		    	  			contentType: 'application/json',		    				
		    	  			data	:	JSON.stringify(eventData),
		    	  			success: function (response) {
		    	  	          if(response)
		    	  	          {
		    	  	              
		    	  	          }                
		    	  	      }
		    	  		
		    	  			
		    	  		});
		    	  		
		    	  		
		    	  		
		    	  		
		    	      	
		    	  	});
		      		
		      	},// select()
		      
		      // event: 이벤트 생성
		      
		      	
		      
		      
		    
		      // eventClick : 날짜칸 하나에 만들어진 이벤트 클릭했을때 기능 관리
		      eventClick : function(arg){
		    	  	
		    	  
		    		//삭제 버튼 보이기
		    	  	$('.modalBtnContainer-modifyEvent').show();
		    	  	$('.modalBtnContainer-addEvent').hide();
		    	  	$('.edit-div').hide();
		    	 	
		    	  	$('#eventModal').modal('show');
		    	  	$('.modal-title').html('일정 삭제');
		    	  	
		    	  	$('#edit-title').val(arg.event.title);
		    	  	$('#edit-color').val(arg.event.backgroundColor);
		    	  	
		    	  	
		    	  	
		    		 // 취소버튼 클릭시
		    	  	$('#closeEvent-modify').unbind();
		    	  	$('#closeEvent-modify').on('click',function(){
		    	  		$('#eventModal').modal('hide');
		    	  	});
		    	  	
		    	  	
		    	  	// 삭제버튼 클릭시
		    	  	$('#deleteEvent').on('click', function (){
		    	  		$('#eventModal').modal('hide');
		    	  		//var start = arg.event.start.getYear();
		    	  		//console.log(start);
		    	  		
		    	  		var editTitle	= $('#edit-title').val();
		    	  		var editColor 	= $('#edit-color').val();
		    	  		var year		= arg.event.start.getYear() + 1900;
		    	  		var month		= arg.event.start.getMonth() + 1;
		    	  		var date		= arg.event.start.getDate();
		    	  		var start 		= year + "/0" + month + "/0" + date;
						
		    	  		//console.log(year);
		    	  		
		    	  		if( month < 10 && date < 10 ) {
							
							start =	year + "/0" + month + "/0" + date;
						}else if( month >= 10 && date < 10 ) {
							
							start = year + "/" + month + "/0" + date;
						}else if( month >= 10 && date >= 10 ) {
							
							start = year + "/" + month + "/" + date;
						}else if( month < 10 && date >= 10 )	{
							
							start = year + "/0" + month + "/" + date;
						} 
		    	  		
		    	  		var eventData = {
			    	  			title		:	editTitle,
			    	  			start		:	start,
			    	  			color		: 	editColor,
			    	  			textColor	: 	'#ffffff'
			    	  		};
		    	  		
		    	  		$.ajax({
		    	  			type	:	"post",
		    	  			url		: 	'calendar_delete',
		    	  			contentType: 'application/json',		    				
		    	  			data	:	JSON.stringify(eventData),
		    	  			success: function (response) {
		    	  	          if(response)
		    	  	          {
		    	  	        	arg.event.remove();
		    	  	              
		    	  	          }                
		    	  	      }
		    	  		
		    	  			
		    	  		});
		    	  		
		    	  		
		    	  		
		    	  	});
		    	    	
		    	    
		    	    
		    	    
		    	  	
		    	  
		      }
		      
		    });
		
		    calendar.render();
		  });// 캘린더 끝
		  
		  
		  $('#edit-color').change(function () {
			    $(this).css('color', $(this).val());
			});
		</script>
		
		
	</body>
</html>