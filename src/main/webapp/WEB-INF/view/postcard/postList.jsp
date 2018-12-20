<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../head.jsp" %>
<link rel="stylesheet" href="/css/flexslider2.css" type="text/css" media="screen" />


<%--   
/* 포스트카드 내용에 a태그 추가하기  */
function alinkSplite(thisClick) {

	var content = $(thisClick[0]).siblings('.content').text();  // html 안에 'content'라는 아이디를 content 라는 변수로 정의한다.

	var splitedArray = content.split(' '); // 공백을 기준으로 문자열을 자른다.

	var linkedContent = '';
	for(var word in splitedArray)
	{
	  word = splitedArray[word];
	  
	   if(word.indexOf('#') == 0) // # 문자를 찾는다.
	   {
		   var word1 = word.substring(1, word.lastIndexOf('#'));
		   var word2 = word.substring(word.lastIndexOf('#')+1);
		   word = word1 + '<span>#<a>'+word2+'</a></span>';
	   }
	   linkedContent += word+' ';
	}
	$(thisClick[0]).siblings('.content').html(linkedContent);
};

/* 화면 상단으로 이동 */
$(function() {
    $("#top_btn").on("click", function() {
        $("html, body").animate({scrollTop:0}, '500');
        return false;
    });
});

/* 이미지 슬라이드 */
$(document).ready(function(){
	  $('.flexslider2').flexslider({
	    animation: "slide",
	    slideshowSpeed : 10000
	    
	  });
	});
/* 내용 댓글 더보기 기능  */
$(document).ready(function(){
	$('.postli5_con').hide();
	
	$('.postli5').on('click','.more_btn',function () {
		$(this).siblings('.postli5_con').show('100');
		alinkSplite($(this));
		$(this).addClass('more_btn2');

	});  
	
	$('.postli5').on('click','.more_btn2',function () {
		$(this).siblings('.postli5_con').hide('100');
		$(this).removeClass('more_btn2');
	});
	
	
	
	//sns공유
    $(".btn_share").click(function(){
        $(this).siblings("#bo_v_sns").fadeToggle();
   
    });
	
	
}); 

/* 페이스북 링크 공유  */
(function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = 580782545709565;
    js.src = "https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v3.0";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));

/* 스크롤바 길이 잡아오기  */
$(window).scroll(function () {
	var height = $(document).scrollTop();

	if(height>200) { 
		$('#postSearch').attr('class','head_menu1')
		$('#post_right_wrap').attr('class','post_right_wrap1')
		$('#post_right_wrap').css('marginTop',height)
		
	} else {
		$('#postSearch').attr('class','postSearch')
		$('#post_right_wrap').attr('class','post_right_wrap')
		$('#post_right_wrap').css('marginTop', '0')
	}
	
});


// 좋아요 클릭 부분 처리

$(function() {
	
	$('.postli_l2').on('click','.likeNull', function () {
		alert('비회원은 사용이 불가능 합니다.');		
	});
	
	$('.postli_l2').on('click','.likeAdd', function () {
		var like_rel_art_id = $(this).siblings('#like_rel_art_id').val();
		$('#likeAddFrm').children('#like_rel_art_id').val(like_rel_art_id);
		
		var thisVar = $(this);
		
		likeAddAjax(thisVar);			
	});
	
	$('.postli_l2').on('click','.likeDel', function () {
		var like_rel_art_id = $(this).siblings('#like_rel_art_id').val();
		$('#likeDeleteFrm').children('#like_rel_art_id').val(like_rel_art_id);
		
		var thisVar = $(this);
		
		likeDelAjax(thisVar);
	});
	
	// 포스트 카드 삭제 클릭 처리 부분
	$('.postli_r').on('click','.postcardDelete', function() {
		
		if (confirm("정말 삭제하시겠습니까??")){    //확인
			var pc_id = $(this).siblings('#pc_id').val();
			$('#postcardDeleteFrm').children('#pc_id').val(pc_id);	
			var thisVar = $(this);
			
			postcardDelAjax(thisVar);
		}else{   //취소
			alert("삭제취소"); //취소시 이벤트 처리
			return;
		}
		
	});
	
	// 포스트 카드 삭제 수정 처리 부분
	$('.postli_r').on('click','.postcardUdate', function() {
		var pc_id = $(this).siblings('#pc_id').val();
		$('#postcardUpdateFrm').children('#pc_id').val(pc_id);	
		$('#postcardUpdateFrm').submit();
	});
	
	// 댓글쓰기
	
	$('.postCard_con').on('click','#com_btn', function() {
		if(${loginInfo.mem_id != null}){
			var comt_cnt = $(this).siblings('#comt_cnt').val();
			var comt_rel_art_id = $(this).siblings('#comt_rel_art_id').val();
			//var mem_nick = $(this).parents('.postCard_con').find('#mem_nick').val();
			$('#commentInsertFrm').children('#comt_cnt').val(comt_cnt);
			$('#commentInsertFrm').children('#comt_rel_art_id').val(comt_rel_art_id);
			//$('#commentInsertFrm').children('#mem_nick').val(mem_nick);
			
			var thisVar = $(this);
			commentInsertAjax(thisVar);
			$(this).siblings('#comt_cnt').val('');
		}else{      
			alert('로그인을 해주세요.');
		}  
		
	});
	
	// 댓글 삭제
	$('.postCard_con').on('click','.commentDel', function() {
		var comt_id = $(this).siblings('#comt_id').val();
		$('#commentDeleteFrm').children('#comt_id').val(comt_id);
		
		var thisVar = $(this);
		commentDeleteAjax(thisVar);
	});
	
	// 댓글 수정
	$('.postCard_con').on('click','.commentUpdate', function() {
		var comt_id = $(this).siblings('#comt_id').val();
		var comt_cntup = $(this).closest('.comment_mam').find('span').text();

		$(this).closest('.postCard_con').find('#comt_cnt').val(comt_cntup);   
		$(this).closest('.postCard_con').find('#com_btn').addClass('com_btnup');
		$(this).closest('.postCard_con').find('.com_btnup').attr('id', 'newID');
		
		var thisVar = $(this);
		
		$('.postCard_con').on('click','.com_btnup', function() {
			var comt_cnt = $(this).siblings('#comt_cnt').val();
			$('#commentUpdateFrm').children('#comt_id').val(comt_id);
			$('#commentUpdateFrm').children('#comt_cnt').val(comt_cnt);
			
			commentUpdateAjax(thisVar);
			
		});
	});
	    
}); 
--%>

