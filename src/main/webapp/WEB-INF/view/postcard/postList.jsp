<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../head.jsp" %>
<link rel="stylesheet" href="/css/flexslider2.css" type="text/css" media="screen" />


<script type="text/javascript">

$(document).ready(function(){
	  $('.flexslider2').flexslider({
	    animation: "slide",
	    slideshowSpeed : 10000
	    
	  });
	});

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

$(document).ready(function(){
	$('.postli5_con').hide();
	
	$('.postli5').on('click','.more_btn',function () {
		
		$(this).siblings('.postli5_con').show('slow');
		$(this).addClass('more_btn2');

	});  
	
	$('.postli5').on('click','.more_btn2',function () {
		$(this).siblings('.postli5_con').hide('slow');
		$(this).removeClass('more_btn2');
	});
	
	
	
	//sns공유
    $(".btn_share").click(function(){
        $(this).siblings("#bo_v_sns").fadeToggle();
   
    });
	
	
    /* $(document).mouseup(function (e) {
        var container = $("#bo_v_sns");
        if (!container.is(e.target) && container.has(e.target).length === 0){
        	container.css("display","none");
        }	
    }); */


	
}); 

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
		alert('좋아요 추가');
		$(this).parents("#likeAddFrm").submit();			
	});
	
	$('.postli_l2').on('click','.likeDel', function () {
		alert('좋아요 삭제');	
		$(this).parents("#likeDeleteFrm").submit();
	});
});


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
				<a href="">글쓰기</a>
			</div>
		</div>
	</div>
	
	<div class="sub_container postWrap">
		
		<div class="post_left_wrap" id="post_left_wrap">
			
			<c:forEach items="${postCardList}" var="pcl">
				<c:choose>
					<c:when test="${pcl.pc_del == 'N'}">	
						<ul class=" postCard_con">
							<li>
								<div class="postli_l"><b><img src="/file/read?mem_profile=${pcl.mem_profile}"></b><span>${pcl.mem_nick}</span> ${pcl.pc_id}</div> 
								<c:choose>
									<c:when test="${loginInfo.mem_id == pcl.mem_id}">
										<div class="postli_r"><a href="">수정</a> <a href="">삭제</a></div>
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
												<c:forEach varStatus="like" begin="0" end="${likeVo.size()}">
													<c:if test="${heart_loop}">
														<c:choose>
															<c:when test="${pcl.pc_id == likeVo[like.index].like_rel_art_id}">
																<form method="post" id="likeDeleteFrm" action="/postCard/likeDelete"  style="display: inline-block;">
																	<i class="fas fa-heart likeDel" style="color:#ff0000;"></i>
																	<input type="hidden" name="like_rel_art_id" value="${pcl.pc_id}">
																	<input type="hidden" name="mem_id" value="${loginInfo.mem_id}">
																</form>
																<c:set var="heart_loop" value="false"></c:set>
															</c:when>
															
															<c:when test="${ likeVo.size() == like.index }">
																<form method="post" id="likeAddFrm" action="/postCard/likeAdd"  style="display: inline-block;">
																	<i class="far fa-heart likeAdd"></i>
																	<input type="hidden" name="like_rel_art_id" value="${pcl.pc_id}">
																	<input type="hidden" name="mem_id" value="${loginInfo.mem_id}">
																	<input type="hidden" name="filter_id" value="postcard">
																</form>
															</c:when>
														</c:choose>
													</c:if>
												</c:forEach>
											</c:otherwise>
											
										</c:choose>
										
										<i class="far fa-comment"></i>
										<input name="like_rel_art_id" type="hidden" value="${pcl.pc_id}">
										<input name="mem_id" type="hidden" value="${loginInfo.mem_id}">
										<input name="filter_id" type="hidden" value="postCard">
									</div>
								<div class="postli_r"><i class="fa fa-share-alt fa-share-alt2 btn_share" aria-hidden="true"></i>
									<ul id="bo_v_sns" class="show_kakao" style="display: none;">
									    <li>
									    	<div class="fb-share-button" data-href="http://192.168.203.53:8081/postCard/postCardList?u=${pcl.pc_id}&t=${pcl.pc_cnt}" data-layout="button_count"></div>
									    </li>
			    					</ul>
		
		 							
			    				</div>
							</li>
							<li>좋아요 <b>${pcl.pc_like_count}</b>개</li>
							<li class="postli5">
								내용 <b class="more_btn">보기 +</b>
								<div class="postli5_con">
									${pcl.pc_cnt}
								</div>
							</li>
							<li class="hashTaglink">
								
								<c:forEach items="${pcl.hashTagList}" var="htl">
									#<a>${htl}</a>
								</c:forEach>
							</li>
							<li><fmt:formatDate value="${pcl.pc_date}" pattern="yyyy. MM. dd"/></li>
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
	
<%@include file="../tail.jsp" %>