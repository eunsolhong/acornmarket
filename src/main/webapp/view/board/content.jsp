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

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8991dcddbea1441d0e4099c7db39cef2&libraries=services,clusterer,drawing"></script>

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

			<!--글내용-->
			<div class="col-sm-8 img-thumbnail box">
				<div id="feedback">
					<div class="container">
						<div class="col-md-5">
							<div class="form-area">
								<form role="form">
									<br style="clear: both">
									<div class="img1">
										<img
											src="<%=request.getContextPath()%>/uploadFile/${article.filename}">
									</div>
									<br>
									<h3 style="margin-bottom: 25px; text-align: center;">${article.subject}
									</h3>


									<div class="form-group cont2">
									<input type="text" class="form-control white"
											id="boardnum" name="boardnum" value="${article.boardnum}"
											readonly name="boardnum">
									</div>

									<div class="form-group cont2">
										<input type="text" class="form-control white"
											id="regdate" name="regdate" value="${article.regdate}"
											readonly name="regdate">
									</div>

									<div class="form-group cont2">
										<input type="text" class="form-control" id="readcount"
											name="readcount" value="${article.readcount}"  readonly
											name="readcount">
									</div>
									
									<div class="form-group cont1">
										<input type="text" class="form-control" id="userid"
											name="userid" value="${article.userid}">
									</div>
									

									<c:choose>
									  <c:when test="${userid ne null}">
									    <a href='javascript: like_func();'><img src='./images/dislike.png' id='like_img'></a>
									  </c:when>
									  <c:otherwise>
									    <a href='javascript: login_need();'><img src='./images/dislike.png'></a>
									  </c:otherwise>
									</c:choose>


									<div class="form-group">
										<input type="text" class="form-control" id="filename"
											name="filename" value="${article.filename}" readonly
											name="filename">
									</div>

									<div class="form-group">
										카테고리 : <input type="text" class="form-control" id="category"
											name="category" value="${article.category}" readonly>
									</div>

									<div class="form-group">
										가격 : <input type="text" class="form-control" id="price"
											name="price" value="${article.price}" readonly>
									</div>

									<div class="form-group">
										주소 : <input type="text" class="form-control" id="address"
											name="address" value="${article.address}" readonly>
									</div>

									<div class="mapp" style="float:center; width: 70%;">
										<div style=" height: 350px;"
											id="map"></div>
									</div>
									<br>


									<div class="form-group">
										<textarea class="form-control" type="textarea" id="content"
											name="content" maxlength="300" rows="20" readonly>${article.content}</textarea>
									</div>

									<div class=button1>
										<input type="button" value="글수정"
											onclick="location.href='${pageContext.request.contextPath}/board/updateForm?num=${article.boardnum}'">&nbsp;&nbsp;
										<input type="button" value="글삭제"
											onclick="location.href='${pageContext.request.contextPath}/board/delete?num=${article.boardnum}'">&nbsp;&nbsp;
										<input type="button" value="쪽지하기">&nbsp;&nbsp; 
										<input type="button" value="판매완료"
											onclick="location.href='${pageContext.request.contextPath}'">&nbsp;&nbsp;
										<input type="button" value="글목록"
											onclick="location.href='${pageContext.request.contextPath}/board/categoryForm?category=${article.category}'">
										<p></p>
									</div>

									<hr>

									<!-- 댓글창 -->
									<div class="form-group1 re1">
										<div class="col-md-12">
											<textarea class="form-control" id="textarea" name="comment"
												cols="40" rows="3" placeholder="댓글로 자유롭게 거래하세요!"></textarea>
										</div>
									</div>
									<p></p>
									<br>
									<div class=btn1>
										<input type="button" value="댓글작성">
									</div>
							</div>
						</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>
	
	
	
	<!-- 지도 -->
	<script>
		//container : 지도를 표시할 div의 아이디
		var container = document.getElementById('map');
		var options = {
			//center : 지도 생성시 반드시 필요. (지도 중심 좌표) / LatLng : 위·경도 죄표[위도(latitude), 경도(longitude)]
			center : new kakao.maps.LatLng(33.450701, 126.570667),
			//level : 지도 확대 레벨
			level : 3
		};
	</script>
	<script>
		// 마커 이미지의 이미지 주소입니다 
		var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
		// 마커 이미지의 이미지 크기 입니다 
		var imageSize = new kakao.maps.Size(24, 35);
		//마커 이미지를 생성합니다 
		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
		//지도 생성 
		var map = new kakao.maps.Map(container, options);
		//주소 - 좌표 변환 객체 생성 
		var geocoder = new kakao.maps.services.Geocoder();
		//주소로 좌표 검색 
		geocoder
				.addressSearch(
						'${article.address}',
						function(result, status) {
							if (status == kakao.maps.services.Status.OK) {
								var coders = new kakao.maps.LatLng(result[0].y,
										result[0].x);
								//결과값으로 받은 위경도를 마커로 표시한다.
								var marker = new kakao.maps.Marker({
									map : map,
									position : coders,
									image : markerImage, // 마커 이미지
									title : '${article.address}' // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다 
								});
								//인포윈도우로 현재 장소에 대한 설명. 
								var infowindow = new kakao.maps.InfoWindow(
										{
											content : '<div style="width: 150px; text-align: center; padding: 5px; font-size: 12px;">현재위치</div>'
										});
								infowindow.open(map, marker);
								//지도의 중심 좌표를 결과값을 받은 위치로 변경
								map.setCenter(coders);
							}
						});
	</script>


	<!-- 좋아요 -->
	<script>
	function like_func(){
		  var frm_read = $('#frm_read');
		  var boardnum = $('#boardnum', frm_read).val();
		  //var mno = $('#mno', frm_read).val();
		  //console.log("boardno, mno : " + boardno +","+ mno);
		  
		  $.ajax({
		    url: "../liketo/like.do",
		    type: "GET",
		    cache: false,
		    dataType: "json",
		    data: 'boardnum=' +boardnum,
		    success: function(data) {
		      var msg = '';
		      var like_img = '';
		      msg += data.msg;
		      alert(msg);
		      
		      if(data.like_check == 0){
		        like_img = "./images/dislike.png";
		      } else {
		        like_img = "./images/like.png";
		      }      
		      $('#like_img', frm_read).attr('src', like_img);
		      $('#like_cnt').html(data.like_cnt);
		      $('#like_check').html(data.like_check);
		    },
		    error: function(request, status, error){
		      alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		    }
		  });
		}
	  </script>
</body>
</html>