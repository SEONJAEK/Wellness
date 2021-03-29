<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script src="/resources/js/addressapi.js"></script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<title>회원가입 페이지</title>
		
		<style>
		h3{
		text-align: center;
		}
		.form{
		padding-left: 50px;
		}
		.form-control{
		border-radius: 10px;
		width: 400px;
		}
		.btn{
		background-color: black;
		color: white;
		width: 400px;
		}
		
		</style>
	</head>
	<script type="text/javascript">

	function chk()
	{
	    var fm  = document.my;

	    for(var i=1; i<=2; i++)
	    {
	        if (!fm['enable'+i].checked)
	        {
	            alert('약관에 동의 해주셔야 회원가입이 정상적으로 이루어집니다');
	            return;
	        }
	    }

	    fm.submit();
	}

	
	

	
		$(document).ready(function(){
			
		
			$("#submit").on("click", function(){
				if($("#user_name").val()==""){
					alert("이름을 입력해주세요.");
					$("#user_name").focus();
					return false;
				}
				if($("#user_id").val()==""){
					alert("아이디를 입력해주세요.");
					$("#user_id").focus();
					return false;
				}
				if($("#user_password").val()==""){
					alert("패스워드를 입력해주세요.");
					$("#user_password").focus();
					return false;
				}
			});
			
		})
		
		 $(document).ready(function () {
    setDateBox();
  });

		
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
                
                
                document.getElementById('addr1').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('addr2').value = fullRoadAddr; 
                /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
                document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
            }
         }).open();
     }
	</script>
	<body>
	<form action="join.do" method="post">
	<h3>회원가입</h3>
		<div class="jumbotron" style="width:500px; margin-top:30px; margin-left: 430px; border-radius: 30px; border: 2.5px dotted;">
				<div class="form">
		<form action='/' method='post' name="my">

        <h4>이용약관</h4>
        <textarea name="area" style="font-size: 12px; width: 400px; height: 100px;" readonly>
    	웰니스 개인정보 처리 방침
    	웰니스는 정보통신망 이용촉진 및 정보보호 등에
    	관한 법률, 개인정보 보호법 등에 관한 법률에 근거하여
    	관련 법령상의 개인정보를 보호하고, 이와 관련한 고충을 
    	신속하고 원활하게 처리할 수 있도록 하기 위하여 다음과 같이 
    	개인정보 처리방침을 수렵합니다.
        </textarea><br>

        <input type='checkbox' name='enable' value='agree'> 
               가입 약관에 동의합니다. &nbsp
       	<input type='checkbox' name='disable' value='disagree'>
               가입 약관에 동의하지 않습니다.
     
		</form><br><br>

   
				
				<label for="name">이름 <input class="form-control" type="text" id="user_name" placeholder="이름을 입력하세요"/></label><br>
				<label for="id">아이디 <input class="form-control" type="text" id="user_id" placeholder="아이디를 입력하세요" /></label><br>
				<label for="password">패스워드 <input class="form-control" type="password" id="user_password" placeholder="비밀번호를 입력하세요" /></label><br>
				<label for="pwd_cfm">패스워드 확인 <input class="form-control" type="password" id="user_pwd_cfm" placeholder="비밀번호를 다시 입력하세요" /></label><br>
				<label for="birth">생년월일<input class="form-control" type="text" id="user_birth" placeholder="년도(4글자)" style="width: 100px; display: inline;">
				<select>
				<option>월</option>
				<option>1</option>
				<option>2</option>
				<option>3</option>
				<option>4</option>
				<option>5</option>
				<option>6</option>
				<option>7</option>
				<option>8</option>
				<option>9</option>
				<option>10</option>
				<option>11</option>
				<option>12</option>
				</select>
				<input class="form-control" type="text" id="user_birth" placeholder="일" style="width: 50px; display: inline;">
				</label><br>
				<label for="email">이메일 <input class="form-control" type="email" id="user_email" placeholder="이메일을 입력하세요"/></label><br>
				<label for="phone">연락처 <input class="form-control" type="text" id="user_phone" placeholder="휴대전화 번호를 입력하세요"/></label><br>
				<label for="gender">성별
				<select>
				<option>선택</option>
				<option>남자</option>
				<option>여자</option>
				</select>
				</label><br><br>
			
				<div class="form-group">
					<label for="address">주소</label><br>
					<input class="form-control" style="width: 40%; display: inline;"
						placeholder="우편번호" name="addr1" id="addr1" type="text"
						readonly="readonly">
					<button type="button" class="btn btn-default"
						onclick="execPostCode();">
						<i class="fa fa-search"></i> 우편번호 찾기
					</button>
				</div>
				<div class="form-group">
					<input class="form-control" style="top: 5px;" placeholder="도로명 주소"
						name="addr2" id="addr2" type="text" readonly="readonly" />
				</div>
				<div class="form-group">
					<input class="form-control" placeholder="상세주소" name="addr3"
						id="addr3" type="text" />
				</div>

				<button class="btn">가입하기</button>
			</div>
	
		</div>
		</form>
	</body>
</html>