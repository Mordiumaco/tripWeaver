<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="/WEB-INF/view/head.jsp" %>

<div class="sub_container">
	<%@include file="myPageLeftMenu.jsp" %>
	
	<div class="mypage_right">
		<h1 class="mypage_title">나의 여행 관리</h1>
		
		<ul class="mypage_list">
			<li>
				<a href="/test/mytravel_write"><img src="/img/calendar_add.jpg"/></a>
				
			</li>
			<li class="mypage_list_add">
				일정을 추가하기 버튼 입니다.
			</li>
		</ul>
		
		<c:forEach items="${mypageTripPlanForListVoList}" var="mypageTripPlanForListVo">
			<ul class="mypage_list">
			<li>
				<a href="/test/mytravel_view?tripplan_id="+${mypageTripPlanForListVo.tripplan_id}><img src="/img/main_01.jpg"/></a>
				<div class="mypage_list" >
					<span>${mypageTripPlanForListVo.tripplan_strat_day}</span> <br/>
					<b>${mypageTripPlanForListVo.marker_sido}</b>
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
					${mypageTripPlanForListVo.marker_enbmyeondong}<br/>
					<b>${loginInfo.mem_name}</b>
				</div>
				<div>
					<button >삭제</button> &nbsp;
					<button onclick="window.location.href='/main/mytravel_update'">수정</button>
				</div>
			</li>
			</ul>			
		</c:forEach>			
		

		
		
		
	
		
	</div>
	
</div>

 
<%@include file="/WEB-INF/view/tail.jsp" %>  