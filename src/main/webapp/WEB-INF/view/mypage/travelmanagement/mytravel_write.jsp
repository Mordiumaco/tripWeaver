<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../head.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/js/font-awesome/css/font-awesome.min.css">   
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a5f2e82aa9bad5f393255b6d8c3200cb&libraries=services"></script>

<script type="text/javascript">

function goMypage(){
	location.href = '/main/mypage'
}

</script>

<form method="post" action="/myplan/mytravel_write2" onsubmit="return checkData()" >

<div class="sub_container">
	
	<h1 class="mypage_title">나의여행 일정 작성</h1>

	<div id="map" class="main_map" style="width:100%;height:400px;"></div>
	
	<div class="markerSchedule">
		<ul class="markerSchedule_bg">
			<li><i class="fa fa-thumbtack"></i> 설정한 마커의 주소를 보여줍니다.</li>
			<li><i class="fa fa-calendar-alt" ></i> 일정 날자 정하기</li>
		</ul>
		<!-- <ul class="testSchedule">
			<li> <i class="fa fa-thumbtack"></i> 테스트용</li>
			<li> <i class="fa fa-calendar-alt" ></i> Day : <input id="testday" type="number" required placeholder="1박 ( ex:1 ) "> <b>박</b></li>
		</ul> -->
	</div>
	
	<div class="selectdeparturedate">
		<ul>
			<li><b>출발일 선택하기</b></li>
			<li><input id="datepicker" name="departDate" class="datepicker" type="text"  name="start" placeholder="출발일" style="width: 35%" readonly="readonly" required></li>
		</ul>
	</div>
	
	<br/><br/>
	<div class="view_btn">
		<ul>
			<li class="essay_filterLi">
				<input class="btn_bd col_03 " type="submit" value="다음" >
			</li>
			<li class="essay_filterLi">
				<input class="btn_bd col_02 " type="button" onclick="goMypage();" value="취소">	 					
			</li>
		</ul>
	</div> 

	
</div>	

	<input id="positionInfo" name="positionInfo" type="hidden" value=""/>
	
