<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../head.jsp" %>

<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/js/font-awesome/css/font-awesome.min.css">   

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a5f2e82aa9bad5f393255b6d8c3200cb"></script>

<script type="text/javascript">
$( function() {
    $('#datepicker').datepicker({
      showOn: "button",
      buttonImage: "/img/calendar.gif",
      buttonImageOnly: true,
      buttonText: "Select date",
      changeYear : true,
      changeMonth : true,
      yearRange : "1930:2020",
      dateFormat: "yy-mm-dd"
    });
} );

</script>

<form method="" action="/main/mytravel_update2">

<div class="sub_container">
	
	<h1 class="mypage_title">나의여행 일정 수정</h1>

	<div id="map" class="main_map" style="width:100%;height:400px;"></div>
	
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new daum.maps.LatLng(33.450701, 126.570667),
			level: 3
		};
	
		var map = new daum.maps.Map(container, options);
	</script>
	
	<div class="markerSchedule">
		<ul class="markerSchedule_bg">
			<li><i class="fa fa-thumbtack"></i> 설정한 마커의 주소를 보여줍니다.</li>
			<li><i class="fa fa-calendar-alt" ></i> 일정 날자 정하기</li>
		</ul>
		<ul>
			<li> <i class="fa fa-thumbtack"></i> 박진이 찍은 마커 지역명</li>
			<li> <i class="fa fa-calendar-alt" ></i> Day : <input type="number" placeholder="1박 ( ex:1 ) "> <b>박</b></li>
		</ul>
		<ul>
			<li> <i class="fa fa-thumbtack"></i> 박진이 찍은 마커 지역명</li>
			<li> <i class="fa fa-calendar-alt" ></i> Day : <input type="number" placeholder="1박 ( ex:1 )"> <b>박</b></li>
		</ul>
		<ul>
			<li> <i class="fa fa-thumbtack"></i> 박진이 찍은 마커 지역명</li>
			<li> <i class="fa fa-calendar-alt" ></i> Day : <input type="number" placeholder="1박 ( ex:1 )"> <b>박</b></li>
		</ul>
	</div>
	
	<div class="selectdeparturedate">
		<ul>
			<li><b>출발일 선택하기</b></li>
			<li><input id="datepicker" class="datepicker" type="text"  name="start" placeholder="출발일" style="width: 35%" readonly="readonly"></li>
		</ul>
	</div>
	
	<br/><br/>
	<div class="view_btn">
		<ul>
			<li class="essay_filterLi">
				<input class="btn_bd col_03 " type="submit" value="다음">
			</li>
			<li class="essay_filterLi">
				<input class="btn_bd col_02 " type="button" onclick="button_event();" value="취소">	 					
			</li>
		</ul>
	</div> 

	
</div>	
</form>
<%@include file="../../tail.jsp" %> 