<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<script src="https://cdn.jsdelivr.net/npm/vue"></script>
<script>
	$(function(){
		var app = new Vue({
		  el: '#vuejsTest',
		  data: {
		    mem_nick: "${loginInfo.mem_nick}"
		  }
		})
	})
	
</script>

<div class="mypage_left">
	<ul>
		<li>
			<c:choose>
				<c:when test="${loginInfo.mem_profile == null}">
					<img src="/img/no_profile.png"> 
				</c:when>
				<c:otherwise>
					<img src="/upload/${loginInfo.mem_profile}" onerror="src='/img/no_profile.png';"> 
				</c:otherwise>
			</c:choose>
		</li>
		<c:choose>
			<c:when test="${loginInfo.mem_author eq 1}">
				<c:set var="author" value="일반"></c:set>
			</c:when>
			<c:when test="${loginInfo.mem_author eq 2}">
				<c:set var="author" value="가이드"></c:set>
			</c:when>
			<c:when test="${loginInfo.mem_author eq 3}">
				<c:set var="author" value="관리자"></c:set>
			</c:when>
		</c:choose>
		<li id="vuejsTest">{{mem_nick}} <span>${author}</span></li>
	</ul>
	<ul class="mypage_leftUl2">
		<c:choose>
			<c:when test="${loginInfo.mem_age eq '10-19'}">
				<c:set var="generation" value="10대"></c:set>
			</c:when>
			<c:when test="${loginInfo.mem_age eq '20-29'}">
				<c:set var="generation" value="20대"></c:set>
			</c:when>
			<c:when test="${loginInfo.mem_age eq '30-39'}">
				<c:set var="generation" value="30대"></c:set>
			</c:when>
			<c:when test="${loginInfo.mem_age eq '40-49'}">
				<c:set var="generation" value="40대"></c:set>
			</c:when>
			<c:when test="${loginInfo.mem_age eq '50-59'}">
				<c:set var="generation" value="50대"></c:set>
			</c:when>
			<c:when test="${loginInfo.mem_age eq '60-'}">
				<c:set var="generation" value="60대"></c:set>
			</c:when>
		</c:choose>
		<li><span>${generation}</span> <a href="/main/memModified">개인정보변경</a></li>
		<li class="mypage_leftUl2_li2"><a href=""><b>1234</b> 팔로잉</a> <a href=""><b>1231</b> 팔로워</a></li>
		<li class="mypage_leftHover"><a href="/main/mypage">나의 여행일정 관리</a></li>
		<li class="mypage_leftHover"><a href="/mypage/guide">나의 투어관리</a></li>
		
		<%-- 나의 예약관리는 가이드 레벨에서만 보임 if 조건 ㄱㄱ --%>
		<c:if test="${loginInfo.mem_author == 2}">
			<li class="mypage_leftHover"><a href="/mypage/reservation">나의 예약</a></li>
		</c:if>
		<%-- --%>
		<li class="mypage_leftHover"><a href="/mypage/myPost">게시글 관리</a></li>
		<li class="mypage_leftHover"><a class="pointer" onclick="window.open('/main/message','window_name','width=417,height=500,location=no,status=no,scrollbars=yes');">메시지</a></li>
		<li class="mypage_leftHover"><a href="/allPostClip?page=1&pageSize=9&mem_id=${loginInfo.mem_id}&tag_search=&search_title=m.mem_nick">클립보드</a></li>
	</ul>
</div>