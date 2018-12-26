<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../head.jsp" %>

<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/js/font-awesome/css/font-awesome.min.css">
<script src="/SE2/js/HuskyEZCreator.js"></script>
<script>
	$(function(){
		//에디터 섹션
		var oEditors = [];

		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors, // 전역변수 명과 동일해야 함.
			elPlaceHolder : "smarteditor", // 에디터가 그려질 textarea ID 값과 동일 해야 함.
			sSkinURI : "/SE2/SmartEditor2Skin.html", // Editor HTML
			fCreator : "createSEditor2", // SE2BasicCreator.js 메소드명이니 변경 금지 X
			htParams : {
				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseToolbar : true,
				// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseVerticalResizer : true,
				// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
				bUseModeChanger : true, 
			}
		});
		
		// 전송버튼 클릭이벤트
		$("#savebutton").click(function(){
			if(confirm("저장하시겠습니까?")) {
				// id가 smarteditor인 textarea에 에디터에서 대입
				oEditors.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []);
				// 이부분에 에디터 validation 검증
				$(this).parents("#frm").submit();
			}
		});
		
		// 필수값 Check
		function validation(){
			var contents = $.trim(oEditors[0].getContents());
			if(contents === '<p>&nbsp;</p>' || contents === ''){ // 기본적으로 아무것도 입력하지 않아도 <p>&nbsp;</p> 값이 입력되어 있음. 
				alert("내용을 입력하세요.");
				oEditors.getById['smarteditor'].exec('FOCUS');
				return false;
			}
			return true;
		}
	});
	
</script>

<script type="text/javascript">
function button_event(){
	if (confirm("정말 삭제하시겠습니까??")){    //확인
		$('.layer1').fadeOut();
	    e.preventDefault();
	}else{   //취소
		alert("삭제취소"); //취소시 이벤트 처리
		return;
	}
}

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



function layer_open1(el){

  var temp = $('#' + el);
  var bg = temp.prev().hasClass('bg');    //dimmed 레이어를 감지하기 위한 boolean 변수

  if(bg){
     $('.layer1').fadeIn();  //'bg' 클래스가 존재하면 레이어가 나타나고 배경은 dimmed 된다. 
  }else{
     temp.fadeIn();
  }

  // 화면의 중앙에 레이어를 띄운다.
  if (temp.outerHeight() < $(document).height() ) temp.css('margin-top', '-'+temp.outerHeight()/2+'px');
  else temp.css('top', '0px');
  if (temp.outerWidth() < $(document).width() ) temp.css('margin-left', '-'+temp.outerWidth()/2+'px');
  else temp.css('left', '0px');

  temp.find('a.cbtn').click(function(e){
     if(bg){
        $('.layer1').fadeOut(); //'bg' 클래스가 존재하면 레이어를 사라지게 한다. 
     }else{
        temp.fadeOut();
     }
     e.preventDefault();
  });

  $('.bg').click(function(e){ //배경을 클릭하면 레이어를 사라지게 하는 이벤트 핸들러
     $('.layer1').fadeOut();
     e.preventDefault();
  });
}

$(document).ready(function(){
	$('.layer_con_sub').on('click','.layer_con_subLi', function() {
		
		var index = $('.layer_con_sub .layer_con_subLi').index(this);
		
		if($(".layer_con_sub .layer_con_subLi:eq("+ index + ")").find("input[name='calendarSelection']").is("checked") == false){
			$(".layer_con_sub .layer_con_subLi:eq("+ index + ")").find("input[name='calendarSelection']").prop("checked", true); /* by ID */
		}
		
	});
});

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

