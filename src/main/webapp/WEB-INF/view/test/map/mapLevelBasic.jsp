<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c03b7a884fd091737601a16e3e8ca281"></script>
<title>지도 레벨 확대 축소</title>

</head>
<body>
<div id="map" style="width:800px;height:600px;" onwheel="mouseWheel()"></div>
<p id="mapLevel">우왕</p>
<p>
	<button onclick="zoomIn()">확대</button>
	<button onclick="zoomOut()">축소</button>
	
</p>
<!--Tutorial 3.  맵 레벨 확대 축소 테스트 (줌 관련 컨트롤러 포함)-->
<script>
	
	var container = document.getElementById("map");
	
	mapOption = {
			center : new daum.maps.LatLng(33.450701, 126.570667),
			lever : 5
	}
	
	var map = new daum.maps.Map(container, mapOption);
	
	//현 지도의 레벨을 표시합니다.
	displayLevel();
	
	function zoomIn(){
		
		var level = map.getLevel();
		
		map.setLevel(level-1);
		
		displayLevel();
	}
	
	function zoomOut(){
		
		var level = map.getLevel();
		
		map.setLevel(level+1);
		
		displayLevel();
	}
	
	
	function mouseWheel(){
		
		displayLevel();
	}
	
	function displayLevel(){
		
		var levelEl = document.getElementById('mapLevel');
		levelEl.innerHTML = '현재 지도 레벨은'+map.getLevel()+'입니다';
	}

	
	//줌 관련 컨트롤러
	var zoomController = new daum.maps.ZoomControl();
	map.addControl(zoomController, daum.maps.ControlPosition.TOPRIGHT); 
	
	daum.maps.event.addListener(map, 'zoom_changed', function(){
		
		// 지도의 현재 레벨을 얻어옵니다
		displayLevel();
	})

	
</script>


</body>
</html>