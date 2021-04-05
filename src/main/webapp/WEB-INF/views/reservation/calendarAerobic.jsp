<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

	<!-- 제이쿼리  -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<link href="resources/fullcalendar/packages/core/main.css" rel='stylesheet' />
	<link href="resources/fullcalendar/packages/daygrid/main.css" rel='stylesheet' />
	<script src="resources/fullcalendar/packages/core/main.js"></script>
	<script src="resources/fullcalendar/packages/interaction/main.js"></script>
	<script src="resources/fullcalendar/packages/daygrid/main.js"></script>
	
	<style>
		#title {
			font-size: 60px;
			text-align: center;;
		}
		
		#container {
			display: flex;
			justify-content: space-between;
			height: 800px;
		}
		
		#calendarAerobic {
			padding: 0px;
			margin: 5px;
			height: 500px;
			width: 500px;
		}
		
		#reservation-img {
			position: relative;
		}
		
		img {
			padding: 0px;
			margin: 5px;
			height: 500px;
			width: 400px;
			opacity: 0.5;
			-webkit-filter: grayscale(100%);
			filter: gray;
		}
		#imgtext {
			position: absolute;;
			font-size: 48px;
			top: 250px;
			right: 80px;
		}
		
		.list-group {
			text-align: center;
			padding-left: 0;
			margin-bottom: 20px;
		}
		.list-group a.menubox {
		    display: inline-block;
		    width: 250px;
		    height: 50px;
		    text-align: center;
		    line-height: 50px;
		    background: #ebebeb;
		    border: 1px solid #ebebeb;
		    font-weight: 400;
		    font-size: 30px;
		    color: #666;
		    text-decoration: none;
		    margin: 0 2px;
		    }
		    .list-group a.active {
		    background: #0e0e0e;
		    color: #c59d55;
		}
		
		a.menubox:hover{
		    background: #0e0e0e;
		    color: #c59d55;
		}
	</style>
	
	<script>	
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
									data: {regDate: regDate, programId: document.querySelector("input[name='programId1']").id },
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
	</script>

	<!-- 각 페이지 내비 -->
	<main class="main">
		<section class="main-top">
	<h2 class="main-title">GX 예약</h2>
	<!--  <div class="main-nav">
		<a href="graph.do">Graph</a> 
		<a href="member_admin.do">회원관리</a>
		<a href="reservation_admin.do">예약관리</a>
	</div> -->
	</section>
	</main>
	
	<div class="sub_menu">
		<nav id="sub_menu">
			<div class="list-group" style="text-align:center!important;">
					<a href="reservationYoga.do" target="_self" class="menubox">Yoga</a>
					<a href="reservationPilates.do" target="_self" class="menubox">Pilates</a>
					<a href="reservationAerobic.do" target="_self" class="menubox active">Aerobic</a>
			</div>
		</nav>
	</div>

	<h1 id="title">에어로빅</h1>
	<div id='container'>
		<div id='calendarAerobic'></div>
		
		<div id='reservation-morning'>
			<div id='reservation-img'>
				<img src='resources/images/r_images/aerobic1.jpg' /> 
				<span id='imgtext'>09:00:10:00</span>
				<input type="button" id="aerobicMorning" name="programId1" value="오전예약"/>
			</div>
		</div>
		<div id='reservation-evening'>
			<div id='reservation-img'>
				<img src='resources/images/r_images/aerobic2.jpg' />
				<span id='imgtext'>18:00-19:00</span>
				<input type="button" id="aerobicEvening" name="programId2" value="오후예약"/>
			</div>
		</div>
	</div>



<%@ include file="../include/footer.jsp" %>