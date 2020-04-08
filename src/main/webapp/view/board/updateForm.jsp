<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>컨텐츠</title>
</head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/content.css" />

<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>

<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

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

			<!--글내용--> 
			<div class="col-sm-8 img-thumbnail">
				<div id="feedback">
					<div class="container">
						<div class="col-md-5">
							<div class="form-area">
								<form role="form" method="post"
									action="${pageContext.request.contextPath}/board/updatePro">
									
									<input type="hidden" name="boardnum" value="${article.boardnum}">
									<!-- <input type="hidden" name="userid" value="22"> -->
									<input type="hidden" name="passwd" value="${article.passwd}">
									<input type="hidden" name="regdate" value="${article.regdate}">
									<input type="hidden" name="readcount" value="${article.readcount}">
									
									
									<br style="clear: both">
									
									<div class="img1">
										<img
											src="<%=request.getContextPath()%>/uploadFile/${article.filename}">
									</div>
									<br>
									
									글 제목 : <input type="text"name="subject"class="form-control"style="margin-bottom: 25px; text-align: center;" value="${article.subject}">

									
									<div class="form-group">
										<select class="form-control" id="category" name="category" >
											<option value="디지털/가전" <c:if test="${article.category eq 'category'}">selected</c:if>>디지털/가전</option>
											<option value="가구/인테리어" <c:if test="${article.category eq 'category'}">selected</c:if>>가구/인테리어</option>
											<option value="여성패션/잡화" <c:if test="${article.category eq 'category'}">selected</c:if>>여성패션/잡화</option>
											<option value="남성패션/잡화" <c:if test="${article.category eq 'category'}">selected</c:if>>남성패션/잡화</option>
											<option value="뷰티/미용" <c:if test="${article.category eq 'category'}">selected</c:if>>뷰티/미용</option>
											<option value="반려동물용품" <c:if test="${article.category eq 'category'}">selected</c:if>>반려동물용품</option>
											<option value="기타중고물품" <c:if test="${article.category eq 'category'}">selected</c:if>>기타중고물품</option>
										</select>
										</div>

									<div class="form-group">
									가격 	: <input type="text" class="form-control" id="price"
											name="price" value="${article.price}">
									</div>

									<div class="form-group">
										<input type="file" class="form-control" id="filename"
											name="filename" value="${article.filename}">
									</div> 
									
									<div class="form-group">
									userid : <input type="text" class="form-control" id="userid"
											name="userid" value="${article.userid} ">
									</div>
									
									<tr>
										<td>
										<label>
										<input class="form-control" size="32" type="text" name="address1" id="address1"
												placeholder="${article.address}" value="${boardnum}"> </label> 
										<label><input type="text" size="32" class="form-control" style=" margin-top: 3px;"id="address2" name="address2" placeholder="상세주소"> </label>		
												
												<input type="button" class="w3-button w3-round-large w3-tiny w3-border"
											style="background-color: #f0e68c; color: #745d46; margin-top: 3px;"
											onclick="sample3_execDaumPostcode()" value="주소 찾기"> <br>
											<div id="wrap"
												style="display: none; border: 1px solid; width: 100%; height: 300px; margin: 5px 0; position: relative">
												<img
													src="//t1.daumcdn.net/postcode/resource/images/close.png"
													id="btnFoldWrap"
													style="cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1"
													onclick="foldDaumPostcode()" alt="접기 버튼">
											</div></td>
									</tr>
									<br>

									<div class="form-group">
									<textarea class="form-control" type="textarea" id="content"
											name="content" maxlength="300" rows="20">${article.content}</textarea>
									</div>
								
								
									<div class=button style="margin-left: 33%;">
										<input type="submit" value="글수정">&nbsp;&nbsp; <input
											type="reset" value="다시작성">&nbsp;&nbsp; <input
											type="button" value="채팅하기">&nbsp;&nbsp; <input
											type="button" value="글목록"
											onclick="location.href='${pageContext.request.contextPath}/board/list'">
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
		<script>
		// 주소 찾기 찾기 화면을 넣을 element
		var element_wrap = document.getElementById('wrap');
		function foldDaumPostcode() {
			// iframe을 넣은 element를 안보이게 한다.
			element_wrap.style.display = 'none';
		}
		function sample3_execDaumPostcode() {
			// 현재 scroll 위치를 저장해놓는다.
			var currentScroll = Math.max(document.body.scrollTop,
					document.documentElement.scrollTop);
			new daum.Postcode({
				oncomplete : function(data) {
					// 검색결과 항목을 클릭했을때 실행할 코드
					var addr = ''; // 주소 변수
					var extraAddr = ''; // 참고항목 변수

					if (data.userSelectedType === 'R') {
						// 사용자가 도로명 주소를 선택했을 경우
						addr = data.roadAddress;
					} else {
						// 사용자가 지번 주소를 선택했을 경우(J)
						addr = data.jibunAddress;
					}
					// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합
					if (data.userSelectedType === 'R') {
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraAddr += data.bname;
						}
					}
					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					// document.getElementById('sample3_postcode').value = data.zonecode;
					document.getElementById("address1").value = addr;
					// 커서를 상세주소 필드로 이동한다.
					// iframe을 넣은 element를 안보이게 한다.
					// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
					element_wrap.style.display = 'none';
					// 주소 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
					document.body.scrollTop = currentScroll;
				},
				// 주소번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정
				onresize : function(size) {
					element_wrap.style.height = size.height + 'px';
				},
				width : '100%',
				height : '100%'
			}).embed(element_wrap);
			// iframe을 넣은 element를 보이게 한다.
			element_wrap.style.display = 'block';
		}
	</script>

</body>
</html>