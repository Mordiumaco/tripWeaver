<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi">
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="/img/favicon.ico" />

<title>TripWeaver</title>


<%@include file="lib/lib.jsp" %>
</head>
<body>

<div class="head_rap">
	<div class="head_sub_rap">
		<div class="head_con head_left">
			<ul>
				<!--  이뿌!!!!! 시작-->
				<li><a id="loginBtn" href="/main/login" >로그인</a></li>
				<li><a href="/main/adminMain" >관리자</a></li>
				<li><a href="/main/register" >회원가입</a></li>
				<!--  이뿌!!!!!  끝-->
				
				<!--  이뿌!!!!!  로그인시에만 보이게-->
				<li><a href="/main/mypage" >마이 페이지</a></li>
				<li><a class="pointer" onclick="window.open('/main/message','window_name','width=417,height=500,location=no,status=no,scrollbars=yes');" target="blank">메세지 &nbsp;<img src="/img/icon/message_icon.png" width="20px"></a></li>
				<!--  이뿌!!!!!  끝 -->
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
						<a href="">PostCard</a>
						
					</li>
					
					<li>
						<a href="">동행</a>
						<div class="oe_menu_div1">
							<div class="tri"></div>
							<ul>
								<li><a href="">가이드 찾기</a></li>
								<li><a href="">파트너 찾기</a></li>
							</ul>
						</div>
					</li>
					
					<li>
						<a href="">Best</a>
						<div class="oe_menu_div1">
							<div class="tri"></div>
							<ul>
								<li><a href="">짠내 Best</a></li>
								<li><a href="">Post Best</a></li>
								<li><a href="">Essay Best</a></li>
								<li><a href="">지역 Best</a></li>
							</ul>
						</div>
					</li>
					
					<li>
						<a href="">추천 컨텐츠</a>
						<div class="oe_menu_div1">
							<div class="tri"></div>
							<ul>
								<li><a href="">추천 여행지</a></li>
								<li><a href="">축제 기간</a></li>
								<li><a href="">숙박 찾기</a></li>
								<li><a href="">도서 찾기</a></li>
							</ul>
						</div>
					</li>
					
					<li>
						<a href="">고객센터</a>
						<div class="oe_menu_div1">
							<div class="tri"></div>
							<ul>
								<li><a href="/main/board">공지사항</a></li>
								<li><a href="">자유게시판</a></li>
								<li><a href="">Q&A</a></li>
								<li><a href="">가이드 지원</a></li>
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
		
		if(loginStatus != null|| loginStatus != ""){
			$("#loginBtn").text("로그아웃");
		}
	});
</script>