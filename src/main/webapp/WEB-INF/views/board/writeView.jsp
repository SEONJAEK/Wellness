<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.css"/>">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap-theme.css"/>">
	 	<!-- ajax 
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
		<!--선재 ajax -->
		<script src="<c:url value="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js" />" ></script>
		<script src="<c:url value="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js" />" ></script>
	

		<!-- SmartEditor2 라이브러리 --> 
		<script src="<c:url value="/resources/editor1/js/HuskyEZCreator.js"/>" ></script>

		<title>Q &amp; A</title>

	<style>
			@media (min-width: 1200px)
		.container {
		    width: 1172px;
		}

	
		.chk {
			background-color: #eee;
    		opacity: 1;
    		font-size: 16px;	
		}
		body {	
			text-align:center;	
		}
		/*#content.chk {	
			margin: 0px -28px 0px 0px; height: 350px; width: 1165px;
		
		}
		
		#boardwriteform {
			font-size: 30px;
		}
		}*/	
		.control-label {	
		font-size: 25px;	
		}
	
	</style>
	

	<!-- 각 페이지 내비 -->
	<main class="main">
		<section class="main-top">
	<h2 class="main-title">관리자메뉴</h2>
	
	
	</section>
	</main>
	
		
	
		<div id="root">
			<section class="container">
				<h1 class="text-left">글 작성</h1>	
			 	<hr style="border-top: 1px solid #818181;"/>	
				<form id="frm" name="writeForm" method="post" action="write.do">
			<table>
				<tbody id="boardwriteform">
					<div class="form-group">
						<label for="title" class="col-sm-2 control-label"
							style="margin: 20px 0 10px 0; width: auto;">제목</label> 
						<input type="text" id="title" class="form-control" name="title"
							value="${update.title}" class="chk" title="제목을 입력해주세요"
							placeholder="제목을 입력해주세요" style="padding: 6px 16px; box-sizing: border-box;" />
					</div>
					
					<div class="form-group">
					<label for="content"class="col-sm-2 control-label" style="margin: 20px 0 10px 0; width: auto;">내용</label>
					<textarea id="ir1" name="content" class="chk form-control" title="내용을 입력해주세요" 	
						placeholder="내용을 입력해주세요" style="min-width: 300px; min-height: 350px;"></textarea>
					</div>
					
					<div class="form-group">
						<label for="userId" class="col-sm-2 control-label"
							style="margin: 20px 0 10px 0; width: auto;">작성자</label>
							 
						<input type="text" id="userId" name="userId" class="chk form-control" value="${sessionScope.userId}"
							title="작성자를 입력해주세요" placeholder="작성자를 입력해주세요"
							style="padding: 6px 16px; box-sizing: border-box;" />
					</div>
					
					<div style="display:inline-block; float:right;">
					<button id="save" class="write_btn btn btn-success" type="submit">작성</button>
					<input type="reset" class="btn btn-danger" value="취소">		
					<a  class="list_btn btn btn-primary" href="list.do">목록</a></li>
						<hr/>
					</div>
				</tbody>
			</table>
		
	
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
<%@ include file="../include/footer.jsp" %>