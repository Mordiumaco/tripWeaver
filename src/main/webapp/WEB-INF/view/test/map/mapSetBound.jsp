<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c03b7a884fd091737601a16e3e8ca281"></script>
<title>지도 범위 재설정하기</title>
</head>
<body>
	<!--Tutorial 5. 지도 범위 재 설정하기 테스트 -->
	<div id="map" style="width:800px;height:600px;"></div>	
	<p>
		<button onclick="setBounds()">지도 범위 재설정 하기</button> 
	</p>
	<script type="text/javascript">
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
		
		var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		 
		// 버튼을 클릭하면 아래 배열의 좌표들이 모두 보이게 지도 범위를 재설정합니다 
		var points = [
		    new daum.maps.LatLng(33.452278, 126.567803),
		    new daum.maps.LatLng(33.452671, 126.574792),
		    new daum.maps.LatLng(33.451744, 126.572441)
		];
		
		// 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
		var bounds = new daum.maps.LatLngBounds();    
		
		var i, marker;
		for (i = 0; i < points.length; i++) {
		    // 배열에 해당하는 좌표를 마커에 집어 넣는다.
		    marker = new daum.maps.Marker({ position : points[i] });
		    marker.setMap(map); //맵 객체에 마커를 셋팅한다. 
		    
		    // LatLngBounds 객체에 좌표를 추가합니다
		    //해당 범위 설정 객체에 좌표들을 넣어준다. [객체에 설정한 마커를 다 담는 범위를 범위값으로 잡는다.]
		    bounds.extend(points[i]); 
		}
		
		function setBounds() {
		    // LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
		    // 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
		    map.setBounds(bounds);
		}
	</script>	
</body>
</html>