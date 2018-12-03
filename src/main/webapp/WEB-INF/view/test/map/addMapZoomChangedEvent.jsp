<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c03b7a884fd091737601a16e3e8ca281"></script>
<meta charset="UTF-8">
<title>확대, 축소 이벤트 등록 테스트</title>
</head>
<body>
<!-- Tutorial 9.확대, 축소 이벤트 등록 테스트 -->
	<div id="map" style="width:800px;height:600px;"></div>	
	<p id="messageBox"></p>
	<script>
		
		var mapContainer = document.getElementById("map");
		var mapOption = {
				center : new daum.maps.LatLng(33.450701, 126.570667),
				level : 5
		}
		
		var map = new daum.maps.Map(mapContainer, mapOption);
		
		var zoomControl = new daum.maps.ZoomControl();
		map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
		
		daum.maps.event.addListener(map, 'zoom_changed', function(){
			
			var level = map.getLevel();
			var message = '현재 지도 축척 레벨은 '+level+'레벨 입니다';
			
			var messageBox = document.getElementById("messageBox");
			messageBox.innerHTML = message;
			
		});
		
	
	</script>
</body>
</html>