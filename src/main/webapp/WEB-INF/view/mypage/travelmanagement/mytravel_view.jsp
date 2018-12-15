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


$(document).ready(function(){
	$('#container').on('click','.essay_calendat_btn',function () {
		$('.essay_calendar').hide('slow'); 
		$('.essay_calendat_btn').addClass('essay_calendar2');
	});  
	
	$('#container').on('click','.essay_calendar2',function () {
		$('.essay_calendar').show('slow'); 
		$('.essay_calendat_btn').removeClass('essay_calendar2');
	});  
});

</script>

<style>
.essay_filter { height: 60px;}
.mypage_title a { float: right; font-size: 0.8em !important; border: 1px solid #ddd; padding: 5px 10px;}
.mypage_title a:hover { background: #41384b; color: #fff;}
</style>



<div class="sub_container">
	<div id="container">
		<h1 class="mypage_title">제목: ${tripplanVo.tripplan_title} <a href="/myplan/mytravel_update?tripplan_id=${tripplanVo.tripplan_id}">수정</a></h1>
		
		<div class="essay_filter">
			
			<!-- 시즌 관련 로직 -->
			<c:choose>
				<c:when test="${tripplanVo.tripplan_season eq 1}">
					<c:set var="season" value="봄"></c:set>
				</c:when>
				<c:when test="${tripplanVo.tripplan_season eq 2}">
					<c:set var="season" value="여름"></c:set>
				</c:when>
				<c:when test="${tripplanVo.tripplan_season eq 3}">
					<c:set var="season" value="가을"></c:set>
				</c:when>
				<c:when test="${tripplanVo.tripplan_season eq 4}">
					<c:set var="season" value="겨울"></c:set>
				</c:when>
				<c:when test="${tripplanVo.tripplan_season eq 5}">
					<c:set var="season" value="무관"></c:set>
				</c:when>
			</c:choose>
			<!-- 테마관련 로직  -->
			<c:choose>
				<c:when test="${tripplanVo.tripplan_theme eq 1}">
					<c:set var="theme" value="먹거리"></c:set>
				</c:when>
				<c:when test="${tripplanVo.tripplan_theme eq 2}">
					<c:set var="theme" value="레저"></c:set>
				</c:when>
				<c:when test="${tripplanVo.tripplan_theme eq 3}">
					<c:set var="theme" value="쇼핑"></c:set>
				</c:when>
				<c:when test="${tripplanVo.tripplan_theme eq 4}">
					<c:set var="theme" value="자연"></c:set>
				</c:when>
				<c:when test="${tripplanVo.tripplan_theme eq 5}">
					<c:set var="theme" value="문화"></c:set>
				</c:when>
				<c:when test="${tripplanVo.tripplan_theme eq 6}">
					<c:set var="theme" value="축제"></c:set>
				</c:when>
			</c:choose>
			<!-- 구성원 타입 로직 -->
			<c:choose>
				<c:when test="${tripplanVo.tripplan_peo_type eq 1}">
					<c:set var="peo_type" value="혼자"></c:set>
				</c:when>
				<c:when test="${tripplanVo.tripplan_peo_type eq 2}">
					<c:set var="peo_type" value="커플"></c:set>
				</c:when>
				<c:when test="${tripplanVo.tripplan_peo_type eq 3}">
					<c:set var="peo_type" value="친구"></c:set>
				</c:when>
				<c:when test="${tripplanVo.tripplan_peo_type eq 4}">
					<c:set var="peo_type" value="가족"></c:set>
				</c:when>
				<c:when test="${tripplanVo.tripplan_peo_type eq 5}">
					<c:set var="peo_type" value="단체"></c:set>
				</c:when>
				<c:when test="${tripplanVo.tripplan_peo_type eq 6}">
					<c:set var="peo_type" value="여자끼리"></c:set>
				</c:when>
				<c:when test="${tripplanVo.tripplan_peo_type eq 7}">
					<c:set var="peo_type" value="남자끼리"></c:set>
				</c:when>
			</c:choose>
			<ul>
				<li>시즌 : <b>${season}</b></li>
				<li>테마 : <b>${theme}</b></li>
				<li>여행일수 : <b>${tripplanVo.tripplan_days-1}박 ${tripplanVo.tripplan_days}일</b></li>
				<li>구성원별 : <b>${peo_type}</b></li>
				<li>총 인원수: <b>${tripplanVo.tripplan_peo_count}명</b></li>
			</ul>
		</div>
		
		<div id="map" class="main_map" style="width:100%;height:400px;"></div>
		
		<script>
			var container = document.getElementById('map');
			var options = {
				center: new daum.maps.LatLng(33.450701, 126.570667),
				level: 3
			};
			
			//마커 이미지 관련 로직 ------------
			var imageSrc = '/img/marker.png', // 마커이미지의 주소입니다    
		    imageSize = new daum.maps.Size(35,47), // 마커이미지의 크기입니다
		    imageOption = {offset: new daum.maps.Point(14,47)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
		      
			// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
			var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption);
			//마커 이미지 로직 끝 ------------
			
			var polylineOption = {map: map, // 선을 표시할 지도 객체 
				endArrow: true, // 선의 끝을 화살표로 표시되도록 설정한다,
				strokeWeight: 4, // 선의 두께
				strokeColor: '#2B8054', // 선 색
				strokeOpacity: 0.7, // 선 투명도
				strokeStyle: 'groove' // 선 스타일
				};
		
			//폴리라인 객체 생성 및 옵션을 파라미터로 넣어준다. 
			var polyline = new daum.maps.Polyline(polylineOption); 
			var polylinePosition = [];
			
			var map = new daum.maps.Map(container, options);
			var bounds = new daum.maps.LatLngBounds();
			
			function addMarker(position){
				  // 마커를 생성합니다
			    var marker = new daum.maps.Marker({
			    	image: markerImage, // 마커이미지 설정 
			    	draggable: false, //드래그 여부
			        position: position
			    });
			    
				bounds.extend(position);
			    // 마커가 지도 위에 표시되도록 설정합니다
			    marker.setMap(map);
			    
			    polylinePosition.push(position);
			    polyline.setPath(polylinePosition);
			    
			    polyline.setMap(map);
			    
			}
			
			<c:forEach items="${mapMarkerList}" var="mapMarker">
				addMarker(new daum.maps.LatLng(${mapMarker.mapmark_y_coor}, ${mapMarker.mapmark_x_coor}));
			</c:forEach>
			
			map.setBounds(bounds);
		</script>
		
		<div class="essay_calendat_btn essay_calendar1"></div>
		<div class="essay_calendar">
			<table>
				<colgroup>
					<col width="20%">
					<col width="20%">
					<col width="20%">
					<col width="20%">
					<col width="20%">
				</colgroup>
				<tbody>
					<tr>
						<th><i class="fa fa-calendar-alt"></i> 날짜</th>
						<th><i class="fas fa-city"></i> 도시</th>
						<th><i class="fas fa-bus"></i> 교통</th>
						<th><i class="far fa-calendar-alt"></i> 일정</th>
						<th><i class="fas fa-bed"></i> 숙소</th>
					</tr>
					
					<c:forEach items="${dailyPlanList}" var="dailyPlanVo">
						<tr>
							<td>
							 <fmt:parseDate var="date" value="${dailyPlanVo.dailyplan_day}" pattern="yyyy-MM-dd"/>
								<span><fmt:formatDate value="${dailyPlanVo.dailyplan_day}" pattern="MM월dd일(E)"/></span><br>
								<b>DAY ${dailyPlanVo.dailyplan_order}</b>
							</td>
							<td>
								${dailyPlanVo.dailyplan_area}
							</td>
							<td>
								${dailyPlanVo.dailyplan_traffic}
							</td>
							<td>
								${dailyPlanVo.dailyplan_cnt}
							</td>
							<td>
								${dailyPlanVo.dailyplan_room}
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		
		<br/><br/>
		<div class="view_btn">
			<ul>
				<li class="essay_filterLi">
					<a href="/main/mypage"><input class="btn_bd col_03 " type="submit" value="목록"></a>
				</li>
				<li class="essay_filterLi">
					<a href="/main/mypage"><input class="btn_bd col_02 " type="button" value="뒤로"></a>
				</li>
			</ul>
		</div> 
	</div>
	
</div>	

<%@include file="../../tail.jsp" %> 