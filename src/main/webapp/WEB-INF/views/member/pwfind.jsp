<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>비밀번호 찾기 페이지</title>
<style>
.btn{
background-color: black;
color: white;
}
</style>
</head>
<body>
	<form action ="/" method="post">
            <h3> 비밀번호 찾기</h3>
            <hr style="width: 100px; margin-top: -10px; float: left;">
            	비밀번호를 찾고자하는 아이디를 입력해주세요
             <div class="container-fluid" style="border: 2px solid; width: 430px; height: 200px; margin-left: 450px; margin-top: 100px;">
     	  	<input type="text" placeholder="회원아이디" style="width: 200px; height: 50px; margin-left: 110px; margin-top: 70px;">
       		</div>
       		  <button class="btn" style="width: 80px; height:30px; margin-left: 630px; margin-top: 30px;">다음</button>
       </form>
</body>
</html>