<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>    

<style>
h2{
text-align: center;
}
.container-fluid{
padding: 30px;
}
</style>
<script type="text/javascript">
$(function () {
	$('#loginCheck').click(function(){
		$.ajax({
			url: 'loginCheck.do',
			dataType: 'json',
			type:'GET',
			contentType : 'text/html; charset=utf-8;',
			data: {userId: $("input[name='userId']").val(), userPass: $("input[name='userPass']").val()},
			success:function(data){
				console.log(data.loginCheck);
				if(data.loginCheck == 1){
					alert("아이디 또는 비밀번호를 입력해주세요.");
				}else if(data.loginCheck == 2) {
					alert('아이디 또는 비밀번호가 틀렸습니다.');
				}
			}
		});
	});
});
</script>

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
            <h2  style="margin-top: 40px;"> Member Login</h2>
           
             <div class="login" style="margin-top: 30px; margin-bottom: 40px;">
<div class="jumbotron" style="width:500px; height: 350px; margin: 0 auto; border-radius: 30px; border: 2.5px dotted; background-color: lightgray;">
                <input type="text" name="userId" id="userId" placeholder="ID" title="아이디입력" style="width: 250px; height: 40px; margin-left: 120px; margin-top: 50px; "><br>
                <input type="password" name="userPass" id="userPass" placeholder="PASSWORD" title="비밀번호입력" style="width: 250px; height: 40px;  margin-left: 120px;"><br>
                <input type="button" value="LOGIN" id="loginCheck" style="width: 250px; height: 40px;  margin-left: 120px;">
             
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
