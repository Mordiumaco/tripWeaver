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
								<form action="/board/updateBoardView" method="get">
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
				<h2 class="view_title">${postsVo.po_subject}  제목이요</h2>
				<ul class="view_header">
					<li><span class="profile_img"><img src="/img/no_profile.gif" alt="no_profile" width="20" height="20" title=""></span><b>&nbsp;&nbsp;${postsVo.userid} 이름이요</b> 님에 글 입니다.</li>
					<li><i class="fa fa-clock-o" aria-hidden="true"></i> &nbsp;<fmt:formatDate value="${postsVo.po_date}" pattern="yyyy-MM-dd"/>날짜요</li>
				</ul>
				<br/>
				<div class="essay_filter">
					<ul>
						<li>테마 : <b>먹거리 여행</b></li>
						<li>여행일수 : <b>3박 4일</b></li>
						<li>구성원별 : <b>커플 여행</b></li>
					</ul>
					
					<ul>
						<li>식비 : <b>9999</b></li>
						<li>숙박비 : <b>9999</b></li>
						<li>교통비 : <b>9999</b></li>
						<li>기타 : <b>9999</b></li>
						<li>총비용 : <b>9999</b></li>
						<li>하루평균비용 : <b>9999</b></li>
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
				
				<p class="view_con">
					 ${postsVo.po_contents}
					 
					 내용이요
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