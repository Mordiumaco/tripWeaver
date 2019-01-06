<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi">
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="/img/favicon.ico" />

<title>TripWeaver</title>

<meta property="og:url"           content="http://localhost:8081/main/main" />
<meta property="og:type"          content="website" />
<meta property="og:title"         content="TripWeaver" />
<meta property="og:description"   content="TripWeaver" />
<meta property="og:image"         content="http://localhost:8081/img/main_01.jpg" />


<%@include file="lib/lib.jsp" %>
</head>
<body>
<script type="text/javascript">
	(function poll() {
		$.ajax({
			url : '/message/alram',
			type : 'get',
			data : "mem_id=" + '${loginInfo.mem_id}',
			success : function(data) {
				if(data > 0){
					$('#alram').text(data);
					$('#alram').addClass('alram');
				} else {
					$('#alram').text('');
					$('#alram').removeClass('alram');
				}
			},
			timeout : 3000,
			complete : setTimeout(function() { poll(); }, 4000)
		})
	})();
</script>
<div class="head_rap">
	<div class="head_sub_rap">
		<div class="head_con head_left">
			<ul>
				<li><a id="loginBtn" href="/main/login" >로그인</a></li>
				<c:choose>
					<c:when test="${loginInfo.mem_id == null}">
						<li><a href="/main/register" >회원가입</a></li>
					</c:when>
					
					<c:when test="${loginInfo.mem_id == 'admin'}">
						<li><a href="/main/adminMain" >관리자</a></li>
					</c:when>
					
					<c:otherwise>
						<li><a href="/main/mypage" >마이 페이지</a><img src="/uplod/profile/profile1.jpg"></li>
						<li><a class="pointer" onclick="window.open('/message/mainView?mem_id=${loginInfo.mem_id}','window_name','width=417,height=500,location=no,status=no,scrollbars=yes');" target="blank">메세지 &nbsp;<img src="/img/icon/message_icon.png" width="20px"><span id="alram" class="alram"></span></a></li>
					</c:otherwise>
				</c:choose>

	
			</ul>
		</div>
		<div class="head_con head_mid">
			<a href="/main/main">
				<img src="/img/logo3.png"  >
			</a>
		</div>
		<div class="head_con head_right">
			
			<div class="oe_menu_wrap">
				<ul id="oe_menu" class="oe_menu">
					<li>
						<a href="/postCard/postCardList?mem_id=${loginInfo.mem_id}&tag_search=">PostCard</a>
					</li>
					
					<li>
						<a href="">동행</a>
						<div class="oe_menu_div1">
							<div class="tri"></div>
							<ul>
								<li><a href="/main/board?board_id=bd00006">가이드 찾기</a></li>
								<li><a href="/main/board?board_id=bd00007">파트너 찾기</a></li>
							</ul>
						</div>
					</li>
					
					<li>
						<a href="/moneyBest">Best</a>
						<div class="oe_menu_div1">
							<div class="tri"></div>
							<ul>
								<li><a href="/moneyBest">짠내 Best</a></li>
								<li><a href="/postBest">Post Best</a></li>
								<li><a href="/essayBest">Essay Best</a></li>
								<%--  <li><a href="/areaBest">지역 Best</a></li> --%>
							</ul>
						</div>
					</li>
					
					<li>
						<a href="/recommendation/travelDestination">추천 컨텐츠</a>
						<div class="oe_menu_div1">
							<div class="tri"></div>
							<ul>
								<li><a href="/recommendation/travelDestination">추천 여행지</a></li>
								<li><a href="/recommendation/festival">축제 기간</a></li>
								<li><a href="/recommendation/lodgment">숙박 찾기</a></li>
								<li><a href="/recommendation/books">도서 찾기</a></li>
							</ul>
						</div>
					</li>
					
					<li>
						<a href="/main/board?board_id=bd00001&page=1&pageSize=10">고객센터</a>
						<div class="oe_menu_div1">
							<div class="tri"></div>
							<ul>
								<li><a href="/main/board?board_id=bd00001&page=1&pageSize=10">공지사항</a></li>
								<li><a href="/main/board?board_id=bd00002">자유게시판</a></li>
								<li><a href="/main/board?board_id=bd00004">Q&A</a></li>
								<li><a href="/main/board?board_id=bd00003">가이드 지원</a></li>
							</ul>
						</div>
					</li>
					
				</ul>
			</div>
		</div>
		
		
	</div>
</div>

	
	
<script type="text/javascript">
	$(function() {
		var $oe_menu = $('#oe_menu');
		var $oe_menu_items = $oe_menu.children('li');
		var $oe_overlay = $('#oe_overlay');

		$oe_menu_items.bind(
				'mouseenter',
				function() {
					var $this = $(this);
					$this.addClass('slided selected');
					$this.children('div').css('z-index', '9999').stop(true,
							true).slideDown(200, function() {
						$oe_menu_items.not('.slided').children('div').hide();
						$this.removeClass('slided');
					});
				}).bind('mouseleave', function() {
			var $this = $(this);
			$this.removeClass('selected').children('div').css('z-index', '1');
		});

		$oe_menu.bind('mouseenter', function() {
			var $this = $(this);
			$oe_overlay.stop(true, true).fadeTo(200, 0.6);
			$this.addClass('hovered');
		}).bind('mouseleave', function() {
			var $this = $(this);
			$this.removeClass('hovered');
			$oe_overlay.stop(true, true).fadeTo(200, 0);
			$oe_menu_items.children('div').hide();
		})
		
		var loginStatus = "${loginInfo}";
		
		 
		if(loginStatus != null && loginStatus != ""){
			$("#loginBtn").click(function () {
				naverLogin.logout();
			});
			$("#loginBtn").text("로그아웃");
			$("#loginBtn").attr({"href":"/login/logout"})
		}
		 
		
		 
	});
</script>