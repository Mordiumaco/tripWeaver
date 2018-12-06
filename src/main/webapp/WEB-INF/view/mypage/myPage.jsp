<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../head.jsp" %>

<div class="sub_container">
	<%@include file="myPageLeftMenu.jsp" %>
	
	<div class="mypage_right">
		<h1 class="mypage_title">나의 여행 관리</h1>
		
		<ul class="mypage_list">
			<li>
				<a href="/main/mytravel_write"><img src="/img/calendar_add.jpg"/></a>
				
			</li>
			<li class="mypage_list_add">
				일정을 추가하기 버튼 입니다.
			</li>
		</ul>
		
		<ul class="mypage_list">
			<li>
				<a href="/main/mytravel_view"><img src="/img/main_01.jpg"/></a>
				<div class="mypage_list01" >
					<span>2018. 11. 30</span> 3박 4일 <br/>
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
					월평동<br/>
					<b>이혜진</b>
				</div>
				<div>
					
					<button >삭제</button> &nbsp;
					<button onclick="window.location.href='/main/mytravel_update'">수정</button>
				</div>
			</li>
		</ul>

		
		
		
	
		
	</div>
	
</div>

 
<%@include file="../tail.jsp" %>  