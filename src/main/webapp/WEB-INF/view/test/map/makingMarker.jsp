<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c03b7a884fd091737601a16e3e8ca281"></script>
<meta charset="UTF-8">
<title>클릭한 위치에 마커 만들기</title>
</head>
<body>
	<div id="map" style="width:800px;height:600px;"></div>	
	<p id="messageBox"></p>
	<!--Tutorial 7.클릭한 위치에 마커 만들기 -->
	<script>
		var container = document.getElementById("map");
		
		var mapOption = {
				center: new daum.maps.LatLng(33.450701, 126.570667),
				level: 5	
		}
		
		var map = new daum.maps.Map(container, mapOption);
		
		var markerOption = {position: map.getCenter()};
		
		var marker = new daum.maps.Marker(markerOption);
		
		marker.setMap(map);
		
		//초기 셋팅 끝
		
		
		//지도에서 클릭을 했을 때...
		daum.maps.event.addListener(map, 'click', function(mouseEvent){
			
			//클릭한 위도, 경도 정보를 가져온다. 
			var latLng = mouseEvent.latLng;
			
			marker.setPosition(latLng);
			
			var message = '클릭한 위치의 위도는 ' + latLng.getLat() + ' 이고, ';
		    message += '경도는 ' + latLng.getLng() + ' 입니다';
		    
		    var resultDiv = document.getElementById("messageBox");
		    resultDiv.innerHTML = message;
		    
		});
		
		
	</script>
</body>
</html>