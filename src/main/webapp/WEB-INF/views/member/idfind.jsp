<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<title>아이디 찾기 페이지</title>
<style>
.container-fluid{
padding: 30px;
}
.btn{
background-color: black;
color: white;

}
</style>

<main class="main">
		<section class="main-top">
	<h2 class="main-title">아이디 찾기</h2>
	<!--  <div class="main-nav">
		<a href="graph.do">Graph</a> 
		<a href="member_admin.do">회원관리</a>
		<a href="reservation_admin.do">예약관리</a>
	</div> -->
	</section>
	</main>

<body>
<form action ="idfind.do" method="post">
            <h2 style="margin-top: 30px; text-align: center;">아이디 찾기</h2>
             <div class="login" style="margin-left: 330px;">
<div class="jumbotron" style="width:450px; height: 200px; margin-left: 160px; margin-top: 40px; margin-bottom: 40px; border-radius: 30px; border: 2.5px dotted; background-color: lightgray; padding-left: 20px; padding-right: 30px; padding-top: 30px;">
              이름 <input type="text" name=userName style="width: 260px; height: 40px; margin-left: 60px;"><br>
         이메일 <input type="email" name=email  style="width: 260px; height: 40px; margin-left: 47px;">
		    <button class="btn" style="width: 130px; height:30px; margin-left: 160px; margin-top: 30px;">아이디찾기</button>
            </div>
       		</div>
       </form>
</body>

<%@ include file="../include/footer.jsp" %>
</html>