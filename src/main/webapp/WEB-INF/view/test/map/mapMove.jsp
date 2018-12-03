<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c03b7a884fd091737601a16e3e8ca281"></script>
<meta charset="UTF-8">
<title>맵 이동 시키기</title>
<!--Tutorial 2.  맵 이동 시키기 테스트-->
</head>
<body>
<div id="map" style="width:800px;height:600px;"></div>
<p>
	<button onclick="setCenter()">그냥 가운데 이동</button>
	<button onclick="setNaturallySetCenter()">부드럽게 가운데로 이동</button>
</p>
<script>
	var container = document.getElementById("map"); //지도를 표시한 div 
	
	mapOption = {
			center: new daum.maps.LatLng(33.450701, 126.570667), //지도 중심 좌표
			level: 5 //지도 확대 레벨 축적레벨(클수록 높은거)
	}
	
	//지도 설정 
	var map = new daum.maps.Map(container, mapOption);
	
	
	function setCenter(){
		
		//좌표 설정 daum.maps.LatLng(x,y 좌표) 객체 생성 
		var moveCenter = new daum.maps.LatLng(33.450701, 126.570667);
		
		//지도 중심으로 그냥 이벤트 없이 이동
		map.setCenter(moveCenter);
	}
	
	function setNaturallySetCenter(){
		
		var moveCenter = new daum.maps.LatLng(33.450701, 126.570667);
		
		
		//panto(좌표) 지도 중심을 부드럽게 이동시킨다. 
		//만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동함. 
		map.panTo(moveCenter); 
	}
	
	
	
</script>	
</body>
</html>