<script type="text/javascript">



// 새로고침 감지해서 탑0 으로 보내기
window.onbeforeunload = (e) => { 
	window.scrollBy(0,50)

}; 


/* 해시태그 클릭시 검색기에 값 넣어주고 검색 실행 */
$(function() {
	$('.hashTaglink').on('click','a',function (){
		var link = $(this).text();
		$('#hashTagSearch').val(link);
		$("#frm").submit();

	});
	
 	$('.hashTagList').on('click','a',function (){
		var link = $(this).text();
		$('#hashTagSearch').val(link);
		$("#frm").submit();	

	}); 
	
	$('.content').on('click','a',function (){
		var link = $(this).text();
		$('#hashTagSearch').val(link);
		$("#frm").submit();	

	});
	
			
});




// 스크롤 페이징 
 var page = 1;  //페이징과 같은 방식이라고 생각하면 된다. 
 
$(function(){  //페이지가 로드되면 데이터를 가져오고 page를 증가시킨다.
	postcardListAjax(page);
    page++;
});  

$(window).scroll(function(){   //스크롤이 최하단 으로 내려가면 리스트를 조회하고 page를 증가시킨다.
     if($(window).scrollTop() >= $(document).height() - $(window).height()){
    	 postcardListAjax(page);
    	 console.log(page);
         page++;   
        
     } 
     var height = $(document).scrollTop();

   	if(height>200) { 
   		$('#postSearch').attr('class','head_menu1')
   		$('#post_right_wrap').attr('class','post_right_wrap1')
   		$('#post_right_wrap').css('top',height)
   	} else {
   		$('#postSearch').attr('class','postSearch')
   		$('#post_right_wrap').attr('class','post_right_wrap')
   		$('#post_right_wrap').css('marginTop', '0')
   	}
   
});


// 좋아요 추가 아작스
function likeAddAjax(thisVar){
	var like_heart = "";
	var comment = "";
	$.ajax({
	    url : "/postCard/likeAdd",
	    type: "POST",
	    data: $('#likeAddFrm').serialize(),
	    success : function(data){
	    	
	    	var thisVar2 = thisVar.parents('.postCard_con');
			thisVar2.find('.likeNum').text(data);
	    	
	    	thisVar.siblings('.fa-comment').remove();
	    	
	    	like_heart += "<i class='fas fa-heart likeDel' style='color:#ff0000;'>";
	    	comment += "<i class='far fa-comment'></i>";
	    	
	    	thisVar.parents('.postli_l2').append(like_heart);
	    	thisVar.parents('.postli_l2').append(comment);
			thisVar.parents('.postli_l2').children('.likeAdd').remove();

	    } 
	});	
};

