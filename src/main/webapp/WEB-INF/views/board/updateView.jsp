<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jsp" %>
	<head>
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="<c:url value="resources/css/bootstrap.css"/>">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="<c:url value="resources/css/bootstrap-theme.css"/>">
	 	
		<script src="<c:url value="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js" />" ></script>
		<script src="<c:url value="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js" />" ></script>
	

		<!-- SmartEditor2 라이브러리 --> 
		<script src="<c:url value="/resources/editor1/js/HuskyEZCreator.js"/>" ></script>	 	
	 	<title>게시판 수정 페이지</title>
	<style>
		.chk {
		    font-size: 16px;		
			background-color: #eee;
    		opacity: 1;	
		}
		h1 {
			text-align:center;
		}
		
		#boardupdateform {
			font-size: 30px;
		}
		.control-label {	
			font-size: 25px;	
		}
	</style>
	</head>
	
	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='updateForm']");
			
			$(".cancel_btn").on("click", function(){
				event.preventDefault();
				location.href = "list.do?bno=${update.bno}"
					   + "&page=${scri.page}"
					   + "&perPageNum=${scri.perPageNum}"
					   + "&searchType=${scri.searchType}"
					   + "&keyword=${scri.keyword}";
			})
			
			$(".update_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "update.do");
				formObj.attr("method", "post");
				formObj.submit();
			})
		})
			
		function fn_valiChk(){
			var updateForm = $("form[name='updateForm'] .chk").length;
			for(var i = 0; i<updateForm; i++){
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
					alert($(".chk").eq(i).attr("title"));
					return true;
				}
			}
		}
		
		//smarteditor
		var oEditors = [];
		$(function(){
		      nhn.husky.EZCreator.createInIFrame({
		          oAppRef: oEditors,
		          elPlaceHolder: "ir1", //textarea에서 지정한 id와 일치해야 합니다. 
		          //SmartEditor2Skin.html 파일이 존재하는 경로
		          sSkinURI: "<c:url value="/resources/editor1/SmartEditor2Skin.html" />",  
		          htParams : {
		              // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
		              bUseToolbar : true,             
		              // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
		              bUseVerticalResizer : true,     
		              // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
		              bUseModeChanger : true,         
		              fOnBeforeUnload : function(){
		                   
		              }
		          }, 
		
		          fCreator: "createSEditor2"
		      });
		      
		      //저장버튼 클릭시 form 전송
		      $("#save").click(function(){
		          oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
		          $("#frm").submit();
		      });    
		});

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
			 	<h1 class="text-left">글 수정</h1>	
				<hr style="border-top: 1px solid #818181;"/>
				<form name="updateForm" role="form" method="post" action="update.do">
					<input type="hidden" name="bno" value="${update.bno}" readonly="readonly"/>
					<input type="hidden" id="page" name="page" value="${scri.page}"> 
					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
					<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
					<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
					<div class="form-group">	
					<label for="title" class="col-sm-2 control-label" style="margin: 20px 0 10px 0;">제목</label>	
						<input type="text" id="title" class="form-control" name="title" value="${update.title}" class="chk" title="제목을 입력하세요." 	
						style="padding: 6px 16px; box-sizing: border-box;"/>	
					</div>	
					<div class="form-group">	
						<label for="content" class="col-sm-2 control-label">내용</label>	
						<textarea id="content" name="content" class="chk form-control" title="내용을 입력하세요." style="min-width: 300px; min-height: 350px;">	
						<c:out value="${update.content}" /></textarea>	
					</div>	
					<div class="form-group">	
						<label for="userId" class="col-sm-2 control-label">작성자</label>	
						<input type="text" id="userId" name="userId" class="chk form-control" value="${update.userId}" readonly="readonly" style="padding: 6px 16px; box-sizing: border-box;"/>	
					</div>	
					<div class="form-group">	
						<label for="bRegDate" class="col-sm-2 control-label">작성날짜</label>	
						<fmt:formatDate value="${update.bRegDate}" pattern="yyyy-MM-dd"/>		
					</div>	
					<div style="display:inline-block; float:right;">			
						<button type="submit" id="save" class="update_btn btn btn-success">수정</button>
						<input type="reset" class="btn btn-danger" value="취소">
						<a class="list_btn btn btn-primary" href="list.do">목록</a></li>		
					</div>
				</form>
			</section>
			<hr />
		</div>
	</body>
<%@ include file="../include/footer.jsp" %>