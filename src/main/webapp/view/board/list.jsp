<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<title>리스트입니다</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/list.css" />
</head>

<body>
	<script
		src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>




	<!-- 카테고리창 -->
	<div class="container">
		<div class="row">
			<div class="col-sm-3">
				<!-- Category -->
				<div class="single category">
					<h3 class="side-title">카테고리</h3>
					<ul class="list-unstyled">
						<li><a
							href="${pageContext.request.contextPath}/board/categoryForm?category=디지털/가전"
							title="">디지털/가전</a></li>
						<li><a
							href="${pageContext.request.contextPath}/board/categoryForm?category=가구/인테리어"
							title="">가구/인테리어</a></li>
						<li><a
							href="${pageContext.request.contextPath}/board/categoryForm?category=여성패션/잡화"
							title="">여성패션/잡화 </a></li>
						<li><a
							href="${pageContext.request.contextPath}/board/categoryForm?category=남성패션/잡화"
							title="">남성패션/잡화 </a></li>
						<li><a
							href="${pageContext.request.contextPath}/board/categoryForm?category=뷰티/미용"
							title="">뷰티/미용</a></li>
						<li><a
							href="${pageContext.request.contextPath}/board/categoryForm?category=반려동물용품"
							title="">반려동물용품</a></li>
						<li><a
							href="${pageContext.request.contextPath}/board/categoryForm?category=기타중고물품"
							title="">기타중고물품</a></li>
					</ul>
				</div>
			</div>

			<!-- 캐러셀 -->
			<div class="col-sm-9 ">
				<div id="demo" class="carousel slide" data-ride="carousel">
					<ul class="carousel-indicators">
						<li data-target="#demo" data-slide-to="0" class="active"></li>
						<li data-target="#demo" data-slide-to="1"></li>
						<li data-target="#demo" data-slide-to="2"></li>
					</ul>
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="${pageContext.request.contextPath}/img/list/purple.png"
								alt="purple" width="800" height="300">
							<div class="carousel-caption"></div>
						</div>
						<div class="carousel-item">
							<img src="${pageContext.request.contextPath}/img/list/event.png"
								alt="event" width="800" height="300">
							<div class="carousel-caption"></div>
						</div>
						<div class="carousel-item">
							<img src="${pageContext.request.contextPath}/img/list/ebichu.png"
								alt="ebichu" width="800" height="300">
							<div class="carousel-caption"></div>
						</div>
					</div>
					<a class="carousel-control-prev" href="#demo" data-slide="prev">
						<span class="carousel-control-prev-icon"></span>
					</a> <a class="carousel-control-next" href="#demo" data-slide="next">
						<span class="carousel-control-next-icon"></span>
					</a>
				</div>

				<br> <br>
				<!-- 리스트  -->
				<h3 class="h3" style="text-align: center;">오늘의 중고거래</h3>
				<br>

				<!-- 게시글이 없습니다추가해주기 -->


				<div class="row">

					<!-- 리스트뿌려주는곳 -->
					<c:forEach items="${li}" var="list">
						<div class="col-md-4 col-sm-6">
							<div class="product-grid8">
								<div class="product-image8">
									<a href=""> <img class="pic-1"
										src="${pageContext.request.contextPath}/uploadFile/${list.filename}">
										<img class="pic-2"
										src="${pageContext.request.contextPath}/uploadFile/${list.filename}">
									</a>
									<ul class="social">
										<li><a href="" class="fa fa-heart"
											style="text-decoration: none"></a></li>
									</ul>
								</div>
								<div class="product-content">
									<div class="price">${list.subject}</div>
									<span class="product-shipping">${list.price}원</span>
								</div>
							</div>
						</div>
					</c:forEach>

				</div>
			</div>
		</div>
	</div>

</body>
</html>
