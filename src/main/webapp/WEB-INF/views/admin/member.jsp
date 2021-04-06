<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet"
	href="<c:url value="resources/css/bootstrap.css?ver=1"/>">

<style>

  .column {
  float: left!important;
  width: 30%!important;
  padding: 10px!important;
  
}

  .three-column:after{
	  content: "";
	  display: table;
	  clear: both;
  }
  
 <!--선재 추가1-->
 
body {
	line-height: 2em;
	/*font-family: "맑은 고딕";*/
}

ul, li {
	list-style: none;
	text-align: center;
	padding: 0;
	margin: 0;
}

#mainWrapper {
	width: 100%;
	margin: 0 auto; /*가운데 정렬*/
}

#mainWrapper>ul>li:first-child {
	text-align: center;
	font-size: 1rem;
	height: 40px;
	vertical-align: middle;
	line-height: 30px;
}

#ulTable {
	margin-top: 10px;
}

#ulTable>li:first-child>ul>li {
	background-color: #c9c9c9;
	font-weight: bold;
	text-align: center;
}

#ulTable>li>ul {
	clear: both;
	padding: 0px auto;
	position: relative;
	min-width: 40px;
}

#ulTable>li>ul>li {
	float: left;
	font-size: 1rem;
	border-bottom: 1px solid silver;
	vertical-align: baseline;
}

#ulTable>li>ul>li:first-child {
	width: 5%;
} /*No 열 크기*/
#ulTable>li>ul>li:first-child+li {
	width: 10%;
} /*제목 열 크기*/
#ulTable>li>ul>li:first-child+li+li {
	width: 5%;
} /*작성일 열 크기*/
#ulTable>li>ul>li:first-child+li+li+li {
	width: 5%;
} /*작성자 열 크기*/
#ulTable>li>ul>li:first-child+li+li+li+li {
	width: 5%;
} /*조회수 열 크기*/
#ulTable>li>ul>li:first-child+li+li+li+li+li {
	width: 15%;
} /*조회수 열 크기*/
#ulTable>li>ul>li:first-child+li+li+li+li+li+li {
	width: 20%;
} /*조회수 열 크기*/
#ulTable>li>ul>li:first-child+li+li+li+li+li+li+li {
	width: 25%;
} /*조회수 열 크기*/
#ulTable>li>ul>li:first-child+li+li+li+li+li+li+li+li {
	width: 10%;
} /*조회수 열 크기*/
.left {
	text-align: center;
}
 <!--선재 추가1-->
 
 .list-group {
text-align: center;
padding-left: 0;
    margin-bottom: 20px;
}
.list-group a.menubox {
	display: inline-block;
	width: 250px;
	height: 50px;
	text-align: center;
	line-height: 50px;
	background: #ebebeb;
	border: 1px solid #ebebeb;
	font-weight: 400;
	font-size: 2rem;
	color: #666;
	text-decoration: none;
	margin: 0 2px;
}
    .list-group a.active {
    background: #0e0e0e;
    color: #c59d55;
}

a.menubox:hover{
    background: #0e0e0e;
    color: #c59d55;
}

h1{font-size: 4rem;}
h2{font-size: 2rem;}

#membertable{font-size: 1rem;}
#membertable th{text-align: center;}

@media screen and (max-width: 768px) {
#membertable .memail .maddre, .mmanag{
display: none;} 
}
</style>
  
	
	<!-- 각 페이지 내비 -->
	<main class="main">
		<section class="main-top">
	<h2 class="main-title">회원 관리 페이지</h2>
	<!--  <div class="main-nav">
		<a href="graph.do">Graph</a> 
		<a href="member_admin.do">회원관리</a>
		<a href="reservation_admin.do">예약관리</a>
	</div> -->
	</section>
	</main>
	
	<h1 style="text-align: center; margin-top: 100px;">회원 목록</h1>
	
	
	<div class="sub_menu">
		<nav id="sub_menu">
			<div class="list-group" style="text-align:center; margin-top: 100px;">
					<a href="graph.do" target="_self" class="menubox">회원 분석</a>
					<a href="member_admin.do" target="_self" class="menubox active">회원 목록</a>
					<a href="reservation_admin.do" target="_self" class="menubox ">예약 현황</a>
			</div>
		</nav>
	</div><br><br><br>
	
	
	
	<!-- 선재 삽입2 -->	

		<div id="mainWrapper">
		<!-- index_count 변수 : 1부터 선언-->
		<c:set var="index_count" value="${pagedListHolder.getPage()*10+1}" scope="page" />
		<ul>
	
			
			<div class="container" style="margin-top: 20px;">
				<jsp:useBean id="pagedListHolder" scope="request"
					type="org.springframework.beans.support.PagedListHolder" />
				<c:url value="/member_admin.do" var="pagedLink">
					<c:param name="p" value="~" />
				</c:url>
		

				<table id="membertable" class="table table-bordered">
					<tr>
						<th>번호</th>
						<th>아이디</th>
						<th>이름</th>
						<th>성별</th>
						<th>나이</th>
						<th>전화번호</th>
						<th class="memail">이메일</th>
						<th class="maddre">주소</th>
						<c:if test="${sessionScope.isAdmin=='1'}">
							<th class="mmanag">관리자여부</th>
						</c:if>
	
					</tr>
					<!-- 반복문 써서 모든 회원정보 출력 -->
					<c:forEach items="${pagedListHolder.pageList}" var="item">
						<tr>
							<td>${index_count}</td> 
							<td>${item.userId}</td>
							<td>${item.userName}</td>
							<td>${item.gender}</td>
							<td>${item.age}</td>
							<td>${item.phone}</td>
							<td>${item.email}</td>
							<td>${item.address}</td>
							<td>
								<select class="isAdmin" name="isAdmin">
										<option value="0" ${item.is_admin == '0' ? 'selected="selected"' : ''} >회원</option>
										<option value="1" ${item.is_admin == '1' ? 'selected="selected"' : ''}>관리자</option>
								</select>
							</td>
	


				
							
					
						</tr>
						<!-- index_count 1씩 증가 -->
						<c:set var="index_count" value="${index_count+1}" scope="page" />
					</c:forEach>
				</table>
				<tg:paging pagedListHolder="${pagedListHolder}"
					pagedLink="${pagedLink}" />
			</div>
			
			
		</ul>
		</div>
	
	
	<script>
	
		$('.isAdmin').change(function() {
			var role =  $(this).find('option:selected').index();
			var user_id =  $(this).closest("tr").find("td:eq(1)").text();
			$.ajax({
				url : "updateRole.do",
				type: "POST",
				data : { "userId" : user_id,"is_admin": role},
				
				success: function(responseData){

				      if(responseData==='success'){
				    	  window.alert('success');
				      }
				}
				
				
				
			});
		});
		
	</script>
	<br><br><br><br>
	<!-- 선재 삽입2 -->		
<%@ include file="../include/footer.jsp" %>