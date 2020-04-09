<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>myPage</title>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8991dcddbea1441d0e4099c7db39cef2&libraries=services,clusterer,drawing"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

</head>

<body>
	<br>	<p>		<br>	<p>
<div style="border: 3px solid skyblue;">
	<div align="center">
		<div style="width: 80%;">
			<div style="float: left; width:25%;">
				<label>회원 이름</label><br><br> ${userId }
				<br><br>
				<input type="button" class="w3-button w3-round-large" value="정보 수정" style="background-color: #f0e68c;" onclick="location='userPasswdCheck'" />
				<input type="button" class="w3-button w3-round-large" value="회원 탈퇴" style="background-color: #f0e68c;" onclick="location='userDelete'" />
			</div>
			<div style="float: left; width:25%;">
				<label>나의 온도</label><br><br>
				
				<c:if test="${userScore <= 25 && userScore >= 0}">
				<i class="fas fa-thermometer-empty  fa-4x"></i>
				</c:if>
				<c:if test="${userScore <= 50 && userScore >= 26}">
				<i class="fas fa-thermometer-quarter fa-4x"></i>
				</c:if>
				<c:if test="${userScore <= 75 && userScore >= 51}">
				<i class="fas fa-thermometer-half  fa-4x"></i>
				</c:if>
				<c:if test="${userScore <= 99 && userScore >= 76}">
				<i class="fas fa-thermometer-three-quarters  fa-4x"></i>
				</c:if>
				<c:if test="${userScore == 100 }">
				<i class="fas fa-thermometer-full  fa-4x"></i>
				</c:if>
				<br/>
				${userScore } ℃
			</div>
			<div style="float: left; width:25%;">
				<label>찜 목록</label><br> <br>
				<a href="${pageContext.request.contextPath}/user/jjimList"><i class="fas fa-heart fa-4x"></i></a>
			</div>
			<div style="float: left; width:25%;">
				<label>거래 내역</label><br><br>
				<a href="${pageContext.request.contextPath}/user/saleList"><i class="fas fa-clipboard-list  fa-4x"></i></a>
			</div>
		</div>
	</div>
	
	<br><p>	<br><p>		<br><p>	

	<br><p>
	<div align="center">
		<div style="width: 80%; height: 400px;">
			<div style="float: left; width: 30%;">
				<div style="border: 3px solid rgb(255, 194, 0); height: 200px;">
				<br><p></p><br>
					<a href="${pageContext.request.contextPath}/chat/chatForm">
						<i class="fas fa-comments  fa-4x"></i>
					</a> 
					<br>채팅
				</div>
				<div style="border: 3px solid pink; height: 200px; align: center;">
				<br><p></p><br>
					<a href="${pageContext.request.contextPath}/user/saleList">
						<i class="fas fa-user-edit  fa-4x"></i>
					</a> 
					<br>작성한 리뷰
				</div>
			</div>내 주위에 있는 거래 보기<br> 
					<i class="fas fa-map fa-2x"></i>
			<div style="float: right; width: 70%;">
				<div style="border: 3px solid skyblue; height:350px; " id="map">
				</div>
			</div>
		</div>
	</div>
</div>
	<br><p>	<br><p>	<br><p>	<br><p>
	
<c:forEach items="${addressList }" var="addressList">
	<div class="addAddress" style="display: none">
		<input type="hidden" size="50" name="juAddress" value="${addressList }"/>
	</div>
</c:forEach>


<script>
	//container : 지도를 표시할 div의 아이디
	var container = document.getElementById('map');
	var options = {
		//center : 지도 생성시 반드시 필요. (지도 중심 좌표) / LatLng : 위·경도 죄표[위도(latitude), 경도(longitude)]
		center: new kakao.maps.LatLng(33.450701, 126.570667),
		//level : 지도 확대 레벨
		level: 3
	};
	
	

	////////////////////////////////////////////////////////////////////
	//내 주소와 같은 구에 있는 거래를 볼 수 있다.									 //
	////////////////////////////////////////////////////////////////////
	var geocoder2 = new kakao.maps.services.Geocoder();
	var addressArray = [];
	var nearAddress =  $('.addAddress'); //jQuery로 클래스의 값을 가져온다.
	
	
	for(var i=0; i<nearAddress.length; i++){
		addressArray.push({
			'groupAddress' : $("input[name='juAddress']").eq(i).val()	//이름이 juAddress인 것의 값을 넣는다.	/	eq(i) : jQuery객체로 반환
		});
	}
	
	for(var i=0; i<addressArray.length; i++){
		geocoder2.addressSearch(
				addressArray[i].groupAddress,
			function(result, status, data){
				//정상적으로 검색 완료 시
				if(status === daum.maps.services.Status.OK){
					var coords = new daum.maps.LatLng(result[0].y, result[0].x);
					
					//결과값으로 받은 위치를 마커로 표시
					var marker = new daum.maps.Marker({
						map:map,
						position : coords
					});
					
					//마커를 지도에 표시
					marker.setMap(map);
					
					var content = '<div style="width:150px; text-align:center; padding:5px;font-size:12px;">'+result[0].address_name+'</div>';
					
					var infowindow = new kakao.maps.InfoWindow({
						content : content
					});
					infowindow.open(map, marker);
				}
				})
	}
	
	////////////////////////////////////////////////////////////////////

	// 마커 이미지의 이미지 주소입니다
	var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
	 // 마커 이미지의 이미지 크기 입니다
    var imageSize = new kakao.maps.Size(24, 35); 
    // 마커 이미지를 생성합니다    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
    
	//지도 생성
	var map = new kakao.maps.Map(container, options);
	//주소 - 좌표 변환 객체 생성
	var geocoder = new kakao.maps.services.Geocoder();
	//주소로 좌표 검색
	geocoder.addressSearch('${useraddress}',function(result, status){
		if(status == kakao.maps.services.Status.OK){
			var coders = new kakao.maps.LatLng(result[0].y, result[0].x);
			
			//결과값으로 받은 위경도를 마커로 표시한다.
			var marker = new kakao.maps.Marker({
				map:map,
				position:coders,
				image : markerImage, // 마커 이미지 
				title : '${useraddress}' // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
			});
			
			//인포윈도우로 현재 장소에 대한 설명.
			var infowindow = new kakao.maps.InfoWindow({
				content : '<div style="width:150px; text-align:center; padding:5px;font-size:12px;">현재 위치</div>'
				
			});
			infowindow.open(map, marker);
			 
			//지도의 중심 좌표를 결과값을 받은 위치로 변경
			map.setCenter(coders);
		}
	});
	</script>
</body>
</html>