<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../head.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/vue"></script>
<script type="text/javascript">
	// 기본형식
	
	var currentEssayPage = 1; //에세이 페이지 초기값
	var currentPostCardPage = 1; //포스트카드 페이지 초기값
	var currentFreeBoardPage = 1;
	var currentGuideRequestBoardPage = 1;
	var currentQnaBoardPage = 1;
	var currentGuideSearchingBoardPage = 1;
	var currentPartnerSearchingBoardPage = 1;
	
	var endFreeBoardPage = parseInt("${freeBoardTotalPage}");
	var endGuideRequestBoardPage = parseInt("${guideRequestBoardTotalPage}");
	var endQnaBoardPage = parseInt("${qnaBoardTotalPage}");
	var endGuideSearchingBoardPage = parseInt("${guideSearchingBoardTotalPage}");
	var endPartnerSearchingBoardPage = parseInt("${partnerSearchingBoardTotalPage}");
	
	
	$(function(){
		$('.content li').hide();
		$('.content li#web1').show();
		$('.tab a').click(function(){
			$('.tab a').removeClass('select');
			//모든 a태그에 select 클래스 없애준다.
			$(this).addClass('select');
			//클릭한 a태그에 select 클래스 적용
			$('.content li').hide();//모든 내용을 안보이게 해줌
			$($(this).attr('href')).slideDown();
		});
		
		essayPage(1);
		postCardPage(1);
		boardPage(1, "bd00002", endFreeBoardPage);
		boardPage(1, "bd00003", endGuideRequestBoardPage);
		boardPage(1, "bd00004", endQnaBoardPage);
		boardPage(1, "bd00006", endGuideSearchingBoardPage);
		boardPage(1, "bd00007", endPartnerSearchingBoardPage);
		
		//에세이 부분
		$('#essaySection').on('click','.bg0',function(){
			var essay_id = $(this).find("#essay_id_area").val();
			location.href = "/essay/essayView?essay_id="+essay_id;
		})
		
		$('#postCardSection').on('click','.bg0',function(){
			location.href = "/postCard/postCardList?mem_id=${loginInfo.mem_id}&tag_search=";
		})
	});
	
	//-----에세이 부분-----
	function essayPageSort(){
		var essayPagingSection = '';
		essayPagingSection +='<a onclick="essayPage(1)" class="pg_page pg_start">처음</a>'
		essayPagingSection +='<a href="" onclick="essayPage('+(currentEssayPage-1)+')" class="pg_page pg_prev">이전</a>';
		essayPagingSection +='';
		
		for(let i = 1; i <= parseInt("${essayTotalPage}"); i++){
			if(currentEssayPage == i){
				essayPagingSection += '<strong class="pg_current">'+i+'</strong>';
				continue;
			}
			essayPagingSection +='<a href="" onclick="essayPage('+i+')" class="pg_page">${loop.index}</a>';
		}
		
		essayPagingSection +='<a href="" onclick="essayPage('+(currentEssayPage-1)+')" class="pg_page pg_next">다음</a>';
		essayPagingSection +='<a href="" onclick="essayPage('+parseInt("${essayTotalPage}")+')" class="pg_page pg_end">맨끝</a>';
		
		$('.essayPagingSection').html(essayPagingSection);
	}
	
	
	function essayPage(page){
		var essaySection = "";
			
		$.ajax({
			type: "POST",
			url: "/mypage/essayPageAjax",
			data: "page="+page,
			success : function(data){
				$(data.essayList).map(function(i, essayVo){
					essaySection += '<tr class="bg0">';
					essaySection += '<td headers="mb_list_cert" class="td_mbcert">'+essayVo.rnum+'</td>';
					essaySection += '<td headers="mb_list_cert" class="td_mbcert">'+essayVo.essay_title+'</td>';
					let essayDate = new Date(essayVo.essay_date);
					
					essaySection += '<td headers="mb_list_open">${essayVo.essay_view_count}'+essayVo.essay_view_count+'</td>';
					essaySection += '<td headers="mb_list_auth" class="td_mbstat">'+essayDate.getFullYear()+'-'+(essayDate.getMonth()+1)+'-'+essayDate.getDate()+'</td>';
					essaySection += '<input id="essay_id_area" type="hidden" value="'+essayVo.essay_id+'"/>';
					essaySection += '</tr>';
					
				});
				
				$("#essaySection").html(essaySection);
				$('.bg0').css("cursor","pointer");
				currentEssayPage = page;
				essayPageSort();
			}
		});
		
	}
	
	
	//포스트 카드 부분
	function postCardPageSort(){
		var postCardPagingSection = '';
		postCardPagingSection +='<a onclick="postCardPage(1)" class="pg_page pg_start">처음</a>'
		postCardPagingSection +='<a href="" onclick="postCardPage('+(currentPostCardPage-1)+')" class="pg_page pg_prev">이전</a>';
		postCardPagingSection +='';
		
		for(let i = 1; i <= parseInt("${postCardTotalPage}"); i++){
			if(currentPostCardPage == i){
				postCardPagingSection += '<strong class="pg_current">'+i+'</strong>';
				continue;
			}
			postCardPagingSection +='<a href="" onclick="postCardPage('+i+')" class="pg_page">${loop.index}</a>';
		}
		
		postCardPagingSection +='<a href="" onclick="postCardPage('+(currentPostCardPage-1)+')" class="pg_page pg_next">다음</a>';
		postCardPagingSection +='<a href="" onclick="postCardPage('+parseInt("${postCardTotalPage}")+')" class="pg_page pg_end">맨끝</a>';
		
		$('.postCardPagingSection').html(postCardPagingSection);
	}
	
	
	function postCardPage(page){
		var postCardSection = "";
			
		$.ajax({
			type: "POST",
			url: "/mypage/postCardPageAjax",
			data: "page="+page,
			success : function(data){
				$(data.postCardList).map(function(i, postCardVo){
					postCardSection += '<tr class="bg0">';
					postCardSection += '<td headers="mb_list_cert" class="td_mbcert">'+postCardVo.rnum+'</td>';
					postCardSection += '<td headers="mb_list_cert" class="td_mbcert">'+postCardVo.pc_cnt+'</td>';
					let postCardDate = new Date(postCardVo.pc_date);
					postCardSection += '<td headers="mb_list_auth" class="td_mbstat">'+postCardDate.getFullYear()+'-'+(postCardDate.getMonth()+1)+'-'+postCardDate.getDate()+'</td>';
					postCardSection += '</tr>';
					
				});
				
				$("#postCardSection").html(postCardSection);
				$('.bg0').css("cursor","pointer");
				currentPostCardPage = page;
				postCardPageSort();
			}
		});
	}
		
		//게시판  부분
		function boardPageSort(page, board_id, endPage){
			var articlePagingSection = '';
			articlePagingSection +='<a onclick="boardPage(1)" class="pg_page pg_start">처음</a>'
			articlePagingSection +='<a href="" onclick="boardPage('+(page-1)+','+board_id+','+endPage+')" class="pg_page pg_prev">이전</a>';
			articlePagingSection +='';
			
			for(let i = 1; i <= endPage; i++){
				if(page == i){
					articlePagingSection += '<strong class="pg_current">'+i+'</strong>';
					continue;
				}
				articlePagingSection +='<a href="" onclick="boardPage('+i+','+board_id+','+endPage+')" class="pg_page">${loop.index}</a>';
			}
			
			articlePagingSection +='<a href="" onclick="boardPage('+(page+1)+','+board_id+','+endPage+')" class="pg_page pg_next">다음</a>';
			articlePagingSection +='<a href="" onclick="boardPage('+endPage+','+board_id+','+endPage+')" class="pg_page pg_end">맨끝</a>';
			
			
			switch(board_id){
			case "bd00002": //자유게시판
				$(".freeBoardPagingSection").html(articlePagingSection);
				break;
			case "bd00003": //가이드 신청
				$(".guideRequestBoardPagingSection").html(articlePagingSection);
				break;
			case "bd00004": //QnA 
				$(".qnaBoardPagingSection").html(articlePagingSection);
				break;
			case "bd00006": //가이드 찾기
				$(".guideSearchingBoardPagingSection").html(articlePagingSection);
				break;
			case "bd00007": //파트너 찾기
				$(".partnerSearchingBoardPagingSection").html(articlePagingSection);
				break;
			}
		}
		
		
		function boardPage(page, board_id, endPage){
			var articleSection = "";
				
			$.ajax({
				type: "POST",
				url: "/mypage/boardPageAjax",
				data: "page="+page+"&board_id="+board_id,
				success : function(data){
					
					$(data.articleList).map(function(i, articleVo){
						articleSection += '<tr class="bg0">';
						articleSection += '<td headers="mb_list_cert" class="td_mbcert">'+articleVo.rnum+'</td>';
						articleSection += '<td headers="mb_list_cert" class="td_mbcert">'+articleVo.art_title+'</td>';
						let articleDate = new Date(articleVo.art_date);
						articleSection += '<td headers="mb_list_auth" class="td_mbstat">'+articleDate.getFullYear()+'-'+(articleDate.getMonth()+1)+'-'+articleDate.getDate()+'</td>';
						articleSection += '</tr>';
						
					});
					
					switch(board_id){
						case "bd00002": //자유게시판
							$("#freeBoardSection").html(articleSection);
							currentFreeBoardPage = page;
							break;
						case "bd00003": //가이드 신청
							$("#guideRequestBoardSection").html(articleSection);
							currentGuideRequestBoardPage = page;
							break;
						case "bd00004": //QnA 
							$("#qnaBoardSection").html(articleSection);
							currentQnaBoardPage = page;
							break;
						case "bd00006": //가이드 찾기
							$("#guideSearchingBoardSection").html(articleSection);
							currentGuideSearchingBoardPage = page;
							break;
						case "bd00007": //파트너 찾기
							$("#partnerSearchingBoardSection").html(articleSection);
							currentPartnerSearchingBoardPage = page;
							break;
					}
					
					$('.bg0').css("cursor","pointer");
					boardPageSort(page, board_id, endPage);
				}
			
			});
	}