// 좋아요 삭제 아작스
function likeDelAjax(thisVar){
	var like_heart = "";
	var comment = "";
	$.ajax({
	    url : "/postCard/likeDelete",
	    type: "POST",
	    data: $('#likeDeleteFrm').serialize(),
	    success : function(data){
	    	
	    	var thisVar2 = thisVar.parents('.postCard_con');
			thisVar2.find('.likeNum').text(data);
	    	
	    	thisVar.siblings('.fa-comment').remove();
	    	
	    	like_heart += "<i class='far fa-heart likeAdd'></i>";
	    	comment += "<i class='far fa-comment'></i>";
	    	
	    	thisVar.parents('.postli_l2').append(like_heart);
	    	thisVar.parents('.postli_l2').append(comment);
			thisVar.parents('.postli_l2').children('.likeDel').remove();
	    	
	    },
	
	});	
};

// 리스트 출력 아작스

function postcardListAjax(page) {
	var tag_search = '${param.tag_search}';
	var mem_id = '${loginInfo.mem_id}';
	var pageSize = 1;
	$.ajax({
	  	url : "/postCard/postCardListAjax",
	    type: "GET",
	    data: "mem_id="+mem_id+"&page="+page +"&pageSize="+pageSize+"&tag_search="+tag_search,
	    success : function(data){
	    	
	    	$('.loading').append('<img src="/img/loading.gif">');
	    	
	    	setTimeout(function(e) {
	    		$(data).appendTo('#post_left_wrap');
	    		$('.loading img').remove();
			}, 1000);
	    	
	    	
	    }
	}); 
};  


// 포스트 카드 삭제 아작스
function postcardDelAjax(thisVar) {
	$.ajax({
	  	url : "/postCard/postcardDelete",
	    type: "POST",
	    data: $('#postcardDeleteFrm').serialize(),
	    success : function(data){
	    	thisVar.parents('.postCard_con').remove();
	    }
	});
}

// 댓글 추가 아작스
function commentInsertAjax(thisVar) {
	$.ajax({
	  	url : "/postCard/insertComment",
	    type: "POST",
	    data: $('#commentInsertFrm').serialize(),
	    dataType :"json",
	    success : function(data){
	    	
	    	var div = '';
	    	div += "<div class='comment_mam'>";
	    	div += "<b>"+ data.mem_nick +"</b> : <span>" + data.comt_cnt+"</span>" ;
    		div += "<ul>";
   			div += "<li>";
			div += "<a class='bbtn_01 commentUpdate'>수정</a><input type='hidden' id='comt_id' name='comt_id' value="+data.comt_id+">";
  			div += "</li>";
 			div += "<li><a class='bbtn_02 commentDel'>삭제</a><input type='hidden' id='comt_id' name='comt_id' value="+data.comt_id+"></li>";
  			div += "</ul>";
 			div += "</div>";
 			div += "<br/>";
 			
 			var text = $(thisVar).parents('.postCard_con').find('.Post_comment');
 			
 			$(div).appendTo(text);
	    }
	});
}	

// 댓글 삭제 아작스
function commentDeleteAjax(thisVar) {
	$.ajax({
	  	url : "/postCard/deleteComment",
	    type: "POST",
	    data: $('#commentDeleteFrm').serialize(),
	    success : function(data){
	    	console.log(typeof data);
	    	console.log(data.comt_cnt);
	    
	    	$(thisVar).parents('.comment_mam').remove();
	    }
	});
}

//댓글 수정 아작스
function commentUpdateAjax(thisVar) {
	$.ajax({
	  	url : "/postCard/updateComment",
	    type: "POST",
	    data: $('#commentUpdateFrm').serialize(),
	    success : function(data){
	    	console.log(data.comt_cnt);
	    	$(thisVar).closest('.comment_mam').find('span').text(data.comt_cnt);
	    	
	    	$(thisVar).closest('.postCard_con').find('#comt_cnt').val('');
	    	$(thisVar).closest('.postCard_con').find('#newID').removeClass('com_btnup');
			$(thisVar).closest('.postCard_con').find('#newID').attr('id', 'com_btn');

	    }
	});
}
</script>

		

<style>

.head_menu1 {
    position: fixed;
    top: 0;
    width: 100%;
    height: 100px;
    background: #fff;
    color: #333;
    z-index: 9999;
    box-shadow: 0px 0px 5px #aaa;
}

.post_right_wrap1 {
	float: right;
    width: 450px;
    position: absolute;
    right: 20px;
}

#bo_v_sns img {
 width: 30px;
 height: 30px;
}

.more_btn, .sns_f  { cursor: pointer;}

.fb-share-button { content: ""; display: block;}
.fb_iframe_widget span { display: contents;}
.postcardDelete { cursor: pointer;}

