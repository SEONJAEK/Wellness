<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
						 //alert(info.date);
						 var year = info.date.getYear()+1900;
						 var month = info.date.getMonth()+1;
						 var date = info.date.getDate();
						 var regDate = year+'-'+month+'-'+date;
						 alert(regDate);
						 document.getElementById('yogaMorning') = function() {
							 $.ajax({
									type: 'POST',
									url: 'reservation.do',
									data: {regDate: regDate, programId: document.querySelector("input[name='programId']").value, },
									dataType: 'json',
									success: function() {
										alert('예약 되었습니다.');
									},
									error:function(request, status, errorData) {
										alert("error code : " + request.status + "\n"
												+"message : " + request.responseText
												+ "\n" + "error : " + errorData);
									}
							  });
						 }
					}
				});
			calendar.render();
		});
	</script>
</head>
<body>
	<h1 id="title">요가</h1>
	<div id='container'>
		<div id='calendarYoga'>
		</div>
		<div id='reservation-morning'>
			<div id='reservation-img'>
				<img src='image/fitness-4006934_1920.jpg'
					style='padding: 0px; margin: 5px; height: 500px; width: 400px; opacity: 0.5; filter: alpha(opacity = 40);' /> 
				<span id='imgtext'>10:00-11:00</span>
				<input type="button" id="yogaMorning" name="programId" value="오전예약"/>
			</div>
		</div>
		<div id='reservation-evening'>
			<div id='reservation-img'>
				<img src='image/machines-91849_1920.jpg'
					style='padding: 0px; margin: 5px; height: 500px; width: 400px; opacity: 0.5; filter: alpha(opacity = 40);' />
				<span id='imgtext'>19:00-20:00</span>
				<input type="button" id="yogaEvening" value="오후예약"/>
			</div>
		</div>
	</div>
</html>