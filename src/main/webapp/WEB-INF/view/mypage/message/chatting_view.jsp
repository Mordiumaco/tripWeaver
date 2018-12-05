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

.mes_con_list { width: 100%; min-height:72px; margin-bottom: 10px;}
.mes_con_list h6 { width: 20%; float: left;  margin: 0;}
.mes_con_list h6 img { height: 64px;}
.mes_con_list ul { width: 80%; float: left; padding-top: 10px;}
.mes_con_list ul li { padding-left:10px;}

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
</style>

<script language="JavaScript" type="text/javascript">
$(document).ready(function(){ 
    $('.mes_con').css('height', $(window).height()-180); 
    $(window).resize(function() { 
        $('.mes_con').css('height', $(window).height()-180); 
    }); 
});
</script>

</head>
<body>
	
	<div class="mes_head">
		<ul>
			<li><a class="back" href="/message/chatRoomListView">&#9664; </a></li>
			<li class="mes_title">
				<div><img src="/img/p_01.png" ></div>
				<div><b>박찬배, 최재현, 박진</b> 채팅방</div>
			</li>
		</ul>
	</div>
	
	<div class="mes_con">
		
		<div class="mes_con_list" >
			<h6><img src="/img/p_03.png" ></h6>
			<ul>
				<li><b>유댕이</b></li>
				<li class="mes_con_list_text">
					내용입니다. 내용이에요.
				</li>
			</ul>
		</div>
		
		<div class="mes_con_list mes_con_listMy" >
			<ul>
				<li class="mes_con_list_text mes_con_list_textMy">
					내용입니다. 내용이에요.12312321
				</li>
			</ul>
		</div>
		
		<div class="mes_con_list" >
			<h6><img src="/img/p_02.png" ></h6>
			<ul>
				<li><b>유댕댕</b></li>
				<li class="mes_con_list_text">
					야 그거 알아? this 이상하다 아아아 sssssss asdasdsad ㅁㄴㅇㅁㄴㅇㅁㄴ
					야 그거 알아? this 이상하다 아아아 sssssss asdasdsad ㅁㄴㅇㅁㄴㅇㅁㄴ
					야 그거 알아? this 이상하다 아아아 sssssss asdasdsad ㅁㄴㅇㅁㄴㅇㅁㄴ
					야 그거 알아? this 이상하다 아아아 sssssss asdasdsad ㅁㄴㅇㅁㄴㅇㅁㄴ
					야 그거 알아? this 이상하다 아아아 sssssss asdasdsad ㅁㄴㅇㅁㄴㅇㅁㄴ
					야 그거 알아? this 이상하다 아아아 sssssss asdasdsad ㅁㄴㅇㅁㄴㅇㅁㄴ
					야 그거 알아? this 이상하다 아아아 sssssss asdasdsad ㅁㄴㅇㅁㄴㅇㅁㄴ
					야 그거 알아? this 이상하다 아아아 sssssss asdasdsad ㅁㄴㅇㅁㄴㅇㅁㄴ
					야 그거 알아? this 이상하다 아아아 sssssss asdasdsad ㅁㄴㅇㅁㄴㅇㅁㄴ
				</li>
			</ul>
		</div>
		
		<div class="mes_con_list" >
			<h6><img src="/img/p_02.png" ></h6>
			<ul>
				<li><b>유댕댕</b></li>
				<li class="mes_con_list_text">
					sdfldsjflsdfl
				</li>
			</ul>
		</div>
	
	     
	</div>
	<div class="mes_bottom">
		<form action="">
			<input type="text">
			<input type="submit" value="전송">
		</form>
	</div>
	
	
	
</body>
</html>