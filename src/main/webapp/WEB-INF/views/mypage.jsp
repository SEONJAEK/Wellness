<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="include/header.jsp" %>

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
	width: 800px;
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


	<div id="mainWrapper">
		<ul>
			<li>My 예약 현황</li>
			<ul id="ulTable">
				<li>
					<ul>
						<li>날짜</li>
						<li>프로그램</li>
						<li>시간</li>
						<li>강사</li>
						<li>취소</li>
					</ul>
				</li>
				<li>
					<c:choose>
						<c:when test="${empty programList}">등록된 예약이 없습니다.</c:when>
						<c:otherwise>
							<c:forEach var="list" items="${programList}"  begin="1" end="10">
								<ul>
									<li>${list.regDate}</li>
									<li>${list.programName}</li>
									<li class="left">${list.programTime}</li>
									<li>${list.userName}</li>
		
									<jsp:useBean id="now" class="java.util.Date" />
									<fmt:formatDate value="${now}" pattern="yyyyMMdd" var="today" />
									<fmt:parseNumber value="${today}" integerOnly="true" var="today" />
		
									<fmt:formatDate value="${list.regDate}" pattern="yyyyMMdd"
										var="reservationDay" />
									<fmt:parseNumber value="${reservationDay}" integerOnly="true"
										var="rDay" /> 
		
									<c:if test="${today-rDay lt 0}">
										<li><input type="button" value="예약취소"
											onclick="btnDelete(${list.num});"></li>
									</c:if>
								</ul>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</li>
			</ul>
		</ul>
	</div>

<%@ include file="include/footer.jsp" %>