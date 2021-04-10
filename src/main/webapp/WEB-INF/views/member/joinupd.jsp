<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<%@ include file="../include/header.jsp" %>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function execPostCode() {
    new daum.Postcode({
        oncomplete: function(data) {
           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
           // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
           var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
           var extraRoadAddr = ''; // 도로명 조합형 주소 변수
           // 법정동명이 있을 경우 추가한다. (법정리는 제외)
           // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
           if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
               extraRoadAddr += data.bname;
           }
           // 건물명이 있고, 공동주택일 경우 추가한다.
           if(data.buildingName !== '' && data.apartment === 'Y'){
              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
           }
           // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
           if(extraRoadAddr !== ''){
               extraRoadAddr = ' (' + extraRoadAddr + ')';
           }
           // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
           if(fullRoadAddr !== ''){
               fullRoadAddr += extraRoadAddr;
           }
           // 우편번호와 주소 정보를 해당 필드에 넣는다.
           console.log(data.zonecode);
           console.log(fullRoadAddr);
           
           
           $("[name=mem_oaddress]").val(data.zonecode);
           $("[name=mem_address]").val(fullRoadAddr);
           
           document.getElementById('mem_oaddress').value = data.zonecode; //5자리 새우편번호 사용
           document.getElementById('mem_address').value = fullRoadAddr;
//            document.getElementById('mem_detailaddress').value = data.jibunAddress;
       }
    }).open();
}
</script>


<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- 유효성검사 코드 -->
<script type="text/javascript">
$(document).ready(function(){
	var uidReg = /^[A-Za-z0-9]{5,18}$/;
	var upwReg = /^[A-Za-z0-9]{6,18}$/;
  	var unameReg = /^[가-힣]{2,5}$/;
  	
  	//아이디 blur
	$("#userid").blur(function(){
		if(uidReg.test($('#userid').val())){
			$("#id_check").text('');
		} else{
			$("#id_check").text('5자이상 18자이하 영문자, 숫자를 섞어서 입력하시오');
			$("#id_check").css('color','gray');
		}
	})
	//비밀번호 blur
	$('#userpw').blur(function(){
		if(upwReg.test($('#userpw').val())){
			$('#pw_check').text('');
			
		} else{
			
			$("#pw_check").text('6자-12자 소문자, 숫자를 섞어서 입력하시오');
			$("#pw_check").css('color','gray');
		}
	});
	//#userpw  #userpw_ck 일치 확인
	$('#userpw_ck').blur(function(){
		if($("#userpw").val() == '') {
			$('#pw_check2').text('비밀번호를 입력하세요');
			$('#pw_check2').css('color','gray');
			
		} else if($('#userpw').val() != $(this).val()){		
			$('#pw_check2').text('비밀번호가 일치하지 않습니다');
			$('#pw_check2').css('color','gray');
		} else {
		
			$('#pw_check2').text('비밀번호가 일치합니다');
			$('#pw_check2').css('color','gray');
		} 
	})
	//이름 blur
	$('#username').blur(function(){
		if(unameReg.test($('#username').val())){
			$('#pw_check').text('');
		
		} else{
			$("#name_check").text('2글자 이상  5글자 이하 한글로 작성하세요');
			$("#name_check").css('color','gray');
		}
	})
	
	$("#myForm").submit(function(){
						   
		   if(!uidReg.test($("#userid").val())){
				swal({
					title: "아이디를 체크하세요!",
					icon:"error"
				});
		      return false;
		   }
		   
		   
		   if(!($("#hiddenIdCheck").val()=="ok")){
				swal({
					title: "아이디 중복확인 해주세요!",
					icon:"error"
				});
			   return false;
		   }
		   if(!upwReg.test($("#userpw").val())){
				swal({
					title: "비밀번호는 6에서 18자리 소문자, 숫자!",
					icon:"error"
				});
		      return false;
		   }
		   if(!unameReg.test($("#username").val())) {
				swal({
					title: "이름한글로 2-5자!",
					icon:"error"
				});
		      return false;
		   }
		   //#userpw_ck
		   if( $("#userpw").val() != $("#userpw_ck").val() ){
				swal({
					title: "비밀번호가 달라요!",
					icon:"error"
				});
		      $("#userpw").focus();      
		      //select 이벤트발생
		      $("#userpw_ck").select();
		      return false;		   
		   }
	
		});
		
		
})
</script>




