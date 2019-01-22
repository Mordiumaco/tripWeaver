<%@page import="kr.co.tripweaver.util.file.FilePath"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../head.jsp" %>

<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/js/font-awesome/css/font-awesome.min.css">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=<%=FilePath.MAPKEY%>"></script>
<script src="/SE2/js/HuskyEZCreator.js"></script>
<script type="text/javascript">
	 // 개발되어 있는 소스에 맞추느라, 전역변수로 사용하였지만, 지역변수로 사용해도 전혀 무관 함.
	var oEditors = [];
	var oEditors2 = [];
	var boardCount = 0;
	$(document).ready(function() {
		
		function createBoard(){
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
			
		
		}
	
		createBoard();
		/* nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors2, 
			elPlaceHolder : "smarteditor2", // 에디터가 그려질 textarea ID 값과 동일 해야 함.
			sSkinURI : "/SE2/SmartEditor2Skin.html", // Editor HTML
			fCreator : "createSEditor2", // SE2BasicCreator.js 메소드명이니 변경 금지 X
			htParams : {
				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseToolbar : true,
				// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseVerticalResizer : true,
				// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
				bUseModeChanger : true, 
			},
			fOnAppLoad : function(){
				oEditors2.getById["smarteditor2"].exec("PASTE_HTML", ["ㅎㅇ"]);
				$('#smart_editor2_content').hide();
			}
			
		}); */
		
	
		// 전송버튼 클릭이벤트
		$("#savebutton").click(function(){
			if(confirm("저장하시겠습니까?")) {
				// id가 smarteditor인 textarea에 에디터에서 대입
				oEditors.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []);
				// 이부분에 에디터 validation 검증
				let titleValue = $('#web1').find(':input[name=essay_title]').val();
				let formCheck = true;
				
				if(titleValue == '' || titleValue < 5){
					alert('제목을 적어주세요 [5자 이상]');
					return false;
				}
				
				$('#web1').find(':input[type=number]').each(function(index){
					
					let moneyValue = $(this).val();
					
					
					if(moneyValue != ''){
				     	var regNumber =  /^[0-9+]*$/;
				         if(!regNumber.test(moneyValue))
				         {
				             alert('숫자만 적어주세요');
				             formCheck = false;
				             return false;
				         }
				    }else{
				    	alert('비어있는 내용 및 비용값을 적어주세요');
				    	formCheck = false;
				    	return false;
				    }
					
					if(moneyValue < 0){
						 alert('0 미만의 숫자를 적지 말아주세요.');
						 formCheck = false;
						 return false;
					}
					
					
				});
				
				if(formCheck){
					$(this).parents("#frm").submit();
				}
			}
		});
		
		// 전송버튼 클릭이벤트
		$("#savebutton2").click(function(){
			if(confirm("저장하시겠습니까?")) {
				// id가 smarteditor인 textarea에 에디터에서 대입
				oEditors2.getById["smarteditor2"].exec("UPDATE_CONTENTS_FIELD", []);
				// 이부분에 에디터 validation 검증
				let titleValue = $('#web2').find(':input[name=essay_title]').val();
				let formCheck = true;
				
				if(titleValue == '' || titleValue < 5){
					alert('제목을 적어주세요 [5자 이상]');
					return false;
				}
				
				$('#web2').find(':input[type=number]').each(function(index){
					
					let moneyValue = $(this).val();
					
					
					if(moneyValue != ''){
				     	var regNumber =  /^[0-9+]*$/;
				         if(!regNumber.test(moneyValue))
				         {
				             alert('숫자만 적어주세요');
				             formCheck = false;
				             return false;
				         }
				         moneyValue = parseInt(moneyValue);
				    }else{
				    	alert('비어있는 내용 및 비용값을 적어주세요');
				    	formCheck = false;
				    	return false;
				    }
					
					if(moneyValue < 0){
						 alert('0 미만의 숫자를 적지 말아주세요.');
						 formCheck = false;
						 return false;
					}
					
					
				});
				
				
				//가이드 인원 수 체크
				$('#web2').find(':input[name= guideplan_peo_count]').each(function(index){
					let guidePeoCount = parseInt($(this).val());
					
					if(guidePeoCount < 0 || guidePeoCount ==0){
						alert("해당 인원은 1명 이상의 인원을 입력해주세요.");
						formCheck = false;
					}
				});
				
				
				if(formCheck){
					$(this).parents("#frm").submit();
				}
			}
		});
		
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
	
	function validation2(){
		var contents = $.trim(oEditors2[0].getContents());
		if(contents === '<p>&nbsp;</p>' || contents === ''){ // 기본적으로 아무것도 입력하지 않아도 <p>&nbsp;</p> 값이 입력되어 있음. 
			alert("내용을 입력하세요.");
			oEditors2.getById['smarteditor2'].exec('FOCUS');
			return false;
		}
	
		return true;
	}
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
	$('.essay_filter').hide();
	$('.view_title').hide();
	$('.essay_calendar3').hide();
	$('.essay_calendat_btn').hide();
	$('.essay_calendar').hide();
	$('#map').hide();
	$('#map2').hide();
	
	
	$('#container').on('click','.essay_calendat_btn',function () {
		$('.essay_calendar').hide('slow'); 
		$('.essay_calendat_btn').addClass('essay_calendar2');
	});  
	
	$('#container').on('click','.essay_calendar2',function () {
		$('.essay_calendar').show('slow'); 
		$('.essay_calendat_btn').removeClass('essay_calendar2');
	});  
});


