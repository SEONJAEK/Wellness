<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
    

<style>
h2{
text-align: center;
}
.container-fluid{
padding: 30px;
}
</style>
<!-- 각 페이지 내비 -->
	<main class="main">
		<section class="main-top">
	<h2 class="main-title">로그인</h2>
	<!-- <div class="main-nav">
		<a href="graph.do">Graph</a> 
		<a href="member_admin.do">회원관리</a>
		<a href="reservation_admin.do">예약관리</a>
	</div> -->
	
	</section>
	</main>
<form action ="login.do" method="post">
            <h2> Member Login</h2>
           
             <div class="login" style="margin-left: 265px;">
            <div class="container-fluid" style="border: 2px solid; width: 400px; height: 300px; margin: 100px;">
                <input type="text" name="userId" placeholder="ID" title="아이디입력" style="width: 250px; height: 40px; margin-left: 80px;"><br>
                <input type="password" name="userPass" placeholder="PASSWORD" title="비밀번호입력" style="width: 250px; height: 40px; margin-left: 80px;"><br>
                <input type="submit" value="LOGIN" style="width: 255px; height: 40px; margin-left: 80px;">
             
            <div>
            
            <ul> <br>
                <a href="idfind.do" style="margin-left: 30px;" >아이디 찾기</a> &nbsp;
                <a href="">비밀번호 찾기</a> &nbsp;
                <a href="">회원가입</a>
            </ul>
            </div>
            </div>
       </div>
     
       </form>
      
        <%@ include file="../include/footer.jsp" %>
