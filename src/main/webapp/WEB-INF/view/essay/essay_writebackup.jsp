<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../head.jsp" %>

<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/js/font-awesome/css/font-awesome.min.css">

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
});


function call()
{
 if(document.getElementById("sell1").value && document.getElementById("sell2").value){
  document.getElementById('sell5').value =parseInt(document.getElementById('sell1').value) + parseInt(document.getElementById('sell2').value) + parseInt(document.getElementById('sell4').value) + parseInt(document.getElementById('sell2').value);
 }
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
	
	<div class="essayLeft">
		<div class="main_con" id="main_con">
			<div id="container">
				<ul class="tab">
					<li><a href="#web1" class="select">일반 사용자</a></li>
					<li><a href="#web2">가이드 사용자</a></li>
				</ul>
				
				<ul class="content">
					<li id="web1">
						<h1 class="mypage_title">Essay 글 작성</h1>
				
						<div>
							<a href="javascript::" onclick="layer_open1('layer_1');return false;" class="btn_bd col_03 myCalendar_btn">나의 여행 일정 선택하기</a>
						</div>
						
						<br/>
						
						<%-- 나의 일정을 클릭하면 나오는 정보 시작 --%>
						<div class="essay_filter">
							<ul>
								<li class="essay_filterLi">테마 : <b>먹거리 여행</b></li>
								<li class="essay_filterLi">여행일수 : <b>3박 4일</b></li>
								<li class="essay_filterLi">구성원별 : <b>커플 여행</b></li>
							</ul>
							
							<ul>
								<li class="essay_filterLi">식비 : <b><input type="number" name="" id="sell1" onkeyup="call()"> 원</b></li>
								<li class="essay_filterLi">숙박비 : <b><input type="number" name="" id="sell2" onkeyup="call()"> 원</b></li>
								<li class="essay_filterLi">교통비 : <b><input type="number" name="" id="sell3" onkeyup="call()"> 원</b></li>
								<li class="essay_filterLi">기타 : <b><input type="number" name="" id="sell4" onkeyup="call()"> 원</b></li>
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
								<tr>
									<th><i class="fa fa-calendar-alt" ></i> 날짜</th>
									<th><i class="fas fa-city"></i> 도시</th>
									<th><i class="fas fa-bus"></i> 교통</th>
									<th><i class="far fa-calendar-alt"></i> 일정</th>
									<th><i class="fas fa-bed"></i> 숙소</th>
								</tr>
								
								<tr>
									<td>
										<span>11월27일(금)</span><br/>
										<b>DAY 1</b>
									</td>
									<td>
										미시령<br/>
										대관령
									</td>
									<td>
										수영<br/>
										달리기<br/>
										자전거<br/>
									</td>
									<td>
										상세 일정 수영 1km<br/>
										상세 일정 달리기 5km<br/>
										상세 일정 자전거 10km<br/>
									</td>
									<td>
										신문지<br/>
										골판지 박스<br/>
										지하철<br/>
									</td>
								</tr>
								
								<tr>
									<td>
										<span>11월27일(금)</span><br/>
										<b>DAY 2</b>
									</td>
									<td>
										미시령<br/>
										대관령
									</td>
									<td>
										수영<br/>
										달리기<br/>
										자전거<br/>
									</td>
									<td>
										상세 일정 수영 1km<br/>
										상세 일정 달리기 5km<br/>
										상세 일정 자전거 10km<br/>
									</td>
									<td>
										신문지<br/>
										골판지 박스<br/>
										지하철<br/>
									</td>
								</tr>
								
								<tr>
									<td>
										<span>11월27일(금)</span><br/>
										<b>DAY 3</b>
									</td>
									<td>
										미시령<br/>
										대관령
									</td>
									<td>
										수영<br/>
										달리기<br/>
										자전거<br/>
									</td>
									<td>
										상세 일정 수영 1km<br/>
										상세 일정 달리기 5km<br/>
										상세 일정 자전거 10km<br/>
									</td>
									<td>
										신문지<br/>
										골판지 박스<br/>
										지하철<br/>
									</td>
								</tr>
							</table>
						</div>
						
						<%-- 나의 일정을 클릭하면 나오는 정보 끝 --%>
						
						<form action="">
							<h2 class="view_title">제목: <input type="text" placeholder="제목을 적어주세요."></h2>
							
							<p class="view_con">
								 
								어 스마트 에디터 적용해
							</p>
							
							
							<br/><br/><br/>

							<div class="view_btn">
								<ul>
									<li class="essay_filterLi">
										<input class="btn_bd col_03 " type="submit" value="작성">
									</li>
									<li class="essay_filterLi">
										<input class="btn_bd col_02 " type="button" onclick="button_event();" value="취소">	 					
									</li>
								</ul>
							</div>
						</form>
					</li>
					<li id="web2">
						<h1 class="mypage_title">Essay 글 작성</h1>
				
						<div>
							<a href="javascript::" onclick="layer_open1('layer_1');return false;" class="btn_bd col_03 myCalendar_btn">나의 여행 일정 선택하기</a>
						</div>
						
						<br/>
						
						<%-- 나의 일정을 클릭하면 나오는 정보 시작 --%>
						<div class="essay_filter">
							<ul>
								<li class="essay_filterLi">테마 : <b>먹거리 여행</b></li>
								<li class="essay_filterLi">여행일수 : <b>3박 4일</b></li>
								<li class="essay_filterLi">구성원별 : <b>커플 여행</b></li>
							</ul>
							
							<ul>
								<li class="essay_filterLi">식비 : <b><input type="number" name="" id="wr_10"> 원</b></li>
								<li class="essay_filterLi">숙박비 : <b><input type="number" name="" id="wr_11"> 원</b></li>
								<li class="essay_filterLi">교통비 : <b><input type="number" name="" id="wr_12"> 원</b></li>
								<li class="essay_filterLi">기타 : <b><input type="number" name="" id="wr_13"> 원</b></li>
								<li class="essay_filterLi">총비용 : <b><input type="number" readonly="readonly"> 원</b></li>
								<li class="essay_filterLi">하루평균비용 : <b><input type="number" readonly="readonly"> 원</b></li>
							</ul>
						</div>
						<br/>
						<div id="map2" class="main_map" style="width:100%;height:400px;"></div>
			
						<script>
							var container = document.getElementById('map2');
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
								<tr>
									<th><i class="fa fa-calendar-alt" ></i> 날짜</th>
									<th><i class="fas fa-city"></i> 도시</th>
									<th><i class="fas fa-bus"></i> 교통</th>
									<th><i class="far fa-calendar-alt"></i> 일정</th>
									<th><i class="fas fa-bed"></i> 숙소</th>
								</tr>
								
								<tr>
									<td>
										<span>11월27일(금)</span><br/>
										<b>DAY 1</b>
									</td>
									<td>
										미시령<br/>
										대관령
									</td>
									<td>
										수영<br/>
										달리기<br/>
										자전거<br/>
									</td>
									<td>
										상세 일정 수영 1km<br/>
										상세 일정 달리기 5km<br/>
										상세 일정 자전거 10km<br/>
									</td>
									<td>
										신문지<br/>
										골판지 박스<br/>
										지하철<br/>
									</td>
								</tr>
								
								<tr>
									<td>
										<span>11월27일(금)</span><br/>
										<b>DAY 2</b>
									</td>
									<td>
										미시령<br/>
										대관령
									</td>
									<td>
										수영<br/>
										달리기<br/>
										자전거<br/>
									</td>
									<td>
										상세 일정 수영 1km<br/>
										상세 일정 달리기 5km<br/>
										상세 일정 자전거 10km<br/>
									</td>
									<td>
										신문지<br/>
										골판지 박스<br/>
										지하철<br/>
									</td>
								</tr>
								
								<tr>
									<td>
										<span>11월27일(금)</span><br/>
										<b>DAY 3</b>
									</td>
									<td>
										미시령<br/>
										대관령
									</td>
									<td>
										수영<br/>
										달리기<br/>
										자전거<br/>
									</td>
									<td>
										상세 일정 수영 1km<br/>
										상세 일정 달리기 5km<br/>
										상세 일정 자전거 10km<br/>
									</td>
									<td>
										신문지<br/>
										골판지 박스<br/>
										지하철<br/>
									</td>
								</tr>
							</table>
						</div>
						
						<%-- 나의 일정을 클릭하면 나오는 정보 끝 --%>
						
						<form action="">
							<h2 class="view_title">제목: <input type="text" placeholder="제목을 적어주세요."></h2>
							
							<p class="view_con">
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
										<td><input id="datepicker" class="datepicker" type="text"  name="start" placeholder="출발일" style="width: 70%" readonly="readonly"></td>
										<td><input id="datepicker1" class="datepicker"  type="text"  name="end" placeholder="종료일" style="width: 70%" readonly="readonly"></td>
										<td><input type="number" placeholder="숫자로 표기하세요."></td>
										<td><div class="plus_btn">+</div></td>
										<td><div class="minus_btn">-</div></td>
									</tr>
								</table>
							</div>
							
							<br/><br/><br/>

							<div class="view_btn">
								<ul>
									<li class="essay_filterLi">
										<input class="btn_bd col_03 " type="submit" value="작성">
									</li>
									<li class="essay_filterLi">
										<input class="btn_bd col_02 " type="button" onclick="button_event();" value="취소">	 					
									</li>
								</ul>
							</div>
						</form>
					</li>
			
			
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
              	<li class="layer_con_subLi">
              		<a >
						<ul class="mypage_list">
							<li>
								<img src="/img/main_01.jpg">
								<div class="mypage_list01">
									<span>2018. 11. 30</span> 3박 4일 <br>
									<b>대전광역시</b>
								</div>
							</li>
							<li>
								<div>친구와 함께</div>
								<ul>
									<li> 123</li>
								</ul>
							</li>
							<li>
								<div>
									월평동<br>
									<b>이혜진</b>
								</div>
								<div>
									<input type="radio" name="calendarSelection" id="calendarSelection0">
								</div>
							</li>
						</ul>
					</a>
              	</li>
              	<li class="layer_con_subLi">
              		<a >
						<ul class="mypage_list">
							<li>
								<img src="/img/main_01.jpg">
								<div class="mypage_list01">
									<span>2018. 11. 30</span> 3박 4일 <br>
									<b>대전광역시</b>
								</div>
							</li>
							<li>
								<div>친구와 함께</div>
								<ul>
									<li> 123</li>
								</ul>
							</li>
							<li>
								<div>
									월평동<br>
									<b>이혜진</b>
								</div>
								<div>
									<input type="radio" name="calendarSelection" id="calendarSelection">
								</div>
							</li>
						</ul>
					</a>
              	</li>
              	<li class="layer_con_subLi">
              		<a >
						<ul class="mypage_list">
							<li>
								<img src="/img/main_01.jpg">
								<div class="mypage_list01">
									<span>2018. 11. 30</span> 3박 4일 <br>
									<b>대전광역시</b>
								</div>
							</li>
							<li>
								<div>친구와 함께</div>
								<ul>
									<li> 123</li>
								</ul>
							</li>
							<li>
								<div>
									월평동<br>
									<b>이혜진</b>
								</div>
								<div>
									<input type="radio" name="calendarSelection" id="calendarSelection">
								</div>
							</li>
						</ul>
					</a>
              	</li>
              	<li class="layer_con_subLi">
              		<a >
						<ul class="mypage_list">
							<li>
								<img src="/img/main_01.jpg">
								<div class="mypage_list01">
									<span>2018. 11. 30</span> 3박 4일 <br>
									<b>대전광역시</b>
								</div>
							</li>
							<li>
								<div>친구와 함께</div>
								<ul>
									<li> 123</li>
								</ul>
							</li>
							<li>
								<div>
									월평동<br>
									<b>이혜진</b>
								</div>
								<div>
									<input type="radio" name="calendarSelection" id="calendarSelection">
								</div>
							</li>
						</ul>
					</a>
              	</li>
              	<li class="layer_con_subLi">
              		<a >
						<ul class="mypage_list">
							<li>
								<img src="/img/main_01.jpg">
								<div class="mypage_list01">
									<span>2018. 11. 30</span> 3박 4일 <br>
									<b>대전광역시</b>
								</div>
							</li>
							<li>
								<div>친구와 함께</div>
								<ul>
									<li> 123</li>
								</ul>
							</li>
							<li>
								<div>
									월평동<br>
									<b>이혜진</b>
								</div>
								<div>
									<input type="radio" name="calendarSelection" id="calendarSelection">
								</div>
							</li>
						</ul>
					</a>
              	</li>

              	<%-- 이뿌~~~ 일정 정보가 없다면 --%>
              	<li class="produce"><a href="/main/mytravel_write"><img src="/img/calendar_add.jpg"></a></li>
            </ul> 
            <div class="view_btn">
				<ul>
					<li class="essay_filterLi">
						<input class="btn_bd col_03 " type="submit" value="선택">
					</li>
					<li class="essay_filterLi">
						<input class="btn_bd col_02 " type="button" onclick="button_event();" value="취소">	 					
					</li>
				</ul>
			</div> 
       </div>
      
    </div>   
</div> 

<%@include file="../tail.jsp" %> 