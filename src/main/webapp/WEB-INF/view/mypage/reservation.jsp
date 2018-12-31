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
		    	<span class="ov_num"> ${reserTotalCnt} 명 </span>
		    </span>
		    <span class="btn_ov01">
		    	<span class="ov_txt">전체 예약 건수</span>
		    	<span class="ov_num"> ${reserCnt} 건 </span>
		    </span>
		    

		</div>
	
		<form id="fsearch" name="fsearch" class="local_sch01 local_sch" method="get" action="/mypage/reservation">
			<select name="sc" id="sc">
			    <option value="mem_nick">닉네임</option>
			</select>
			<input type="text" name="searchText" value="" id="stx" required="" class="frm_input">
			<input type="submit" class="btn_submit" value="검색">
		</form>
	
		<div class="local_desc01 local_desc">
		    <p>
				현재 자신이 가이드하고 있는 Essay글에 예약자 정보를 볼 수 있습니다.
		    </p>
		</div>
	
	
		<form name="fmemberlist" id="fmemberlist" action="" onsubmit="return fmemberlist_submit(this);" method="post">
		
			<div class="tbl_head01 tbl_wrap">
			    <table>
				    <caption>회원관리 목록</caption>
				    <colgroup>
				    	<col width="5%">
				    	<col width="37%">
				    	<col width="11%">
				    	<col width="11%">
				    	<col width="8%">
				    	<col width="8%">
				    	<col width="10%">
				    	<col width="10%">
				    </colgroup>
				    
				    <thead>
					    <tr>
					     	<th scope="col" id="mb_list_id">
					        	<a href="">번호</a>
					        </th>
					        <th scope="col" id="mb_list_id">
					        	<a href="">예약 에세이 제목</a>
					        </th>
					        <th scope="col" rowspan="2" id="mb_list_cert">
					        	<a href="">예약날짜</a>
					        </th>
					         <th scope="col" rowspan="2" id="mb_list_cert">
					        	<a href="">신청날짜</a>
					        </th>
					        <th scope="col" id="mb_list_open">
					        	<a href="">예약인원</a>
					        </th>
					        <th scope="col" id="mb_list_mailr">
					        	<a href="">신청자</a>
					        </th>
					        <th scope="col" id="mb_list_auth">쪽지</th>
					 		<th scope="col" id="mb_list_auth">삭제</th>
					    </tr>
				    </thead>
				    
				    <tbody>
				    	<c:if test="${reservationList != null}">
				    	<c:forEach items="${reservationList}" var="reservationForMyPageVo">
				    		 <tr class="bg0">
						      	<td headers="mb_list_cert" class="td_mbcert">
						            	${reservationForMyPageVo.rnum}
						        </td>
						        <td headers="mb_list_cert" class="td_mbcert">
						            	${reservationForMyPageVo.essay_title}
						        </td>
						        <td headers="mb_list_open">
						           ${reservationForMyPageVo.guideplan_start_day}
						        </td>
						        <td headers="mb_list_open">
						           ${reservationForMyPageVo.reser_date}
						        </td>
						        <td headers="mb_list_mailr">
						            ${reservationForMyPageVo.reser_apply_peo_count}
						        </td>
						        <td headers="mb_list_auth" class="td_mbstat">
						           	 ${reservationForMyPageVo.mem_nick}   
						        </td>
						        <td headers="mb_list_grp" class="td_numsmall">
						        	<a href="" class="btn btn_03">쪽지</a>
						        </td>
						        <td headers="mb_list_grp" class="td_numsmall">
						        	<a href="/reserDelete?reser_id=${reservationForMyPageVo.reser_id}" class="btn btn_01" >삭제</a>
						        </td>
						    </tr>
				    	</c:forEach>
				    	</c:if>
				  </tbody>
				</table>
			</div>
			
		</form>
	
		<nav class="pg_wrap"><span class="pg">
				<a href="/mypage/reservation" class="pg_page pg_start">처음</a>
				<c:choose>
					<c:when test="${currentPage == 1}">
						<a href="#" class="pg_page pg_prev">이전</a>
					</c:when>
					<c:otherwise>
						<a href="/mypage/reservation?page=${currentPage-1}" class="pg_page pg_prev">이전</a>
					</c:otherwise>
				</c:choose>
				<c:forEach begin="1" end="${page}" varStatus="loop">
					<c:choose>
						<c:when test="${currentPage == loop.index}">
							<strong class="pg_current">${loop.index}</strong>
						</c:when>
						<c:otherwise>
							<a href="" class="pg_page">${loop.index}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:choose>
					<c:when test="${currentPage == page}">
						<a href="#" class="pg_page pg_next">다음</a>
					</c:when>
					<c:otherwise>
						<a href="/mypage/reservation?page=${currentPage+1}" class="pg_page pg_next">다음</a>
					</c:otherwise>
				</c:choose>
				<a href="/mypage/reservation?page=${page}" class="pg_page pg_end">맨끝</a>
			</span>
		</nav>
		
		
	</div>
	
</div>


<%@include file="../tail.jsp" %> 