<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jsp" %>
	<head>
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="<c:url value="resources/css/bootstrap.css"/>">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="<c:url value="resources/css/bootstrap-theme.css"/>">css">
	 	
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 	
	 	<title>댓글 수정 페이지</title>
	 	<style>
			body {
			font-size: 25px;
			text-align: center;
		}
			.container {
			min-height: 1000px;
		}
			.chk {
			font-size: 16px;	
		}
		</style>
	</head>
	
	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='updateForm']");
			
			$(".cancel_btn").on("click", function(){
				location.href = "readView.do?bno=${replyUpdate.bno}"
					   + "&page=${scri.page}"
					   + "&perPageNum=${scri.perPageNum}"
					   + "&searchType=${scri.searchType}"
					   + "&keyword=${scri.keyword}";
			})
			
		})
		
	</script>
	<!-- 각 페이지 내비 -->
	<main class="main">
		<section class="main-top">
	<h2 class="main-title">관리자메뉴</h2>
	<!-- <div class="main-nav">
		<a href="graph.do">Graph</a> 
		<a href="member_admin.do">회원관리</a>
		<a href="reservation_admin.do">예약관리</a>
	</div> -->
	
	</section>
	</main>
	<body>
	
		<div id="root">
			
			
			
			<section class="container">
				<h1 class="text-left">댓글 수정</h1>
			 	<hr style="border-top: 1px solid #818181;"/>
				<form name="updateForm" role="form" method="post" action="replyUpdate.do">
					<input type="hidden" name="bno" value="${replyUpdate.bno}" readonly="readonly"/>
					<input type="hidden" id="rno" name="rno" value="${replyUpdate.rno}" />
					<input type="hidden" id="page" name="page" value="${scri.page}"> 
					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
					<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
					<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
					
					<div class="form-group">
						<label for="content" class="col-xs-1 control-label" >내용</label>
						<textarea id="content" name="content" class="chk form-control" style="min-width: 300px; min-height: 350px;">
						<c:out value="${replyUpdate.rContent}"/></textarea>
					</div>

					<!-- <table>
						<tbody>
							<tr>
								<td>
									<label for="rContent">댓글 내용</label><input type="text" id="rContent" name="rContent" value="${replyUpdate.rContent}"/>
								</td>
							</tr>	
							
						</tbody>			
					</table>  -->
					<div style="display:inline-block; float:right;">
						<button type="submit" class="update_btn btn btn-success">저장</button>
						<input type="reset" class="btn btn-danger" value="취소">
						<a  class="list_btn btn btn-primary" href="list.do">목록</a></li>	
					</div>
					<!--  <div>
						<button type="submit" class="update_btn">저장</button>
						<button type="button" class="cancel_btn">취소</button>
					</div> -->
				</form>
			</section>
			<hr />
		</div>
	</body>
<%@ include file="../include/footer.jsp" %>