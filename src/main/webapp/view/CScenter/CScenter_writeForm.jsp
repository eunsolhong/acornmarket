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

		<form name="writeform" id="form" role="form" method="post" >

			<input type="hidden" name="readCount" value="0"> <input type="hidden" name="passwd" value="admin">

			<div class="mb-3">
				<br> <label for="subject">제목</label> <input type="text" class="form-control" name="subject" placeholder="제목을 입력해 주세요">
			</div>

			<div class="mb-3">
				<label for="adminId">작성자</label> <input type="text" class="form-control" name="adminId" id="reg_id" placeholder="이름을 입력해 주세요">
			</div>

			<div class="mb-3">
				<label for="category">분류</label>
				<select name="category">
					<c:if test="${type eq 'n' }">
						<option value="notice">공지사항</option>
					</c:if>
					<c:if test="${type eq 'f' }">
						<option value="faq1">FAQ회원관련</option>
						<option value="faq2">FAQ기타</option>
					</c:if>
				</select>
			</div>

			<div class="mb-3">
				<label for="content">내용</label>
				<textarea class="form-control" rows="10" name="content" id="content" placeholder="내용을 입력해 주세요"></textarea>
			</div>
			<c:if test="${type eq 'n' }">
				<button onclick=mySubmit(1) class="btn btn-sm btn-light">미리보기</button>
				<button type="button" class="btn btn-sm btn-light">
					<a href="${pageContext.request.contextPath}/CScenter/CScenterNotice?page=${page}" style="color: black; text-decoration: none;">목록</a>
				</button>
			</c:if>
			<c:if test="${type eq 'f' }">
				<button onclick=mySubmit(2) class="btn btn-sm btn-light">저장</button>
				<button type="button" class="btn btn-sm btn-light">
					<a href="${pageContext.request.contextPath}/CScenter/CScenterFAQ" style="color: black; text-decoration: none;">목록</a>
				</button>
			</c:if>
		</form>
	</div>
</body>
<script>
	function mySubmit(index) {

		if (index == 1) {

			document.writeform.action = '${pageContext.request.contextPath}/CScenter/CScenter_preContent?type=write&page=${page}';

		}
		if (index == 2) {

			document.writeform.action = '${pageContext.request.contextPath}/CScenter/CScenter_write?type=${type}';

		}
		document.form.submit();

	}
</script>
</html>