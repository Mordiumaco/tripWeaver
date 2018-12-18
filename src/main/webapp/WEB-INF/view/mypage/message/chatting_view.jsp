<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TripWeaver 메신저</title>
<link rel="shortcut icon" type="image/x-icon" href="/img/favicon.ico" />
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
.mes_head ul li:nth-child(1) { width: 15%; float: left;}
.mes_head ul li:nth-child(2) { width: 85%; float: left;}
.mes_title { width: 100%;}
.mes_title div { float: left; line-height: 80px; height: 80px;}
.mes_title div:nth-child(1) { width: 20%;}
.mes_title div:nth-child(1) img { height: 64px; margin-top: 8px;}
.mes_title div:nth-child(2) { width: 80%; padding-left: 10px;}

.mes_con { width: 100%; background: #b0c4d6; overflow-y: scroll; padding: 10px;   }
.pointer { cursor: pointer;}

.mes_bottom {  width:100%; height: 100px; background: #fff;}

.mes_bottom input[type=text] { width:80%; height: 100px; line-height: 100px; padding-left: 10px; border: none; }

.mes_bottom input[type=submit] { background:#ffec42; border: 1px solid #e8d73f; padding: 10px 20px; border-radius: 5px; color: #716919;  }

.mes_con_list { width: 100%; min-height:72px; margin-bottom: 15px; display: table;}
.mes_con_list h6 { width: 20%; float: left;  margin: 0;}
.mes_con_list h6 img { height: 64px;}
.mes_con_list ul { width: 80%; float: left; padding-top: 10px;}
.mes_con_list ul li { padding-left:10px;}

.mes_date { float: right; font-size: 0.75em;}
.mes_dateMy { float: none;}

.mes_con_list_text { margin-top:5px; background:#fff; padding: 5px; border-radius: 4px; box-shadow: 1px 1px 3px #999; line-height: 160%;
	display: inline-block;
	max-width: 302px;
	word-wrap: break-word; 
	-webkit-line-clamp: 6; 
	-webkit-box-orient: vertical;
	
}

.mes_con_listMy {}
.mes_con_listMy ul { width: 100%;}
.mes_con_listMy ul li { float: right;}
.mes_con_list_textMy { background:#ffeb33 !important; }

.back { text-decoration: none; font-size: 1.7em; color: #4a461f; display: block; line-height: 80px; padding-left: 10px;}
.back:hover { color:#ffeb33 ; }

.unread {
	font-size: 10px;
	color: #FFE400;
}
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
		send();
	});
	
    $('.mes_con').css('height', $(window).height()-180); 
    $(window).resize(function() { 
        $('.mes_con').css('height', $(window).height()-180); 
    }); 
	$(".mes_con").scrollTop($(".mes_con")[0].scrollHeight); //스크롤 최하단으로이동
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
			html += '<span class="mes_date mes_dateMy">' + t + '</span></li>';
			html += '<li class="mes_con_list_text mes_con_list_textMy">';
			html +=	msg.msg_cnt + '</li><span class="unread">2</span></ul><div>';
		} else {
			html = '<div class="mes_con_list" >';
			html += '<h6><img src="/file/read?mem_profile=' + msg.mem_profile + '"></h6>';
			html += '<ul><li><b>' + msg.mem_nick + '</b>';
			html += '<span class="mes_date">' + t + '</span></li>';
			html += '<li class="mes_con_list_text">';
			html +=	msg.msg_cnt + '</li><span id="' + msg.msg_id + '" class="unread">' + msg.unread + '</span></ul><div>';
		}
	}
	
	read();
	
	if(msg == ''){
		return false;
	} else {
		$('.mes_con').append(html);
		$(".mes_con").scrollTop($(".mes_con")[0].scrollHeight);
	}
}

function getTimeStamp() {
   var d = new Date();
   var s =
     leadingZeros(d.getFullYear(), 4) + '.' +
     leadingZeros(d.getMonth() + 1, 2) + '.' +
     leadingZeros(d.getDate(), 2) + ' ' +

     leadingZeros(d.getHours(), 2) + ':' +
     leadingZeros(d.getMinutes(), 2) + ':' +
     leadingZeros(d.getSeconds(), 2);

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
		console.log("[alram] data : " + data);
		var obj = JSON.parse(data);
		console.log("[alram] obj : " + obj);
		updateReciveCount(obj);
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
	for(var i = 0; i < obj.length; i++){
		console.log("updateReciveCount : " + obj[i].unread + ' : ' + obj[i].msg_id);
		//obj에서 그룹아이디 가져와서 비교
		var iii = '' + obj[i].msg_id;
		var id = document.getElementById(iii);
		console.log("id : " + id);
		document.getElementById(iii).innerText = '' + obj[i].unread;
		console.log("id.innerText : " + document.getElementById(iii).innerText);
	}
}


</script>
</head>
<body>
	
	<div class="mes_head">
		<ul>
			<li><a class="back" href="/message/chatRoomListView?mem_id=${loginInfo.mem_id}">&#9664; </a></li>
			<li class="mes_title">
				<div><img src="/file/read?mem_profile=${loginInfo.mem_profile}" ></div>
				<div><b>
					<c:forEach items="memNickList" var="nick">
						${nick}&nbsp;
					</c:forEach>
				</b>${chatrrom_name}</div>
			</li>
		</ul>
		<form action="/message/exitChatroom">
			<input type="hidden" name="group_id" value="${group_id}">
			<input type="hidden" name="mem_id" value="${loginInfo.mem_id}">
			<input type="submit" id="exit_btn"  value="채팅방 나가기">
		</form>
	</div>
	<div class="mes_con">
		<c:set var="prev_mem_id" value=""/>
				<c:set var="prev_mem_id" value=""/>
		
		<c:forEach items="${messageVOs}" var="msg">
			<div class="mes_con_list ${msg.mem_id eq loginInfo.mem_id ? 'mes_con_listMy' : ''}" >
				<c:if test="${msg.mem_id ne loginInfo.mem_id}">
					<h6><img src="/file/read?mem_profile=${msg.mem_profile}" ></h6>
				</c:if>
				<ul>
					<li><c:if test="${msg.mem_id ne loginInfo.mem_id}"><b>${msg.mem_nick}</b></c:if> <span class="mes_date ${msg.mem_id eq loginInfo.mem_id ? 'mes_dateMy' : ''}"><fmt:formatDate value="${msg.msg_date}" pattern="yyyy.MM.dd hh:mm"/></span></li>
					<li class="mes_con_list_text ${msg.mem_id eq loginInfo.mem_id ? 'mes_con_list_textMy' : ''}">
						${msg.msg_cnt}
					</li><span id="${msg.msg_id}" class="unread">${msg.unread}</span> 
				</ul>
			</div>
		</c:forEach>
	</div>
	<div class="mes_bottom">
		<form action="/message/send" method="post">
			<input type="text" id="msg" name="msg">
			<input type="button" id="sendMessage" value="전송">
		</form>
	</div>
</body>
</html>