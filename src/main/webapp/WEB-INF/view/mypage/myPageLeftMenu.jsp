<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="mypage_left">
	<ul>
		<li>
			<img src="/img/p_01.png"> 
		</li>
		<li>닉네임입니다. <span>일반</span></li>
	</ul>
	<ul class="mypage_leftUl2">
		<li>12. 01 <span>20대</span> <a href="/main/memModified">개인정보변경</a></li>
		<li class="mypage_leftUl2_li2"><a href=""><b>1234</b> 팔로잉</a> <a href=""><b>1231</b> 팔로워</a></li>
		<li class="mypage_leftHover"><a href="/main/mypage">나의 여행일정 관리</a></li>
		<li class="mypage_leftHover"><a href="/main/guide">나의 투어관리</a></li>
		<%-- 나의 예약관리는 가이드 레벨에서만 보임 if 조건 ㄱㄱ --%>
		<li class="mypage_leftHover"><a href="/main/reservation">나의 예약</a></li>
		<%-- --%>
		<li class="mypage_leftHover"><a href="/main/myPost">게시글 관리</a></li>
		<li class="mypage_leftHover"><a class="pointer" onclick="window.open('/main/message','window_name','width=417,height=500,location=no,status=no,scrollbars=yes');">메시지</a></li>
		<li class="mypage_leftHover"><a href="/main/clipBoard">클립보드</a></li>
	</ul>
</div>