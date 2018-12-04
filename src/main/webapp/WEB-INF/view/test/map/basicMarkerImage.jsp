<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c03b7a884fd091737601a16e3e8ca281"></script>
<title>이미지 마커 변경 테스트 및 드래거블 가능 테스트</title>
</head>
<body>
	<!-- Tutorial 10. 이미지 마커 변경 및 드래거블 가능 테스트 -->
	<div id="map" style="width:800px;height:600px;"></div>	
	<p id="messageBox"></p>
	
	<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 4 // 지도의 확대 레벨
    };

var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

var imageSrc = '/img/marker.png', // 마커이미지의 주소입니다    
    imageSize = new daum.maps.Size(35,47), // 마커이미지의 크기입니다
    imageOption = {offset: new daum.maps.Point(14,47)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
      
// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption);
var markerPosition = new daum.maps.LatLng(33.450701, 126.570667); // 마커가 표시될 위치입니다

// 마커를 생성합니다
var marker = new daum.maps.Marker({
    position: markerPosition, 
    image: markerImage, // 마커이미지 설정 
    draggable: true
});

marker.setMap(map);
// 마커가 지도 위에 표시되도록 설정합니다

</script>
</body>
</html>