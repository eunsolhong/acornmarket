<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<title>Insert title here</title>
</head>
<style>
body {
	padding-top: 70px;
	padding-bottom: 30px;
}
</style>
<body>
	<c:if test="${check eq '1'}">
		<meta http-equiv="Refresh" content="0;url=CScenterNotice?page=${page} ">
	</c:if>
	
	<c:if test="${check eq '0'}">
	<script type="text/javascript">
		alert("비밀번호가 맞지 않습니다");
		history.go(-1);
	</script>
	</c:if>
</body>
</html>