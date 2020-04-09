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
	<div class="container" role="main">

		<h2>CScenter Form</h2>

		
		
		
		
		
		
		
		
		<form name="deleteform" id="form" role="form" method="post" action="${pageContext.request.contextPath}/CScenter/CScenter_delete?num=${num}&page=${page}">

			<div class="mb-3">
				<br> <label>비밀번호 확인</label> <input type="text" class="form-control" name="passwd" placeholder="비밀번호를 입력하세요">
			</div>

			<button type="submit" class="btn btn-sm btn-light">삭제</button>
			<button type="button" class="btn btn-sm btn-light">
				<a href="${pageContext.request.contextPath}/CScenter/CScenterNotice?page=${page}" style="color: black; text-decoration: none;">목록</a>
			</button>

		</form>
	</div>
</body>
</html>