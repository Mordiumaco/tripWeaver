<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../head.jsp" %>

<div class="sub_container">
	<%@include file="myPageLeftMenu.jsp" %>
	
	<div class="mypage_right">
		<h1 class="mypage_title">나의 예약</h1>
		
		<div class="local_ov01 local_ov">
		    <a href="" class="ov_listall">전체목록</a>
		    
		    <span class="btn_ov01">
		    	<span class="ov_txt">전체 예약자</span>
		    	<span class="ov_num"> 1,460명 </span>
		    </span>

		</div>
	
		<form id="fsearch" name="fsearch" class="local_sch01 local_sch" method="get">
			<label for="sfl" class="sound_only">검색대상</label>
			<select name="sfl" id="sfl">
			    <option value="mb_nick">예약자</option>
			</select>
			<label for="stx" class="sound_only">검색어<strong class="sound_only"> 필수</strong></label>
			<input type="text" name="stx" value="" id="stx" required="" class="required frm_input">
			<input type="submit" class="btn_submit" value="검색">
		</form>
	
		<div class="local_desc01 local_desc">
		    <p>
				현재 자신이 가이드하고 있는 Essay글에 예약자 정보를 볼 수 있습니다.
		    </p>
		</div>
	
	
		<form name="fmemberlist" id="fmemberlist" action="" onsubmit="return fmemberlist_submit(this);" method="post">
			<input type="hidden" name="sst" value="mb_datetime">
			<input type="hidden" name="sod" value="desc">
			<input type="hidden" name="sfl" value="">
			<input type="hidden" name="stx" value="">
			<input type="hidden" name="page" value="1">
			<input type="hidden" name="token" value="">
		
			<div class="tbl_head01 tbl_wrap">
			    <table>
				    <caption>회원관리 목록</caption>
				    <colgroup>
				    	<col width="5%">
				    	<col width="40%">
				    	<col width="13%">
				    	<col width="10%">
				    	<col width="10%">
				    	<col width="14%">
				    	<col width="8%">
				    </colgroup>
				    
				    <thead>
					    <tr>
					     	<th scope="col" id="mb_list_id">
					        	<a href="">번호</a>
					        </th>
					        <th scope="col" id="mb_list_id">
					        	<a href="">제목</a>
					        </th>
					        <th scope="col" rowspan="2" id="mb_list_cert">
					        	<a href="">예약날짜</a>
					        </th>
					        <th scope="col" id="mb_list_open">
					        	<a href="">예약인원</a>
					        </th>
					        <th scope="col" id="mb_list_mailr">
					        	<a href="">가이드</a>
					        </th>
					        <th scope="col" id="mb_list_auth">쪽지</th>
					 		<th scope="col" id="mb_list_auth">삭제</th>
					    </tr>
				    </thead>
				    
				    <tbody>
					    <tr class="bg0">
					      	<td headers="mb_list_cert" class="td_mbcert">
					            	1
					        </td>
					        <td headers="mb_list_cert" class="td_mbcert">
					            	행복한 부산여행
					        </td>
					        <td headers="mb_list_open">
					            1988-02-13
					        </td>
					        <td headers="mb_list_mailr">
					            8
					        </td>
					        <td headers="mb_list_auth" class="td_mbstat">
					           	 박진     
					        </td>
					     
					        <td headers="mb_list_grp" class="td_numsmall">
					        	<a href="" class="btn btn_03">쪽지 보내기</a>
					        </td>
					        
					        <td headers="mb_list_grp" class="td_numsmall">
					        	<a href="" class="btn btn_02">삭제</a>
					        </td>
					    </tr>
				
				  </tbody>
				</table>
			</div>
			
		</form>
	
		<nav class="pg_wrap"><span class="pg">
			<span class="sound_only">열린</span>
				<strong class="pg_current">1</strong><span class="sound_only">페이지</span>
				<a href="" class="pg_page">2<span class="sound_only">페이지</span></a>
				<a href="" class="pg_page">3<span class="sound_only">페이지</span></a>
				<a href="" class="pg_page">4<span class="sound_only">페이지</span></a>
				<a href="" class="pg_page">5<span class="sound_only">페이지</span></a>
				<a href="" class="pg_page">6<span class="sound_only">페이지</span></a>
				<a href="" class="pg_page">7<span class="sound_only">페이지</span></a>
				<a href="" class="pg_page">8<span class="sound_only">페이지</span></a>
				<a href="" class="pg_page">9<span class="sound_only">페이지</span></a>
				<a href="" class="pg_page">10<span class="sound_only">페이지</span></a>
				<a href="" class="pg_page pg_next">다음</a>
				<a href="" class="pg_page pg_end">맨끝</a>
			</span>
		</nav>
		
		
	</div>
	
</div>


<%@include file="../tail.jsp" %> 