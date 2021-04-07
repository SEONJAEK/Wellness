<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<title>비밀번호 찾기</title>
<style>
.btn{
background-color: black;
color: white;
}

</style>

<!-- 각 페이지 내비 -->
	<main class="main">
		<section class="main-top">
	<h2 class="main-title">비밀번호 찾기</h2>
	<!-- <div class="main-nav">
		<a href="graph.do">Graph</a> 
		<a href="member_admin.do">회원관리</a>
		<a href="reservation_admin.do">예약관리</a>
	</div> -->
	
	</section>
	</main>

<body>
	<div class="contact-clean">
		<form action="findpw.do" method="GET">
			<h2 class="text-center" style="text-align: center; margin-top: 40px;">비밀번호 찾기</h2>
			<hr style= "border: 1px solid; width: 200px;">
			<p class="text-center"  style="text-align: center; margin-top: 30px;">
				아래 이메일주소를 입력하시면,<br> 입력하신 이메일로 새암호를 보내드립니다<br>
				<br></p>
				
			<div class="jumbotron" style="width:500px; height: 200px; margin-top:40px; margin-bottom: 40px; margin-left: 400px; border-radius: 30px; border: 2.5px dotted; background-color: lightgray;">
				<input type="text" id="userId" name="userId" placeholder="ID를 입력해주세요" style="margin-top: 30px; margin-left: 130px; width: 250px; height: 40px;"
					class="form-control" class="input"/>
					
			<div class="form-group has-error has-feedback">
				<input type="email" name="email" placeholder="email을 입력해주세요" style="margin-left: 130px; width: 250px; height: 40px;"
					class="form-control" />
				<p style="text-align: center; margin-top: 10px;">'@'포함한 이메일주소를 정확히 입력해주세요.</p>
			</div>

			<div class="form-group">
			<button type="submit" class="btn" style="width: 250px; height:30px; margin-left: 130px; margin-top: 10px;">다음</button>
			
			</div>
			</div>
		</form>
		
	</div>
     
</body>
<%@ include file="../include/footer.jsp" %>
