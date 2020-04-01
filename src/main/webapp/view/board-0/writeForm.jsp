<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품글쓰기</title>
</head>

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/writeForm.css" />

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
						<li><a
							href="${pageContext.request.contextPath}/board/categoryForm"
							title="">디지털/가전</a></li>
						<li><a href="" title="">가구/인테리어</a></li>
						<li><a href="" title="">여성패션/잡화 </a></li>
						<li><a href="" title="">남성패션/잡화 </a></li>
						<li><a href="" title="">뷰티/미용</a></li>
						<li><a href="" title="">반려동물용품</a></li>
						<li><a href="" title="">기타중고물품</a></li>
					</ul>
				</div>
			</div>

			<!--글쓰기 -->
			<div class="col-sm-8 img-thumbnail">
				<div id="feedback">
					<div class="container">
						<div class="col-md-5">
							<div class="form-area">
								<form method="post"
									action="${pageContext.request.contextPath}/board/writePro">
									<br style="clear: both">
									<h3 style="margin-bottom: 25px; text-align: center;">상품거래
										글쓰기폼 + 지도API어떻게</h3>
									<div class="form-group">
									<input type="hidden" name="readcount" value="${article.readcount}">
										<input type="text" class="form-control" id="subject" name="subject"
											placeholder="글 제목" required>
									</div>

									<div class="form-group">
										<select class="form-control" id="category" name="category">
											<option>카테고리 선택</option>
											<option>디지털/가전</option>
											<option>가구/인테리어</option>
											<option>여성패션/잡화</option>
											<option>남성패션/잡화</option>
											<option>뷰티/미용</option>
											<option>반려동물/용품</option>
											<option>기타중고물품</option>
										</select>

									</div>
									<div class="form-group">
										<input type="text" class="form-control" id="address"
											name="address" placeholder="₩ 가격 입력 (선택사항)" required>
									</div>

									<div class="form-group">
										<input type="file" class="form-control-file border"
											name="filename">
									</div>

									<div class="form-group">
										<textarea class="form-control" type="textarea" id="content" name="content"
											placeholder="올릴 게시글 내용을 작성해주세요 (가품 및 판매금지품목은 게시가 제한될 수 있어요.)"
											maxlength="300" rows="20"></textarea>
									</div>

									<input type="submit" id="submit" name="submit"
										class="btn btn-warning pull-right" value="등록">

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