<!-- css -->
<style type="text/css">


h5{
   text-align: center;
}
.singup {
	background-color: black;
		color: white;
		width: 300px;
		height: 30px;
		margin-bottom: 30px;
}
.id_Button{
background-color: black;
		color: white;
		width: 130px;

}
.form-control{
		border-radius: 0px;
		width: 400px;
}
.jumbotron{
		font-size: 2rem; min-width:600px; min-height: 550px; margin: 0 auto; margin-top: 50px; margin-bottom: 50px; border-radius: 30px; border: 2.5px dotted; background-color: lightgray; padding-left: 30px; padding-top: 30px;
}
button[type=button], input[type=submit]{
border-radius:4px;
}
input{
margin-bottom: 10px;
}
.width90{
width: 90%;
}

</style>

<!-- 각 페이지 내비 -->
	<main class="main">
		<section class="main-top">
	<h2 class="main-title">회원정보 수정</h2>
	<!-- <div class="main-nav">
		<a href="graph.do">Graph</a> 
		<a href="member_admin.do">회원관리</a>
		<a href="reservation_admin.do">예약관리</a>
	</div> -->
	
	</section>
	</main>

<body>


<!-- 입력  -->
<h1 style="text-align:center; margin-top: 40px;">회원정보 수정</h1>

<div class="jumbotron">
  
	<form action="joinupd.do" method="post" id="myForm">
	
   		
   		<h6><label>아이디<span id="red"></span><br>
      		<input type="text" value="${update.userId}"   name="userId" id="userid" class="form-control width90" readonly="readonly" required />
      	</h6>
 
   		<h6><label>비밀번호<span id="red"></span><br>
      		<input type="password" value="${update.userPass}" placeholder="비밀번호" name="userPass" id="userpw" class="form-control width90" required /></label>
  			<div id="pw_check"></div>
  		</h6>
  
   		<h6><label>비밀번호확인<span id="red"></span><br>
      		<input type="password" value="${update.userPass}" placeholder="비밀번호확인" name="userpw_ck" id="userpw_ck" class="form-control width90" required /></label>
   			<div id="pw_check2"></div>
   		</h6>
   
   		<h6><label>이름<span id="red"></span><br>
      		<input type="text" value="${update.userName}" placeholder="이름" name="userName" id="username" class="form-control width90" required /></label>
      		<div id="name_check"></div>
      	</h6>
      
  		<h6><label>핸드폰<span id="red"></span><br>
      		<input type="tel" value="${update.phone}" placeholder="- 없이 숫자만 써주세요(숫자11자리)" name="phone" maxlength="11" id="usertel" class="form-control width90" required "/></label>
      	</h6>
  
   		<h6><label >이메일<span id="red"></span><br>
      		<input type="email" value="${update.email}" placeholder="이메일" name="email" id="useremail"  class="form-control width90" required style="display:inline-block; width: 300px"/>
      		</label>
      	</h6>
		
	<h6>주소<label><span id="red"></span>
		<div class="form-group">                   
			<input class="form-control" placeholder="우편번호" name="post_num" id="mem_oaddress" type="text" value="${update.post_num}" readonly="readonly" required style="display:inline-block; width: 100px">
    			</label>
    		<button type="button" class="id_Button" onclick="execPostCode();" style="display:inline-block;"><i class="fa fa-search"></i> 우편번호 찾기</button>                               
		</div>
	
		<div class="form-group">
    		<input type="text" class="form-control"  placeholder="도로명 주소" name="address" id="mem_address"  value="${update.address}" required style="width: 254px" readonly="readonly" />
   	 		<input type="text" class="form-control" placeholder="상세주소" name="address2" id="mem_detailaddress"  value="${update.address2}" required style="display:inline-block; width: 280px"/>
		</div>
	</h6>
	<div style="margin-top: 30px; text-align:center;">
		<input type="submit" value="수정하기" class="singup"/><br>
		</div>
   </form>
</div>
<%@ include file="../include/footer.jsp" %>
		
		