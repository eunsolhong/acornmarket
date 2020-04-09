<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>카테고리폼</title>
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


<!-- 리스트 -->
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/categoryForm.css" />
</head>

<body>
	<script
		src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

	<!-- 검색창 -->
	<nav class="nav1">
		<div class="container">
			<div class="right">
				<form class="form-inline" action="/action_page.php">
					<input class="form-control mr-sm-2" type="text"
						placeholder="도토리 찾기">
					<button class="btn btn-outline-warning" type="submit"
						style="height: 40px;">
						<i class="fa fa-search"></i>
					</button>
				</form>
			</div>
		</div>
	</nav>
	<br>

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
						<li><a href="${pageContext.request.contextPath}/board/categoryForm?category=가구/인테리어" title="">가구/인테리어</a></li>
						<li><a href="${pageContext.request.contextPath}/board/categoryForm?category=여성패션/잡화" title="">여성패션/잡화 </a></li>
						<li><a href="${pageContext.request.contextPath}/board/categoryForm?category=남성패션/잡화" title="">남성패션/잡화 </a></li>
						<li><a href="${pageContext.request.contextPath}/board/categoryForm?category=뷰티/미용" title="">뷰티/미용</a></li>
						<li><a href="${pageContext.request.contextPath}/board/categoryForm?category=반려동물용품" title="">반려동물용품</a></li>
						<li><a href="${pageContext.request.contextPath}/board/categoryForm?category=기타중고물품" title="">기타중고물품</a></li>
					</ul>
				</div>
			</div>

			<!-- 리스트  -->

			<div class="col-sm-8">

				<div class="container">
					<div class="row">
						<div class="well well2">
							
							
						 <c:if test="${userid ne null}">
							<div class="writebutton">
							<input type="submit" 
								onclick="location.href='${pageContext.request.contextPath}/board/write'"
								value="글쓰기">
								</div>
						 </c:if> 
						
							<c:if test="${userid eq null }">
							<div class="writebutton">
							<input type="submit" 
								onclick="location.href='${pageContext.request.contextPath}/user/selectJoinForm'"
								value="글쓰기">
								</div>
							
							</c:if>	  				
							
							<p></p>

							<div class="list-group">
								<c:forEach items="${li}" var="list">
									<a href="#" class="list-group-item">
										<div class="media col-md-3">
											<figure class="pull-left">
												<img class="media-object img-rounded img-responsive"
													src="${pageContext.request.contextPath}/uploadFile/${list.filename}"  alt=""></figure>
													
										</div>

										<div class="col-md-6">
											<!-- 반복문으로 돌린다 -->

											<table>
												<tr>
												<%-- 	<td width="20%">[ ${list.boardnum} ] </td> --%>
													<td> ${list.subject}</td>
												</tr>
												</table>

												<p class="list-group-item-text">${list.price} 원</p>
										</div>

										<div class="col-md-3 text-center">
											
										
										
										<c:if test="${list.soldout == 0}">
											<button type="button" class="btn btn-info btn-lg btn-block blue" 
											onclick="location.href='${pageContext.request.contextPath}/board/content?num=${list.boardnum}'">구매하기</button>
										
											
											<button type="button" class="btn btn-danger btn-lg btn-block blue" 
											onclick="location.href='${pageContext.request.contextPath}/board/content?num=${list.boardnum}'">판매중</button>
										</c:if>
										
										<c:if test="${list.soldout != 0}">
											<button type="button" class="btn btn-danger btn-lg btn-block blue" 
											onclick="location.href='${pageContext.request.contextPath}/board/content?num=${list.boardnum}'">판매완료</button>
										</c:if>
										</div>
										
									</a>
								</c:forEach>


							</div>
						</div>
					</div>
					<!-- </form> -->
				</div>
			</div>

		</div>
	</div>

	<!-- 페이징처리 -->
	<p align="center">

		<c:if test="${startPage > bottomLine}">

			<a href="list?pageNum=${startPage - bottomLine}">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<a href="list?pageNum=${i}">[${i}]</a>
		</c:forEach>

		<c:if test="${endPage < pageCount}">
			<a href="list?pageNum=${startPage + bottomLine}">[다음]</a>
		</c:if>
</body>
</html>
