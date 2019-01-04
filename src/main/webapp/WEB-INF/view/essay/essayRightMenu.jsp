<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<script>
function closeLayer( obj ) {
	$(obj).parent().parent().hide(500);
}

function followProcess(mem_id, mem_id2){
	
	$.ajax({
	    url : "/follow/following",
	    type: "POST",
	    data: "mem_id="+mem_id+"&mem_id2="+mem_id2,
	    success : function(data){
	    	alert("팔로우 완료");
	    	$('.followLayer').hide(500);
	    },
	    error: function(){
	    	alert("뿌잉 터짐");
	    }
	});	
	
}

function followDelete(mem_id, mem_id2){
	
	$.ajax({
	    url : "/follow/unfollow",
	    type: "POST",
	    data: "mem_id="+mem_id+"&mem_id2="+mem_id2,
	    success : function(data){
	    	alert("언팔로우 완료");
	    	$('.followLayer').hide(500);
	    },
	    error: function(){
	    	alert("뿌잉 터짐");
	    }
	});	
}

$(document).ready(function(){
	$('.fold_wrap').on('click','.fold_btn',function () {
		$('.mypage_right2').animate({ right : '-260px'},200);
		$('.fold_btn').animate({ right : '-1px'},200);
		$('.fold_btn').addClass('fold_btnAfter');
	}); 
	
	$('.fold_wrap').on('click','.fold_btnAfter',function () {
		$('.mypage_right2').animate({ right : '0px'},200);
		$('.fold_btn').animate({ right : '260px'},200);
		$('.fold_btn').removeClass('fold_btnAfter');
	});
});

$(document).ready(function(){
	/* $('.reservation_list').on('click', function(){
		
		
	}) */
	//프로필 사진 부분을 클릭했을 때 언팔로우 팔로우 여부 확인
	$('.mypage_right2').on('click', '.profileSection', function(event){
		
		let logincheck = "${loginInfo.mem_id}";
		
		if(logincheck == ""){
			alert("팔로잉/언팔로우를 위해 로그인을 먼저 해주세요");
			event.preventDefault();
			return;
		}	
	
		
		$(this).css("cursor", "pointer");
		
		let memIdValue = $(this).find("#mem_id").val();
		var sWidth = window.innerWidth;
		var sHeight = window.innerHeight;

		var oWidth = $('.followLayer').width();
		var oHeight = $('.followLayer').height();

		// 레이어가 나타날 위치를 셋팅한다.
		var divLeft = event.pageX-30;
		var divTop = event.pageY-30;

		// 레이어가 화면 크기를 벗어나면 위치를 바꾸어 배치한다.
		if( divLeft + oWidth > sWidth ) divLeft -= oWidth;
		if( divTop + oHeight > sHeight ) divTop -= oHeight;

		// 레이어 위치를 바꾸었더니 상단기준점(0,0) 밖으로 벗어난다면 상단기준점(0,0)에 배치하자.
		if( divLeft < 0 ) divLeft = 0;
		if( divTop < 0 ) divTop = 0;

		$('.followLayer').css({
			"top": divTop,
			"left": divLeft,
			"position": "absolute"
		}).toggle("500");
		 
		//아작스로 해당 팔로우 상태를 확인한다. 
		
		$.ajax({
	    url : "/follow/followState",
	    type: "POST",
	    data: "mem_id="+memIdValue+"&mem_id2="+"${loginInfo.mem_id}",
		    success : function(data){
		    	if(data == 1){
		    		let linkValue = 'javascript: followDelete('+'"'+memIdValue+'"'+',"${loginInfo.mem_id}")';
		    		$('.followLayer').find('a').text("Unfollow");
		    		$('.followLayer').find('a').attr("href", linkValue);
		    	}
		    	
		    	if(data == 0){
		    		let linkValue = 'javascript: followProcess('+'"'+memIdValue+'"'+',"${loginInfo.mem_id}")';
		    		$('.followLayer').find('a').text("Following");
		    		$('.followLayer').find('a').attr("href", linkValue);
		    	}
		    },
		});	
	
	})
	
	
	 $('.reservation_list1').on('click', function() {
		if($("input:radio[id='re1']").is(":checked") == false){
			$("input:radio[id='re1']").prop("checked", true); /* by ID */
		}else{
			$("input:radio[id='re1']").prop("checked", false);
		}
	});
	$('.reservation_list2').on('click', function() {
		if($("input:radio[id='re2']").is(":checked") == false){
			$("input:radio[id='re2']").prop("checked", true); /* by ID */
		}else{
			$("input:radio[id='re2']").prop("checked", false);
		}
	});
	$('.reservation_list3').on('click', function() {
		if($("input:radio[id='re3']").is(":checked") == false){
			$("input:radio[id='re3']").prop("checked", true); /* by ID */
		}else{
			$("input:radio[id='re3']").prop("checked", false);
		}
	});
	$('.reservation_list4').on('click', function() {
		if($("input:radio[id='re4']").is(":checked") == false){
			$("input:radio[id='re4']").prop("checked", true); /* by ID */
		}else{
			$("input:radio[id='re4']").prop("checked", false);
		}
	}); 
	
	$('.table').on('click', function() {
		if($("input:radio[id='re4']").is(":checked") == false){
			$("input:radio[id='re4']").prop("checked", true); /* by ID */
		}else{
			$("input:radio[id='re4']").prop("checked", false);
		}
	}); 
	
	
	//해당 예약일자가 현 날짜를 지났을 경우 input pox를 삭제한다
	$(".reservation_list").each(function(){
		let startDay = new Date($(this).find(".start_day").text());
		let nowDay = new Date();
		
		if(startDay < nowDay){
			$(this).css({"opacity":"0.2"});
			$(this).find(":radio").attr("disabled", "disabled");
			$(this).find(":radio").remove();
		}
	});
	follow_count('${writerVo.mem_id}');
});