.content a { color: #0064ff; cursor: pointer; }
.content span { color:#0064ff; }

.postli_r a { cursor: pointer;}

.comment_mam { padding: 6px 2px;}
.comment_mam span { display: inline-block !important;}

.loading { width: 100%; float: left; text-align: center;}
.loading img { float: none; width: 200px; margin-bottom: 20px;}

</style>
	
	<div class="postSearch" id="postSearch">
		<div class="pbgfb Di7vw " role="button" tabindex="0">
			<div class="eyXLr postLogo">
				<img src="/img/postCardLogo.png" width="6%;"> <span></span> PostCard
			</div>
			<div class="eyXLr wUAXj ">
				<form method="get" action="/postCard/postCardList" id="frm">
					<input type="text" id="hashTagSearch" name="tag_search" placeholder="#검색" value="${param.tag_search}"><button type="submit"><i class="fa fa-search" aria-hidden="true"></i></button>
					<input type="hidden" name="mem_id" value="${loginInfo.mem_id}"> 
				</form>
			</div>
			<div class="eyXLr wUAXj ">
				<c:choose>
					<c:when test="${loginInfo.mem_id != null}">
						<a href="/postCard/postWrite">글쓰기</a>
					</c:when>
				</c:choose>
				
			</div>
		</div>
	</div>
	
	<div class="sub_container postWrap">
		
		<div class="post_left_wrap" id="post_left_wrap">
			
			
			
		</div>
		
		<div class="post_right_wrap" id="post_right_wrap">
			<ul>
				<li>
					<div class="postli_l">
						<b class="my_profile">
							<c:choose>
								<c:when test="${loginInfo.mem_profile == null}">
									<img src="../img/no_profile.png">
								</c:when>
								<c:otherwise>
									<img src="/file/read?mem_profile=${loginInfo.mem_profile}">
								</c:otherwise>
							</c:choose>
							
						</b>
						<c:choose>
							<c:when test="${loginInfo.mem_nick == null}">
								<span>회원 정보가 없습니다.</span>
							</c:when>
							<c:otherwise>
								<span>${loginInfo.mem_nick}</span>
							</c:otherwise>
						</c:choose>
					</div> 
				</li>
			</ul>
			
			<ul class="hashTagList">
				
				<c:forEach items="${hashTagCount}" var="htc" varStatus="num">
					<li>
						<b># ${num.index + 1}</b> <div>#<a>${htc.tag_word}</a></div> <span><b>${htc.tag_count}</b>개 사용</span>
					</li>
				</c:forEach>
			
			</ul>
		</div>
	
	
	</div>
	
	<%-- 스크롤 페이징시 로딩 애니메이션 --%>
	<div class="loading" ></div>
	
	<button type="button" id="top_btn"><i class="fa fa-arrow-up" aria-hidden="true"></i></button>
	
	<%-- 좋아요. 삭제  폼 --%>
	<form method="post" id="likeDeleteFrm" action="/postCard/likeDelete" >
		<input type="hidden" id="like_rel_art_id" name="like_rel_art_id" value="">
		<input type="hidden" id="mem_id" name="mem_id" value="${loginInfo.mem_id}">
	</form>
	
	<%-- 좋아요. 추가 --%>
	<form method="post" id="likeAddFrm"  >
		<input type="hidden" id="like_rel_art_id" name="like_rel_art_id" value="">
		<input type="hidden" id="mem_id" name="mem_id" value="${loginInfo.mem_id}">
		<input type="hidden" name="filter_id" value="postcard">
	</form>
	
	<%-- 포스트 카드 삭제 --%>
	<form method="post" id="postcardDeleteFrm" >
		<input type="hidden" id="pc_id" name="pc_id" value="">
		<input type="hidden" id="mem_id" name="mem_id" value="${loginInfo.mem_id}">
	</form>
	
	<%-- 포스트 카드 수정 --%>
	<form method="post" id="postcardUpdateFrm" action="/postCard/postUpdate">
		<input type="hidden" id="pc_id" name="pc_id" value="">
		<input type="hidden" id="mem_id" name="mem_id" value="${loginInfo.mem_id}">
	</form>
	
	<%-- 댓글 작성 --%>
	<form method="post" id="commentInsertFrm" >
		<input type="hidden" id="comt_cnt" name="comt_cnt" value="">
		<input type="hidden" id="comt_rel_art_id" name="comt_rel_art_id" value="">
		<input type="hidden" id="mem_id" name="mem_id" value="${loginInfo.mem_id}">
		<input type="hidden" id="filter_id" name="filter_id" value="postcard">
		<input type="hidden" id="mem_nick" name="mem_nick" value="${loginInfo.mem_nick}">
	</form>
	
	<%-- 댓글 수정 --%>
	<form method="post" id="commentUpdateFrm" >
		<input type="hidden" id="comt_id" name="comt_id" value="">
		<input type="hidden" id="comt_cnt" name="comt_cnt" value="">
	</form>
	<%-- 댓글 삭제 --%>
	<form method="post" id="commentDeleteFrm" >
		<input type="hidden" id="comt_id" name="comt_id" value="">
	</form>
	
	
<%@include file="../tail.jsp" %>