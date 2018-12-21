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


</script>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a5f2e82aa9bad5f393255b6d8c3200cb"></script>

<style>
#container { width: 100%;}

.bo_vc_act:after { clear: inherit; }

.view_con { border: 1px solid #ddd; margin-top: 20px; width: 100%;}

</style>

<div class="sub_container">

	<%@include file="essayRightMenu.jsp" %>
	
	<div class="essayLeft">
		<div class="main_con" id="main_con">
			<div id="container">
				<div class="view_btn">
					<ul>
						<c:if test="${postsVo.userid == S_USER.userId}">
							<li>
								<form action="/main/essay_update" method="get">
									<input type="hidden"  name="postsId" value="${postsVo.po_id}">
									<input class="btn_bd col_03" type="submit" value="수정">
								</form>
							</li>
							<li>
								<form action="/board/deleteBoard" method="post" name="deletePosts">
									<input type="hidden"  name="po_id" value="${postsVo.po_id}">
									<input type="hidden"  name="po_delete" value="Y">
									<input type="hidden"  name="nt_id" value="${postsVo.nt_id}">
									<input class="btn_bd col_02" type="button" onclick="button_event();" value="삭제">	 					
								</form>
							</li>
						</c:if>
					
				
						
					</ul>
				</div>
				<h2 class="view_title">제목: ${essayVo.essay_title}</h2>
				<ul class="view_header">
					<li><span class="profile_img"><img src="/img/no_profile.png" alt="no_profile" width="20" height="20" title=""></span><b>&nbsp;&nbsp;${writerVo.mem_nick}</b> 님의 글 입니다.</li>
					<li><i class="fa fa-clock-o" aria-hidden="true"></i> &nbsp;<fmt:formatDate value="${essayVo.essay_date}" pattern="yyyy-MM-dd"/></li>
				</ul>
				<br/>
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
						<li>식비 : <b>${essayVo.essay_meal_exp}</b></li>
						<li>숙박비 : <b>${essayVo.essay_room_exp}</b></li>
						<li>교통비 : <b>${essayVo.essay_traffic_exp}</b></li>
						<li>기타 : <b>${essayVo.essay_other_exp}</b></li>
						<c:set var="total" value="${essayVo.essay_meal_exp+essayVo.essay_room_exp+essayVo.essay_traffic_exp+essayVo.essay_other_exp}"></c:set>
						<fmt:parseNumber value="${total/tripplanVo.tripplan_days}" integerOnly="true" var="average"></fmt:parseNumber>
						<li>총비용 : <b>${total}</b></li>
						<li>하루평균비용 : <b>${average}</b></li>
					</ul>
				</div>
				<script type="text/javascript">
				console.log("${total/tripplanVo.tripplan_days}");
				</script>
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
				
				<p class="view_con">
					 ${essayVo.essay_cnt}
				</p>
				
				
				<br/><br/><br/>

		    	
		    	<button type="button" class="cmt_btn"><i class="fa fa-commenting-o" aria-hidden="true"></i> 댓글목록</button>
				
				<c:choose>
					<c:when test="${comList.size() != 0}">
						<c:forEach items="${comList}" var="co">
							<article id="c_489">
						        <header style="z-index:3">
						            <h3>${co.userid} 님의  댓글</h3>
						            <br/>
						            <span class="sv_wrap">
						            <span class="bo_vc_hdinfo">
						            	<i class="fa fa-clock-o" aria-hidden="true"></i>
				            			<fmt:formatDate value="${co.co_date}" pattern="yyyy-MM-dd"/>
						            </span>
						        </header>
					        	<!-- 댓글 출력 -->
						        <div class="cmt_contents">
							        <c:choose>
					            		<c:when test="${co.co_delete != 'Y'}">
					            			<p>${co.co_contents}</p>
					            		</c:when>
					            		<c:otherwise>
					            			<p>삭제된 게시글 입니다.</p>
					            		</c:otherwise>
						            </c:choose>
						        </div>
						        <c:if test="${co.userid == S_USER.userId }">
							        <ul class="bo_vc_act">
			                			<li>
			                				<form action="/board/deleteComment" method="post">
			                					<input type="hidden" name="po_id" value="${co.po_id}">
			                					<input type="hidden" name="co_id" value="${co.co_id}">
			                					<input type="hidden" name="co_delete" value="Y">
			                					<c:if test="${co.co_delete != 'Y'}">
			                						<input class="btn_b03" type="submit" value="삭제">
			                					</c:if>
			                				</form>
			                			</li>            
			                		</ul>
		                		</c:if>
				   	 		</article>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<article id="c_489">
							  <header style="z-index:3">
						            <h3>댓글이 없습니다.</h3>
						        </header>
						</article>
						
					</c:otherwise>
				</c:choose>
				
				<div class="commentWrite">
					<form action="/board/insertComment" method="post">
						<ul>
							<li>
								<input type="text" name="co_contents" placeholder="내용을 적어주세요." required="required">
								<input type="hidden" name="po_id" value="${param.postsId}"> 
								<input type="hidden" name="userId" value="${S_USER.userId}">
							</li>
							<li><input class="btn_bd col_01" type="submit" value="댓글 작성"></li>
						</ul>
					</form>
				</div>
				
			</div>
		</div>

	</div>
	
</div>

<%@include file="../tail.jsp" %> 