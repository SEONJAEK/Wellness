<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
</head>
<body>
<form action ="idfind.do" method="post">
            <h3> 아이디 찾기</h3>
            <hr style="width: 100px; margin-top: -10px; float: left;">
             <div class="login" style="margin-left: 330px;">
             <div class="container-fluid" style="border: 2px solid; width: 430px; height: 200px; margin: 100px;">
              이름 <input type="text" name=userName style="width: 240px; height: 40px; margin-left: 60px;"><br>
         이메일 <input type="email" name=email  style="width: 240px; height: 40px; margin-left: 44px;">
		    <button class="btn" style="width: 130px; height:30px; margin-left: 160px; margin-top: 5px;">아이디찾기</button>
            </div>
       		</div>
       </form>
</body>
</html>