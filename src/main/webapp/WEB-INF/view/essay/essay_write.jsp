<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../head.jsp" %>

<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/js/font-awesome/css/font-awesome.min.css">

<script type="text/javascript">
function button_event(){
	if (confirm("정말 삭제하시겠습니까??")){    //확인
	    var ff = document.deletePosts;
	    ff.submit();
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

</script>


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a5f2e82aa9bad5f393255b6d8c3200cb"></script>

<style>
#container { width: 100%;}

.bo_vc_act:after { clear: inherit; }

.view_con { border: 1px solid #ddd; margin-top: 20px; width: 100%;}
.essay_calendar th { text-align: center;}
.essay_filterLi { display:block !important; padding: 0 !important;}
.myCalendar_btn { padding: 10px;  cursor: pointer; width: 100%; height:45px; line-height:24px; display: block; font-size: 1.2em; font-weight: bold; text-align: center; border-radius: 30px;}
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
							<a class="btn_bd col_03 myCalendar_btn">나의 여행 일정 선택하기</a>
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
								<li class="essay_filterLi">식비 : <b>9999</b></li>
								<li class="essay_filterLi">숙박비 : <b>9999</b></li>
								<li class="essay_filterLi">교통비 : <b>9999</b></li>
								<li class="essay_filterLi">기타 : <b>9999</b></li>
								<li class="essay_filterLi">총비용 : <b>9999</b></li>
								<li class="essay_filterLi">하루평균비용 : <b>9999</b></li>
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
						<strong>WEB 2</strong>
						내용이들어갑니다.내용이들어갑니다.내용이들어갑니다.내용이들어갑니다.내용이들어갑니다.내용이들어갑니다.내용이들어갑니다.내용이들어갑니다.내용이들어갑니다.내용이들어갑니다.내용이들어갑니다.
					</li>
			
			
				</ul>
			
			
				
				
			</div>
		</div>

	</div>
	
</div>

<%@include file="../tail.jsp" %> 