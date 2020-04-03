<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script
	src="${pageContext.request.contextPath}/js/sweetalert/sweetalert.js"></script>
<body>
<body>

	<script>
   
   if(${check == 1}){
      alert("게시글이 삭제되었습니다.");   
      location.href="${pageContext.request.contextPath}/board/list";
      
     /*  /board/categoryForm?category=${article.category} */
      
   }else if(${check != 1}){
      alert("비밀번호가 맞지 않습니다\n다시 입력해주세요.");
      history.go(-1);
   };
   
   </script>
</body>
</html>