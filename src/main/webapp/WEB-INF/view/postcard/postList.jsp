<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../head.jsp" %>

<script type="text/javascript">
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


.more_btn { cursor: pointer;}

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
				<ul class=" postCard_con">
					<li>
						<div class="postli_l"><b><img src="/file/read?mem_profile=${pcl.mem_profile}"></b><span>${pcl.mem_nick}</span></div> 
						<c:choose>
							<c:when test="${loginInfo.mem_id == pcl.mem_id}">
								<div class="postli_r"><a href="">수정</a> <a href="">삭제</a></div>
							</c:when>
						</c:choose>
					</li>
					<li><img src="/img/main_01.jpg"></li>
					<li><div class="postli_l postli_l2">하트 &nbsp; <i class="far fa-comment"></i></div> <div class="postli_r"><i class="fa fa-share-alt fa-share-alt2" aria-hidden="true"></i></div></li>
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