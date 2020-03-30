<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>컨텐츠</title>
</head>

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/content.css" />

<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>

<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<body>


	<!-- 카테고리창 -->
	<div class="container">
		<div class="row">
			<div class="col-sm-3">
				<!-- Category -->
				<div class="single category">
					<h3 class="side-title">카테고리</h3>
					<ul class="list-unstyled">
						<li><a href="${pageContext.request.contextPath}/board/categoryForm?category=디지털/가전" title="">디지털/가전</a></li>
						<li><a href="" title="">가구/인테리어</a></li>
						<li><a href="" title="">여성패션/잡화 </a></li>
						<li><a href="" title="">남성패션/잡화 </a></li>
						<li><a href="" title="">뷰티/미용</a></li>
						<li><a href="" title="">반려동물용품</a></li>
						<li><a href="" title="">기타중고물품</a></li>
					</ul>
				</div>
			</div>

			<!--글내용-->
			<div class="col-sm-8 img-thumbnail">
				<div id="feedback">
					<div class="container">
						<div class="col-md-5">
							<div class="form-area">
								<form role="form">
									<br style="clear: both">
									<h3 style="margin-bottom: 25px; text-align: center;">${article.subject} 글제목</h3>
									
									<div class="form-group">
										<input type="text" class="form-control" id="boardnum" name="boardnum" value="${article.boardnum} 글번호" readonly
											name="boardnum" >
									</div>
									
									<div class="form-group">
										<input type="text" class="form-control" id="regdate" name="regdate" value="${article.regdate} 작성일" readonly
											name="regdate" >
									</div>
									
										
									<div class="form-group">
										<input type="text" class="form-control" id="readcount" name="readcount" value="${article.readcount} 조회수" readonly
											name="readcount" >
									</div>

									<div class="form-group">
										<input type="text" class="form-control" id="filename" name="filename" value="${article.filename} 상품사진" readonly
											name="filename" >
									</div>

									<div class="form-group">
										<input type="text" class="form-control" id="category"
											name="category" value="${article.category} 카테고리" readonly >
									</div>
									
									<div class="form-group">
										<input type="text" class="form-control" id="price"
											name="price" value="${article.price} 가격" readonly>
									</div>										
									
									<div class="form-group">
										<input type="text" class="form-control" id="userid"
											name="userid" value="${article.userid} 사용자 + 온도" readonly>
									</div>
									
									<div class="form-group">
										<input type="text" class="form-control" id="address"
											name="address" value="${article.address} 주소" readonly>
									</div>

									<div class="form-group">
										<textarea class="form-control" type="textarea" id="content"
											name="content" maxlength="300" rows="20" readonly>${article.content} 글내용</textarea>
									</div>

										<div class=button style="margin-left: 33%;">
										<input type="button" value="글수정"
											onclick="location.href='${pageContext.request.contextPath}/board/modify'">&nbsp;&nbsp;
											<input type="button" value="글삭제"
											onclick="location.href='${pageContext.request.contextPath}/board/delete'">&nbsp;&nbsp;
											<input type="button" value="채팅하기">&nbsp;&nbsp;
											<input type="button" value="글목록"
											onclick="location.href='${pageContext.request.contextPath}/board/list'">
											<p></p>
								</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>