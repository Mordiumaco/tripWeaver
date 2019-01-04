<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

#exit_btn { position: absolute; top: 0; right: 0; background: #ffeb33;  border: 1px solid #a79816; padding: 5px; border-radius: 0 0 5px 5px; font-size: 0.8em;}
#exit_btn:hover { background:#797016; color: #fff;}

#sendMessage { background:#ffeb33; border: 1px solid #e8d73f; padding: 5px 10px; border-radius: 3px;}
#sendMessage:hover { background: #bfb021;}
.mes_dateMy { position: absolute; left: -100px; width: 100px;}
</style>

 <!-- Web socket CDN -->
<script src="http://cdn.sockjs.org/sockjs-0.3.4.js"></script>

<script language="JavaScript" type="text/javascript">
var sock;
var sock_alram;


$(document).ready(function(){ 
	connect();
	connect_alram();
	
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
		var conf = confirm("채팅방을 나가시겠습니까?");
		if(conf){
			var mem_nick = '${loginInfo.mem_nick}';
			if(msg != ""){
				message = {};
				message.msg_cnt = '"' + mem_nick + '"님이 퇴장하셨습니다.';
				message.msg_date = new Date();
				message.mem_id = 'admin';
				message.group_id = '${group_id}';
			}
			sock.send(JSON.stringify(message));
			
			$('#exit_frm').submit();
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
			html = '<div><h6>' + msg.msg_cnt + '</h6></div>';
		} else {
			html = '<div class="mes_con_list" >';
			html += '<h6 class="my_profile my_profile2" ><img src="/file/read?mem_profile=' + msg.mem_profile + '"></h6>';
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
	if(obj == '0'){
// 		var className = document.getElementsByClassName('unread');
		var abc = $('.unread').text(0);
// 		console.log("className : " + className);
// 		console.log("className.innerText1 : " + className.innerText);
// 		className.innerText = '여기야여기!!';
// 		console.log("className.innerText2 : " + className.innerText);
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


</script>
</head>
<body>
	<div class="mes_head">
		<ul>
			<li><a class="back" href="/message/chatRoomListView?mem_id=${loginInfo.mem_id}">&#9664; </a></li>
			<li class="mes_title">
				<div class="my_profile"><img src="/file/read?mem_profile=${loginInfo.mem_profile}" ></div>
				<div><b>
					<c:forEach items="memNickList" var="nick">
						${nick}&nbsp;
					</c:forEach>
				</b>${chatrrom_name}</div>
			</li>
		</ul>
		<form id="exit_frm" action="/message/exitChatroom">
			<input type="hidden" name="group_id" value="${group_id}">
			<input type="hidden" name="mem_id" value="${loginInfo.mem_id}">
			<input type="button" id="exit_btn"  value="채팅방 나가기">
		</form>
	</div>
	<div class="mes_con">
		<c:set var="prev_mem_id" value=""/>
				<c:set var="prev_mem_id" value=""/>
		
		<c:forEach items="${messageVOs}" var="msg">
			<c:choose>
				<c:when test="${msg.mem_id eq 'admin'}">
					<div><h6>${msg.msg_cnt}</h6></div>				
				</c:when>
				<c:otherwise>
					<div class="mes_con_list ${msg.mem_id eq loginInfo.mem_id ? 'mes_con_listMy' : ''}" >
						<c:if test="${msg.mem_id ne loginInfo.mem_id}">
							<h6 class="my_profile my_profile2"><img src="/file/read?mem_profile=${msg.mem_profile}" ></h6>
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
</body>
</html>