<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>로그인 페이지</title>
<style>
h2{
text-align: center;
}
.container-fluid{
padding: 30px;
}
</style>
</head>
<body>
<form action ="/" method="post">
            <h2> Member Login</h2>
             <div class="login" style="margin-left: 330px;">
            <div class="container-fluid" style="border: 2px solid; width: 400px; height: 300px; margin: 100px;">
                <input type="text" placeholder="ID" title="아이디입력" style="width: 250px; height: 40px; margin-left: 80px;"><br>
                <input type="password" placeholder="PASSWORD" title="비밀번호입력" style="width: 250px; height: 40px; margin-left: 80px;"><br>
                <input type="button" value="LOGIN" style="width: 255px; height: 40px; margin-left: 80px;" onclick=location.href='main.jsp'>
            <div>
            <ul> <br>
                <a href="" style="margin-left: 30px;" >아이디 찾기</a> &nbsp;
                <a href="">비밀번호 찾기</a> &nbsp;
                <a href="">회원가입</a>
            </ul>
            </div>
            </div>
       </div>
       </form>
        </body>
</html>