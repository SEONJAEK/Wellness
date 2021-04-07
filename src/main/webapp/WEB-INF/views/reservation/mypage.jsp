<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet"
	href="<c:url value="resources/css/bootstrap.css"/>">
<style type="text/css">
body {
	line-height: 2em;
	font-family: "맑은 고딕";
}

ul, li {
	list-style: none;
	text-align: center;
	padding: 0;
	margin: 0;
}

#mainWrapper {
	width: 80%;
	margin: 0 auto; /*가운데 정렬*/
}

#mainWrapper>ul>li:first-child {
	text-align: center;
	font-size: 14pt;
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
	font-size: 10pt;
	border-bottom: 1px solid silver;
	vertical-align: baseline;
}

#ulTable>li>ul>li:first-child {
	width: 10%;
} /*No 열 크기*/
#ulTable>li>ul>li:first-child+li {
	width: 45%;
} /*제목 열 크기*/
#ulTable>li>ul>li:first-child+li+li {
	width: 20%;
} /*작성일 열 크기*/
#ulTable>li>ul>li:first-child+li+li+li {
	width: 15%;
} /*작성자 열 크기*/
#ulTable>li>ul>li:first-child+li+li+li+li {
	width: 10%;
} /*조회수 열 크기*/
.left {
	text-align: center;
}
.reservationMsg {
	margin: auto;
	text-align: center;
	font-size: 48px;
}
</style>
<script>
	function btnDelete(num) {
		if(confirm('취소 하시겠습니까?') == true) {
			location.href="delete.do?num="+num;
			alert('취소되었습니다.');
		}else {
			return false;
		}
	}
 </script>
<!-- 각 페이지 내비 -->
	<main class="main">
		<section class="main-top">
	<h2 class="main-title">MY 예약</h2>
	<!--  <div class="main-nav">
		<a href="graph.do">Graph</a> 
		<a href="member_admin.do">회원관리</a>
		<a href="reservation_admin.do">예약관리</a>
	</div> -->
	</section>
	</main>

<div id="mainWrapper">

	<c:set var="index_count" value="${pagedListHolder.getPage()*10+1}" scope="page" />
	<ul>
		<li>My 예약 현황</li>
					
		<div class="container" style="margin-top: 20px;">
			<jsp:useBean id="pagedListHolder" scope="request" type="org.springframework.beans.support.PagedListHolder" />
			<c:url value="/mypage.do" var="pagedLink">
				<c:param name="p" value="~" />
			</c:url>
					
			<table class="table table-bordered">
					<c:choose>
						<c:when test="${empty pagedListHolder.pageList}">
							<tr id="reservationMsg">등록된 예약이 없습니다.</tr>
						</c:when>
						<c:otherwise>
							<tr>
								<th>날짜</th>
								<th>프로그램</th>
								<th>시간</th>
								<th>강사</th>
								<th>예약취소</th>
							</tr>	
							<c:forEach items="${pagedListHolder.pageList}" var="list">
									<tr>
										<td>${list.regDate}</td> 
										<td>${list.programName}</td>
										<td>${list.programTime}</td>
										<td>${list.userName}</td>
										<td>
										<%-- <jsp:useBean id="now" class="java.util.Date" />
	                                    <fmt:formatDate value="${now}" pattern="yyyyMMdd" var="today" />
	                                    <fmt:parseNumber value="${today}" integerOnly="true" var="today" />
	                  
	                                    <fmt:formatDate value="${list.regDate}" pattern="yyyyMMdd" var="reservationDay" />
	                                    <fmt:parseNumber value="${reservationDay}" integerOnly="true" var="rDay" /> --%>  
	                                    
	                                   <%-- <c:if test="${today-rDay lt 0}"> --%>
	                                       <li><input type="button" value="예약취소" onclick="btnDelete(${list.num});"></li>
	                                   <%-- </c:if> --%>
                                   		</td>
									</tr>
									<c:set var="index_count" value="${index_count+1}" scope="page" />		
								</c:forEach>				
						</c:otherwise>
				</c:choose>
			</table>
			<tg:paging pagedListHolder="${pagedListHolder}" pagedLink="${pagedLink}" />
		</div>
	</ul>
</div>

<%@ include file="../include/footer.jsp" %>