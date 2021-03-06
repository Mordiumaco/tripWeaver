<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 


<script type="text/javascript">


$('.postli5_con').hide();

/* 포스트카드 내용에 a태그 추가하기  */
function alinkSplite(thisClick) {

	var content = $(thisClick[0]).siblings('.content').html();  // html 안에 'content'라는 아이디를 content 라는 변수로 정의한다.

	var splitedArray = content.split(' '); // 공백을 기준으로 문자열을 자른다.

	var linkedContent = '';
	for(var word in splitedArray)
	{
		word = splitedArray[word];
	  
	   if(word.indexOf('#') != -1) // # 문자를 찾는다.
	   {
		   var word1 = word.substring(0, word.indexOf('#'));
		   var word2 = word.substring(word.indexOf('#')+1);
		   
		   var wordSumText = '';
		   
		   if(word2.indexOf('#') != -1){
			   word1Array = word2.split('#');
			  
			   for(var wordSum in word1Array){
				   if(word1Array[wordSum] == ''){
					   wordSumText += '#'+word1Array[wordSum];  
				   }else{
					   wordSumText += '<span>#<a>'+ word1Array[wordSum] +'</span></a>'; 
				   }
			   }
		   } else {
			   wordSumText += '<span>#<a>'+ word2 +'</span></a>'; 
		   }
		  
		   
		   word = word1 + wordSumText ;
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





</script>

<c:choose>
	<c:when test="${fn:length(postCardList) == 0}">
		<ul class="postCard_con postCard_con_none">
			<li>해당 조건에 게시물은 없습니다.</li>
			<li><img src="/img/no_POST.jpg"></li>
		</ul>
	</c:when>
	<c:otherwise>
		<c:forEach items="${postCardList}" var="pcl"  varStatus="i">
			<c:choose>
				<c:when test="${pcl.pc_del == 'N'}">	
					<ul class="postCard_con">
						<li>
							<div class="postli_l postInfo">
								<b>
									<img src="/file/read?file=${pcl.mem_profile}" onerror="src='/img/no_profile.png'">
								</b>
								<span class="mem_nick_sns">${pcl.mem_nick}</span>
								<input type="hidden" id="mem_id" name="mem_id" value="${pcl.mem_id}">
								<input type="hidden" id="pc_id" name="pc_id" value="${pcl.pc_id}">
							</div> 
							<c:choose>
								<c:when test="${loginInfo.mem_id == pcl.mem_id}">
									<div class="postli_r">
										<a class="postcardUdate" >수정</a> 
										<a class="postcardDelete">삭제</a>
										<input type="hidden" id="pc_id" name="pc_id" value="${pcl.pc_id}">
									</div>
								</c:when>
							</c:choose>
						</li>
						<li>
							<div class="flexslider2">
							  	<ul class="slides">
									<c:forEach items="${pcl.attachmentList}" var="att">
										<c:choose>
											<c:when test="${fn:length(pcl.attachmentList) == 0}">
											</c:when>
											<c:when test="${fn:length(pcl.attachmentList) == 1}">
												<img src="/file/read?file=/postcard/${att.att_file_name}">
											</c:when>
											<c:otherwise>
													  	<li>
													  		<img src="/file/read?file=/postcard/${att.att_file_name}" onerror="src='/img/no_image.png'">
													    </li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</ul>
							</div>
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
								<ul class="show_kakao" style="display: none;">
								    <li>
								    	<a href="javascript:;" id="kakao-link-btn"> 
											<!-- 버튼이 생기는 부분, id는 맘대로 쓰시되 아래 js 코드도 동일하게 적용해주셔야 합니다. -->
											<img src="//developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png" /> <!-- 톡 이미지 부분이고, 전 kakaolink_btn_small.png로 불러왔습니다.   -->
										</a>
										
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
							<c:forEach items="${pcl.hashTagList}" var="htl">#<a>${htl}</a></c:forEach>
						</li>
						<li><fmt:formatDate value="${pcl.pc_date}" pattern="yyyy. MM. dd"/></li>
						<li class="postli5">
							댓글 <b class="more_btn3">보기 +</b>
							<div class="postli5_con">
								<span class="Post_comment">
									<c:choose>
										<c:when test="${pcl.commentList.size() != 0}">
											<c:forEach items="${pcl.commentList}" var="com" varStatus="comNum">
												<c:choose>
													<c:when test="${com.comt_del == 'N' }">
														<div class="comment_mam">
															<b>${com.mem_nick}</b> : <span>${com.comt_cnt}</span>
															<input type="hidden" id="mem_nick" name="mem_nick" value="${com.mem_nick}"> 
															<c:choose>
																<c:when test="${loginInfo.mem_id == com.mem_id}">
																	<ul>
																		<li>
																			<a class="bbtn_01 commentUpdate">수정</a>
																			<input type="hidden" id="comt_id" name="comt_id" value="${com.comt_id}">
																		</li>
																		<li>
																			<a class="bbtn_02 commentDel">삭제</a>
																			<input type="hidden" id="comt_id" name="comt_id" value="${com.comt_id}">
																		</li>
																		
																	</ul>
																</c:when>
															</c:choose>
														</div>
													</c:when>
												</c:choose>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<div class='nocomment'>댓글이 없습니다.</div>
										</c:otherwise>
									</c:choose>
								</span>
							</div>
						</li>
						<li>
							<input id="comt_cnt" name="comt_cnt" type="text" placeholder="댓글달기...">
							<button id="com_btn" type="button">작성</button> &nbsp;&nbsp;&nbsp; 
							<c:choose>
								<c:when test="${loginInfo.mem_id ne null }">
									<a href="javascript::" onclick="layer_open1('layer_1');return false;" class="declaration_btn">
										<img src="/img/icon/declaration.png">
									</a>
								</c:when>
								<c:otherwise>
									<img src="/img/icon/declaration.png">
								</c:otherwise>
							</c:choose>
							
							
							<input type="hidden" id="comt_rel_art_id" name="comt_rel_art_id" value="${pcl.pc_id}">
						</li>
					</ul>
				</c:when>
			</c:choose>
		</c:forEach>
	</c:otherwise>
</c:choose>


	
	