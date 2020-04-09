<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>userPasswdCheck</title>
</head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<style>
label {
	color: #745d46;
}
.jumbotron {
			border: solid 10px #745d46; 
			background-color : #fffff8;
		}
</style>
<body>
<br><p>			<br>		<p>	<br>		
<div align="center" >
	<div class="col-lg-5 jumbotron w3-panel w3-round-xlarge" >
		<br><p>			<br>	<br>		<p>	
		<h4 align="center">개인정보를 안전하게 보호하기 위하여<br> '도토리 마켓' 아이디의 비밀번호를 한번 더 입력해주세요.</h4>
	<div align="center">
	<br><p><br>
	<form method="post" action="userPasswdCheckPro">
		<label>	
			<input class="w3-input" type="password" name="userpasswd" placeholder="Password" size="30" />
		</label>
			<input type="submit" class="w3-button w3-round-large" value="확인" style="background-color: #f0e68c;" />
	</form>
	<br>	<br>		<p>	
</div>
</div>
</div>
</body>
</html>