</script>


<div class="sub_container">
	<%@include file="myPageLeftMenu.jsp" %>
	
	<div class="mypage_right">
	
		<ul class="tab">
			<li><a href="#web1" class="select">Essay</a></li>
			<li><a href="#web2">PostCard</a></li>
			<li><a href="#web3">자유게시판</a></li>
			<li><a href="#web4">가이드지원</a></li>
			<li><a href="#web5">Q&A</a></li>
			<li><a href="#web6">가이드 찾기</a></li>
			<li><a href="#web7">파트너 찾기</a></li>
		</ul>
		
		<ul class="content">
			<li id="web1">
				
					<h1 class="mypage_title">에세이 게시물 관리</h1>
					
				
					<form id="fsearch" name="fsearch" class="local_sch01 local_sch" method="get">
						<label for="sfl" class="sound_only">검색대상</label>
						<select name="sfl" id="sfl">
						    <option value="mb_nick">제목</option>
						</select>
						<label for="stx" class="sound_only">검색어<strong class="sound_only"> 필수</strong></label>
						<input type="text" name="stx" value="" id="stx" required="" class="required frm_input">
						<input type="submit" class="btn_submit" value="검색">
					</form>
				
				
					
					<div class="tbl_head01 tbl_wrap">
					    <table>
						    <caption>회원관리 목록</caption>
						    <colgroup>
						    	<col width="10%">
						    	<col width="65%">
						    	<col width="10%">
						    	<col width="15%">
						    
						    </colgroup>
						    
						    <thead>
							    <tr>
							     	<th scope="col" id="mb_list_id">
							        	<a href="">번호</a>
							        </th>
							        <th scope="col" id="mb_list_id">
							        	<a href="">제목</a>
							        </th>
							        
							        <th scope="col" id="mb_list_open">
							        	<a href="">조회</a>
							        </th>
		
							        <th scope="col" rowspan="2" id="mb_list_cert">
							        	<a href="">날짜</a>
							        </th>
							    </tr>
						    </thead>
						    
						    <tbody id="essaySection">
						    	<%-- <c:forEach items="${essayList}" var="essayVo">
						    		<tr class="bg0">
								      	<td headers="mb_list_cert" class="td_mbcert">${essayVo.rnum}</td>
								        <td headers="mb_list_cert" class="td_mbcert">${essayVo.essay_title}</td>
								        <td headers="mb_list_open">${essayVo.essay_view_count}</td>
								        <td headers="mb_list_auth" class="td_mbstat">${essayVo.essay_date}</td>
							   		 </tr>
						    	</c:forEach> --%>
						  	</tbody>
						</table>
					</div>
						
				
				
					<nav class="pg_wrap">
						<span class="pg essayPagingSection">
							<%-- <a href="" onclick="essayPage()" class="pg_page pg_start">처음</a>
							<a href="" onclick="essayPage()" class="pg_page pg_prev">이전</a>
							<strong class="pg_current">1</strong>
							<c:forEach begin="1" end="${essayTotalPage}" varStatus="loop">
								<a href="" onclick="essayPage()" class="pg_page">${loop.index}</a>
							</c:forEach>
							<a href="" onclick="essayPage()" class="pg_page pg_next">다음</a>
							<a href="" onclick="essayPage()" class="pg_page pg_end">맨끝</a> --%>
						</span>
					</nav>
					
			</li>
			<li id="web2">
				<h1 class="mypage_title">포스트카드 관리</h1>
					
				
					<form id="fsearch" name="fsearch" class="local_sch01 local_sch" method="get">
						<label for="sfl" class="sound_only">검색대상</label>
						<select name="sfl" id="sfl">
						    <option value="mb_nick">제목</option>
						</select>
						<label for="stx" class="sound_only">검색어<strong class="sound_only"> 필수</strong></label>
						<input type="text" name="stx" value="" id="stx" required="" class="required frm_input">
						<input type="submit" class="btn_submit" value="검색">
					</form>
				
				
					
					<div class="tbl_head01 tbl_wrap">
					    <table>
						    <caption>회원관리 목록</caption>
						    <colgroup>
						    	<col width="10%">
						    	<col width="75%">
						    	<col width="15%">
						    
						    </colgroup>
						    
						    <thead>
							    <tr>
							     	<th scope="col" id="mb_list_id">
							        	<a href="">번호</a>
							        </th>
							        <th scope="col" id="mb_list_id">
							        	<a href="">내용</a>
							        </th>
							        <th scope="col" rowspan="2" id="mb_list_cert">
							        	<a href="">날짜</a>
							        </th>
							    </tr>
						    </thead>
						    
						    <tbody id="postCardSection">
						  	</tbody>
						</table>
					</div>
					
					<nav class="pg_wrap">
						<span class="pg postCardPagingSection">
						</span>
					</nav>
			</li>
			<li id="web3">
				<h1 class="mypage_title">자유게시판 관리</h1>
					
				
					<form id="fsearch" name="fsearch" class="local_sch01 local_sch" method="get">
						<label for="sfl" class="sound_only">검색대상</label>
						<select name="sfl" id="sfl">
						    <option value="mb_nick">제목</option>
						</select>
						<label for="stx" class="sound_only">검색어<strong class="sound_only"> 필수</strong></label>
						<input type="text" name="stx" value="" id="stx" required="" class="required frm_input">
						<input type="submit" class="btn_submit" value="검색">
					</form>
				
				
					
					<div class="tbl_head01 tbl_wrap">
					    <table>
						    <colgroup>
						    	<col width="10%">
						    	<col width="65%">
						    	<col width="10%">
						    	<col width="15%">
						    
						    </colgroup>
						    
						    <thead>
							    <tr>
							     	<th scope="col" id="mb_list_id">
							        	<a href="">번호</a>
							        </th>
							        <th scope="col" id="mb_list_id">
							        	<a href="">제목</a>
							        </th>
							        
							        <th scope="col" id="mb_list_open">
							        	<a href="">조회</a>
							        </th>
		
							        <th scope="col" rowspan="2" id="mb_list_cert">
							        	<a href="">날짜</a>
							        </th>
							    </tr>
						    </thead>
						    
						    <tbody id="freeBoardSection">
						  	</tbody>
						</table>
					</div>
					<nav class="pg_wrap">
						<span class="pg freeBoardPagingSection">
						</span>
					</nav>
			</li>
			<li id="web4">
				<h1 class="mypage_title">가이드 지원</h1>
					
				
					<form id="fsearch" name="fsearch" class="local_sch01 local_sch" method="get">
						<label for="sfl" class="sound_only">검색대상</label>
						<select name="sfl" id="sfl">
						    <option value="mb_nick">제목</option>
						</select>
						<label for="stx" class="sound_only">검색어<strong class="sound_only"> 필수</strong></label>
						<input type="text" name="stx" value="" id="stx" required="" class="required frm_input">
						<input type="submit" class="btn_submit" value="검색">
					</form>
				
				
					
					<div class="tbl_head01 tbl_wrap">
					    <table>
						    <caption>회원관리 목록</caption>
						    <colgroup>
						    	<col width="10%">
						    	<col width="65%">
						    	<col width="10%">
						    	<col width="15%">
						    
						    </colgroup>
						    
						    <thead>
							    <tr>
							     	<th scope="col" id="mb_list_id">
							        	<a href="">번호</a>
							        </th>
							        <th scope="col" id="mb_list_id">
							        	<a href="">제목</a>
							        </th>
							        
							        <th scope="col" id="mb_list_open">
							        	<a href="">조회</a>
							        </th>
		
							        <th scope="col" rowspan="2" id="mb_list_cert">
							        	<a href="">날짜</a>
							        </th>
							    </tr>
						    </thead>
						    
						    <tbody id="guideRequestBoardSection">
						  	</tbody>
						</table>
					</div>
					<nav class="pg_wrap">
						<span class="pg guideRequestBoardPagingSection">
						</span>
					</nav>
			</li>
			<li id="web5">
				<h1 class="mypage_title"> Q & A</h1>
					
				
					<form id="fsearch" name="fsearch" class="local_sch01 local_sch" method="get">
						<label for="sfl" class="sound_only">검색대상</label>
						<select name="sfl" id="sfl">
						    <option value="mb_nick">제목</option>
						</select>
						<label for="stx" class="sound_only">검색어<strong class="sound_only"> 필수</strong></label>
						<input type="text" name="stx" value="" id="stx" required="" class="required frm_input">
						<input type="submit" class="btn_submit" value="검색">
					</form>
				
				
					
					<div class="tbl_head01 tbl_wrap">
					    <table>
						    <caption>회원관리 목록</caption>
						    <colgroup>
						    	<col width="10%">
						    	<col width="65%">
						    	<col width="10%">
						    	<col width="15%">
						    
						    </colgroup>
						    
						    <thead>
							    <tr>
							     	<th scope="col" id="mb_list_id">
							        	<a href="">번호</a>
							        </th>
							        <th scope="col" id="mb_list_id">
							        	<a href="">제목</a>
							        </th>
							        
							        <th scope="col" id="mb_list_open">
							        	<a href="">조회</a>
							        </th>
		
							        <th scope="col" rowspan="2" id="mb_list_cert">
							        	<a href="">날짜</a>
							        </th>
							    </tr>
						    </thead>
						    
						    <tbody id="qnaBoardSection">
						    	<%-- <c:forEach items="${essayList}" var="essayVo">
						    		<tr class="bg0">
								      	<td headers="mb_list_cert" class="td_mbcert">${essayVo.rnum}</td>
								        <td headers="mb_list_cert" class="td_mbcert">${essayVo.essay_title}</td>
								        <td headers="mb_list_open">${essayVo.essay_view_count}</td>
								        <td headers="mb_list_auth" class="td_mbstat">${essayVo.essay_date}</td>
							   		 </tr>
						    	</c:forEach> --%>
						  	</tbody>
						</table>
					</div>
					<nav class="pg_wrap">
						<span class="pg qnaBoardPagingSection">
						</span>
					</nav>
			</li>
			<li id="web6">
			<h1 class="mypage_title">가이드 찾기</h1>
					
				
					<form id="fsearch" name="fsearch" class="local_sch01 local_sch" method="get">
						<label for="sfl" class="sound_only">검색대상</label>
						<select name="sfl" id="sfl">
						    <option value="mb_nick">제목</option>
						</select>
						<label for="stx" class="sound_only">검색어<strong class="sound_only"> 필수</strong></label>
						<input type="text" name="stx" value="" id="stx" required="" class="required frm_input">
						<input type="submit" class="btn_submit" value="검색">
					</form>
				
				
					
					<div class="tbl_head01 tbl_wrap">
					    <table>
						    <caption>회원관리 목록</caption>
						    <colgroup>
						    	<col width="10%">
						    	<col width="65%">
						    	<col width="10%">
						    	<col width="15%">
						    
						    </colgroup>
						    
						    <thead>
							    <tr>
							     	<th scope="col" id="mb_list_id">
							        	<a href="">번호</a>
							        </th>
							        <th scope="col" id="mb_list_id">
							        	<a href="">제목</a>
							        </th>
							        
							        <th scope="col" id="mb_list_open">
							        	<a href="">조회</a>
							        </th>
		
							        <th scope="col" rowspan="2" id="mb_list_cert">
							        	<a href="">날짜</a>
							        </th>
							    </tr>
						    </thead>
						    
						    <tbody id="guideSearchingBoardSection">
						    	<%-- <c:forEach items="${essayList}" var="essayVo">
						    		<tr class="bg0">
								      	<td headers="mb_list_cert" class="td_mbcert">${essayVo.rnum}</td>
								        <td headers="mb_list_cert" class="td_mbcert">${essayVo.essay_title}</td>
								        <td headers="mb_list_open">${essayVo.essay_view_count}</td>
								        <td headers="mb_list_auth" class="td_mbstat">${essayVo.essay_date}</td>
							   		 </tr>
						    	</c:forEach> --%>
						  	</tbody>
						</table>
					</div>
					<nav class="pg_wrap">
						<span class="pg guideSearchingBoardPagingSection">
						</span>
					</nav>
			</li>
			<li id="web7">
			<h1 class="mypage_title">파트너 찾기</h1>
					
				
					<form id="fsearch" name="fsearch" class="local_sch01 local_sch" method="get">
						<label for="sfl" class="sound_only">검색대상</label>
						<select name="sfl" id="sfl">
						    <option value="mb_nick">제목</option>
						</select>
						<label for="stx" class="sound_only">검색어<strong class="sound_only"> 필수</strong></label>
						<input type="text" name="stx" value="" id="stx" required="" class="required frm_input">
						<input type="submit" class="btn_submit" value="검색">
					</form>
				
				
					
					<div class="tbl_head01 tbl_wrap">
					    <table>
						    <caption>회원관리 목록</caption>
						    <colgroup>
						    	<col width="10%">
						    	<col width="65%">
						    	<col width="10%">
						    	<col width="15%">
						    
						    </colgroup>
						    
						    <thead>
							    <tr>
							     	<th scope="col" id="mb_list_id">
							        	<a href="">번호</a>
							        </th>
							        <th scope="col" id="mb_list_id">
							        	<a href="">제목</a>
							        </th>
							        
							        <th scope="col" id="mb_list_open">
							        	<a href="">조회</a>
							        </th>
		
							        <th scope="col" rowspan="2" id="mb_list_cert">
							        	<a href="">날짜</a>
							        </th>
							    </tr>
						    </thead>
						    
						    <tbody id="partnerSearchingBoardSection">
						  	</tbody>
						</table>
					</div>
					<nav class="pg_wrap">
						<span class="pg partnerSearchingBoardPagingSection">
						</span>
					</nav>
			</li>
		</ul>
		
	</div>
</div>


<%@include file="../tail.jsp" %> 