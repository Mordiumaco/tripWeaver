<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://cdn.jsdelivr.net/npm/vue"></script>
<script>
	$(function() {
		var app = new Vue({
			el : '#vuejsTest',
			data : {
				mem_nick : "${loginInfo.mem_nick}"
			}
		})
	})
	
	//팔로우 레이어팝업을 위한 메서드
	function layer_open1(el, follow){
	
	  var temp = $('#' + el);
	  var bg = temp.prev().hasClass('bg');    //dimmed 레이어를 감지하기 위한 boolean 변수
	
	  if(bg){
	     $('.layer1').fadeIn();  //'bg' 클래스가 존재하면 레이어가 나타나고 배경은 dimmed 된다. 
	  }else{
	  }
	  // 화면의 중앙에 레이어를 띄운다.
	  if (temp.outerHeight() < $(document).height() ) temp.css('margin-top', '-'+temp.outerHeight()/2+'px');
	  else temp.css('top', '0px');
	  if (temp.outerWidth() < $(document).width() ) temp.css('margin-left', '-'+temp.outerWidth()/2+'px');
	  else temp.css('left', '0px');

	  if(follow == 'following'){
		  $("#follow_popup_title").text("팔로잉");
	  } else {
		  $("#follow_popup_title").text("팔로워");
	  }

	  follow_pop_up(follow, "");
	  
	  temp.find('a.cbtn, a.close').click(function(e){
	     if(bg){
	        $('.layer1').fadeOut(); //'bg' 클래스가 존재하면 레이어를 사라지게 한다. 
	     }else{
	        temp.fadeOut();
	     }
	     e.preventDefault();
	  });

	  $('.bg, .close').click(function(e){ //배경을 클릭하면 레이어를 사라지게 하는 이벤트 핸들러
	     $('.layer1').fadeOut();
	     e.preventDefault();
	  });
	}
	
	//ajax 팔로잉이벤트 팔로잉수 갱신
	function follow_count(mem_id) {
		$.ajax({
			url : "/follow/followCountMypageAjax",
			type : "get",
			data : {"mem_id":mem_id},
			success : function(dt) {
				$("#following_cnt").html(dt.followingCnt)
				$("#follower_cnt").html(dt.followerCnt)
			}
		});
	}
	//ajax 팔로잉/팔로워 조회 레이어팝업
	function follow_pop_up(follow, stx) {
		//팔로잉,팔로워 구분하는 변수 필요
		$.ajax({
			url : "/follow/followListPopupAjax",
			type : "get",
			data : "mem_id=" + "${loginInfo.mem_id}" + "&follow=" + follow + "&stx1=" + stx,
			success : function(dt) {
				$("#follow_list_ajax").html(dt);
			}
		});
	}
</script>

<div class="mypage_left">
	<ul>
		<li><c:choose>
				<c:when test="${loginInfo.mem_profile == null}">
					<b class="my_profile my_profile10">
						<img src="/img/no_profile.png">
					</b>
				</c:when>
				<c:otherwise>
					<b class="my_profile my_profile10">
<%-- 						<img src="/upload/${loginInfo.mem_profile}" onerror="src='/img/no_profile.png';"> --%>
						<img src="/file/read?file=${loginInfo.mem_profile}" onerror="src='/img/no_profile.png';">
					</b>
				</c:otherwise>
			</c:choose></li>
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
		<li><span>${generation}</span> <a href="/mypage/memberEdit">개인정보변경</a></li>
		<li class="mypage_leftUl2_li2">
			<a href="javascript::" onclick="layer_open1('layer_1', 'following');return false;" class="follow_btn"><b id="following_cnt"></b> 팔로잉</a> 
			<a href="javascript::" onclick="layer_open1('layer_1', 'follower');return false;" class="follow_btn"><b id="follower_cnt"></b> 팔로워</a>
		</li>
		<li class="mypage_leftHover"><a href="/main/mypage">나의 여행일정 관리</a></li>
		<li class="mypage_leftHover"><a href="/mypage/guide">나의 예약</a></li>

		<%-- 나의 예약관리는 가이드 레벨에서만 보임 if 조건 ㄱㄱ --%>
		<c:if test="${loginInfo.mem_author == 2}">
			<li class="mypage_leftHover"><a href="/mypage/reservation">나의 투어관리</a></li>
		</c:if>
		<%-- --%>
		<li class="mypage_leftHover"><a href="/mypage/myPost">게시글 관리</a></li>
		<li class="mypage_leftHover"><a class="pointer"
			onclick="window.open('/message/mainView?mem_id=${loginInfo.mem_id}','window_name','width=417,height=500,location=no,status=no,scrollbars=yes');" target="blank">메시지</a></li>
		<li class="mypage_leftHover"><a
			href="/allPostClip?page=1&pageSize=9&mem_id=${loginInfo.mem_id}&tag_search=&search_title=m.mem_nick">클립보드</a></li>
	</ul>
</div>

<div class="layer1">
	<div class="bg"></div>
	<div id="layer_1" class="pop_layer follow_pop_layer">
		<div class="layer_con">
			<form id="mypage_follow_search_form" action="/" method="post">
			 <!-- 팔로잉/팔로워 구분 -->
				<div class="mypage_follow_popup_title"><span id="follow_popup_title"></span><input type="text" name="stx1" id="stx1" placeholder="아이디를 입력해주세요"/><input type="button" id="follow_search_btn" value="검색"/><input type="button" class="close" id="follow_close" value="나가기"/></div>
			</form>
			<ul id="follow_list_ajax">
				<!-- 리스트 ajax부분 -->
				<li></li>
			</ul>
		</div>

	</div>
</div>

<script>
	//팔로우 숫자를 세팅하는 메서드
	follow_count("${loginInfo.mem_id}");
	
	$('.followBtn').on({
		click : function() {
			var follow;
			var following_id = '${loginInfo.mem_id}';
			var followed_id = $(this).prev().val();
			var selectMembers = $('.'+followed_id);
			if($(this).hasClass('following') == true){
				$.each(selectMembers, function(idx, obj){ //obj = $(selectMembers[idx])
					var btn = $(obj).find('.followBtn');
					btn.val("팔로우");
					btn.addClass("follower");
					btn.removeClass("following");
				});
				follow = 'N';
				unfollow(following_id, followed_id);
			} else {
				$.each(selectMembers, function(idx, obj){ //obj = $(selectMembers[idx])
					var btn = $(obj).find('.followBtn');
					btn.val("팔로잉");
					btn.addClass("following");
					btn.removeClass("follower");
				});
				follow = 'Y';
				following(following_id, followed_id);
			}
			follow_count(following_id);
		},
		mouseenter : function() {
			$(this).css({'background-color' : '#389e7d', "color" : "white"});
			if($(this).hasClass('following') == true){
				$(this).val("언팔로우");
			}
		},
		mouseleave : function() {
			$(this).css({'background-color': 'transparent', "color" : "black"});
			if($(this).hasClass('following') == true) {
				$(this).val("팔로잉");
			}
		}
	});
	
	$("#follow_search_btn").on("click", function() {
		var stx = $("#stx1").val();
		var follow = $("#follow_popup_title").html();
		follow = follow == "팔로잉" ? "following" : "follower";
		follow_pop_up(follow, stx);
	});
</script>