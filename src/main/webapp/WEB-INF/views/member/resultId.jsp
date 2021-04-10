<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../include/header.jsp" %>

<style>
.btn-g{margin:3px;} 
.out-div{text-align:center; margin:5%;}
.signup {
	background-color: black;
		color: white;
		width: 200px;
		height: 35px;
}
h5{font-size: 30px;}
h3{margin-bottom:2%;}
</style>

<main class="main">
		<section class="main-top">
	<h2 class="main-title">아이디 찾기 결과</h2>
	<!--  <div class="main-nav">
		<a href="graph.do">Graph</a> 
		<a href="member_admin.do">회원관리</a>
		<a href="reservation_admin.do">예약관리</a>
	</div> -->
	</section>
	</main>

<form action = "resultId.do" method="post" style="min-height: 600px;">
<div class="jumbotron" style="width:500px; height: 200px; margin:0 auto; margin-top: 100px; border-radius: 30px; border: 2.5px dotted; background-color: lightgray;">
  	<div class="row out-div">
		<div class="col-12">
	     	<div class="row">
	     		<div class="col-12">
	     			<h3>ID 찾기 결과</h3>
	   				<h5 id="idfind">아이디: ${memberVO.userId}  </h5>
					
					<span>
						<input type="button" style="margin-top: 30px;" value="로그인" class="signup" onclick="location.href='login.do'">
						<input type="button" style="margin-top: 30px;" value="비밀번호 찾기" class="signup" onclick="location.href='pwfind.do'">
					</span>
				</div> 
			</div>
	 	 </div>    
	</div>
</div>         
</form>
<%@ include file="../include/footer.jsp" %>