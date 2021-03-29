<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<title>회원정보 수정 페이지</title>
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
<body>
<form action="/views/joinupd" method="post">
	<h3>회원정보 수정</h3>
		<div class="jumbotron" style="width:500px; margin-top:30px; margin-left: 430px; border-radius: 30px; border: 2.5px dotted;">
				<div class="form">
				<label for="name">이름 <input class="form-control" type="text" id="user_name" placeholder="이름을 입력하세요"/></label><br>
				<label for="id">아이디 <input class="form-control" type="text" id="user_id" disabled placeholder="nalala" /></label><br>
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

				<button class="btn">수정하기</button>
			</div>
	
		</div>
		</form>
</body>
</html>