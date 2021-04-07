<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jsp" %>
	<head>
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="<c:url value="resources/css/bootstrap.css"/>">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="<c:url value="resources/css/bootstrap-theme.css"/>">
		
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 
	 	<title>게시판 페이지</title>
	<style>
		h1 {
		text-align:center;
		}
		.input-group .form-control {
			width:94%;
		}
		.boardmain{
			font-size:20px;
		}
		.thead1 {
			font-size:25px;
		}
		a{color:#333333;}
		a.write {
	    display: flex;
	    justify-content: center;
	    align-items: center;
	    height: 34px;
	    width: 125px;
	    padding: 0 12px;
	    border-radius: 4px;
	    font-size: 1rem;
	    font-weight: 500;
	    line-height: 1.5;
	    text-align: center;
	    border: 1px solid #65b836;
	    color: #fff;
	    background: #55a532 linear-gradient(#91dd70, #55ae2e);    
	    cursor: pointer;
	    box-sizing: border-box;
	    position: relative;}
	</style>
	<script>
		function btn_login() {
			if(confirm('로그인을 해주세요.') == true) {
				location.href="login.do";
			}else{
				return false;
			}
		};
	</script>
	</head>
	<!-- 각 페이지 내비 -->
	<main class="main">
		<section class="main-top">
	<h2 class="main-title">Q &amp; A</h2>
	<!-- <div class="main-nav">
		<a href="graph.do">Graph</a> 
		<a href="member_admin.do">회원관리</a>
		<a href="reservation_admin.do">예약관리</a>
	</div> -->
	
	</section>
	
	</main>
	<body class="boardmain">
		<div class="container">
			<h1 class="text-left">전체 글</h1>
			<hr style="border-top: 1px solid #818181;"/>

			<section id="container">
				<form role="form" method="get">
					<table class="table table-hover text-center">
						<thead class="thead1">
							<tr><th>번호</th><th>제목</th><th>작성자</th><th>등록일</th><th>조회수</th></tr>
						</thead>
						
						<c:forEach items="${list}" var="list">
							<tr>
								<td><c:out value="${list.bno}" /></td>
								<td>
								<!--<c:choose>
								<c:when test="${}">
								</c:when>
								<c:otherwise>
								</c:otherwise>
								</c:choose>	-->
									<a href="readView.do?bno=${list.bno}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}"><c:out value="${list.title}" /></a>
								</td>
								<td><c:out value="${list.userId}" /></td>
								<td><fmt:formatDate value="${list.bRegDate}" pattern="yyyy-MM-dd"/></td>
								<td><c:out value="${list.hit}" /></td>
							</tr>
						</c:forEach>
						
					</table>
					<div class="search row">
						<div class="col-xs-2 col-sm-2">
							<select name="searchType" class="form-control">
								<option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
								<option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
								<option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
								<option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
								<option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
							</select>
						</div>
						 
						<div class="col-xs-10 col-sm-10">
							<div class="input-group">
								<input type="text" name="keyword" id="keywordInput" value="${scri.keyword}" class="form-control"/>
								<span class="input-group-btn">
									<button id="searchBtn" type="button" class="btn btn-default">검색</button> 	
								</span>
							</div>
						</div>
						<c:choose>
							<c:when test="${userId != null}">
								<li style="margin:30px 10px -30px 0; float:right;"><a class="write text-right" href="writeView.do">글 작성</a></li>
							</c:when>
							<c:otherwise>
								<li style="margin:30px 10px -30px 0; float:right;"><a class="write text-right" onclick="btn_login();">글 작성</a></li>
							</c:otherwise>
						</c:choose>
						<script>
							 $(function(){
								 $('#searchBtn').click(function() {
									 self.location = "list.do" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
								 });
							 });   
						</script>
					</div>
					<div class="text-center">
						<ul class="pagination">
							<c:if test="${pageMaker.prev}">
								<li><a href="list.do${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
							</c:if> 
							
							<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
								<li <c:out value="${pageMaker.cri.page == idx ? 'class=info' : ''}" />>
								<a href="list.do${pageMaker.makeSearch(idx)}">${idx}</a></li>
							</c:forEach>
							
							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a href="list.do${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
							</c:if> 
						</ul>
					</div>
				</form>
			</section>
		</div>
	</body>
<%@ include file="../include/footer.jsp" %>