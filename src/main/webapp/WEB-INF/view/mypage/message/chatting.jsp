<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TripWeaver 메신저</title>
<link rel="shortcut icon" type="image/x-icon" href="/img/favicon.ico" />
<link rel="stylesheet" href="/js/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

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

.mes_menu ul {}
.mes_menu ul li { width: 50%; float: left; text-align: center; line-height: 50px;}
.mes_menu ul li a { color: #fff; font-weight: bold; text-decoration: none; display: inline-block; width: 100%;}
.mes_menu ul li a:hover { background: #1a6d52;}
.mes_menu ul li a img { padding-top: 5px;}

.mes_menu ul li:nth-child(2) a { background:#1a6d52; }

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

.mes_btn01::after { content:"언팔로잉"; }
.mes_btn01:hover::after { content:"팔로잉"; }

.mes_btn02::after { content:"언팔로워";}
.mes_btn02:hover::after { content:"팔로워";}


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
.fa-plus-square{font-size: 30px; color: #ffcd41;}
.local_sch03{;padding:5px 15px;background:#e9ebf9;margin:10px 0}
.local_sch div{margin:5px 0;}
.local_sch03 strong{display:inline-block;width:70px;}
.local_sch03  label{margin-right:5px;display:inline-block}
.local_sch03 button{height:30px;padding:0 5px;border:0;background:#9eacc6;color:#fff;}
.local_sch03 .btn_submit{height:30px;padding:0 5px;border:0;;color:#fff;}
.local_sch03 .frm_input{height:30px;border:1px solid #dcdcdc;padding:0 5px;}

.mes_Search { width:100%; height: 30px; background: #f1f1f1; padding:5px 5px; }
.mes_Search span { float: right; line-height: 30px; margin-right: 10px; font-size: 0.9em; color: #333; font-weight: bold;}
.mes_Search a { background: #fff; border-radius: 5px; height: 28px; width: 26px; display: block; float: right;}

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


.chatting_list { width: 100%; }
.chatting_list>ul>li:nth-child(even) { background: #f1f1f1;}

.Chat_room { width:100%; height: 70px;}
.Chat_room div { width: 20%; float: left; background:#aaa; text-align: center; padding: 15px 0;}
.Chat_room div img { margin-top: 5px;}

.Chat_room ul { width: 80%; float: left; height: 70px; padding-left: 10px; }
.Chat_room .chat_con {  
	display: inline-block; 
	width: 310px; 
	white-space: nowrap; 
	overflow: hidden; 
	text-overflow: ellipsis; 
	
	/* 여러 줄 자르기 추가 스타일 */ 
	white-space: normal; 
	height: 40px; 
	text-align: left; 
	word-wrap: break-word; 
	display: -webkit-box; 
	-webkit-line-clamp: 2; 
	-webkit-box-orient: vertical;
	line-height: 150%;
	color: #666;
}

.Chat_room li span { float: right;}

.Chat_room ul li:nth-child(1) { padding-top: 3px;}

.Chat_room b { font-size: 0.9em;}
.chat_con { font-size: 0.8em;}

.Chat_room a { color: #333;}

</style>
<script src="/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	
	(function poll() {
		$.ajax({
			url : '/message/chatRoomListViewRenew',
			type : 'get',
			data : "mem_id=" + '${loginInfo.mem_id}',
			success : function(data) {
				$('#chatting_list').html(data);
			},
			timeout : 3000,
			complete : setTimeout(function() { poll(); }, 4000)
		})
	})();
	
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
<!-- 		<form id="fsearch" name="fsearch" class="local_sch01 local_sch" method="get"> -->
<!-- 			<label for="sfl" class="sound_only">검색대상</label> -->
		
<!-- 			<label for="stx" class="sound_only">검색어<strong class="sound_only"> 필수</strong></label> -->
<!-- 			<input type="text" name="stx" value="" id="stx" required="" class="required frm_input" placeholder="채팅방 이름, 참여자로 검색해 주세요."> -->
<!-- 			<input type="submit" class="btn_submit" value="검색"> -->
<!-- 		</form> -->
			<a href="/message/createChatroomView?mem_id=${loginInfo.mem_id}" ><i class="fas fa-plus-square"></i></a><span>채팅방 생성하기</span>
	</div>
	
	<div class="chatting_list" id="chatting_list">
		
	</div>
	
	
</body>
</html>