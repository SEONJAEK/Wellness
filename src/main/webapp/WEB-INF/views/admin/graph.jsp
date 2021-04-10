<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="../include/header.jsp" %>

<script src="<c:url value="/resources/js/Chart.min.js" />"></script>



<style>

  .column {
  float: left!important;
  width: 30%!important;
  padding: 10px!important;
  
}

  .three-column:after{
	  content: "";
	  display: table;
	  clear: both;
  }
  
 <!--선재 추가1-->
 
body {
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
	font-size: 14pt;
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
	font-size: 10pt;
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
 <!--선재 추가1-->
 
.list-group {
	text-align: center;
	padding-left: 0;

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

a.menubox:hover{
    background: #0e0e0e;
    color: #c59d55;
}
h1{font-size: 4rem;}
h2{font-size: 2rem;}

</style>
  

	<!-- 각 페이지 내비 -->
	<main class="main">
		<section class="main-top">
	<h2 class="main-title">관리자 페이지</h2>
	<!-- <div class="main-nav">
		<a href="graph.do">Graph</a> 
		<a href="member_admin.do">회원관리</a>
		<a href="reservation_admin.do">예약관리</a>
	</div> -->
	
	</section>
	</main>
	
	<h1 style="text-align: center; margin-top: 100px;">회원 분석</h1>
	
	
	<div class="sub_menu">
		<nav id="sub_menu">
			<div class="list-group" style="text-align:center; margin-top: 100px;">
					<a href="graph.do" target="_self" class="menubox active">회원 분석</a>
					<a href="member_admin.do" target="_self" class="menubox ">회원 목록</a>
					<a href="reservation_admin.do" target="_self" class="menubox ">예약 현황</a>
			</div>
		</nav>
	</div><br><br><br>


	
	<div class="three-column" style="padding-top: 100px; margin: 0 auto; min-width: 100%;">
		<!-- 원형그래프 -->
		
		<div class="column" id="canvas-holder">
			<h2 style="text-align: center">남여 회원 성비 </h2><br><br>
			<canvas id="chart-area"></canvas>
			
		</div>
		<div>
		남: ${count_male}<br>
		여: ${count_female}<br>
		총: ${count_male+count_female}<br>
		</div>
		<!-- 남녀 연령별 막대그래프 -->
		<div class="column" id="canvas-holder">
		<h2 style="text-align: center">나이대별 회원 분포도</h2><br><br>
		<canvas id="chart-area1"></canvas>
		</div>
		
		<!-- 회원 증가추이 꺾은선 그래프 -->
		<div class="column" id="canvas-holder">
		<h2 style="text-align: center">월별 회원 증가 추이</h2><br><br>
		<canvas id="chart-area2"></canvas>
		 </div>
	</div>

<br><br><br><br><br><br>

	
	
	<!-- 공통 스크립트 주소 -->
	
	<script>

	var color = Chart.helpers.color;
	window.chartColors = {
			red: 'rgb(255, 99, 132)',
			orange: 'rgb(255, 159, 64)',
			yellow: 'rgb(255, 205, 86)',
			green: 'rgb(75, 192, 192)',
			blue: 'rgb(54, 162, 235)',
			purple: 'rgb(153, 102, 255)',
			grey: 'rgb(201, 203, 207)'
		};
		//1. 첫번째 그래프 : 도넛 그래프
		var config = {
			type: 'doughnut',
			data: {
		        labels: ['남', '여'],
		        datasets: [{
		            label: 'My First dataset',
		            backgroundColor: [window.chartColors.yellow,window.chartColors.green],
		           
		            data:  [${count_male}, ${count_female}]
		        }]
		    },
		    options: {}
		};
		
	
		
	
		
		var config1 = {
				type: 'horizontalBar',
				data: {
			   
			      
					labels: ['10대','20대', '30대', '40대', '50대', '기타'],
					datasets: [{
						label: '여',
						backgroundColor: color(window.chartColors.red).alpha(0.5).rgbString(),
						borderColor: window.chartColors.red,
						data: [${f_ten}, ${f_twenty}, ${f_thirty}, ${f_fourty}, ${f_fifty}, ${f_other}],
						fill: false,
					}, {
						label: '남',
						backgroundColor: color(window.chartColors.blue).alpha(0.5).rgbString(),
						borderColor: window.chartColors.blue,
						fill: false,
						data: [${m_ten}, ${m_twenty}, ${m_thirty}, ${m_fourty}, ${m_fifty}, ${m_other}],
					}]
				},

			   
				options: {
					//데이터 셋에 모두 적용가능한  option
					elements: {
						rectangle: {
							borderWidth: 2,
						}
					},
					responsive: true,
					legend: {
						position: 'top',
					},
					title: {
						display: false,
						text: 'Chart.js Horizontal Bar Chart'
					}
				}
			};
		
		
		var config2 = {
				type: 'line',
				data: {
					labels: ['5월', '6월', '7월', '8월', '9월', '10월', '11월','12월','1월','2월','3월','4월'],
					datasets: [{
						label: 'My First dataset',
						backgroundColor: window.chartColors.red,
						borderColor: window.chartColors.red,
						data: [10, 30, 39, 40, 35, 34, 15, 20, 30,20,35,26],
						fill: false,
					}]
				},
			    options: {}
			};

		
		window.onload = function() {
			//config(javascript)와 chart-area을 연결
			var ctx = document.getElementById('chart-area').getContext('2d');
			window.myDoughnut = new Chart(ctx, config);
			//config1(javascript)와 chart-area1을 연결
			var ctx1 = document.getElementById('chart-area1').getContext('2d');
			window.myDoughnut1 = new Chart(ctx1, config1);
			//config2(javascript)와 chart-area2을 연결
			var ctx2 = document.getElementById('chart-area2').getContext('2d');
			window.myDoughnut2 = new Chart(ctx2, config2);
		};
		
		
		</script>


	<!-- 선재 삽입2 -->		
<%@ include file="../include/footer.jsp" %>