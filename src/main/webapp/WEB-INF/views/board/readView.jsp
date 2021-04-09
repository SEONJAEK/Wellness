<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jsp"%>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="<c:url value="resources/css/bootstrap.css"/>">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="<c:url value="resources/css/bootstrap-theme.css"/>">

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<title>게시판 상세보기</title>
<style>
	#content{
		margin: 0px -28px 0px 0px; height: 350px; min-width: 300px;
	}
	#title, #userId{
	min-width: 300px;
	}
	/* .form-horizontal .form-group {
    	margin-right: -13px;
    	margin-left: -141px;
	} */
	.form-group {
    	margin-bottom: 25px;
	}
	.control-label {
		font-size:25px;
	}
	# crudbutton { 
		float: left; 
	}
	ul, h1 {
		text-align:center;
	}

</style>
</head>

<script type="text/javascript">
	$(document)
			.ready(
					function() {
						var formObj = $("form[name='readForm']");

						// 수정 
						$(".update_btn").on("click", function() {
							formObj.attr("action", "updateView.do");
							formObj.attr("method", "get");
							formObj.submit();
						})

						// 삭제
						$(".delete_btn").on("click", function() {

							var deleteYN = confirm("삭제하시겠습니까?");
							if (deleteYN == true) {

								formObj.attr("action", "delete.do");
								formObj.attr("method", "post");
								formObj.submit();
								alert('삭제되었습니다.');

							}
						})

						// 목록
						$(".list_btn")
								.on(
										"click",
										function() {

											location.href = "list.do?page=${scri.page}"
													+ "&perPageNum=${scri.perPageNum}"
													+ "&searchType=${scri.searchType}&keyword=${scri.keyword}";
										})

						$(".replyWriteBtn").on("click", function() {
							var formObj = $("form[name='replyForm']");
							formObj.attr("action", "replyWrite.do");
							formObj.submit();
						});

						//댓글 수정 View
						$(".replyUpdateBtn")
								.on(
										"click",
										function() {
											location.href = "replyUpdateView.do?bno=${read.bno}"
													+ "&page=${scri.page}"
													+ "&perPageNum=${scri.perPageNum}"
													+ "&searchType=${scri.searchType}"
													+ "&keyword=${scri.keyword}"
													+ "&rno="
													+ $(this).attr("data-rno");
										});

						//댓글 삭제 View
						$(".replyDeleteBtn")
								.on(
										"click",
										function() {
											if(confirm('삭제하시겠습니까?') == true){
												location.href = "replyDelete.do?bno=${read.bno}"
														+ "&page=${scri.page}"
														+ "&perPageNum=${scri.perPageNum}"
														+ "&searchType=${scri.searchType}"
														+ "&keyword=${scri.keyword}"
														+ "&rno="
														+ $(this).attr("data-rno");
														alert('삭제되었습니다.');
											}else {
												return false;
											}
										});
					})
</script>
<!-- 각 페이지 내비 -->
<main class="main">
	<section class="main-top">
		<h2 class="main-title">게시판 상세 페이지</h2>
		<!-- <div class="main-nav">
		<a href="graph.do">Graph</a> 
		<a href="member_admin.do">회원관리</a>
		<a href="reservation_admin.do">예약관리</a>
	</div> -->

	</section>
</main>
<body>
	<div class="container">
		<h1>게시판 상세 페이지</h1>
		<hr />

		<div>
			<%@include file="nav.jsp"%>
		</div>

		<section id="container">
			<form name="readForm" role="form" method="post">
				<input type="hidden" id="bno" name="bno" value="${read.bno}" /> <input
					type="hidden" id="page" name="page" value="${scri.page}"> <input
					type="hidden" id="perPageNum" name="perPageNum"
					value="${scri.perPageNum}"> <input type="hidden"
					id="searchType" name="searchType" value="${scri.searchType}">
				<input type="hidden" id="keyword" name="keyword"
					value="${scri.keyword}">
			</form>

			<div class="form-group">
				<label for="userId" class="col-sm-2 control-label">작성자</label> <input
					type="text" id="userId" name="userId" class="form-control"
					value="${read.userId}" readonly="readonly" />
			</div>
			
			<div class="form-group">
				<label for="bRegDate" class="col-sm-2 control-label">작성날짜</label>
				<fmt:formatDate value="${read.bRegDate}" pattern="yyyy-MM-dd" />
			</div>
			
			<div class="form-group">
				<label for="title" class="col-sm-2 control-label">제목</label> <input
					type="text" id="title" name="title" class="form-control"
					value="${read.title}" readonly="readonly" />
			</div>
			<div class="form-group">
				<label for="content" class="col-sm-2 control-label">내용</label>
				<textarea id="content" name="content" class="form-control"
					readonly="readonly"><c:out value="${read.content}" /></textarea>
			</div>
			
			<div id="crudbutton" class="text-right" style="padding-top: 30px;">
				<c:if test="${sessionScope.userId == read.userId || isAdmin == 1}">
						<button type="button" class="update_btn btn btn-warning">수정</button>
						<button type="button" class="delete_btn btn btn-danger">삭제</button>
				</c:if>
				
				<button type="button" class="list_btn btn btn-primary">목록</button>
			</div>

			<!-- 댓글 -->

			<div id="reply">
				    <p style="margin-left: 10px; font-size: 25px;">댓글</p>
				    <hr style="margin-bottom: 10px; padding:0; border-top: 1px solid #818181;">
					<c:forEach items="${replyList}" var="replyList">
						<li>
							<p class="replyContent">
								작성자 : ${replyList.userId} &nbsp; 작성 날짜 :
								<fmt:formatDate value="${replyList.regDate}"
									pattern="yyyy-MM-dd" />
							</p>
							<hr style="margin:0; padding:0;">
							<p style="margin-left: 10px; padding-top: 20px;">${replyList.rContent}</p>
							<div>
								<c:if test="${sessionScope.userId == replyList.userId}">
									<button type="button" class="replyUpdateBtn btn btn-warning"
										data-rno="${replyList.rno}">수정</button>
									<button type="button" class="replyDeleteBtn btn btn-danger"
										data-rno="${replyList.rno}">삭제</button>
								</c:if>
							</div>
						</li>
					</c:forEach>
				</ol>
			</div>

			<form name="replyForm" method="post" class="form-horizontal">
				<input type="hidden" id="bno" name="bno" value="${read.bno}" /> <input
					type="hidden" id="page" name="page" value="${scri.page}"> <input
					type="hidden" id="perPageNum" name="perPageNum"
					value="${scri.perPageNum}"> <input type="hidden"
					id="searchType" name="searchType" value="${scri.searchType}">
				<input type="hidden" id="keyword" name="keyword"
					value="${scri.keyword}">

				
				<c:if test="${sessionScope.userId != null}">
						<div class="form-group">
					<div class="col-sm-12">
						<input type="text" id="rContent" name="rContent" class="form-control" style="min-width: 300px; padding-left: 10px; box-sizing: border-box;" placeholder="댓글을 남겨보세요">
					</div>
				</div>

				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10 text-right">
						<button type="button" class="replyWriteBtn btn btn-success">등록</button>
					</div>
				</div>
				</c:if>
				
				
			</form>
		</section>
		<hr />
	</div>
</body>
<%@ include file="../include/footer.jsp"%>