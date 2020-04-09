<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>deleteForm</title>
</head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<style>
label {
	color: #745d46;
}

.jumbotron {
	border: solid 10px #745d46;
	background-color: #fffff8;
}
</style>
<body>
	<br>
	<p>
		<br>
	<p>
		<br>
	<div align="center">
		<div class="col-lg-5 jumbotron w3-panel w3-round-xlarge">
			<br>
			<p>
				<br> <br>
			<p>
			<h4 align="center">
				안전한 게시글 삭제를 위해<br> 게시글 비밀번호를 한번 더 입력해주세요!

			</h4>
			<div align="center">
				<br>
				<p>
					<br>
				<form method="post" action="deletePro">
					<label> <input class="w3-input" type="password"
						name="passwd" placeholder="비밀번호 입력" size="30" /> <input
						type="hidden" name="num" value="${num}">
					</label> <input type="submit" class="w3-button w3-round-large" value="확인"
						style="background-color: #f0e68c;" />
				</form>
				<br> <br>
				<p>
			</div>
		</div>
	</div>
</body>

</html>