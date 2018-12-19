<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../head.jsp" %>
<link rel="stylesheet" href="/css/flexslider2.css" type="text/css" media="screen" />


<script type="text/javascript">

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
		   var word1 = word.substring(0, word.lastIndexOf('#'));
		   var word2 = word.substring(word.lastIndexOf('#'));
		   word = word1 + '<a>'+word2+'</a>';
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



// 스크롤 페이징 
var page = 1;

$(window).scroll(function() {
    if ($(window).scrollTop() == $(document).height() - $(window).height()) {
      console.log(++page);
      $("#post_left_wrap").append("");
 
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
		
	})
	
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
}

#bo_v_sns img {
 width: 30px;
 height: 30px;
}

.more_btn, .sns_f  { cursor: pointer;}

.fb-share-button { content: ""; display: block;}
.fb_iframe_widget span { display: contents;}
.postcardDelete { cursor: pointer;}

.content a { color: #0064ff; }

</style>
	
	<div class="postSearch" id="postSearch">
		<div class="pbgfb Di7vw " role="button" tabindex="0">
			<div class="eyXLr postLogo">
				<img src="/img/postCardLogo.png" width="6%;"> <span></span> PostCard
			</div>
			<div class="eyXLr wUAXj ">
				<form action="" id="frm">
					<input type="text" id="hashTagSearch" placeholder="#검색"><button type="submit"><i class="fa fa-search" aria-hidden="true"></i></button>
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
			
			<c:forEach items="${postCardList}" var="pcl">
				<c:choose>
					<c:when test="${pcl.pc_del == 'N'}">	
						<ul class="postCard_con">
							<li>
								<div class="postli_l"><b><img src="/file/read?mem_profile=${pcl.mem_profile}"></b><span>${pcl.mem_nick}</span></div> 
								<c:choose>
									<c:when test="${loginInfo.mem_id == pcl.mem_id}">
										<div class="postli_r">
											<a href="">수정</a> 
											<a class="postcardDelete">삭제</a>
											<input type="hidden" id="pc_id" name="pc_id" value="${pcl.pc_id}">
										</div>
									</c:when>
								</c:choose>
							</li>
							<li>
								<c:choose>
									<c:when test="">
										<img src="/img/main_01.jpg">
									</c:when>
									<c:otherwise>
										<div class="flexslider2">
										  <ul class="slides">
										    <li>
										      	<img src="/img/main_01.jpg">
										    </li>
										    <li>
										      	<img src="/img/main_01.jpg">
										    </li>
										    <li>
										      	<img src="/img/main_01.jpg">
										    </li>
										    <li>
										      	<img src="/img/main_01.jpg">
										    </li>
										  </ul>
										</div>
									</c:otherwise>
								</c:choose>
								
							</li>
							<li>
								<div class="postli_l postli_l2">
									<c:choose>
										<c:when test="${loginInfo.mem_id == null}">
											<i class="far fa-heart likeNull"></i>
										</c:when>
										
										<c:otherwise>
											<c:set var="heart_loop" value="true"></c:set>
											<input type="hidden" id="like_rel_art_id" name="like_rel_art_id" value="${pcl.pc_id}">
											<c:forEach varStatus="like" begin="0" end="${likeVo.size()}">
												<c:if test="${heart_loop}">
													<c:choose>
														<c:when test="${pcl.pc_id == likeVo[like.index].like_rel_art_id}">
															<i class="fas fa-heart likeDel" style="color:#ff0000;"></i>
															<c:set var="heart_loop" value="false"></c:set>
														</c:when>
														
														<c:when test="${ likeVo.size() == like.index }">
															<i class="far fa-heart likeAdd"></i>
														</c:when>
													</c:choose>
												</c:if>
											</c:forEach>
										</c:otherwise>
										
									</c:choose>
									
									<i class="far fa-comment"></i>
									
								</div>
								<div class="postli_r"><i class="fa fa-share-alt fa-share-alt2 btn_share" aria-hidden="true"></i>
									<ul id="bo_v_sns" class="show_kakao" style="display: none;">
									    <li>
									    	<div class="fb-share-button" data-href="http://192.168.203.53:8081/postCard/postCardList?u=${pcl.pc_id}&t=${pcl.pc_cnt}" data-layout="button_count"></div>
									    </li>
			    					</ul>
		
			    				</div>
							</li>
							<li class="likeNumLi">좋아요 <b class="likeNum">${pcl.pc_like_count}</b>개</li>
							<li class="postli5">
								내용 <b class="more_btn">보기 +</b>
								<div class="postli5_con content">${pcl.pc_cnt}</div>
							</li>
							<li class="hashTaglink">
								
								<c:forEach items="${pcl.hashTagList}" var="htl">
									#<a>${htl}</a>
								</c:forEach>
							</li>
							<li><fmt:formatDate value="${pcl.pc_date}" pattern="yyyy. MM. dd"/></li>
							<li class="postli5">
								댓글 <b class="more_btn">보기 +</b>
								<div class="postli5_con">
									<span class="Post_comment">
										<b>회원 아이디</b> : 댓글 입니다. 1 
										<ul>
											<li><a class="bbtn_01">수정</a></li>
											<li><a class="bbtn_02">삭제</a></li>
										</ul>
									</span>
								</div>
							</li>
							<li><input type="text" placeholder="댓글달기..."><button type="button">작성</button> <a>ㆍㆍㆍ</a></li>
						</ul>
					</c:when>
				</c:choose>
			</c:forEach>
			
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
	
<%@include file="../tail.jsp" %>