<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../head.jsp" %>
<link rel="stylesheet" href="/css/flexslider2.css" type="text/css" media="screen" />

<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<script type="text/javascript">

//새로고침 감지해서 탑0 으로 보내기

window.onbeforeunload = function() {
	$('html, body').animate({scrollTop : -10000});

}

function closeLayer( obj ) {
	$(obj).parent().parent().hide(500);
}


// follow 처리 부분 
$(function(){
	$(".followLayer").hide();
	
	//프로필 사진 부분을 클릭했을 때 언팔로우 팔로우 여부 확인
	$('#post_left_wrap').on('click', '.postInfo', function(event){
		
		let logincheck = "${loginInfo.mem_id}";
		
		if(logincheck == ""){
			alert("팔로잉/언팔로우를 위해 로그인을 먼저 해주세요");
			event.preventDefault();
			return;
		}	
	
		
		$(this).css("cursor", "pointer");
		
		let memIdValue = $(this).find("#mem_id").val();
		var sWidth = window.innerWidth;
		var sHeight = window.innerHeight;

		var oWidth = $('.followLayer').width();
		var oHeight = $('.followLayer').height();

		// 레이어가 나타날 위치를 셋팅한다.
		var divLeft = event.pageX+10;
		var divTop = event.pageY+5;

		// 레이어가 화면 크기를 벗어나면 위치를 바꾸어 배치한다.
		if( divLeft + oWidth > sWidth ) divLeft -= oWidth;
		if( divTop + oHeight > sHeight ) divTop -= oHeight;

		// 레이어 위치를 바꾸었더니 상단기준점(0,0) 밖으로 벗어난다면 상단기준점(0,0)에 배치하자.
		if( divLeft < 0 ) divLeft = 0;
		if( divTop < 0 ) divTop = 0;

		$('.followLayer').css({
			"top": divTop,
			"left": divLeft,
			"position": "absolute"
		}).toggle("500");
		 
		//아작스로 해당 팔로우 상태를 확인한다. 
		
		$.ajax({
	    url : "/follow/followState",
	    type: "POST",
	    data: "mem_id="+memIdValue+"&mem_id2="+"${loginInfo.mem_id}",
		    success : function(data){
		    	if(data == 1){
		    		let linkValue = 'javascript: followDelete('+'"'+memIdValue+'"'+',"${loginInfo.mem_id}")';
		    		$('.followLayer').find('a').text("Unfollow");
		    		$('.followLayer').find('a').attr("href", linkValue);
		    	}
		    	
		    	if(data == 0){
		    		let linkValue = 'javascript: followProcess('+'"'+memIdValue+'"'+',"${loginInfo.mem_id}")';
		    		$('.followLayer').find('a').text("Following");
		    		$('.followLayer').find('a').attr("href", linkValue);
		    	}
		    },
		});	
		
	
	})
})

function followProcess(mem_id, mem_id2){
	
	$.ajax({
	    url : "/follow/following",
	    type: "POST",
	    data: "mem_id="+mem_id+"&mem_id2="+mem_id2,
	    success : function(data){
	    	alert("팔로우 완료");
	    	$('.followLayer').hide(500);
	    },
	    error: function(){
	    	alert("뿌잉 터짐");
	    }
	});	
	
}

function followDelete(mem_id, mem_id2){
	
	$.ajax({
	    url : "/follow/unfollow",
	    type: "POST",
	    data: "mem_id="+mem_id+"&mem_id2="+mem_id2,
	    success : function(data){
	    	alert("언팔로우 완료");
	    	$('.followLayer').hide(500);
	    },
	    error: function(){
	    	alert("뿌잉 터짐");
	    }
	});	
}

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
 var sendAvaFalg = true;
 
$(function(){  //페이지가 로드되면 데이터를 가져오고 page를 증가시킨다.
	postcardListAjax(page);
    page++;
    console.log(page);
});  
 

