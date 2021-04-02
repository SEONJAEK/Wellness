<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="include/header.jsp" %>

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
</style>
  

	
	
	
	<h1 style="text-align: center; padding-top: 50px;">관리자페이지</h1>
	<div class="three-column" style="padding-top: 100px;">
		<!-- 원형그래프 -->
		<div class="column" id="canvas-holder">
			<canvas id="chart-area"
				 ></canvas>
		</div>

		<!-- 남녀 연령별 막대그래프 -->
		<div class="column" id="canvas-holder">
		<canvas id="chart-area1"
			></canvas>
		</div>
		<!-- 회원 증가추이 꺾은선 그래프 -->
		<div class="column" id="canvas-holder">
		<canvas id="chart-area2"
			></canvas>
		 </div>
	</div>


	
	
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
					// Elements options apply to all of the options unless overridden in a dataset
					// In this case, we are setting the border of each horizontal bar to be 2px wide
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
					labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월','8월','9월','10월','11월','12월'],
					datasets: [{
						label: 'My First dataset',
						backgroundColor: window.chartColors.red,
						borderColor: window.chartColors.red,
						data: [10, 30, 39, 20, 25, 34, 0,0,0,0,0,0],
						fill: false,
					}]
				},
			    options: {}
			};

		window.onload = function() {
			var ctx = document.getElementById('chart-area').getContext('2d');
			window.myDoughnut = new Chart(ctx, config);
			
			var ctx1 = document.getElementById('chart-area1').getContext('2d');
			window.myDoughnut1 = new Chart(ctx1, config1);
			
			var ctx2 = document.getElementById('chart-area2').getContext('2d');
			window.myDoughnut2 = new Chart(ctx2, config2);
		};
		
		
		</script>

	<!-- 선재 삽입2 -->	
	
		<div id="mainWrapper">
		<!-- index_count 변수 : 1부터 선언-->
		<c:set var="index_count" value="${pagedListHolder.getPage()*10+1}" scope="page" />
		<ul>
			<li>회원 정보 페이지</li>
			
			<div class="container" style="margin-top: 20px;">
				<jsp:useBean id="pagedListHolder" scope="request"
					type="org.springframework.beans.support.PagedListHolder" />
				<c:url value="/graph.do" var="pagedLink">
					<c:param name="p" value="~" />
				</c:url>
		

				<table class="table table-bordered">
					<tr>
						<th>번호</th>
						<th>아이디</th>
						<th>이름</th>
						<th>성별</th>
						<th>나이</th>
						<th>전화번호</th>
						<th>이메일</th>
						<th>주소</th>
						<th>관리자여부</th>
	
					</tr>
					<!-- 반복문 써서 모든 회원정보 출력 -->
					<c:forEach items="${pagedListHolder.pageList}" var="item">
						<tr>
							<td>${index_count}</td> 
							<td>${item.userId}</td>
							<td>${item.userName}</td>
							<td>${item.gender}</td>
							<td>${item.age}</td>
							<td>${item.phone}</td>
							<td>${item.email}</td>
							<td>${item.address}</td>
							<td>
							<select class="isAdmin" id="isAdmin" name="isAdmin">
									<option value="0" ${item.is_admin == '0' ? 'selected="selected"' : ''} >회원</option>
									<option value="1" ${item.is_admin == '1' ? 'selected="selected"' : ''}>관리자</option>
							</select>
							</td>
							
					
						</tr>
						<!-- index_count 1씩 증가 -->
						<c:set var="index_count" value="${index_count+1}" scope="page" />
					</c:forEach>
				</table>
				<tg:paging pagedListHolder="${pagedListHolder}"
					pagedLink="${pagedLink}" />
			</div>
			
			
		</ul>
		</div>
	

	<!-- 선재 삽입2 -->		
	
	</div>
<%@ include file="include/footer.jsp" %>