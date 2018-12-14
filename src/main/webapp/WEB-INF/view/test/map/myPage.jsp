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
				<c:if test="${mypageTripPlanForListVo.tripplan_image}" ></c:if>
				<a href="/test/mytravel_view?tripplan_id=+${mypageTripPlanForListVo.tripplan_id}">
					<c:choose>
						<c:when test="${mypageTripPlanForListVo.tripplan_image eq ''}">
							<img src="/img/no_image.png"/>
						</c:when>
						<c:when test="${mypageTripPlanForListVo.tripplan_image == null}">
							<img src="/img/no_image.png"/>
						</c:when>
						<c:otherwise>
							<img src="/img/${mypageTripPlanForListVo.tripplan_image}"/>
						</c:otherwise>
					</c:choose>
				</a>
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
					<a href="/myplan/mytravel_delete?tripplan_id=${mypageTripPlanForListVo.tripplan_id}"><button>삭제</button></a> &nbsp;
					<a href="/myplan/mytravel_update?tripplan_id=${mypageTripPlanForListVo.tripplan_id}"><button>수정</button></a>
				</div>
			</li>
			</ul>			
		</c:forEach>			
		

		
		
		
	
		
	</div>
	
</div>

 
<%@include file="/WEB-INF/view/tail.jsp" %>  