$(window).scroll(function(){   //스크롤이 최하단 으로 내려가면 리스트를 조회하고 page를 증가시킨다.
     if($(window).scrollTop() >= $(document).height() - $(window).height()){

    	//if(sendAvaFalg == true){
    		postcardListAjax(page);
    	 	page++;
    	 	console.log(page);
    	//}
    	
   	 
        
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

/* 내용 댓글 더보기 기능  */
$(document).ready(function(){
	
	$('#post_left_wrap').on('click','.postli5 .more_btn',function () {
		$(this).siblings('.postli5_con').show('100');
		alinkSplite($(this));
		$(this).addClass('more_btn2');

	});  
	
	$('#post_left_wrap').on('click','.postli5 .more_btn2',function () {
		$(this).siblings('.postli5_con').hide('100');
		$(this).removeClass('more_btn2');
	});
	
	
	$('#post_left_wrap').on('click','.postli5 .more_btn3',function () {
		$(this).siblings('.postli5_con').show('100');
		$(this).addClass('more_btn4');

	});  
	
	$('#post_left_wrap').on('click','.postli5 .more_btn4',function () {
		$(this).siblings('.postli5_con').hide('100');
		$(this).removeClass('more_btn4');
	});
	
	
	//sns공유
	$('#post_left_wrap').on('click','.postCard_con .btn_share',function(){
	    
		var title = $(this).parents('.postCard_con').find('.mem_nick_sns').text();
		var description = $(this).parents('.postCard_con').find('.hashTaglink').text();
		var imageUrl = $(this).parents('.postCard_con').find('.slides img').eq(0).prop('src');
		var likeCount = $(this).parents('.postCard_con').find('.likeNum').text();
		
		if(imageUrl == null ){
			imageUrl = '<img src="/img/no_image.png">';
		}
		
		$(this).parents('.postCard_con').find('#kakao-link-btn').addClass('kakao-link-btn');

	    $(this).siblings(".show_kakao").fadeToggle();
	    kakao(title, description, imageUrl, likeCount );
	    $(this).parents('.postCard_con').find('#kakao-link-btn').removeClass('kakao-link-btn');
	});
	
	
}); 




//좋아요 클릭 부분 처리

$(function() {
	
	$('#post_left_wrap').on('click','.postli_l2 .likeNull', function () {
		alert('비회원은 사용이 불가능 합니다.');		
	});
	
	$('#post_left_wrap').on('click','.postli_l2 .likeAdd', function () {
		var like_rel_art_id = $(this).siblings('#like_rel_art_id').val();
		$('#likeAddFrm').children('#like_rel_art_id').val(like_rel_art_id);
		
		var thisVar = $(this);
		
		likeAddAjax(thisVar);			
	});
	
	$('#post_left_wrap').on('click','.postli_l2 .likeDel', function () {
		var like_rel_art_id = $(this).siblings('#like_rel_art_id').val();
		$('#likeDeleteFrm').children('#like_rel_art_id').val(like_rel_art_id);
		
		var thisVar = $(this);
		
		likeDelAjax(thisVar);
	});
	
	// 포스트 카드 삭제 클릭 처리 부분
	$('#post_left_wrap').on('click','.postli_r .postcardDelete', function() {
		
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
	$('#post_left_wrap').on('click','.postli_r .postcardUdate', function() {
		var pc_id = $(this).siblings('#pc_id').val();
		$('#postcardUpdateFrm').children('#pc_id').val(pc_id);	
		$('#postcardUpdateFrm').submit();
	});
	
	// 댓글쓰기
	
	$('#post_left_wrap').on('click','.postCard_con #com_btn', function() {
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
	$('#post_left_wrap').on('click','.postCard_con .commentDel', function() {
		var comt_id = $(this).siblings('#comt_id').val();
		$('#commentDeleteFrm').children('#comt_id').val(comt_id);
		
		var ulNum = $(this).parents('#post_left_wrap').find('.postCard_con').index();
		console.log(ulNum);
		
		var thisVar = $(this);
		commentDeleteAjax(thisVar, ulNum);
	});
	
	// 댓글 수정
	$('#post_left_wrap').on('click','.postCard_con .commentUpdate', function() {
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
	
	
	// 신고하기
	$('#post_left_wrap').on('click','.declaration_btn', function() {
		 var report_id = $(this).siblings('#comt_rel_art_id').val();
		 $('#report_id').val(report_id);
	});
	
	     
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
	
	if(sendAvaFalg == true){
		sendAvaFalg =false;
		$.ajax({
		  	url : "/postCard/postCardListAjax",
		    type: "GET",
		    data: "mem_id="+mem_id+"&page="+page +"&tag_search="+tag_search,
		    success : function(data){	
		    	$('.loading').append('<img src="/img/loading.gif">');
	    	
		    	setTimeout(function(e) {
		    		$(data).appendTo('#post_left_wrap');
		    		$('.loading img').remove();
				}, 500);
		    	
		    	
		    },
		    complete : function(){
		    	sendAvaFalg = true;
		    	
		    }
		});
	}
	
	
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
 			
 			$(thisVar).parents('.postCard_con').find('.nocomment').remove();
 			
 			var text = $(thisVar).parents('.postCard_con').find('.Post_comment');
 			
 			$(div).appendTo(text);
	    }
	});
}	

// 댓글 삭제 아작스
function commentDeleteAjax(thisVar, ulNum) {
	$.ajax({
	  	url : "/postCard/deleteComment",
	    type: "POST",
	    data: $('#commentDeleteFrm').serialize(),
	    success : function(data){
	    	console.log(typeof data);
	    	console.log(data.comt_cnt);
	
	    	$(thisVar).parents('.comment_mam').remove();
	    	if(($('.postCard_con').eq(ulNum).find('.comment_mam').length) == 0){
	    		var nocomment = "<div class='nocomment'>댓글이 없습니다.</div>";
	    		var Post_commentEq = $('.postCard_con').eq(ulNum).find('.Post_comment');
	    	 	$(nocomment).appendTo(Post_commentEq);
	    	}
	    	
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





function layer_open1(el){

	  var temp = $('#' + el);
	  var bg = temp.prev().hasClass('bg');    //dimmed 레이어를 감지하기 위한 boolean 변수
	
	  if(bg){
	     $('.layer1').fadeIn();  //'bg' 클래스가 존재하면 레이어가 나타나고 배경은 dimmed 된다. 
	  }else{
	    
	  }

	  // 화면의 중앙에 레이어를 띄운다.
	  if (temp.outerHeight() < $(document).height() ) temp.css('margin-top', '-'+temp.outerHeight()/2+'px');
	  else temp.css('top', '0px');
	  if (temp.outerWidth() < $(document).width() ) temp.css('margin-left', '-'+temp.outerWidth()/2+'px');
	  else temp.css('left', '0px');

	  temp.find('a.cbtn, a.close').click(function(e){
	     if(bg){
	        $('.layer1').fadeOut(); //'bg' 클래스가 존재하면 레이어를 사라지게 한다. 
	     }else{
	        temp.fadeOut();
	     }
	     e.preventDefault();
	  });

	  $('.bg, .close').click(function(e){ //배경을 클릭하면 레이어를 사라지게 하는 이벤트 핸들러
	     $('.layer1').fadeOut();
	     e.preventDefault();
	  });
	}

	$(document).ready(function(){
		$('.layer_con_sub').on('click','.layer_con_subLi', function() {
			
			var index = $('.layer_con_sub .layer_con_subLi').index(this);
			
			if($(".layer_con_sub .layer_con_subLi:eq("+ index + ")").find("input[name='calendarSelection']").is("checked") == false){
				$(".layer_con_sub .layer_con_subLi:eq("+ index + ")").find("input[name='calendarSelection']").prop("checked", true); /* by ID */
			}
			
		});
	});

function kakao(title, description, imageUrl, likeCount ) {
	// 카카오톡 링크 서비스
    // // 사용할 앱의 JavaScript 키를 설정해 주세요.
    if(!Kakao.Link) Kakao.init('3eacc4a71d2f1cf53f038748a49079ad');
    // // 카카오링크 버튼을 생성합니다. 처음 한번만 호출하면 됩니다.
    Kakao.Link.createDefaultButton({
      container: '.kakao-link-btn',  // 컨테이너는 아까 위에 버튼이 쓰여진 부분 id 
      objectType: 'feed',
      content: {  // 여기부터 실제 내용이 들어갑니다. 
        title: title, // 본문 제목
        description: description,
        imageUrl: imageUrl, // 이미지
        link: {
          mobileWebUrl: 'http://localhost:8081/postCard/postCardList?mem_id=normal1&tag_search=',
          webUrl: 'http://localhost:8081/postCard/postCardList?mem_id=normal1&tag_search='
        }
      },
      social: {  
        likeCount: Number(likeCount), //게시글 좋아요 숫자 넘기기
      },
      buttons: [
        {
          title: '웹으로 보기',
		link: {
            mobileWebUrl: 'https://developers.kakao.com',
            webUrl: 'https://developers.kakao.com'
          }
        },
        {
          title: '앱으로 보기',
          link: {
            mobileWebUrl: 'https://developers.kakao.com',
            webUrl: 'https://developers.kakao.com'
          }
        }
      ]
    });
  //]]>
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

#bo_v_sns {  display: inline-block; margin-left: -40px; margin-top: 30px;}

.more_btn, .sns_f  { cursor: pointer;}

.fb-share-button { content: ""; display: block;}
.fb_iframe_widget span { display: contents;}
.postcardDelete { cursor: pointer;}

.content a { color: #0064ff; cursor: pointer; }
.content span { color:#0064ff; }

.postli_r a { cursor: pointer;}

.comment_mam { padding: 6px 2px;}
.comment_mam span { display: inline-block !important;}

.loading { width: 100%; float: left; text-align: center; position: absolute; bottom: 500px;}
.loading img { float: none; width: 200px; margin-bottom: 20px;}

</style>
	<div class="followLayer">
		<div>
			<img onClick="closeLayer(this)" style="cursor:pointer;font-size:1.5em" title="닫기" src="/img/cancel.png">
		</div>
		<a href="#" class="btn btn_02"> 팔로잉 </a>
	</div>	
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
									<img src="/file/read?file=${loginInfo.mem_profile}">
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
	
	
	<div class="layer1">
	    <div class="bg"></div>
	    <div id="layer_1" class="pop_layer postcard_pop_layer">
	       <div class="layer_con">
	       	<form action="/report/insertReport" method="post">	
	            <ul>
					 <li>
					 	<input type="text" id="report_id" name="report_rel_art_id" readonly="readonly" value="">
					 	<input type="hidden" id="mem_id" name="mem_id" value="${loginInfo.mem_id}">
					 	<input type="hidden" id="filter_id" name="filter_id" value="postcard">
					 	
					 	<select name="rep_rea_id">
					 		<c:forEach items="${reportVOs}" var="report">
					 			<option value="${report.rep_rea_id}">${report.rep_rea_name}</option>
					 		</c:forEach>
					 	</select>
					 </li>
					 <li>
					 	<textarea name="rep_cnt" placeholder="신고 내용을 적어주세요."></textarea>
					 </li>	
					 <li><input type="submit" value="신고"> <a class="close">취소</a></li>            
	            </ul>
	         </form>
	       </div>
	      
	    </div>   
	</div> 
	

<%@include file="../tail.jsp" %>