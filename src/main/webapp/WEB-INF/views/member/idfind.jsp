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
input{
font-family:'Do Hyeon';
font-size: 1.3rem;
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
<form action ="idfind.do" method="post" style="min-height: 600px;">
          
       		
       		<h2 style="padding:50px 0; font-size: 2rem; text-align:center;">아이디 찾기</h2>
           
      		<div class="login">
				<div class="jumbotron" style="width:500px; height: 350px; margin: 0 auto; border-radius: 30px; border: 2.5px dotted; background-color: lightgray;">
                <input type="text" name="userName" placeholder="이름" style="width: 250px; height: 40px; margin-left: 120px; margin-top: 50px; "><br>
                <input type="email" name="email" placeholder="이메일"  style="width: 250px; height: 40px;  margin-left: 120px;"><br>             
                <input type="submit" value="아이디 찾기" style="width: 250px; height: 40px;  margin-left: 120px; font-weight: 700;">            
            <div>
            <ul> <br>
             
            </ul>
            </div>
            </div>
       </div>
       </form>
</body>


<%@ include file="../include/footer.jsp" %>
</html>