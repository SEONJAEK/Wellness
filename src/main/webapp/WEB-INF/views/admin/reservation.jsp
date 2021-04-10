<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="../include/header.jsp"%>
<link rel="stylesheet"
	href="<c:url value="resources/css/bootstrap.css?ver=1"/>">
<link
	href="<c:url value="resources/fullcalendar/packages/core/main.css"/>"
	rel='stylesheet' />
<link
	href="<c:url value="resources/fullcalendar/packages/daygrid/main.css" />"
	rel='stylesheet' />
<script
	src="<c:url value="resources/fullcalendar/packages/core/main.js"/>"></script>
<script
	src="<c:url value="/resources/fullcalendar/packages/interaction/main.js"/>"></script>
<script
	src="<c:url value="/resources/fullcalendar/packages/daygrid/main.js" />"></script>



<style>
.column {
	float: left !important;
	width: 30% !important;
	padding: 10px !important;
}

.three-column:after {
	content: "";
	display: table;
	clear: both;
}

<!--
선재 추가1-->body {
	line-height: 2em;
	font-family: "맑은 고딕";
}

ul, li {
	list-style: none;
	text-align: center;
	padding: 0;
	margin: 0;
}

#mainWrapper {
	width: 70%;
	margin: 0 auto; /*가운데 정렬*/
}

#mainWrapper>ul>li:first-child {
	text-align: center;
	font-size: 1rem;
	height: 40px;
	vertical-align: middle;
	line-height: 30px;
}

#ulTable {
	margin-top: 10px;
}

#ulTable>li:first-child>ul>li {
	background-color: #c9c9c9;
	font-weight: bold;
	text-align: center;
}

#ulTable>li>ul {
	clear: both;
	padding: 0px auto;
	position: relative;
	min-width: 40px;
}

#ulTable>li>ul>li {
	float: left;
	font-size: 1rem;
	border-bottom: 1px solid silver;
	vertical-align: baseline;
}

#ulTable>li>ul>li:first-child {
	width: 5%;
} /*No 열 크기*/
#ulTable>li>ul>li:first-child+li {
	width: 10%;
} /*제목 열 크기*/
#ulTable>li>ul>li:first-child+li+li {
	width: 5%;
} /*작성일 열 크기*/
#ulTable>li>ul>li:first-child+li+li+li {
	width: 5%;
} /*작성자 열 크기*/
#ulTable>li>ul>li:first-child+li+li+li+li {
	width: 5%;
} /*조회수 열 크기*/
#ulTable>li>ul>li:first-child+li+li+li+li+li {
	width: 15%;
} /*조회수 열 크기*/
#ulTable>li>ul>li:first-child+li+li+li+li+li+li {
	width: 20%;
} /*조회수 열 크기*/
#ulTable>li>ul>li:first-child+li+li+li+li+li+li+li {
	width: 25%;
} /*조회수 열 크기*/
#ulTable>li>ul>li:first-child+li+li+li+li+li+li+li+li {
	width: 10%;
} /*조회수 열 크기*/
.left {
	text-align: center;
}

<!--
선재 추가1-->.list-group {
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
	font-size: 2rem;
	color: #666;
	text-decoration: none;
	margin: 0 2px;
}

.list-group a.active {
	background: #0e0e0e;
	color: #c59d55;
}

a.menubox:hover {
	background: #0e0e0e;
	color: #c59d55;
}
</style>

<style>
#title {
	text-align: center;
}

#container {
	display: flex;
	justify-content: space-between;
	margin: auto;
}

#calendarYoga {
	padding: 0px;
	margin: 5px;
	width: 500px;
}

#reservation-img {
	position: relative;
}

#imgtext {
	position: absolute;;
	font-size: 3rem;
	top: 250px;
	right: 80px;
}

h1{font-size: 4rem;}
h2{font-size: 2rem;}
</style>


	<!-- 각 페이지 내비 -->
	<main class="main">
		<section class="main-top">
			<h2 class="main-title">관리자 페이지</h2>
		</section>
	</main>

	<h1 style="text-align: center; margin-top: 100px;">GX 예약 현황</h1>
	
	
	<div class="sub_menu">
		<nav id="sub_menu">
			<div class="list-group" style="text-align:center; margin-top: 100px;">
					<a href="graph.do" target="_self" class="menubox">회원 분석</a>
					<a href="member_admin.do" target="_self" class="menubox">회원 목록</a>
					<a href="reservation_admin.do" target="_self" class="menubox active">GX 예약 현황</a>
			</div>
		</nav>
	</div><br><br><br>


<!-- 선재 삽입2 -->

<br>
<br>
<div id='container'>
	<div id='calendar'></div>
