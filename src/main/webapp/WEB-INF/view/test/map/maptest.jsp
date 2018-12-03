<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"/>
	<title>Daum 지도 시작하기</title>
</head>
<body>
	<div id="map" style="width:500px;height:400px;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c03b7a884fd091737601a16e3e8ca281"></script>
	<script>
	
		//맵 컨테이너 
		var container = document.getElementById('map'); //맵
		
		//맵 좌표 부분
		var mapPosition = new daum.maps.LatLng(33.450701, 126.570667);
		
		//맵 관련 옵션
		var options = {
			center: mapPosition, //맵 처음 위치 가운데 지점 설정(좌표) 
			level: 5 //맵 축척도(숫자가 커질수록 축적 밀도가 높아진다.)
		};
		
		//맵에 관련된 DIV container을 넣어주고 옵션 관련 배열을 넣어준 맵 객체를 생성해서 map 변수명에 넣어준다. . 
		var map = new daum.maps.Map(container, options);
		
		//마커 관련 옵션을 넣어준다. 
		var markerOption = {position: mapPosition};
		
		//마커에 대한 객체(마커 객체)를 만들어 주고 그에대한 배열 옵션을 넣어준다. 
		var marker = new daum.maps.Marker(markerOption);
		
		//마커를 맵위에 뿌려준다. 
		marker.setMap(map);
		
		
	</script>
	
</body>
</html>