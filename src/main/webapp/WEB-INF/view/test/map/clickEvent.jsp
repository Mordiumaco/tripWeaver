<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c03b7a884fd091737601a16e3e8ca281"></script>
<meta charset="UTF-8">
<title>클릭 이벤트 등록하기</title>
</head>
<body>
	<!--Tutorial 6. 클릭 이벤트 등록하기 테스트 -->
	<div id="map" style="width:800px;height:600px;"></div>	
	<p id="messagebox"></p>
	<script type="text/javascript">
		
		var container = document.getElementById("map");
		mapOption = {
				center : new daum.maps.LatLng(33.450701, 126.570667),
				level : 5
		}
		
		var map = new daum.maps.Map(container, mapOption);
		
		var zoomControl = new daum.maps.ZoomControl();
		map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
		
		//지도가 확대 또는 축소되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록
		
		daum.maps.event.addListener(map, 'zoom_changed', function(){
			
			//지도의 현재 레벨 얻어오기 
			var level = map.getLevel();
			
			var message = '현재 지도 레벨은 '+level+'레벨 입니다';
			
			var resultDiv = document.getElementById("messagebox");
			
			resultDiv.innerHTML = message;
		}) 
				
	</script>
</body>
</html>