<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c03b7a884fd091737601a16e3e8ca281"></script>
<meta charset="UTF-8">
<title>이동 이벤트 등록</title>
</head>
<body>
<!-- Tutorial 8.이동 이벤트 등록 -->
	<div id="map" style="width:800px;height:600px;"></div>	
	<p id="messageBox"></p>
	<script>
		
		var container = document.getElementById("map");
		
		var mapOption = {
				center: new daum.maps.LatLng(33.450701, 126.570667),
				level:5
		}
		
		var map = new daum.maps.Map(container, mapOption);
		
		daum.maps.event.addListener(map, 'dragend', function(){
			
			var latlng = map.getCenter();
			var message = '변경된 지도 중심좌표는 ' + latlng.getLat() + ' 이고, ';
		    message += '경도는 ' + latlng.getLng() + ' 입니다';
			
		    var resultDiv = document.getElementById("messageBox");
		    resultDiv.innerHTML = message;
		    
		})
	</script>
</body>
</html>