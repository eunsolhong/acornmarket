<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Join</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${pageContext.request.contextPath}/js/sweetalert/sweetalert.js"></script>
</head>
<script>

	//아이디 중복 여부를 판단
	function openidCheck(user) {
		$.ajax({
			url:"/user/idCheckTest",
			type:"post",
			
		})
		
		
		
		
		
		
		//아이디를 입력했는지 검사
		if (user.userId.value == "") { //id를 입력하지않은 빈칸일 경우
			swal("ID를 입력하세요.");
			return;
		}
		//URL과 사용자 입력 ID를 조합합니다.
		url = "idCheck?userId=" + user.userId.value; //idCheck.jsp의 id값을 form에 입력한 값으로 저장

		//새로운 윈도우(창)을 엽니다.
		open(
				url,
				"idCheck",
				"toolbar = no, location=no, status=no, scrollbars=no, resizable=no, width=330, height=350");
	}
</script>

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
	<div align="center">
		<div class="col-lg-4 jumbotron w3-panel w3-round-xlarge"  style="width:70%;">
			<form name="user" autocomplete="off">
				<table style="color: white;">
					<tr>
						<td width="100%">
							<label>ID</label> <br>
							<label><input class="w3-input w3-round w3-border" size="35" type="text" name="userid" id="userId"></label>
							<input type="button" class="w3-button w3-round-large w3-middle" style="background-color: #f0e68c; color:#745d46;" name="confirm_id" value="ID중복 확인" onclick="openidCheck(this.form)">
						</td>
					</tr>
					<tr><td> <div id="userIdCheck"></div></td></tr>
					<tr>
						<td>
							<label class="w3-margin-right">Password</label> 
							<input class="w3-input w3-round w3-border" size="22" type="password" name="userpasswd" id="userPasswd">
						</td>
					</tr>
				</table>
			
					<input class="w3-button w3-round-large w3-margin-right" style="background-color: #f0e68c; width: 100px;" type="submit" value="join"/> 
					
			</form>
		</div>
	</div>
</body>
</html>