//팔로우 레이어팝업을 위한 메서드
function layer_open2(el, follow){

  var temp = $('#' + el);
  var bg = temp.prev().hasClass('bg');    //dimmed 레이어를 감지하기 위한 boolean 변수

  if(bg){
     $('.layer2').fadeIn();  //'bg' 클래스가 존재하면 레이어가 나타나고 배경은 dimmed 된다. 
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
        $('.layer2').fadeOut(); //'bg' 클래스가 존재하면 레이어를 사라지게 한다. 
     }else{
        temp.fadeOut();
     }
     e.preventDefault();
  });

  $('.bg, .close').click(function(e){ //배경을 클릭하면 레이어를 사라지게 하는 이벤트 핸들러
     $('.layer2').fadeOut();
     e.preventDefault();
  });
}

function follow_pop_up(follow, stx) {
	//팔로잉,팔로워 구분하는 변수 필요
	var writer_id = '${writerVo.mem_id}';
	$.ajax({
		url : "/follow/followListPopupAjax",
		type : "get",
		data : "mem_id=" + writer_id + "&follow=" + follow + "&stx1=" + stx + "&viewer=" + '${loginInfo.mem_id}',
		success : function(dt) {
			$("#follow_list_ajax").html(dt);
		}
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

</script>

<div class="fold_wrap">
	<div class="fold_btn"></div>  
	<div class="followLayer">
		<div>
			<img onClick="closeLayer(this)" style="cursor:pointer;font-size:1.5em;z-index:9999;" title="닫기" src="/img/cancel.png">
		</div>
		<a href="#" class="btn btn_02"> 팔로잉 </a>
	</div>	  
	<div class="mypage_left mypage_right2">
		<ul class="profileSection">
			<li>
				<c:choose>
					<c:when test="${writerVo.mem_profile == null}">
						<img src="/img/no_profile.png"> 
					</c:when>
					<c:otherwise>
						<img src="/upload/${writerVo.mem_profile}" onerror="src='/img/no_profile.png';"> 
					</c:otherwise>
				</c:choose>
			</li>
			<c:choose>
				<c:when test="${writerVo.mem_author eq 1}">
					<c:set var="author" value="일반"></c:set>
				</c:when>
				<c:when test="${writerVo.mem_author eq 2}">
					<c:set var="author" value="가이드"></c:set>
				</c:when>
				<c:when test="${writerVo.mem_author eq 3}">
					<c:set var="author" value="관리자"></c:set>
				</c:when>
			</c:choose>
			<input id="mem_id" type="hidden" value="${writerVo.mem_id}"/>
			<li>${writerVo.mem_nick}<span>${author}</span></li>
		</ul>
		<ul class="mypage_leftUl2">
			<c:choose>
				<c:when test="${writerVo.mem_age eq '10-19'}">
					<c:set var="generation" value="10대"></c:set>
				</c:when>
				<c:when test="${writerVo.mem_age eq '20-29'}">
					<c:set var="generation" value="20대"></c:set>
				</c:when>
				<c:when test="${writerVo.mem_age eq '30-39'}">
					<c:set var="generation" value="30대"></c:set>
				</c:when>
				<c:when test="${writerVo.mem_age eq '40-49'}">
					<c:set var="generation" value="40대"></c:set>
				</c:when>
				<c:when test="${writerVo.mem_age eq '50-59'}">
					<c:set var="generation" value="50대"></c:set>
				</c:when>
				<c:when test="${writerVo.mem_age eq '60-'}">
					<c:set var="generation" value="60대"></c:set>
				</c:when>
			</c:choose>
			<li> <span>${generation}</span> 
			
			<c:if test="${loginInfo.mem_id ne writerVo.mem_id}">
				<a onclick="window.open('/message/selectMessage11?login_id=${loginInfo.mem_id}&mem_id=${writerVo.mem_id}','window_name','width=417,height=500,location=no,status=no,scrollbars=yes');">메세지</a></li>
			</c:if>
			
			<li class="mypage_leftUl2_li2">
				<a href="javascript::" onclick="layer_open2('layer_2', 'following');return false;" class="follow_btn"><b id="following_cnt"></b> 팔로잉</a> 
				<a href="javascript::" onclick="layer_open2('layer_2', 'follower');return false;" class="follow_btn"><b id="follower_cnt"></b> 팔로워</a>
			</li>
		</ul>
		
		<c:if test="${guidePlanList != null}">
			<h6 class="leftUl2_title">예약 가능한 날짜</h6>
			<form action="/reservationForEssay" method="post">
			<c:forEach items="${guidePlanList}" var="guidePlanVo" varStatus="loop">
				<table class="reservation_list reservation_list${loop.index+1}">
					<tr>
						<th>출발 일자</th>
						<td class="start_day"><fmt:formatDate value="${guidePlanVo.guideplan_start_day}" pattern="yyyy .MM .dd"/></td>
					</tr>
					<tr>
						<th>도착 일자</th>
						<td><fmt:formatDate value="${guidePlanVo.guideplan_end_day}" pattern="yyyy .MM .dd"/></td>
					</tr>
					<tr>
						<th>예약 가능인원</th>
						<td>${guidePlanVo.guideplan_peo_count}</td>
					</tr>
					<tr>
						<th>예약 가능한 남은 인원</th>
						<td>${guidePlanVo.guideplan_peo_count-guidePlanVo.total_res_people_count}</td>
					</tr>
					<tr>
						<th>선택</th>
						<td><input type="radio" id="re${loop.index+1}" name="guideplan_id" value="${guidePlanVo.guideplan_id}" required="required"></td>
					</tr>
				</table>						
			</c:forEach>
			<div class="reservation_num"> 동행 인원 : <input type="number" name="reser_apply_peo_count" placeholder="숫자만 입력하세요." required="required"> 명</div>
				<input class="reservation_btn classname" type="submit" value="예약하기">
			</form>
		</c:if>
		<!-- <table class="reservation_list reservation_list1">
			<tr>
				<th>날짜</th>
				<td>2018. 01. 10</td>
			</tr>
			<tr>
				<th>선택</th>
				<td><input type="radio" id="re1" name="re"></td>
				
				
			</tr>
			<tr>
				<th>예약 가능인원</th>
				<td>8</td>
			</tr>
	
		</table>
		
		<table class="reservation_list reservation_list2">
			<tr>
				<th>날짜</th>
				<td>2018. 01. 10</td>
			</tr>
			<tr>
				<th>선택</th>
				<td><input type="radio"  id="re2" name="re"></td>
				
				
			</tr>
			<tr>
				<th>예약 가능인원</th>
				<td>8</td>
			</tr>
	
		</table>
		<table class="reservation_list reservation_list3">
			<tr>
				<th>날짜</th>
				<td>2018. 01. 10</td>
			</tr>
			<tr>
				<th>선택</th>
				<td><input type="radio" id="re3" name="re"></td>
				
				
			</tr>
			<tr>
				<th>예약 가능인원</th>
				<td>8</td>
			</tr>
	
		</table>
		<table class="reservation_list reservation_list4">
			<tr>
				<th>날짜</th>
				<td>2018. 01. 10</td>
			</tr>
			<tr>
				<th>선택</th>
				<td><input type="radio" id="re4" name="re"></td>
				
				
			</tr>
			<tr>
				<th>예약 가능인원</th>
				<td>8</td>
			</tr>
	
		</table> -->
		
		
	</div>

</div>

<div class="layer2">
	<div class="bg"></div>
	<div id="layer_2" class="pop_layer follow_pop_layer">
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
	$("#follow_search_btn").on("click", function() {
		var stx = $("#stx1").val();
		var follow = $("#follow_popup_title").html();
		follow = follow == "팔로잉" ? "following" : "follower";
		follow_pop_up(follow, stx);
	});
</script>