</div>
<!-- 요가 -->
<div id="mainWrapper">
	<h1 style="text-align: center; padding:0; margin: 100px 0;">
		${select_date}</h1>
		
	<!-- 요가1: index_count 변수 : 1부터 선언-->
	<c:set var="yoga1_count" value="1" scope="page" />
	<div class="col-xs-6">
		<table class="table table-bordered">
			<h2>YOGA [오전]</h2>
			<tr>
				<th>ID</th>
				<th>회원 이름</th>
				<th>회원 아이디</th>
				<th>전화번호</th>
			</tr>
			<!-- 반복문 써서 모든 회원정보 출력 -->
			<c:forEach items="${listYoga1}" var="item">
				<tr>
					<td>${yoga1_count}</td>
					<td>${item.userName}</td>
					<td>${item.userId}</td>
					<td>${item.phone}</td>
				</tr>
				<!-- index_count 1씩 증가 -->
				<c:set var="yoga1_count" value="${yoga1_count+1}" scope="page" />
			</c:forEach>
		</table>
	</div>
	
	<!--요가2: index_count 변수 : 1부터 선언-->
	<c:set var="yoga2_count" value="1" scope="page" />
	<div class="col-xs-6">
		<table class="table table-bordered">
			<h2>YOGA [오후]</h2>
			<tr>
				<th>ID</th>
				<th>회원 이름</th>
				<th>회원 아이디</th>
				<th>전화번호</th>
			</tr>
			<!-- 반복문 써서 모든 회원정보 출력 -->
			<c:forEach items="${listYoga2}" var="item">
				<tr>
					<td>${yoga2_count}</td>
					<td>${item.userName}</td>
					<td>${item.userId}</td>
					<td>${item.phone}</td>
				</tr>
				<!-- index_count 1씩 증가 -->
				<c:set var="yoga2_count" value="${yoga2_count+1}" scope="page" />
			</c:forEach>
		</table>
	</div>
	<!--필라테스1: index_count 변수 : 1부터 선언-->
	<c:set var="pilates1_count" value="1" scope="page" />
	<div class="col-xs-6">
		<table class="table table-bordered">
			<h2>PILATES [오전]</h2>
			<tr>
				<th>ID</th>
				<th>회원 이름</th>
				<th>회원 아이디</th>
				<th>전화번호</th>
			</tr>
			<!-- 반복문 써서 모든 회원정보 출력 -->
			<c:forEach items="${listPilates1}" var="item">
				<tr>
					<td>${pilates1_count}</td>
					<td>${item.userName}</td>
					<td>${item.userId}</td>
					<td>${item.phone}</td>
				</tr>
				<!-- index_count 1씩 증가 -->
				<c:set var="pilates1_count" value="${pilates1_count+1}" scope="page" />
			</c:forEach>
		</table>
	</div>
	<!--필라테스2: index_count 변수 : 1부터 선언-->
	<c:set var="pilates2_count" value="1" scope="page" />
	<div class="col-xs-6">
		<table class="table table-bordered">
			<h2>PILATES [오후]</h2>
			<tr>
				<th>ID</th>
				<th>회원 이름</th>
				<th>회원 아이디</th>
				<th>전화번호</th>
			</tr>
			<!-- 반복문 써서 모든 회원정보 출력 -->
			<c:forEach items="${listPilates2}" var="item">
				<tr>
					<td>${pilates2_count}</td>
					<td>${item.userName}</td>
					<td>${item.userId}</td>
					<td>${item.phone}</td>
				</tr>
				<!-- index_count 1씩 증가 -->
				<c:set var="pilates2_count" value="${pilates2_count+1}" scope="page" />
			</c:forEach>
		</table>
	</div>

	<!-- 에어로빅1: index_count 변수 : 1부터 선언-->
	<c:set var="aerobic1_count" value="1" scope="page" />
	<div class="col-xs-6">
		<table class="table table-bordered">
			<h2>AEROBIC [오전]</h2>
			<tr>
				<th>ID</th>
				<th>회원 이름</th>
				<th>회원 아이디</th>
				<th>전화번호</th>
			</tr>
			<!-- 반복문 써서 모든 회원정보 출력 -->
			<c:forEach items="${listAerobic1}" var="item">
				<tr>
					<td>${aerobic1_count}</td>
					<td>${item.userName}</td>
					<td>${item.userId}</td>
					<td>${item.phone}</td>
				</tr>
				<!-- index_count 1씩 증가 -->
				<c:set var="aerobic1_count" value="${aerobic1_count+1}" scope="page" />
			</c:forEach>
		</table>
	</div>

	<!-- 에어로빅2: index_count 변수 : 1부터 선언-->
	<c:set var="aerobic2_count" value="1" scope="page" />
	<div class="col-xs-6">
		<table class="table table-bordered">
			<h2>AEROBIC [오후]</h2>
			<tr>
				<th>ID</th>
				<th>회원 이름</th>
				<th>회원 아이디</th>
				<th>전화번호</th>
			</tr>
			<!-- 반복문 써서 모든 회원정보 출력 -->
			<c:forEach items="${listAerobic2}" var="item">
				<tr>
					<td>${aerobic2_count}</td>
					<td>${item.userName}</td>
					<td>${item.userId}</td>
					<td>${item.phone}</td>
				</tr>
				<!-- index_count 1씩 증가 -->
				<c:set var="aerobic2_count" value="${aerobic2_count+1}" scope="page" />
			</c:forEach>
		</table>
	</div>



</div>
<!-- 에어로빅 -->
<script>	
		document.addEventListener('DOMContentLoaded', function() {
			var calendarEl = document.getElementById('calendar');
			var calendar = new FullCalendar.Calendar(calendarEl, {
					timezone: 'local',
				
					plugins: ['interaction','dayGrid'],
					fixedWeekCount: false,
					
					header: {        	  
						 left: '',
				            center: 'title',
				            right: 'prev,next'
					},	
					
					selectable: true,
					
					select: function(){
						document.querySelector(".fc-highlight").style.background = '#5a5a5a';
					},
					
					dateClick: function(info) {
						 var year = info.date.getYear()+1900;
						 var month = info.date.getMonth()+1;
						 var date = info.date.getDate();
						 var regDate = year +'-'+month +'-'+ date;
					
							$.ajax({
								url : "reservation_admin.do",
								type: "GET",
								data : { "date" : regDate},
							
							
								
								success: function(responseData){
							
									window.location.href = "reservation_admin.do?date=" + regDate;
								}
							
							});			 
					}
				});
			calendar.render();
	
		});

		</script>
<%@ include file="../include/footer.jsp"%>