// 기본형식
$(function(){
	$('.content li').hide();
	$('.content li#web1').show();
	$('.tab a').click(function(){
		$('.tab a').removeClass('select');
		//모든 a태그에 select 클래스 없애준다.
		$(this).addClass('select');
		//클릭한 a태그에 select 클래스 적용
		$('.content li').hide();//모든 내용을 안보이게 해줌
		$($(this).attr('href')).slideDown();
		
		if(boardCount == 0){
			nhn.husky.EZCreator.createInIFrame({
				oAppRef : oEditors2, 
				elPlaceHolder : "smarteditor2", // 에디터가 그려질 textarea ID 값과 동일 해야 함.
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
			boardCount++;
		}
		
		//$(".view_con2 iframe").height("649px").focus();
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
      dateFormat: "yy-mm-dd",
      minDate: 0
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
      dateFormat: "yy-mm-dd",
    });
} );


$(document).ready(function(){
	var j = $('.essay_calendar3 tr').length;
	console.log (j);
	
	$(".plus_btn").on("click",function(){
		if( j < 5){
			j++;
			
			$(".essay_calendar3 table tbody").append("<tr class='dateTr"+ j +"'> <td><input name='guideplan_start_day' id='datepicker"+ j +"' class='datepicker' type='text'  name='start' placeholder='출발일' style='width: 70%' readonly='readonly'></td> <td><input name='guideplan_end_day' id='datepicker"+ j+j +"' class='datepicker' type='text'  name='end' placeholder='종료일' style='width: 70%' readonly='readonly'></td><td><input name='guideplan_peo_count' type='number' placeholder='인원 정원을 적어주세요.'></td><td></td><td></td></tr>");
			
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
});


function call()
{
  document.getElementById('sell5').value =parseInt(document.getElementById('sell1').value) + parseInt(document.getElementById('sell2').value) + parseInt(document.getElementById('sell4').value) + parseInt(document.getElementById('sell2').value);
  document.getElementById('sell6').value = parseInt(document.getElementById('sell5').value)/parseInt($("#tripplan_days").val());
  
  document.getElementById('gsell5').value =parseInt(document.getElementById('gsell1').value) + parseInt(document.getElementById('gsell2').value) + parseInt(document.getElementById('gsell4').value) + parseInt(document.getElementById('gsell2').value);
  document.getElementById('gsell6').value = parseInt(document.getElementById('gsell5').value)/parseInt($("#tripplan_days").val());
}




	//선택한 tripplan을 에세이 글에 뿌려주는 역할을 하는 기능
	function selectTripplan(){
		let selTripplan = encodeURI($(":input:radio[name=calendarSelection]:checked").val());
		
		 $.ajax({
				type: "GET",
				url:"/essay/essayTripplanAjax",
				data : {"selTripplan" : selTripplan},
				success : function(data){
					setMarkers(null);
					setMarkers2(null);
					
					markers = [];
					markers2 = [];
					console.log(data);
					bounds = new daum.maps.LatLngBounds();
					polylinePosition = [];
					bounds2 = new daum.maps.LatLngBounds();
					polylinePosition2 = [];
					
					//----dailyPlan section 
					$(".dailyPlanSection").html("");
					let dailyPlanHead = "";
					
					dailyPlanHead += '<colgroup><col width="20%"><col width="20%"><col width="20%"><col width="20%"><col width="20%"></colgroup>';
					dailyPlanHead += '<tr>';
					dailyPlanHead += '<th><i class="fa fa-calendar-alt" ></i> 날짜</th>';
					dailyPlanHead += '<th><i class="fas fa-city"></i> 도시</th>';
					dailyPlanHead += '<th><i class="fas fa-bus"></i> 교통</th>';
					dailyPlanHead += '<th><i class="far fa-calendar-alt"></i> 일정</th>';
					dailyPlanHead += '<th><i class="fas fa-bed"></i> 숙소</th>';
					dailyPlanHead += '</tr>';
					
					$(".dailyPlanSection").append(dailyPlanHead);
					
					$(data.mapMarkerList).map(function(i, mapMarker) {
			        	
			        	bounds.extend(new daum.maps.LatLng(mapMarker.mapmark_y_coor, mapMarker.mapmark_x_coor));
			        	
			        	addMarker(new daum.maps.LatLng(mapMarker.mapmark_y_coor, mapMarker.mapmark_x_coor))
			           
			        });
					
					$(data.mapMarkerList).map(function(i, mapMarker) {
			        	
			        	bounds2.extend(new daum.maps.LatLng(mapMarker.mapmark_y_coor, mapMarker.mapmark_x_coor));
			        	
			        	addMarker2(new daum.maps.LatLng(mapMarker.mapmark_y_coor, mapMarker.mapmark_x_coor))
			           
			        });
					
					let theme = ""; 
					let peo_type = "";
					let season = "";
					
					switch(data.tripplanVo.tripplan_theme){
		    			case "1" : theme = "먹거리";
		    			break;
		    			case "2" : theme = "레저";
		    			break;
		    			case "3" : theme = "쇼핑";
		    			break;
		    			case "4" : theme = "자연";
		    			break;
		    			case "5" : theme = "문화";
		    			break;
		    			case "6" : theme = "축제";
		    			break;
	    			}
	    			
	    			switch(data.tripplanVo.tripplan_season){
		    			case "1" : season = "봄";
		    			break;
		    			case "2" : season = "여름";
		    			break;
		    			case "3" : season = "가을";
		    			break;
		    			case "4" : season = "겨울";
		    			break;
		    			case "5" : season = "무관";
		    			break;
		    			
					}
	    			
	    			
	    			switch(data.tripplanVo.tripplan_peo_type){
	    			
		    			case "1" : peo_type = "혼자";
		    			break;
		    			case "2" : peo_type = "커플";
		    			break;
		    			case "3" : peo_type = "친구";
		    			break;
		    			case "4" : peo_type = "가족";
		    			break;
		    			case "5" : peo_type = "단체";
		    			break;
		    			case "6" : peo_type = "여자끼리";
		    			break;
		    			case "7" : peo_type = "남자끼리";
		    			break;
					}
						

					$(".theme").text(theme); 
					$(".season").text(season); 
					$(".peo_count").text(data.tripplanVo.tripplan_peo_count); 
					$(".peo_type").text(peo_type); 
					$(".days").text((data.tripplanVo.tripplan_days-1)+"박 "+data.tripplanVo.tripplan_days+"일"); 
	    			$("#tripplan_days").val(data.tripplanVo.tripplan_days);
					$("#tripplan_id").val(data.tripplanVo.tripplan_id);
					$("#tripplan_id2").val(data.tripplanVo.tripplan_id);
	    			call();
					
					
					$(data.dailyPlanList).map(function(i, dailyPlanVo) {
			        	let dailyDate = new Date(dailyPlanVo.dailyplan_day);
			        	let dailyDay = "";
			        	switch(dailyDate.getDay()){
			        	case 0: 
			        		dailyDay ="일";
			        		break;
			        	case 1: 
			        		dailyDay ="월";
				        	break;
			        	case 2: 
			        		dailyDay ="화";
				        	break;
			        	case 3: 
			        		dailyDay ="수";
				        	break;
			        	case 4: 
			        		dailyDay ="목";
				        	break;
			        	case 5: 
			        		dailyDay ="금";
				        	break;
			        	case 6: 
			        		dailyDay ="토";
				        	break;
			        	}
			        	
						let dailyDateFormat = dailyDate.getMonth()+1+"월 "+dailyDate.getDate()+"일("+dailyDay+")";
			        	
			        	let dailyPlanContent = "";
			        	dailyPlanContent += "<tr>";
			        	dailyPlanContent += "<td>";
			        	dailyPlanContent += "<span>"+dailyDateFormat+"<span>";
			        	dailyPlanContent += "<b>DAY "+dailyPlanVo.dailyplan_order+"</b>";
			        	dailyPlanContent += "</td>";
			        	dailyPlanContent += "<td>";
			        	dailyPlanContent += ((dailyPlanVo.dailyplan_area==null) ?   " " : dailyPlanVo.dailyplan_area);
			        	dailyPlanContent += "</td>";
			        	dailyPlanContent += "<td>";
			        	dailyPlanContent += ((dailyPlanVo.dailyplan_traffic==null) ?  " " : dailyPlanVo.dailyplan_traffic);
			        	dailyPlanContent += "</td>";
			        	dailyPlanContent += "<td>";
			        	dailyPlanContent += ((dailyPlanVo.dailyplan_cnt==null) ?  " " : dailyPlanVo.dailyplan_cnt);
			        	dailyPlanContent += "</td>";
			        	dailyPlanContent += "<td>";
			        	dailyPlanContent += ((dailyPlanVo.dailyplan_room==null) ?  " " : dailyPlanVo.dailyplan_room);
			        	dailyPlanContent += "</td>";
			        	dailyPlanContent += "</tr>";
						
			        	$(".dailyPlanSection").append(dailyPlanContent);
			        });
					
					
					map.setBounds(bounds);
					map2.setBounds(bounds2);
					
					 $('.layer1').fadeOut();
					 
					 $('.essay_filter').show();
					 $('.view_title').show();
					 $('.essay_calendar3').show();
					 $('.essay_calendat_btn').show();
					 $('.essay_calendar').show();
					 $('#map').show();
					 $('#map2').show();
				}
			}); 
		
	}


	
	function setMarkers(map) {
	    for (var i = 0; i < markers.length; i++) {
	        markers[i].setMap(map);
	    }    
	}
	
	function setMarkers2(map) {
	    for (var i = 0; i < markers2.length; i++) {
	        markers2[i].setMap(map);
	    }    
	}
</script>




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
	
	<div class="essayLeft">
		<div class="main_con" id="main_con">
			<div id="container">
				<ul class="tab">
					<li><a href="#web1" class="select">일반 사용자</a></li>
					<c:if test="${loginInfo.mem_author eq 2}">
						<li><a href="#web2">가이드 사용자</a></li>
					</c:if>
				</ul>
				
				<ul class="content">
					<form action="/essay/insertEssayForm" method="post" id="frm">
					<li id="web1">
						<h1 class="mypage_title">Essay 글 작성</h1>
				
						<div>
							<a href="javascript::" onclick="layer_open1('layer_1');return false;" class="btn_bd col_03 myCalendar_btn">나의 여행 일정 선택하기</a>
						</div>
						
						<br/>
						
						<%-- 나의 일정을 클릭하면 나오는 정보 시작 --%>
						<div class="essay_filter">
							<ul>
								<li class="essay_filterLi">시즌 : <b class="season">일정필요</b></li>
								<li class="essay_filterLi">테마 : <b class="theme">일정필요</b></li>
								<li class="essay_filterLi">여행일수 : <b class="days">일정필요</b></li>
								<li class="essay_filterLi">구성원별 : <b class="peo_type">일정필요</b></li>
								<li class="essay_filterLi">총 인원수 : <b class="peo_count">일정필요</b></li>
							</ul>
							<ul>
								<!-- 히든으로 처리할값 처리 -->
								<input type="hidden" id="tripplan_days"/>
								<input type="hidden" id="tripplan_id" name="tripplan_id"/>
								<input type="hidden" id="essay_filter" name="essay_filter" value="N"/> 
								<li class="essay_filterLi">식비 : <b><input type="number" name="essay_meal_exp" id="sell1" onkeyup="call()"> 원</b></li>
								<li class="essay_filterLi">숙박비 : <b><input type="number" name="essay_room_exp" id="sell2" onkeyup="call()"> 원</b></li>
								<li class="essay_filterLi">교통비 : <b><input type="number" name="essay_traffic_exp" id="sell3" onkeyup="call()"> 원</b></li>
								<li class="essay_filterLi">기타 : <b><input type="number" name="essay_other_exp" id="sell4" onkeyup="call()"> 원</b></li>
								<li class="essay_filterLi">총비용 : <b><input type="number" readonly="readonly" id="sell5"> 원</b></li>
								<li class="essay_filterLi">하루평균비용 : <b><input type="number" readonly="readonly" id="sell6"> 원</b></li>
							</ul>
						</div>
						<br/>
						<div id="map" class="main_map" style="width:100%;height:400px;"></div>
			
						<script>
							var container = document.getElementById('map');
							var options = {
								center: new daum.maps.LatLng(35.7683, 128.708),
								level: 13
							};
							var markers = [];
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
							    
								markers.push(marker);
								bounds.extend(position);
							    // 마커가 지도 위에 표시되도록 설정합니다
							    marker.setMap(map);
							    
							    polylinePosition.push(position);
							    polyline.setPath(polylinePosition);
							    
							    polyline.setMap(map);
							    
							}
						</script>
						
						<div class="essay_calendat_btn essay_calendar1"></div>
						<div class="essay_calendar">
							<table class="dailyPlanSection">
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
							</table>
						</div>
						
						<%-- 나의 일정을 클릭하면 나오는 정보 끝 --%>
						
							<h2 class="view_title">제목: <input type="text" name="essay_title" placeholder="제목을 적어주세요."></h2>
							
							<p class="view_con">
								<textarea name="essay_cnt" id="smarteditor" rows="10" cols="100" style="width:100%; height:600px;"> </textarea> 
							</p>
							
							
							<br/><br/><br/>

							<div class="view_btn">
								<ul>
									<li class="essay_filterLi">
										<input class="btn_bd col_03 " type="button" id="savebutton" value="작성">
									</li>
									<li class="essay_filterLi">
										<a href="/main/main"><input class="btn_bd col_02 " type="button" value="취소"></a>					
									</li>
								</ul>
							</div>
					</li>
					</form>
					
					<form action="/essay/insertEssayFormForGuide" method="post" id="frm">
					<li id="web2">
						<h1 class="mypage_title">Essay 글 작성</h1>
				
						<div>
							<a href="javascript::" onclick="layer_open1('layer_1');return false;" class="btn_bd col_03 myCalendar_btn">나의 여행 일정 선택하기</a>
						</div>
						
						<br/>
						
						<%-- 나의 일정을 클릭하면 나오는 정보 시작 --%>
						<div class="essay_filter">
							<ul>
								<li class="essay_filterLi">시즌 : <b class="season">일정필요</b></li>
								<li class="essay_filterLi">테마 : <b class="theme">일정필요</b></li>
								<li class="essay_filterLi">여행일수 : <b class="days">일정필요</b></li>
								<li class="essay_filterLi">구성원별 : <b class="peo_type">일정필요</b></li>
								<li class="essay_filterLi">총 인원수 : <b class="peo_count">일정필요</b></li>
							</ul>
							
							<ul>
								<input type="hidden" id="tripplan_days">
								<input type="hidden" id="tripplan_id2" name="tripplan_id">
								<input type="hidden" id="essay_filter" name="essay_filter" value="G"/> 
								<li class="essay_filterLi">식비 : <b><input type="number" name="essay_meal_exp" id="gsell1" onkeyup="call()"> 원</b></li>
								<li class="essay_filterLi">숙박비 : <b><input type="number" name="essay_room_exp" id="gsell2" onkeyup="call()"> 원</b></li>
								<li class="essay_filterLi">교통비 : <b><input type="number" name="essay_traffic_exp" id="gsell3" onkeyup="call()"> 원</b></li>
								<li class="essay_filterLi">기타 : <b><input type="number" name="essay_other_exp" id="gsell4" onkeyup="call()"> 원</b></li>
								<li class="essay_filterLi">총비용 : <b><input type="number" readonly="readonly" id="gsell5"> 원</b></li>
								<li class="essay_filterLi">하루평균비용 : <b><input type="number" readonly="readonly" id="gsell6"> 원</b></li>
							</ul>
						</div>
						<br/>
						<div id="map2" style="width:100%;height:400px;"></div>
						
						<script>
							var container2 = document.getElementById("map2");
							var options2 = {
								center: new daum.maps.LatLng(35.7683, 128.708),
								level: 13
							};
							var markers2 = [];
							//마커 이미지 관련 로직 ------------
							var imageSrc2 = '/img/marker.png', // 마커이미지의 주소입니다    
							imageSize2 = new daum.maps.Size(35,47), // 마커이미지의 크기입니다
							imageOption2 = {offset: new daum.maps.Point(14,47)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
							  
							// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
							var markerImage2 = new daum.maps.MarkerImage(imageSrc2, imageSize2, imageOption2);
							//마커 이미지 로직 끝 ------------
	
							var polylineOption2 = {map: map2, // 선을 표시할 지도 객체 
								endArrow: true, // 선의 끝을 화살표로 표시되도록 설정한다,
								strokeWeight: 4, // 선의 두께
								strokeColor: '#2B8054', // 선 색
								strokeOpacity: 0.7, // 선 투명도
								strokeStyle: 'groove' // 선 스타일
								};
	
							//폴리라인 객체 생성 및 옵션을 파라미터로 넣어준다. 
							var polyline2 = new daum.maps.Polyline(polylineOption2); 
							var polylinePosition2 = [];
	
							var map2 = new daum.maps.Map(container2, options2);
							var bounds2 = new daum.maps.LatLngBounds();
	
							function addMarker2(position2){
								  // 마커를 생성합니다
							    var marker2 = new daum.maps.Marker({
							    	image: markerImage2, // 마커이미지 설정 
							    	draggable: false, //드래그 여부
							        position: position2
							    });
							    
								markers2.push(marker2);
								bounds2.extend(position2);
							    // 마커가 지도 위에 표시되도록 설정합니다
							    marker2.setMap(map2);
							    
							    polylinePosition2.push(position2);
							    polyline2.setPath(polylinePosition2);
							    
							    polyline2.setMap(map2);
							    
							}
						</script>
						
						<div class="essay_calendat_btn essay_calendar1"></div>
						<div class="essay_calendar">
							<table class="dailyPlanSection">
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
							</table>
						</div>
						
						<%-- 나의 일정을 클릭하면 나오는 정보 끝 --%>
						
							<h2 class="view_title">제목: <input type="text" name="essay_title" placeholder="제목을 적어주세요."></h2>
							
							<p class="view_con2">
								<textarea name="essay_cnt" id="smarteditor2" rows="10" cols="100" style="width: 100%; height: 600px;"> </textarea>
							</p>
							
							<h2 class="view_title">가이드 일정 선택하기</h2>
							<div class="essay_calendar3">
								<table>
									<colgroup>
										<col width="35%">
										<col width="35%">
										<col width="10%">
										<col width="10%">
										<col width="10%">
									</colgroup>
									<tr>
										<th>출발일</th>
										<th>종료일</th>
										<th>모집인원</th>
										<th>일정추가</th>
										<th>일정삭제</th>
									</tr>
									<tr class="dateTr">
										<td><input name="guideplan_start_day" id="datepicker" class="datepicker" type="text"  name="start" placeholder="출발일" style="width: 70%" readonly="readonly"></td>
										<td><input name="guideplan_end_day" id="datepicker1" class="datepicker"  type="text"  name="end" placeholder="종료일" style="width: 70%" readonly="readonly"></td>
										<td><input name="guideplan_peo_count" type="number" placeholder="인원 정원을 적어주세요." ></td>
										<td><div class="plus_btn">+</div></td>
										<td><div class="minus_btn">-</div></td>
									</tr>
								</table>
							</div>
							
							<br/><br/><br/>

							<div class="view_btn">
								<ul>
									<li class="essay_filterLi">
										<input class="btn_bd col_03 " type="button"  id="savebutton2" value="작성">
									</li>
									<li class="essay_filterLi">
										<a href="/main/main"><input class="btn_bd col_02 " type="button" value="취소"></a>					
									</li>
								</ul>
							</div>
						</li>
					</form>
			
			
				</ul>
			
			
				
				
			</div>
		</div>

	</div>
	
</div>




<%-- 레이어 팝업 --%>

<div class="layer1">
    <div class="bg"></div>
    <div id="layer_1" class="pop_layer">
       <div class="layer_con">
             <ul class="layer_con_sub">
              	<c:forEach items="${mypageTripPlanForListVoList}" var="mypageTripPlanForListVo">
              	<li class="layer_con_subLi">
              		<a >
						<ul class="mypage_list">
						<li>
							<c:choose>
								<c:when test="${mypageTripPlanForListVo.tripplan_image eq ''}">
									<img src="/img/no_image.png"/>
								</c:when>
								<c:when test="${mypageTripPlanForListVo.tripplan_image == null}">
									<img src="/img/no_image.png"/>
								</c:when>
								<c:otherwise>
									<img src="/file/read?file=${mypageTripPlanForListVo.tripplan_image}"/>
								</c:otherwise>
							</c:choose>
							<div class="mypage_list01" >
								<span>${mypageTripPlanForListVo.tripplan_start_day}</span> ${mypageTripPlanForListVo.tripplan_days-1}박 ${mypageTripPlanForListVo.tripplan_days}일<br/>
								<b>${mypageTripPlanForListVo.mapmark_sido}</b>
							</div>
						</li>
						<li>
							<div>${mypageTripPlanForListVo.tripplan_title}</div>
							<ul>
								<li>${mypageTripPlanForListVo.totalmarker_count}</li>
							</ul>
						</li>
						<li>
							<div>
								${mypageTripPlanForListVo.mapmarker_enbmyeondong}<br/>
								<b>${loginInfo.mem_name}</b>
							</div>
							<div>
								<input type="radio" name="calendarSelection" id="calendarSelection0 myTripplan" value="${mypageTripPlanForListVo.tripplan_id}">
							</div>
						</li>
						</ul>	
						</a>
					</li>		
					</c:forEach>	
              	<%-- 이뿌~~~ 일정 정보가 없다면 --%>
              	<li class="produce"><a href="/myplan/mytravel_write"><img src="/img/calendar_add.jpg"></a></li>
            </ul> 
            <div class="view_btn">
				<ul>
					<li class="essay_filterLi">
						<input class="btn_bd col_03 " type="submit" onclick="selectTripplan();" value="선택">
					</li>
					<li class="essay_filterLi">
						<input class="btn_bd col_02 " type="button" onclick="$('.layer1').fadeOut();" value="취소">	 					
					</li>
				</ul>
			</div> 
       </div>
      
    </div>   
</div> 

<%@include file="../tail.jsp" %> 