</form>
	<script>
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
	
		function addMarkerInfoAndArea(detailAddr){
			var markerInfoAndArea  = '<ul>';
			markerInfoAndArea += '<li> <i class="fa fa-thumbtack"></i>'+detailAddr+'</li>';
			markerInfoAndArea += '<li> <i class="fa fa-calendar-alt" ></i> Day : <input name="days" type="number" placeholder="1박 ( ex:1 )" required> <b>박</b></li>';
			markerInfoAndArea += '</ul>';
			
			//만약에 마커가 10개 이상이 생기면..
			/* var markerLength = $(".markerSchedule_bg").siblings().length;
			if(markerLength > 10){
				alert('마커의 개수는 10개 이상 만들 수 없습니다.');
				return;
			} 
			*/
			
			$(".markerSchedule").append(markerInfoAndArea);
		}	
		
		var totalObj = new Object();
		var jsonInfo;
		// 주소-좌표 변환 객체를 생성
		var geocoder = new daum.maps.services.Geocoder();
		
		var container = document.getElementById('map');
		var options = {
			  center : new daum.maps.LatLng(35.7683, 128.708), // 지도의 중심좌표
		      level : 13 // 지도의 확대 레벨
		};
	
		var map = new daum.maps.Map(container, options);
		
		// 지도를 클릭했을때 클릭한 위치에 마커를 추가하도록 지도에 클릭이벤트를 등록합니다
		daum.maps.event.addListener(map, 'click', function(mouseEvent) {        
		    // 클릭한 위치에 마커를 표시합니다 
		    addMarker(mouseEvent.latLng);             
		});
		
		//마커 이미지 관련 로직 ------------
		var imageSrc = '/img/marker.png', // 마커이미지의 주소입니다    
	    imageSize = new daum.maps.Size(35,47), // 마커이미지의 크기입니다
	    imageOption = {offset: new daum.maps.Point(14,47)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
	      
		// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
		var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption);
		//마커 이미지 로직 끝 ------------
		
		
		//선 객체 관련 옵션
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
		//상세 주소에 대한 배열
		var addressFullNames = [];
		//시도에 대한 배열 
		var sidoNames = [];
		
		//시군구에 대한 배열 
		var sigunguNames = [];
		
		//읍명동에 대한 배열
		var enbmyeondongNames = [];
		
		// 지도에 표시된 마커 객체를 가지고 있을 배열입니다
		var markers = [];

		// 마커 하나를 지도위에 표시합니다 
		//addMarker(new daum.maps.LatLng(33.450701, 126.570667));

		// 마커를 생성하고 지도위에 표시하는 함수입니다
		function addMarker(position) {
			
			//중복값 처리 로직-------------
			
			markers.forEach(function(element){
				let markersPostion = element.getPosition();
				if(markersPostion.ib === position.ib && markersPostion.jb === position.jb){
					alert('중복된 위치입니다.');
					return;
				}				
			});
			 
			
			//중복값 처리 로직 끝-------
			
			//마커 개수가 10개 이상이면 최재현은 바보된다.
			var markerLength = $(".markerSchedule_bg").siblings().not(".testSchedule").length;
			if(markerLength > 9){
				alert('마커의 개수는 10개 이상 만들 수 없습니다.');
				return;
			} 
			
		    // 마커를 생성합니다
		    var marker = new daum.maps.Marker({
		    	image: markerImage, // 마커이미지 설정 
		    	draggable: false, //드래그 여부
		        position: position
		    });

		    
		    
		    
		    // 마커가 지도 위에 표시되도록 설정합니다
		    marker.setMap(map);
		    
		    // 생성된 마커를 배열에 추가합니다
		    markers.push(marker);
		    
		    //표시 선
		    polylinePosition.push(position);
		    
		    polyline.setMap(map);
		    
		    polyline.setPath(polylinePosition);
		    
		    searchDetailAddrFromCoords(position, function(result, status) {
		        if (status === daum.maps.services.Status.OK) {
		        	//
		            var detailAddr =  result[0].address.address_name;
		        	let sido = result[0].address.region_1depth_name;
		        	let sigungu = result[0].address.region_2depth_name;
		        	let enbmyeondong = result[0].address.region_3depth_name;
		            //var detailAddr2 =  result[0].address.region_3depth_name;
		            
		            //마커에 대한 정보 UL HTML 에 담는다. 
				    addressFullNames.push(detailAddr);
		            sidoNames.push(sido);
		            sigunguNames.push(sigungu);
		            enbmyeondongNames.push(enbmyeondong);
				    addMarkerInfoAndArea(detailAddr);
				    
				    totalObj.positions = polylinePosition;
				    totalObj.address_names = addressFullNames;
				    totalObj.sidoNames = sidoNames;
				    totalObj.sigunguNames = sigunguNames;
				    totalObj.enbmyeondongNames = enbmyeondongNames;
				    
				    jsonInfo = JSON.stringify(totalObj);
				    console.log(jsonInfo);
				    document.getElementById("positionInfo").value = jsonInfo;
		        }   
		    });
		    
		    /* for(let i = 0; i < markers.length; i++){
		    	
		    	if(i>0){
		    		document.getElementById("markers").value += markers[i].value;	
		    		 var jsonInfo = JSON.stringify(totalObj.markers);
		    		 console.log(jsonInfo); //브라우저 f12개발자 모드에서 confole로 확인 가능
		    	}else{
		    		document.getElementById("markers").value = markers[i];
		    		var jsonInfo = JSON.stringify(totalObj.markers);
		    		 console.log(jsonInfo); //브라우저 f12개발자 모드에서 confole로 확인 가능
		    	}
		    } */
		    
		    
		    
		    //마커에 대한 정보 UL HTML 에 담는다. 
		    //addMarkerInfoAndArea();
		    
		    //오른쪽을 클릭했을때 해당 마커를 지운다.
		    daum.maps.event.addListener(marker, 'rightclick', function(){
				let idx = markers.indexOf(marker);
				if(idx > -1){
					setMarkers(null);
					markers.splice(idx, 1);
					setMarkers(map);
					//맵 마커와 일치하는 인덱스에 해당하는 라인 해당하는 좌표 부분을 지운다.
					polylinePosition.splice(idx,1);
					//이미 해당 폴리라인에 맵 설정을 이미 해놨기 때문에 맵 설정은 따로 더 할필요 없고
					//폴리라인 포지션 배열만 다시 폴리라인 객체에 set 해준다.  
					polyline.setPath(polylinePosition);
					//해당 마커 정보를 저장할 html input절을 지운다
					$(".markerSchedule_bg").siblings().not(".testSchedule")[idx].remove();
					addressFullNames.splice(idx,1);
					sidoNames.splice(idx,1);
					sigunguNames.splice(idx,1);
					enbmyeondongNames.splice(idx,1);
					
					//지웠으므로 다시 지운 포지션 좌표를 다시 json 객체에 넣어준다. 
					totalObj.positions = polylinePosition;
					totalObj.address_names = addressFullNames;
					totalObj.sidoNames = sidoNames;
					totalObj.sigunguNames = sigunguNames;
					totalObj.enbmyeondongNames = enbmyeondongNames;
					jsonInfo = JSON.stringify(totalObj);
					console.log(jsonInfo);
					document.getElementById("positionInfo").value = jsonInfo;
					
				}
			});
		    
		    /* 
		    마커 드래그엔드 우선 막아놓기 
		    나중에 추가하면 사용할 addListener
		    daum.maps.event.addListener(marker, 'dragend', function() {
		    }); */
		    
		 
		    
		    
		    //huskdoll.tistory.com/11 JSON 관련 사이트
		    
		}

		//정보 요청
		function searchDetailAddrFromCoords(coords, callback) {
		    // 좌표로 법정동 상세 주소 정보를 요청합니다
		    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
		}

		
		// 배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수입니다
		function setMarkers(map) {
		    for (var i = 0; i < markers.length; i++) {
		        markers[i].setMap(map);
		    }    
		}

	/* 	// "마커 보이기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에 표시하는 함수입니다
		function showMarkers() {
		    setMarkers(map)    
		}

		// "마커 감추기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에서 삭제하는 함수입니다
		function hideMarkers() {
		    setMarkers(null);    
		} */
		
		//form 관련 기능
		function checkData(){
			
			//달력에 값이 있는지 확인 
			var dateChecker = document.getElementById("datepicker").value;
			var formChecker = true;
			
			//달력 관련 input에 값이 없거나 공백이면 다시 입력하라고 한다. 
			if(dateChecker == "" || dateChecker == null){
				alert("출발일을 정해주세요");
				
				return false;
				
			}else{
				
				//days check 로직 추가(2019.01.06 추가)
				$(':input[name=days]').each(function(index){
					
					let days = parseInt($(this).val());
					
					if(days < 0){
						alert('0보다 작은 수는 적용할 수 없습니다.')
						formChecker = false;
						return;
					}
				});
				
				
				if(formChecker){
					return true;					
				}else{
					return false;
				}
				
			}
			
			
			
		}
	
	
		
	</script>
	

<%@include file="../../tail.jsp" %> 