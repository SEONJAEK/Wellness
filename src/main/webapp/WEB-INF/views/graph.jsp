<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<%@ include file="include/header.jsp" %>
<script src="js/Chart.min.js"></script>


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
	
		var config = {
			type: 'doughnut',
			data: {
		        labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
		        datasets: [{
		            label: 'My First dataset',
		            backgroundColor: 'rgb(255, 99, 132)',
		            borderColor: 'rgb(255, 99, 132)',
		            data: [0, 10, 5, 2, 20, 30, 45]
		        }]
		    },
		    options: {}
		};
		
	
		
		var config1 = {
				type: 'bar',
				data: {
			        labels: ['rkrj', '나나나나나나', '다다다다다다', '라라라라라라', '마마마', '바바바바바바바', '사사사사사사사사', '아아아아아아', '자자자자', '차차차차차차차', '카카카카카카카'],
			        datasets: [{
			            label: '테스트 데이터셋',
			            data: [
			                10,
			                3,
			                30,
			                23,
			                10,
			                5,
			                15,
			                20,
			                13,
			                5,
			                9
			            ],
			            borderColor: "rgba(255, 201, 14, 1)",
			            backgroundColor: "rgba(255, 201, 14, 0.5)",
			            fill: false,
			        }]
			    },
			    options: {}
			};
		var config2 = {
				type: 'line',
				data: {
					labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
					datasets: [{
						label: 'My First dataset',
						data: [10, 30, 39, 20, 25, 34, 0],
						fill: false,
					}, {
						label: 'My Second dataset',
						fill: false,
						data: [18, 33, 22, 19, 11, 39, 30],
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

<%@ include file="include/footer.jsp" %>