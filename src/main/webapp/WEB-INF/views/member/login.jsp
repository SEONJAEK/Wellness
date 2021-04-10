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
		<form action ="login.do" method="post" style="min-height: 800px;">
            <h2 style="padding:50px 0; font-size: 2rem;">로그인</h2>
           
      <div class="login">
			<div class="jumbotron" style="width:500px; height: 350px; margin: 0 auto; border-radius: 30px; border: 2.5px dotted; background-color: lightgray;">
                <input type="text" name="userId" placeholder="아이디" title="아이디입력" style="width: 250px; height: 40px; margin-left: 120px; margin-top: 50px; "><br>
                <input type="password" name="userPass" placeholder="비밀번호" title="비밀번호입력" style="width: 250px; height: 40px;  margin-left: 120px;"><br>
                <input type="submit" value="로그인" style="width: 250px; height: 40px;  margin-left: 120px; font-weight: 700;">
             
            <div>
            <ul> <br>
                <a href="idfind.do" style="margin-left: 110px; font-size: 20px;" >아이디 찾기</a> &nbsp;
                <a href="pwfind.do" style="font-size: 20px;">비밀번호 찾기</a> &nbsp;
                <a href="join.do"  style="font-size: 20px;">회원가입</a>
            </ul>
            </div>
            </div>
       </div>
     
       </form>
      
        <%@ include file="../include/footer.jsp" %>
