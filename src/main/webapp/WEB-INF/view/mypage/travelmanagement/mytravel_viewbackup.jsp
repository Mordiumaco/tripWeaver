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
		<h1 class="mypage_title">제목: 제목을 보여줘~~~ <a href="">수정</a></h1>
		
		<div class="essay_filter">
			<ul>
				<li>테마 : <b>먹거리 여행</b></li>
				<li>여행일수 : <b>3박 4일</b></li>
				<li>구성원별 : <b>커플 여행</b></li>
			</ul>
		</div>
		
		<div id="map" class="main_map" style="width:100%;height:400px;"></div>
		
		<script>
			var container = document.getElementById('map');
			var options = {
				center: new daum.maps.LatLng(33.450701, 126.570667),
				level: 3
			};
		
			var map = new daum.maps.Map(container, options);
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
					
					<tr>
						<td>
							<span>11월27일(금)</span><br>
							<b>DAY 1</b>
						</td>
						<td>
							미시령<br>
							대관령
						</td>
						<td>
							수영<br>
							달리기<br>
							자전거<br>
						</td>
						<td>
							상세 일정 수영 1km<br>
							상세 일정 달리기 5km<br>
							상세 일정 자전거 10km<br>
						</td>
						<td>
							신문지<br>
							골판지 박스<br>
							지하철<br>
						</td>
					</tr>
					
					<tr>
						<td>
							<span>11월27일(금)</span><br>
							<b>DAY 2</b>
						</td>
						<td>
							미시령<br>
							대관령
						</td>
						<td>
							수영<br>
							달리기<br>
							자전거<br>
						</td>
						<td>
							상세 일정 수영 1km<br>
							상세 일정 달리기 5km<br>
							상세 일정 자전거 10km<br>
						</td>
						<td>
							신문지<br>
							골판지 박스<br>
							지하철<br>
						</td>
					</tr>
					
					<tr>
						<td>
							<span>11월27일(금)</span><br>
							<b>DAY 3</b>
						</td>
						<td>
							미시령<br>
							대관령
						</td>
						<td>
							수영<br>
							달리기<br>
							자전거<br>
						</td>
						<td>
							상세 일정 수영 1km<br>
							상세 일정 달리기 5km<br>
							상세 일정 자전거 10km<br>
						</td>
						<td>
							신문지<br>
							골판지 박스<br>
							지하철<br>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<br/><br/>
		<div class="view_btn">
			<ul>
				<li class="essay_filterLi">
					<input class="btn_bd col_03 " type="submit" value="목록">
				</li>
				<li class="essay_filterLi">
					<input class="btn_bd col_02 " type="button" onclick="button_event();" value="뒤로">	 					
				</li>
			</ul>
		</div> 
	</div>
	
</div>	

<%@include file="../../tail.jsp" %> 