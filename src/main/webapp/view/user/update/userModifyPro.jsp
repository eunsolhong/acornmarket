<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>user ModifyForm</title>
</head>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<body>


			<div>${user.userid }</div>
			<div><input type="password" value="${user.userpasswd }" size="30"/></div>
			<div><input type="text" value="${user.useremail }" size="30"/></div>
			<div><input type="text" value="${user.username }" size="30"/></div>
			<div><input type="text" value="${user.useraddress }" size="30"/></div>
			<div><input type="text" value="${user.userphone }" size="30"/></div>
			
			<br>
			<input type="button" class="w3-button w3-round-large" value="수정취소" style="background-color: #f0e68c;" onclick="location='myPage'" />
	
</body>
</html>