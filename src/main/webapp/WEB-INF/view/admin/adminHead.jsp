<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TripWeaver</title>
<link rel="stylesheet" href="/css/admin.css">
<script src="/js/jquery-3.3.1.min.js"></script>
<link rel="shortcut icon" type="image/x-icon" href="/img/favicon.ico" />
<script>
	var tempX = 0;
	var tempY = 0;
	
	function imageview(id, w, h)
	{
	
	    menu(id);
	
	    var el_id = document.getElementById(id);
	
	    //submenu = eval(name+".style");
	    submenu = el_id.style;
	    submenu.left = tempX - ( w + 11 );
	    submenu.top  = tempY - ( h / 2 );
	
	    selectBoxVisible();
	
	    if (el_id.style.display != 'none')
	        selectBoxHidden(id);
	}
</script>
<div id="to_content">
	<a href="#container">본문 바로가기</a>
</div>
<header id="hd">
    <h1>TripWeaver 관리자</h1>
    <div id="hd_top">
		<button type="button" id="btn_gnb" class="btn_gnb_close">메뉴</button>
		<div id="logo">
       		<a href="/main/adminMain">TripWeaver 관리자</a>
       	</div>
        <div id="tnb">
            <ul>
                <li class="tnb_li">
                	<a href="/main/main" class="tnb_community" target="_blank" title="커뮤니티 바로가기">커뮤니티 바로가기</a>
                </li>
                <li class="tnb_li">
                	<button type="button" class="tnb_mb_btn">관리자<span class="./img/btn_gnb.png">메뉴열기</span></button>
                    <ul class="tnb_mb_area">
                        <li id="tnb_logout"><a href="">로그아웃</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
    
    <nav id="gnb" class="gnb_large">
        <h2>관리자 주메뉴</h2>
        <ul class="gnb_ul">
            <li class="gnb_li <%-- 클래스 on을 각 페이지로 연결될때 적용해주세요. --%>on">
                <button type="button" class="btn_op menu-100 menu-order-1" title="환경설정"></button>
                <div class="gnb_oparea_wr">
                    <div class="gnb_oparea">
                        <h3>설정</h3>
                       	<a href="">팝업관리</a>
                       	<a href="">투표관리</a>
                       	<a href="">이벤트관리</a>
                       	<a href="/main/declaration">신고관리</a>
                    </div>
                </div>
            </li>
            
            <li class="gnb_li">
                <button type="button" class="btn_op menu-200 menu-order-2" title="회원관리"></button>
                <div class="gnb_oparea_wr">
                    <div class="gnb_oparea">
                        <h3>회원관리</h3>
                        <a href="/manage/memberView?page=1&pageSize=10">회원관리</a>
                    </div>
                </div>
            </li>
            
            <li class="gnb_li">
                <button type="button" class="btn_op menu-300 menu-order-3" title="게시판관리"></button>
                <div class="gnb_oparea_wr">
                    <div class="gnb_oparea">
                        <h3>게시판관리</h3>
                        <a href="/board/boardCreate">게시판관리</a>
                    </div>
                </div>
            </li>
            
            <li class="gnb_li">
                <button type="button" class="btn_op menu-500 menu-order-5" title="통계"></button>
                <div class="gnb_oparea_wr">
                    <div class="gnb_oparea">
                        <h3>통계</h3>
                       	<a href="/connStat/connStatList?page=1&pageSize=10&dateType=month&classification=browser">접속자 통계</a>
                       	<a href="/connStat/connStatTime">접속자 시간 통계</a>
                       	<a href="/artstat/artstatEssay">게시물 통계</a>
                    </div>
                </div>
            </li>
            
            <li class="gnb_li">
                <button type="button" class="btn_op" title="필터"></button>
                <div class="gnb_oparea_wr">
                    <div class="gnb_oparea">
                        <h3>필터생성</h3>
                        <a href="/main/codetable">코드테이블</a>
                    </div>
                </div>
            </li>
        </ul>
    </nav>
</header>

<script>

	var model = ${gnb};
	if(model != null){
		$("#gnb .gnb_ul").children().eq(model).addClass("on").siblings().removeClass("on");
	}
		
	jQuery(function($){

		
	    var menu_cookie_key = 'g5_admin_btn_gnb';
	
	    $(".tnb_mb_btn").click(function(){
	        $(".tnb_mb_area").toggle();
	    });
	
	    $("#btn_gnb").click(function(){
	        
	        var $this = $(this);
	
	        try {
	            if( ! $this.hasClass("btn_gnb_open") ){
	                set_cookie(menu_cookie_key, 1, 60*60*24*365);
	            } else {
	                delete_cookie(menu_cookie_key);
	            }
	        }
	        catch(err) {
	        }
	
	        $("#container").toggleClass("container-small");
	        $("#gnb").toggleClass("gnb_small");
	        $this.toggleClass("btn_gnb_open");

    	});

	    $(".gnb_ul li .btn_op" ).click(function() {
	        $(this).parent().addClass("on").siblings().removeClass("on");
	    });

	});
</script>


<div id="wrapper">
    <div id="container" class="">
        <h1 id="container_title"> <%-- 각 제목 가져오세요. --%> ${title}</h1>
        <div class="container_wr">

