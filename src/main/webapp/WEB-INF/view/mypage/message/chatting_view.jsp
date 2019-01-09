<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TripWeaver 메신저</title>
<link rel="shortcut icon" type="image/x-icon" href="/img/favicon.ico" />
<link rel="stylesheet" href="/js/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

<script src="/js/jquery-3.3.1.min.js"></script>
<style type="text/css">

* { box-sizing: border-box;}

body {
	overflow-x: hidden;
    max-width: 414px;
    width: 414px;
    overflow:hidden;
    margin: 0;
    position: relative;
}

ul {
	list-style: none;
	padding: 0;
	margin: 0;
}

.mes_head { width:100%; height:80px; background:#a9bdce; border-bottom: 1px solid #a4b7c7; }
.mes_head ul { width:100%; height: 80px;}
.mes_head ul li:nth-child(1) { width: 10%; float: left;}
.mes_head ul li:nth-child(2) { width: 85%; float: left;}
.mes_title { width: 100%;}
.mes_title div { float: left; line-height: 80px; height: 80px;}
.mes_title div:nth-child(1) { width: 20%; margin-top: 5px;}
.mes_title div:nth-child(1) img {  width:100%; }
.mes_title div:nth-child(2) { width: 80%; padding-left: 10px;}

.mes_con { width: 100%; background: #b0c4d6; overflow-y: scroll; padding: 10px;   }
.pointer { cursor: pointer;}

.mes_bottom {  width:100%; height: 100px; background: #fff;}

.mes_bottom input[type=text] { width:80%; height: 100px; line-height: 100px; padding-left: 10px; border: none; }

.mes_bottom input[type=submit] { background:#ffec42; border: 1px solid #e8d73f; padding: 10px 20px; border-radius: 5px; color: #716919;  }

.mes_con_list { width: 100%; min-height:72px; margin-bottom: 15px; display: table;}
.mes_con_list h6 { width: 20%; float: left;  margin: 0;}
.mes_con_list h6 img { width: 100%;}
.mes_con_list ul { width: 80%; float: left; padding-top: 10px;}
.mes_con_list ul li { padding-left:10px;}

.mes_date { font-size: 0.75em; color: #666; position: absolute; top: 15px; right: -100px;}
.mes_dateMy { float: none;}

.mes_con_list_text { margin-top:5px; background:#fff; padding: 5px; border-radius: 4px; box-shadow: 1px 1px 3px #999; line-height: 160%;
	display: inline-block;
	max-width: 302px;
	word-wrap: break-word; 
	-webkit-line-clamp: 6; 
	-webkit-box-orient: vertical;
	margin-left: 5px;
	
	position: relative;
	
}

.mes_con_listMy { position: relative;}
.mes_con_listMy ul { width: 100%;}
.mes_con_listMy ul li { float: right;}
.mes_con_list_textMy { background:#ffeb33 !important;  }

.back { text-decoration: none; font-size: 1.7em; color: #4a461f; display: block; line-height: 80px; padding-left: 10px;}
.back:hover { color:#ffeb33 ; }

.unread {
	font-size: 0.7em;
	color: #FFE400;
	margin-left: 5px;
	padding-top: 5px;
	position: absolute;
	top:-6px;
	right: -15px;
}

/* 이미지  수정 동그라미*/
.my_profile { 
	width:70px !important; 
	height:70px !important; 
	line-height:70px !important; 
	border-radius: 50%; 
	display: inline-block; 
	vertical-align: bottom; 
	overflow: hidden;
}

.my_profile2 {
	width: 60px !important;
	height: 60px !important;
}

.my_profile2 img {
	min-height: 60px;
	
}

.mes_con_listMy .unread { position: absolute; left: -20px; width: 10px; }

#roomName_btn:hover { background:#797016; color: #fff;}
#exit_btn { background: #ffeb33;  border: 1px solid #a79816; padding: 5px; border-radius: 5px; font-size: 0.8em; margin: 5px 0px 10px 10px;}
#exit_btn:hover { background:#797016; color: #fff;}

#sendMessage { background:#ffeb33; border: 1px solid #e8d73f; padding: 5px 10px; border-radius: 3px;}
#sendMessage:hover { background: #bfb021;}
.mes_dateMy { position: absolute; left: -100px; width: 100px;}

.admin_msg {
	width: 380px;
	height: 16px;
	background-color: #aaa;
	color: white;
	text-align: center;
	border-radius: 5px;
}

#memberCnt {
	color: #ffeb33;
}
.cursor {cursor: pointer; color: #ffeb33;}

#rightMenu {
	width : 200px;
	height: 400px;
	background: white;
	border-radius: 5px 0px 0px 0px;
	position: absolute;
	top: 0px;
	right: -190px;
	overflow-y: scroll;
	z-index: 10;
}

#roomName { width: 75%; margin: 10px 5px 5px 25px;}

#roomName_btn { background: #ffeb33;  border: 1px solid #a79816; padding: 5px; border-radius: 5px; font-size: 0.8em; float: left; margin: 5px 8px 10px 27px;}

#rightMenu_02 { font-weight: bold; font-size: 15px;}

#rightMenu_03 { width: 90%}

.03_li { width: 80%; height: 90px; margin: 10px 5px 5px 15px;}

.my_profile { width:80px ; height:80px; line-height:80px; border-radius: 50%; display: inline-block; vertical-align: bottom; overflow: hidden;}

.mypage_follow_li { width: 196px !important; height: 90px !important; float: left; }

.mypage_follow_profile { width: 80px !important; margin: 5px; float: left;}

.msg_mem_nick {}

.fold_btn { width: 30px; height: 50px; line-height:50px; position: fixed; top: 0px; right: 10px; background: #dddddd; text-align: center; border-radius: 15px 0 0 15px ; font-weight: bold; cursor: pointer; z-index: 11; }
.fold_btn::after { content: ">";}

.fold_btnAfter::after { content: "<";}

</style>

 <!-- Web socket CDN -->
<script src="http://cdn.sockjs.org/sockjs-0.3.4.js"></script>

<script language="JavaScript" type="text/javascript">
var sock;
var sock_alram;
var sock_access;


$(document).ready(function(){ 
	connect();
	connect_alram();
	connect_access();
	
	$('#rightMenu').on('click','.fold_btn',function () {
		$('.mypage_right2').animate({ right : '-190px'},200);
		$('.fold_btn').animate({ right : '-1px'},200);
		$('.fold_btn').addClass('fold_btnAfter');
	}); 
	
	$('#rightMenu').on('click','.fold_btnAfter',function () {
		$('.mypage_right2').animate({ right : '0px'},200);
		$('.fold_btn').animate({ right : '190px'},200);
		$('.fold_btn').removeClass('fold_btnAfter');
	});
	
	$('#roomName_btn').on('click', function() {
		var conf = confirm("채팅방이름을 수정하시겠습니까?");
		var chatroom_name = $('#roomName').val();
		var group_id = '${group_id}';
		var mem_id = '${loginInfo.mem_id}';
		if(conf){
			$.ajax({
				url : '/message/updateChatroomName',
				type : 'post',
				data : {'group_id':group_id,'mem_id':mem_id,'chatroom_name':chatroom_name},
				success : function(dt) {
					
					$('#roomTitle').html(chatroom_name);
					
				}
			});
		}
	});
// 	var getRead = function () {
// 		var deferred = $.Deferred();
// 		try {
// 			deferred.resolve();
// 		} catch (e) {
// 			deferred.reject(e);
// 		}
// 		return deferred.promise();
// 	}
// 	getRead().done(function(msg) {
// 		console.log("msg : " + msg);
// 		read();	
// 	});
	
	$("#sendMessage").on("click", function() {
		if($("#msg").val() == ''){
			alert("보낼 메세지를 1자 이상 입력해주세요.");
		} else {
			send();
		}
	});
	
    $('.mes_con').css('height', $(window).height()-180); 
    $(window).resize(function() { 
        $('.mes_con').css('height', $(window).height()-180); 
    }); 
	$(".mes_con").scrollTop($(".mes_con")[0].scrollHeight); //스크롤 최하단으로이동
	
	$("#msg").keydown(function(e) {
			if(e.keyCode == 13){
				if($("#msg").val() == ''){
					alert("보낼 메세지를 1자 이상 입력해주세요.");
				} else {
					send();
				}
			}
	});
	
	$('#exit_btn').on('click', function() {
		//나간멤버아이디, 나간채팅방아이디
		var conf = confirm("채팅방을 나가시겠습니까?");
		if(conf){
			var mem_nick = '${loginInfo.mem_nick}';
			if(msg != ""){
				message = {};
				message.msg_cnt = '"' + mem_nick + '"님이 퇴장하셨습니다.';
				message.msg_date = new Date();
				message.mem_id = 'admin';
				message.group_id = '${group_id}';
				message.access = 'exit';
				message.alram_mem_id = '${loginInfo.mem_id}';
			}
			sock.send(JSON.stringify(message));			//퇴장, 초대 메세지를 띄우기 위한 부분
			message.mem_id = '${loginInfo.mem_id}';
			sock_access.send(JSON.stringify(message));	//채팅방 대화상대 리스트 갱신을 위한 부분
			$('#exit_frm').submit();					//채팅방리스트화면으로가는 부분
		}
	});
});

function connect() {
	sock = new SockJS('/message');
	sock.onopen = function() {
		console.log('onopen : ' + sock);
	};
	sock.onmessage = function(event) {
		var data = event.data;
		console.log(data);
		var obj = JSON.parse(data);
		console.log(obj);
		appendMessage(obj);
	};
	sock.onclose = function() {
		console.log('onclose');
	};
};

function send() {
	var msg = $("#msg").val();
	if(msg != ""){
		message = {};
		message.msg_cnt = msg;
		message.msg_date = new Date();
		message.mem_id = '${loginInfo.mem_id}';
		message.group_id = '${group_id}';
	}
	sock.send(JSON.stringify(message));
	$("#msg").val("");
}

function appendMessage(msg) {
	var html;
	var t = getTimeStamp();
	console.log("msg.mem_id : " + msg.mem_id + " + " + '${loginInfo.mem_id}');
	if(msg.group_id == '${group_id}'){
		if(msg.mem_id == '${loginInfo.mem_id}'){
			html = '<div class="mes_con_list mes_con_listMy" >';
			html += '<ul><li>';
			html += '</li>';
			html += '<li class="mes_con_list_text mes_con_list_textMy">';
			html +=	msg.msg_cnt + '<span id="' + msg.msg_id + '" class="unread">' + msg.unread + '</span><span class="mes_date mes_dateMy">' + t + '</span></li></ul><div>';
		} else if(msg.mem_id == 'admin') {
			if(msg.access == 'exit'){ //채팅방나가기일때
				html = '<div class="admin_msg"><h6>' + msg.msg_cnt + '&nbsp;<a class="cursor" onclick="invitedMember(\'' + msg.alram_mem_id + '\')">초대하기</a></h6></div>';
			} else { //채팅방 초대일경우
				html = '<div class="admin_msg"><h6>' + msg.msg_cnt + '</h6></div>';
			}
		} else {
			html = '<div class="mes_con_list" >';
			html += '<h6 class="my_profile my_profile2" ><img src="/file/read?file=' + msg.mem_profile + '"></h6>';
			html += '<ul><li><b>' + msg.mem_nick + '</b>';
			html += '</li>';
			html += '<li class="mes_con_list_text">';
			html +=	msg.msg_cnt + '<span id="' + msg.msg_id + '" class="unread">' + msg.unread + '</span><span class="mes_date">' + t + '</span></li></ul><div>';
		}
	}
	
	
	if(msg == ''){
		return false;
	} else {
		$('.mes_con').append(html);
		$(".mes_con").scrollTop($(".mes_con")[0].scrollHeight);
	}
	read();
}

function getTimeStamp() {
   var d = new Date();
   var s =
     leadingZeros(d.getFullYear(), 4) + '.' +
     leadingZeros(d.getMonth() + 1, 2) + '.' +
     leadingZeros(d.getDate(), 2) + ' ' +

     leadingZeros(d.getHours(), 2) + ':' +
     leadingZeros(d.getMinutes(), 2);

   return s;
 }

 function leadingZeros(n, digits) {
   var zero = '';
   n = n.toString();

   if (n.length < digits) {
     for (i = 0; i < digits - n.length; i++)
       zero += '0';
   }
   return zero + n;
 }

function connect_alram() {
	sock_alram = new SockJS('/alram');
	sock_alram.onopen = function() {
		console.log('[alram] onopen : ' + sock);
		read();
	};
	sock_alram.onmessage = function(event) {
		var data = event.data;
			console.log("[alram] event.data : " + data);
		if(data != '[]'){
			console.log("[alram] data : " + data);
			var obj = JSON.parse(data);
			console.log("[alram] obj : " + obj);
			updateReciveCount(obj);
		} else {
			updateReciveCount('0');
		}
	};
	sock_alram.onclose = function() {
		console.log('[alram] onclose');
	}
}
//읽음 (채팅방 입장했을경우, 메세지 수신받았을 경우)
function read() {
	//채팅방 아이디, 로그인멤버 아이디
	var participant = new Object();
	participant.mem_id = '${loginInfo.mem_id}';
	participant.group_id = '${group_id}';
	sock_alram.send(JSON.stringify(participant));
}
//메세지 읽음인원 수정
function updateReciveCount(obj) {
	if(obj[0].group_id == '${group_id}'){
		if(obj == '0'){
			var abc = $('.unread').text(0);
		} else {
			for(var i = 0; i < obj.length; i++){
				console.log("updateReciveCount : " + obj[i].unread + ' : ' + obj[i].msg_id);
				//obj에서 그룹아이디 가져와서 비교
				var iii = '' + obj[i].msg_id;
				var id = document.getElementById(iii);
				console.log("id : " + id);
				if(id.innerText != null){
					id.innerText = '' + obj[i].unread;
					console.log("id.innerText : " + document.getElementById(iii).innerText);
				}
			}
		}
	}
}

function connect_access() {
	sock_access = new SockJS('/access');
	sock_access.onopen = function() {
		console.log('[access] onopen : ' + sock);
		read();
	};
	sock_access.onmessage = function(event) {
		var data = event.data;
		if(data != '[]'){
			var obj = JSON.parse(data);
			console.log("[access] data : " + data);
			console.log("[access] obj : " + obj);
			if(obj[0].group_id == '${group_id}'){
				renewMember(obj);
				if(obj[0].mem_qrcode == '2'){ //이미 초대된 멤버일경우
					if(obj[0].invite_nick == '${loginInfo.mem_nick}'){ //누른사람과 로그인멤버가 같을경우만
						alert('이미 초대된 멤버입니다.');
					}
				} else if(obj[0].mem_qrcode == '1'){ //초대가 아니라 퇴장일 수 도 있는거 잖아			
					message = {};
					message.msg_cnt = '"' + obj[0].invite_nick + '"님이 "' + obj[0].invited_nick + '"님을 초대완료 하였습니다.';
					message.msg_date = new Date();
					message.mem_id = 'admin';
					message.group_id = '${group_id}';
					message.access = 'invite';
					sock.send(JSON.stringify(message));			//메세지
				}
			}
		} else {
		}
	};
	sock_access.onclose = function() {
		console.log('[access] onclose');
	}
}

function invitedMember(invited_id) {
	//이미 초대된 인원인지 확인 아작스 보내서 이미 존재하는지 확인
	//초대받는사람 아이디
	//초대되는 방아이디, 방닉네임
	//멤버 아이디말고 닉네임
// 	var invite_id = '';		//초대받는사람ID
	var conf = confirm('"' + invited_id + '"님을 초대하시겠습니까?');
	var group_id = '${group_id}';
	if(conf){
		var invite_nick = '${loginInfo.mem_nick}';	//초대한사람
		if(msg != ""){
			message = {};
			message.mem_id = invited_id;
			message.group_id = '${group_id}';
			message.access = 'invite';
			message.invite_nick = invite_nick;
			message.invited_nick = invited_id;
			
			sock_access.send(JSON.stringify(message));	//먼저 확인하고
		}
	}
}

function renewMember(obj) {
	console.log('renewMember(obj) 들어옴');
	console.log('renewMember(obj) : ' + obj);
	//채팅방나가기를 눌렀을 경우
	//초대하기를 눌었을 경우
	//채팅방 인원수, 채팅방 대화상대 리스트 갱신
	$("#memberCnt").html(obj.length);
	
	var html = "";
	$.each(obj, function(idx, mem) {
		html += '	<li class="03_li mes_f_list mypage_follow_li">';
		html += '		<div class="mypage_follow_profile">';
		html += '			<b class="my_profile my_profile2">';
		html += '				<img src="/file/read?file=' + mem.mem_profile + '">';
		html += '			</b>';	
		html += '		</div>';
		html += '		<div class="msg_mem_nick">' + mem.mem_nick + '</div>';
		html += '	</li>';
	});
	$("#rightMenu_03").html(html);
	
}

</script>
</head>
<body>
	<!-- 우측메뉴 -->
	<div id="rightMenu" class="mypage_right2">
		<div class="fold_btn fold_btnAfter"></div>
		<div id="rightMenu_01">
			<div>
				<input type="text" name="roomName" id="roomName" placeholder="방이름 수정"/>
				<input type="button" id="roomName_btn" value="변경"/>
			</div>
			<form id="exit_frm" action="/message/chatRoomListView">
				<input type="hidden" name="mem_id" value="${loginInfo.mem_id}">
				<input type="button" id="exit_btn"  value="채팅방 나가기">
			</form>
		</div>
		<div id="rightMenu_02">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;대화상대
		</div>
		<ul id="rightMenu_03">
			<c:forEach items="${memList}" var="mem">
				<li class="03_li mes_f_list mypage_follow_li">
					<div class="mypage_follow_profile">
						<b class="my_profile my_profile2">
							<img src="/file/read?file=${mem.mem_profile}">
						</b>
					</div>
					<div class="msg_mem_nick">${mem.mem_nick}</div>
				</li>
			</c:forEach>
		</ul>
		
	</div>
	<!--  -->
	<div class="mes_head">
		<ul>
			<li><a class="back" href="/message/chatRoomListView?mem_id=${loginInfo.mem_id}">&#9664; </a></li>
			<li class="mes_title">
				<div class="my_profile"><img src="/file/read?file=${loginInfo.mem_profile}" ></div>
				<div>
					<b id="roomTitle">${chatrrom_name}</b>&nbsp;<span id="memberCnt">${fn:length(memList)}</span>
				</div>
			</li>
		</ul>
	</div>
	<div class="mes_con">
		<c:set var="prev_mem_id" value=""/>
				<c:set var="prev_mem_id" value=""/>
		
		<c:forEach items="${messageVOs}" var="msg">
			<c:choose>
				<c:when test="${msg.mem_id eq 'admin'}">
					<c:if test="${fn:contains(msg.msg_cnt, '초대')}">
						<div class="admin_msg"><h6>${msg.msg_cnt}</h6></div>				
					</c:if>
					<c:if test="${fn:contains(msg.msg_cnt, '퇴장')}">
						<div class="admin_msg"><h6>${msg.msg_cnt}&nbsp;<a class="cursor" onclick="invitedMember('${msg.alram_mem_id}')">초대하기</a></h6></div>				
					</c:if>
				</c:when>
				<c:otherwise>
					<div class="mes_con_list ${msg.mem_id eq loginInfo.mem_id ? 'mes_con_listMy' : ''}" >
						<c:if test="${msg.mem_id ne loginInfo.mem_id}">
							<h6 class="my_profile my_profile2"><img src="/file/read?file=${msg.mem_profile}" ></h6>
						</c:if>
						<ul>
							<li><c:if test="${msg.mem_id ne loginInfo.mem_id}"><b>${msg.mem_nick}</b></c:if></li>
							<li class="mes_con_list_text ${msg.mem_id eq loginInfo.mem_id ? 'mes_con_list_textMy' : ''}">
								${msg.msg_cnt}
								<span id="${msg.msg_id}" class="unread">${msg.unread}</span> 
								<span class="mes_date ${msg.mem_id eq loginInfo.mem_id ? 'mes_dateMy' : ''}"><fmt:formatDate value="${msg.msg_date}" pattern="yyyy.MM.dd hh:mm"/></span>
							</li>					
						</ul>
					</div>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</div>
	<div class="mes_bottom">
		<input type="text" id="msg" name="msg">
		<input type="button" id="sendMessage" value="전송">
	</div>
	<!-- 우측 채팅방 멤버, 채팅방 나가기, 채팅방 이름 수정,  -->
	<div>
		
	</div>
</body>
</html>