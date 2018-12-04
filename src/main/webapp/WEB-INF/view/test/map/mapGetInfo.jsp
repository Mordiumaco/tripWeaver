<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c03b7a884fd091737601a16e3e8ca281"></script>
<title>지도 정보 얻어오기</title>
</head>
<body>
<!--Tutorial 4.  맵 정보 얻어오기  테스트 -->
<div id="map" style="width:800px;height:600px;" onclick="getInfo()" onwheel="getInfo()"></div>		
<p id="messageBox">
</p>
<script>
	
	var container = document.getElementById("map");
	
	mapOption = {
			center: new daum.maps.LatLng(33.450701, 126.570667),
			level: 3
	}
	
	var map = new daum.maps.Map(container, mapOption); //해당 div 에 지도 생성
	
	var mapTypeController = new daum.maps.MapTypeControl(); //지도 타입 
	
	map.addControl(mapTypeController, daum.maps.ControlPosition.TOPRIGHT);
	
	var zoomController = new daum.maps.ZoomControl();
	map.addControl(zoomController, daum.maps.ControlPosition.RIGHT);
	
	function getInfo(){
		
		var center = map.getCenter();
		
		var level = map.getLevel();
		
		var mapTypeId = map.getMapTypeId();
		
		var bounds = map.getBounds(); //지도에 대한 현재 영역을 얻어옴 
		
		var swLatLng = bounds.getSouthWest();
		
		var neLatLng = bounds.getNorthEast();
		
		var boundStr = bounds.toString();
		
	
	  var message = '지도 중심좌표는 위도 ' + center.getLat() + ', <br>';
	    message += '경도 ' + center.getLng() + ' 이고 <br>';
	    message += '지도 레벨은 ' + level + ' 입니다 <br> <br>';
	    message += '지도 타입은 ' + mapTypeId + ' 이고 <br> ';
	    message += '지도의 남서쪽 좌표는 ' + swLatLng.getLat() + ', ' + swLatLng.getLng() + ' 이고 <br>';
	    message += '북동쪽 좌표는 ' + neLatLng.getLat() + ', ' + neLatLng.getLng() + ' 입니다';
    
		var messageBox = document.getElementById("messageBox");
		
		messageBox.innerHTML = message;
	}
	
	getInfo();
</script>
</body>
</html>