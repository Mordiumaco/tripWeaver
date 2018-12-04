<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c03b7a884fd091737601a16e3e8ca281"></script>
<title>mapGenerate.jsp</title>
</head>
<body>
<!--Tutorial 1.  맵 생성 테스트 -->
<div id="map" style="width:500px;height:400px;"></div>
<script>
	
	var container = document.getElementById("map"); //맵을 담을 div를 담아낸다.
	
	var mapOption = {	
			center: new daum.maps.LatLng(33.450701, 126.570667), //지도 가운데 위치
			level: 1	//지도 축척 밀도 (높을 수도 밀도가 높아진다.)
	}
	
	var map = new daum.maps.Map(container, mapOption); //다음 맵객체 생성 (맵을 담을 컨테이너, 맵 설정 관련 배열)
	
	
</script>

</body>
</html>