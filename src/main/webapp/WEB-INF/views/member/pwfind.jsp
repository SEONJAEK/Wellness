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
			<h2 class="text-center">비밀번호 찾기</h2>
			<p class="text-center">
				아래 이메일주소를 입력하시면,<br> 입력하신 이메일로 새암호를 보내드립니다<br>
				<br>
			<div class="form-group has-success has-feedback">
				<input type="text" id="userId" name="userId" placeholder="ID를 입력해주세요"
					class="form-control" /><i aria-hidden="true"
					class="form-control-feedback glyphicon glyphicon-ok"></i>
			</div>
			<div class="form-group has-error has-feedback">
				<input type="email" name="email" placeholder="email을 입력해주세요"
					class="form-control" /><i aria-hidden="true"
					class="form-control-feedback glyphicon glyphicon-remove"></i>
				<p class="help-block">'@'포함한 이메일주소를 정확히 입력해주세요.</p>
			</div>

			<div class="form-group">
			<button type="submit" class="btn" style="width: 80px; height:30px; margin-left: 630px; margin-top: 30px;">다음</button>
			
			</div>
		</form>
		
	</div>
     
</body>
<%@ include file="../include/footer.jsp" %>