$( function() {
    $('#datepicker1').datepicker({
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
	var j = $('.essay_calendar3 tr').length;
	console.log (j);
	
	$(".plus_btn").on("click",function(){
		if( j < 5){
			j++;
			$(".essay_calendar3 table tbody").append("<tr class='dateTr"+ j +"'> <td><input id='datepicker"+ j +"' class='datepicker' type='text'  name='start' placeholder='출발일' style='width: 70%' readonly='readonly'></td> <td><input id='datepicker"+ j+j +"' class='datepicker' type='text'  name='end' placeholder='종료일' style='width: 70%' readonly='readonly'></td><td><input type='number' placeholder='숫자로 표기하세요.'></td><td></td><td></td></tr>");
			
		} else {
			alert(" 최대 4개 까지 입니다.");
			return ;	
		}
		
		$( function() {
		    $("#datepicker"+ j +"").datepicker({
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
		
		$( function() {
		    $("#datepicker"+ j+j +"").datepicker({
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
		
	});
	
	$(".minus_btn").on("click",function(){
	 if(j<3){
            return false;
        }else{
   			$('table tbody .dateTr'+j).remove();
   			j--;
        }
	});
	
	
	call();
});

function call()
{
  document.getElementById('sell5').value =parseInt(document.getElementById('sell1').value) + parseInt(document.getElementById('sell2').value) + parseInt(document.getElementById('sell4').value) + parseInt(document.getElementById('sell2').value);
  document.getElementById('sell6').value = parseInt(document.getElementById('sell5').value)/parseInt($("#tripplan_days").val());
}

</script>


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a5f2e82aa9bad5f393255b6d8c3200cb"></script>

<style>
#container { width: 100%;}

.bo_vc_act:after { clear: inherit; }

.view_con { border: 1px solid #ddd; margin-top: 20px; width: 100%;}
.essay_calendar th { text-align: center;}
.essay_filterLi { display:block !important; padding: 0 !important;}
.essay_filterLi b input[type=number] { width: 84px;}
.myCalendar_btn { padding: 10px;  cursor: pointer; width: 100%; height:45px; line-height:24px; display: block; font-size: 1.2em; font-weight: bold; text-align: center; border-radius: 30px; color: #fff !important;}
.myCalendar_btn:hover { background: #389e7d;}
.view_title input { width: 95.5%; padding: 10px 0px; padding-left: 10px;}
</style>


<div class="sub_container">
	<form name="essayFoam" id="frm" action="/essay/essayUpdateForm" method="post">
	<div class="essayLeft">
		<div class="main_con" id="main_con">
			<div id="container">

				<h1 class="mypage_title">Essay 글 수정</h1>
		
				<!-- <div>
					<a href="javascript::" onclick="layer_open1('layer_1');return false;" class="btn_bd col_03 myCalendar_btn">나의 여행 일정 선택하기</a>
				</div> -->
				
				<br/>
				
				<%-- 나의 일정을 클릭하면 나오는 정보 시작 --%>
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
					
					<ul>
						<input type="hidden" id="tripplan_days" value="${tripplanVo.tripplan_days}"/>
						<li class="essay_filterLi">식비 : <b><input type="number" name="essay_meal_exp" id="sell1" value="${essayVo.essay_meal_exp}" onkeyup="call()"> 원</b></li>
						<li class="essay_filterLi">숙박비 : <b><input type="number" name="essay_room_exp" id="sell2" value="${essayVo.essay_room_exp}" onkeyup="call()"> 원</b></li>
						<li class="essay_filterLi">교통비 : <b><input type="number" name="essay_traffic_exp" id="sell3" value="${essayVo.essay_traffic_exp}" onkeyup="call()"> 원</b></li>
						<li class="essay_filterLi">기타 : <b><input type="number" name="essay_other_exp" id="sell4" value="${essayVo.essay_other_exp}" onkeyup="call()"> 원</b></li>
						<li class="essay_filterLi">총비용 : <b><input type="number" readonly="readonly" id="sell5"> 원</b></li>
						<li class="essay_filterLi">하루평균비용 : <b><input type="number" readonly="readonly" id="sell6"> 원</b></li>
					</ul>
				</div>
				<br/>
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
						<tr>
							<th><i class="fa fa-calendar-alt" ></i> 날짜</th>
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
					</table>
				</div>
				
				<%-- 나의 일정을 클릭하면 나오는 정보 끝 --%>
				
				
					<h2 class="view_title">제목: <input type="text" name="essay_title" value="${essayVo.essay_title}" placeholder="제목을 적어주세요."></h2>
					<input type="hidden" name="essay_id" value="${essayVo.essay_id}">
					<p class="view_con">
						<textarea id="smarteditor" name="essay_cnt" rows="10" cols="100" style="width:100%; height:600px;">${essayVo.essay_cnt}</textarea>						 
					</p>
					
					
					<br/><br/><br/>

					<div class="view_btn">
						<ul>
							<li class="essay_filterLi">
								<input class="btn_bd col_03 " type="submit" id="savebutton" value="수정">
							</li>
							<li class="essay_filterLi">
								<input class="btn_bd col_02 " type="button" onclick="button_event();" value="취소">	 					
							</li>
						</ul>
					</div>
				

				
			</div>
		</div>

	</div>
	</form>
</div>






<%@include file="../tail.jsp" %> 