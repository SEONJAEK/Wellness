<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp" %>

	<!-- 제이쿼리  -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<link href="resources/fullcalendar/packages/core/main.css" rel='stylesheet' />
	<link href="resources/fullcalendar/packages/daygrid/main.css" rel='stylesheet' />
	<script src="resources/fullcalendar/packages/core/main.js"></script>
	<script src="resources/fullcalendar/packages/interaction/main.js"></script>
	<script src="resources/fullcalendar/packages/daygrid/main.js"></script>
	
	<style>
		#title {
			font-size: 48px;
			text-align: center;;
		}
		
		#container {
			display: flex;
			justify-content: space-between;
			height: 800px;
		}
		
		#calendarYoga {
			padding: 0px;
			margin: 5px;
			height: 500px;
			width: 500px;
		}
		
		#calendarAerobic {
			padding: 0px;
			margin: 5px;
			height: 500px;
			width: 500px;
		}
		
		#calendarPilates {
			padding: 0px;
			margin: 5px;
			height: 500px;
			width: 500px;
		}
		
		#reservation-img {
			position: relative;
		}
		
		#imgtext {
			position: absolute;;
			font-size: 48px;
			top: 250px;
			right: 80px;
		}
	</style>
	
	<script>	
		document.addEventListener('DOMContentLoaded', function() {
			var calendarEl = document.getElementById('calendarYoga');
			var calendar = new FullCalendar.Calendar(calendarEl, {
					timezone: 'local',
					plugins: ['interaction','dayGrid'],
					fixedWeekCount: false,
					showNonCurrentDates: false,
					header: {        	  
						left:'',
						center: 'title',
						right: ''
					},		        
					selectable: true,
					select: function(){
						document.querySelector(".fc-highlight").style.background = '#5a5a5a';
					},
					dateClick: function(info) {
						 var year = info.date.getYear()+1900;
						 var month = info.date.getMonth()+1;
						 var date = info.date.getDate();
						 var regDate = year+'-'+month+'-'+date;
						 document.getElementById('yogaMorning').onclick=function(){
							 $.ajax({
									type: 'POST',
									url: 'reservation.do',
									data: {regDate: regDate, programId: document.querySelector("input[name='programId1']").id },
									dataType: 'json',
									success: function(data) {
										alert("예약되었습니다.");
										confirm("My 예약 페이지로 이동하시겠습니까?")
									}
							  });
							}
						 document.getElementById('yogaEvening').onclick=function(){
							 $.ajax({
									type: 'POST',
									url: 'reservation.do',
									data: {regDate: regDate, programId: document.querySelector("input[name='programId2']").id },
									dataType: 'json',
									success: function(data) {
										alert("예약되었습니다.");
									},
							  });
						}
					}
				});
			calendar.render();
		});
		
		
		
		document.addEventListener('DOMContentLoaded', function() {
			var calendarEl = document.getElementById('calendarPilates');
			var calendar = new FullCalendar.Calendar(calendarEl, {
					timezone: 'local',
					plugins: ['interaction','dayGrid'],
					fixedWeekCount: false,
					showNonCurrentDates: false,
					header: {        	  
						left:'',
						center: 'title',
						right: ''
					},		        
					selectable: true,
					select: function(){
						document.querySelector(".fc-highlight").style.background = '#5a5a5a';
					},
					dateClick: function(info) {
						 var year = info.date.getYear()+1900;
						 var month = info.date.getMonth()+1;
						 var date = info.date.getDate();
						 var regDate = year+'-'+month+'-'+date;
						 document.getElementById('pilatesMorning').onclick=function(){
							 $.ajax({
									type: 'POST',
									url: 'reservation.do',
									data: {regDate: regDate, programId: document.querySelector("input[name='programId3']").id },
									dataType: 'json',
									success: function(data) {
										alert("예약되었습니다.");
									},
							  });
							}
						 document.getElementById('pilatesEvening').onclick=function(){
							 $.ajax({
									type: 'POST',
									url: 'reservation.do',
									data: {regDate: regDate, programId: document.querySelector("input[name='programId4']").id },
									dataType: 'json',
									success: function(data) {
										alert("예약되었습니다.");
									},
							  });
						}
					}
				});
			calendar.render();
		});
		
		
		
		document.addEventListener('DOMContentLoaded', function() {
			var calendarEl = document.getElementById('calendarAerobic');
			var calendar = new FullCalendar.Calendar(calendarEl, {
					timezone: 'local',
					plugins: ['interaction','dayGrid'],
					fixedWeekCount: false,
					showNonCurrentDates: false,
					header: {        	  
						left:'',
						center: 'title',
						right: ''
					},		        
					selectable: true,
					select: function(){
						document.querySelector(".fc-highlight").style.background = '#5a5a5a';
					},
					dateClick: function(info) {
						 var year = info.date.getYear()+1900;
						 var month = info.date.getMonth()+1;
						 var date = info.date.getDate();
						 var regDate = year+'-'+month+'-'+date;
						 document.getElementById('aerobicMorning').onclick=function(){
							 $.ajax({
									type: 'POST',
									url: 'reservation.do',
									data: {regDate: regDate, programId: document.querySelector("input[name='programId5']").id },
									dataType: 'json',
									success: function(data) {
										alert("예약되었습니다.");
									},
									error:function(request, status, errorData) {
										alert("error code : " + request.status + "\n"
												+"message : " + request.responseText
												+ "\n" + "error : " + errorData);
									}
							  });
							}
						 document.getElementById('aerobicEvening').onclick=function(){
							 $.ajax({
									type: 'POST',
									url: 'reservation.do',
									data: {regDate: regDate, programId: document.querySelector("input[name='programId6']").id },
									dataType: 'json',
									success: function(data) {
										alert("예약되었습니다.");
									},
							  });
						}
					}
				});
			calendar.render();
		});
	</script>




	<h1 id="title">요가</h1>
	<div id='container'>
		<div id='calendarYoga'></div>
		<div id='reservation-morning'>
			<div id='reservation-img'>
				<img src='image/fitness-4006934_1920.jpg'
					style='padding: 0px; margin: 5px; height: 500px; width: 400px; opacity: 0.5; filter: alpha(opacity = 40);' /> 
				<span id='imgtext'>10:00-11:00</span>
				<input type="button" id="yogaMorning" name="programId1" value="오전예약"/>
			</div>
		</div>
		<div id='reservation-evening'>
			<div id='reservation-img'>
				<img src='image/machines-91849_1920.jpg'
					style='padding: 0px; margin: 5px; height: 500px; width: 400px; opacity: 0.5; filter: alpha(opacity = 40);' />
				<span id='imgtext'>19:00-20:00</span>
				<input type="button" id="yogaEvening" name="programId2" value="오후예약"/>
			</div>
		</div>
	</div>
	
	
	
	<h1 id="title">필라테스</h1>
	<div id='container'>
		<div id='calendarPilates'></div>
		<div id='reservation-morning'>
			<div id='reservation-img'>
				<img src='image/fitness-4006934_1920.jpg'
					style='padding: 0px; margin: 5px; height: 500px; width: 400px; opacity: 0.5; filter: alpha(opacity = 40);' /> 
				<span id='imgtext'>11:00-12:00</span>
				<input type="button" id="pilatesMorning" name="programId3" value="오전예약"/>
			</div>
		</div>
		<div id='reservation-evening'>
			<div id='reservation-img'>
				<img src='image/machines-91849_1920.jpg'
					style='padding: 0px; margin: 5px; height: 500px; width: 400px; opacity: 0.5; filter: alpha(opacity = 40);' />
				<span id='imgtext'>20:00-21:00</span>
				<input type="button" id="pilatesEvening" name="programId4" value="오후예약"/>
			</div>
		</div>
	</div>
	
	
	
	<h1 id="title">에어로빅</h1>
	<div id='container'>
		<div id='calendarAerobic'></div>
		<div id='reservation-morning'>
			<div id='reservation-img'>
				<img src='image/fitness-4006934_1920.jpg'
					style='padding: 0px; margin: 5px; height: 500px; width: 400px; opacity: 0.5; filter: alpha(opacity = 40);' /> 
				<span id='imgtext'>09:00:10:00</span>
				<input type="button" id="aerobicMorning" name="programId5" value="오전예약"/>
			</div>
		</div>
		<div id='reservation-evening'>
			<div id='reservation-img'>
				<img src='image/machines-91849_1920.jpg'
					style='padding: 0px; margin: 5px; height: 500px; width: 400px; opacity: 0.5; filter: alpha(opacity = 40);' />
				<span id='imgtext'>18:00-19:00</span>
				<input type="button" id="aerobicEvening" name="programId6" value="오후예약"/>
			</div>
		</div>
	</div>

<%@ include file="include/footer.jsp" %>