<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../head.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/vue"></script>
<script type="text/javascript">
	// 기본형식
	
	var currentEssayPage = 1; //에세이 페이지 초기값
	
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
				console.log(data);
				$(data.essayList).map(function(i, essayVo){
					essaySection += '<tr class="bg0">';
					essaySection += '<td headers="mb_list_cert" class="td_mbcert">'+essayVo.rnum+'</td>';
					essaySection += '<td headers="mb_list_cert" class="td_mbcert">'+essayVo.essay_title+'</td>';
					let essayDate = new Date(essayVo.essay_date);
					
					essaySection += '<td headers="mb_list_open">${essayVo.essay_view_count}'+essayVo.essay_view_count+'</td>';
					essaySection += '<td headers="mb_list_auth" class="td_mbstat">'+essayDate.getFullYear()+'-'+(essayDate.getMonth()+1)+'-'+essayDate.getDate()+'</td>';
					essaySection += '</tr>';
					
				});
				
				$("#essaySection").html(essaySection);
				
				currentEssayPage = page;
				essayPageSort();
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
				
					<h1 class="mypage_title">게시물 관리</h1>
					
				
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
				<strong>WEB 2</strong>
				내용이들어갑니다.내용이들어갑니다.내용이들어갑니다.내용이들어갑니다.내용이들어갑니다.내용이들어갑니다.내용이들어갑니다.내용이들어갑니다.내용이들어갑니다.내용이들어갑니다.내용이들어갑니다.
			</li>
			<li id="web3">
				<strong>WEB 3</strong>
				내용이들어갑니다.내용이들어갑니다.내용이들어갑니다.내용이들어갑니다.내용이들어갑니다.내용이들어갑니다.내용이들어갑니다.내용이들어갑니다.내용이들어갑니다.내용이들어갑니다.내용이들어갑니다.
			</li>
			<li id="web4">
				<strong>WEB 4</strong>
				내용이들어갑니다.내용이들어갑니다.내용이들어갑니다.내용이들어갑니다.내용이들어갑니다.내용이들어갑니다.내용이들어갑니다.내용이들어갑니다.내용이들어갑니다.내용이들어갑니다.내용이들어갑니다.
			</li>
			<li id="web5">
				<strong>WEB 5</strong>
				내용이들어갑니다.내용이들어갑니다.내용이들어갑니다.내용이들어갑니다.내용이들어갑니다.내용이들어갑니다.내용이들어갑니다.내용이들어갑니다.내용이들어갑니다.내용이들어갑니다.내용이들어갑니다.
			</li>
			<li id="web6">
				<strong>WEB 5</strong>
				내용이들어갑니다.내용이들어갑니다.내용이들어갑니다.내용이들어갑니다.내용이들어갑니다.내용이들어갑니다.내용이들어갑니다.내용이들어갑니다.내용이들어갑니다.내용이들어갑니다.내용이들어갑니다.
			</li>
			<li id="web7">
				<strong>WEB 5</strong>
				내용이들어갑니다.내용이들어갑니다.내용이들어갑니다.내용이들어갑니다.내용이들어갑니다.내용이들어갑니다.내용이들어갑니다.내용이들어갑니다.내용이들어갑니다.내용이들어갑니다.내용이들어갑니다.
			</li>
		</ul>
		
	</div>
</div>


<%@include file="../tail.jsp" %> 