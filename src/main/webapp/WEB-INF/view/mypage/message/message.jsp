<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TripWeaver 메신저</title>
<link rel="shortcut icon" type="image/x-icon" href="/img/favicon.ico" />

<style type="text/css">

* { box-sizing: border-box;}

body {
	overflow-x: hidden;
    max-width: 400px;
    width: 400px;
    overflow-y: scroll;
    margin: 0;
}

ul {
	list-style: none;
	padding: 0;
	margin: 0;
}

.mes_menu {
	background:#389e7d;
	width: 100%;
	height: 50px;
}

.count {
	text-align:center; 
	font-size:13px; 
	background-color:#f1f1f1; 
	height:30px; 
	line-height:30px;
}

.mes_menu ul {}
.mes_menu ul li { width: 50%; float: left; text-align: center; line-height: 50px;}
.mes_menu ul li a { color: #fff; font-weight: bold; text-decoration: none; display: inline-block; width: 100%;}
.mes_menu ul li a:hover { background: #1a6d52;}
.mes_menu ul li a img { padding-top: 5px;}

.mes_menu ul li:nth-child(1) a { background:#1a6d52; }

.mes_my { width: 100%;}
.mes_my>b {height: 30px; background: #f1f1f1; display: block; line-height: 30px; padding-left: 10px; margin-bottom: 10px;}

.mes_my div { width: 20%; float: left; max-height: 80px;}
.mes_my ul { width: 80%; float: left; height: 80px; }
.mes_my ul li { padding-left: 20px; line-height: 80px;}
.mes_my img { width: 100%;}

.mes_friendUl .mes_f_list:nth-child(even) { background: #f1f1f1;}

.mes_friend { width: 50%; float: left; border-right: 1px solid #ddd;  margin: 10px 0 0 0; }
.mes_friend h6 { text-align: center; font-size: 0.8em; background: #f1f1f1; height: 30px; line-height: 30px; margin: 0; }

.no_line { border-right: 0;}

.mes_f_list { height: 70px; padding-top: 5px; padding-bottom: 5px;}
.mes_f_list div { width: 30%; float: left; height: 60px;}
.mes_f_list div img { width: 100%; border-radius: 50%;}
.mes_f_list ul { width:70%; float: left; height: 60px;}
.mes_f_list ul li { margin-left: 10px; height: 30px; line-height: 30px; font-size: 0.75em;}

.mes_f_list ul li a { border: 1px solid #ddd; padding:3px; text-decoration: none; }
.mes_f_list ul li a:hover { background: #389e7d; color: #fff;}

.mes_btn01, .mes_btn02 { width: 40px; }

.mes_btn01::after { content:"팔로잉"; }
.mes_btn01:hover::after { content:"언팔로우"; }

.mes_btn02::after { content:"팔로우";}
.mes_btn02:hover::after { content:"팔로우";}

.mes_Search {height: 40px;}

/* 페이지 내 검색 */
.local_sch{}
.local_sch:after ,.local_sch div:after{display:block;visibility:hidden;clear:both;content:""}
.local_sch .btn_sch{width:30px;height:30px;border:0;padding:0;float:left;background:url(../img/sch_btn.png) no-repeat 50% 50%;border:1px solid #dcdcdc;border-left:0;text-indent:-999px;overflow:hidden}
.local_sch .btn_sch2{width:35px;height:35px;border:0;padding:0;background:url(../img/sch_btn.png) no-repeat 50% 50% #eee;border:1px solid #dcdcdc;text-indent:-999px;overflow:hidden}

.local_sch .sch_input{height:30px;border:1px solid #dcdcdc;border-right:0;;padding:0 5px;float:left;}
.local_sch select{height:30px;margin-right:3px;border:1px solid #dcdcdc}
.local_sch01{margin: 10px 0;}
.local_sch02{}
.local_sch01 .frm_input{height:30px;border:1px solid #dcdcdc;padding:0 5px; margin-left: 10px; width: 80%;}
.local_sch01 .btn_submit{width:30px;height:30px;border:0;padding:0;background:url(../img/sch_btn.png) no-repeat 50% 50% #eee;border:1px solid #dcdcdc;text-indent:-999px;overflow:hidden;     vertical-align: middle }
.local_sch03{;padding:5px 15px;background:#e9ebf9;margin:10px 0}
.local_sch div{margin:5px 0;}
.local_sch03 strong{display:inline-block;width:70px;}
.local_sch03  label{margin-right:5px;display:inline-block}
.local_sch03 button{height:30px;padding:0 5px;border:0;background:#9eacc6;color:#fff;}
.local_sch03 .btn_submit{height:30px;padding:0 5px;border:0;;color:#fff;}
.local_sch03 .frm_input{height:30px;border:1px solid #dcdcdc;padding:0 5px;}
/* 페이지 내 실행 */
.local_cmd {min-width:960px}

.local_cmd01 {margin:0 0 10px;padding:0 }
.local_cmd01 .cmd_tit {font-weight:bold}
.local_cmd01 .btn_submit {padding:3px 5px;border:1px solid #ff3061;color:#fff;font-size:0.95em;vertical-align:middle}

/* 필수입력 */
.required, textarea.required {background-image:url('../img/require.png')  !important;background-repeat:no-repeat   !important;background-position:right top  !important;}

/* 화면낭독기 사용자용 */
#hd_login_msg {position:absolute;top:0;left:0;font-size:0;line-height:0;overflow:hidden}
.msg_sound_only, .sound_only {display:inline-block !important; position:absolute;  top:0;  left:0;  margin:0 !important;  padding:0 !important;  font-size:0;  line-height:0; border:0 !important;overflow:hidden !important;}


.followBtn {
	width:50px;
    background-color: transparent;
    border: none;
    color:black;
    padding: 3px 0;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 12px;
    cursor: pointer;
}

/* 이미지  수정 동그라미*/
.my_profile { 
	width:80px ; 
	height:80px; 
	line-height:80px; 
	border-radius: 50%; 
	display: inline-block; 
	vertical-align: bottom; 
	overflow: hidden;
	margin-left: 5px;
}

.my_profile2 {
	width: 60px;
	height: 60px;
}

.my_profile2 img {
	min-height: 60px;
	
}


</style>
<script src="/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var login_id = '${loginInfo.mem_id}';
		follow_count(login_id);
		
		$('.followBtn').on({
			click : function() {
				var follow;
				var following_id = '${loginInfo.mem_id}';
				var followed_id = $(this).prev().val();
				console.log("following : " + following_id + "/ followed : " + followed_id);
				if($(this).hasClass('following') == true){
					$(this).val("팔로우");
					$(this).addClass("follower");
					$(this).removeClass("following");
					follow = 'N';
					unfollow(following_id, followed_id);
				} else {
					$(this).val("팔로잉");
					$(this).addClass("following");
					$(this).removeClass("follower");
					follow = 'Y';
					following(following_id, followed_id);
				}	
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
	});
	
	function following(following_id, followed_id) {
		$.ajax({
			url : "/follow/following",
			type : "post",
			data : {"mem_id2":following_id,"mem_id":followed_id},
			error : function() {
				follow_count(following_id);
			}
		});
	}
	function unfollow(following_id, followed_id) {
		$.ajax({
			url : "/follow/unfollow",
			type : "post",
			data : {"mem_id2":following_id,"mem_id":followed_id},
			error : function() {
				follow_count(following_id);
			}
		});
	}
	function follow_count(mem_id) {
		$.ajax({
			url : "/follow/followCountAjax",
			type : "post",
			data : {"mem_id":mem_id},
			success : function(dt) {
				$("#follow_count").html(dt);
			}
		});
	}
</script>

</head>
<body>
	<div class="mes_menu">
		<ul>
			<li><a href="/message/mainView?mem_id=${loginInfo.mem_id}"><img src="/img/icon/friend.png" height="20px;"/> &nbsp; 친구</a></li>
			<li><a href="/message/chatRoomListView?mem_id=${loginInfo.mem_id}"><img src="/img/icon/message01_icon.png" height="20px;" /> &nbsp; 채팅</a></li>
		</ul>
	</div>
	<div class="mes_Search">
		<form action="/message/searchFollow" id="fsearch" name="fsearch" class="local_sch01 local_sch" method="get">
			<label for="sfl" class="sound_only">검색대상</label>
			<label for="stx" class="sound_only">검색어<strong class="sound_only"> 필수</strong></label>
			<input type="text" name="stx" value="" id="stx" required="" class="required frm_input" placeholder="친구 닉네임으로 검색 하세요.">
			<input type="hidden" name="mem_id" value="${loginInfo.mem_id}">
			<input type="submit" class="btn_submit" value="검색">
		</form>
	</div>
	
	<div class="mes_my">
		<b>내프로필</b> 
		<div>
			<b class="my_profile"><img src="/file/read?mem_profile=${loginInfo.mem_profile}"></b>
		</div>
		<ul>
			<li>${loginInfo.mem_nick}</li>
		</ul>
	</div>
	<div id="follow_count">
		<!-- follow count ajax -->
	</div>
	
	<div class="mes_friend">
		<ul class="mes_friendUl">
		
			<c:forEach items="${followingVOs}" var="following">
				<li class="mes_f_list">
					<div><b class="my_profile my_profile2"><img src="/file/read?mem_profile=${following.mem_profile}"></b></div>
					<ul>
						<li>${following.mem_nick}</li>
						<li>
							<a href="">쪽지</a>
							<input type="hidden" value="${following.mem_id}">
							<input type="button" class="following followBtn" value="팔로잉">
						</li>
					</ul>
				</li>
			</c:forEach>
			

			
			
		</ul>
	</div>
	
	<div class="mes_friend no_line">
		<ul class="mes_friendUl">
	
			<c:forEach items="${followerVOs}" var="follower">
				<c:set var="fol_state" value=""/>
				<c:forEach items="${followVOs}" var="fol">
					<c:if test="${fol.mem_id2 == follower.mem_id}">
						<c:set var="fol_state" value="${fol.fol_state}"/>
					</c:if>
				</c:forEach>
				<li class="mes_f_list">
					<div><b class="my_profile my_profile2"><img src="/file/read?mem_profile=${follower.mem_profile}"></b></div>
					<ul>
						<li>${follower.mem_nick}</li>
						<li>
							<a href="">쪽지</a>
							<input type="hidden" value="${follower.mem_id}">
							<c:choose>
								<c:when test="${fol_state == 0}">
									<input type="button" class="follower followBtn" value="팔로우">
								</c:when>
								<c:otherwise>
									<input type="button" class="following followBtn" value="팔로잉">
								</c:otherwise>
							</c:choose>
						</li>
					</ul>
				</li>
			</c:forEach>


			
		</ul>
	</div>
	
</body>
</html>