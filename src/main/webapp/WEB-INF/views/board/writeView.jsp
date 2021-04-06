<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
	<head>
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="<c:url value="resources/css/bootstrap.css"/>">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="<c:url value="resources/css/bootstrap-theme.css"/>">
	 	
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 	
	 	<title>게시판 글 작성 페이지</title>
	<style>
		.chk {
			background-color: #eee;
    		opacity: 1;
		}
		body {
			text-align:center;
		}
		#content.chk {
			margin: 0px -28px 0px 0px; height: 350px; width: 1165px;
		}
		#container {
  			display: flex;
 			justify-content: center;
		}
		#boardwriteform {
			font-size: 30px;
		}
	
	</style>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='writeForm']");
			$(".write_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "write.do");
				formObj.attr("method", "post");
				formObj.submit();
			});
		})
		function fn_valiChk(){
			var regForm = $("form[name='writeForm'] .chk").length;
			for(var i = 0; i<regForm; i++){
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
					alert($(".chk").eq(i).attr("title"));
					return true;
				}
			}
		}
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
		<h1>게시판 글 작성 페이지</h1>
		
	 	<hr/>
	 	
	 	<div>
			<%@include file="nav.jsp" %>
		</div>
		
		<hr>
	
		<div id="root">
			<section id="container">
				<form name="writeForm" method="post" action="write.do">
					<table>
						<tbody id="boardwriteform">
							<tr>
								<td>
									<label for="title">제목 : </label><input type="text" id="title" name="title" class="chk" title="제목을 입력하세요." placeholder="제목을 입력해 주세요"/>
								</td>
							</tr>	
							<tr>
								<td>
									<label for="content">내용 : </label><textarea id="content" name="content" class="chk" title="내용을 입력하세요." placeholder="내용을 입력해 주세요"></textarea>
								</td>
							</tr>
							<tr>
								<td>						
									<button class="write_btn" type="submit">작성</button>	
								</td>
							</tr>			
						</tbody>			
					</table>
				</form>
			</section>
			<hr />
		</div>
	</body>
<%@ include file="../include/footer.jsp" %>