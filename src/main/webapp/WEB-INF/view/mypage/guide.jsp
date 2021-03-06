<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../head.jsp" %>

<div class="sub_container">
	<%@include file="myPageLeftMenu.jsp" %>
	
	<script>
		//해당 tripplan 삭제 여부를 묻는 메세지
		function reservationDeleteCheck(reser_id){
			if(confirm('해당일 예약 건을 지우시겠습니까?')){
				location.href = '/reserDelete?reser_id='+reser_id;
			}
		}
	</script>
	<div class="mypage_right">
		<h1 class="mypage_title">나의 예약</h1>
		
		<div class="local_ov01 local_ov">
		    <a href="" class="ov_listall">전체목록</a>
		    
		    <span class="btn_ov01">
		    	<span class="ov_txt">신청했던 예약 건 수</span>
		    	<span class="ov_num">${reserCnt} 건</span>
		    </span>

		</div>
	
		<form id="fsearch" name="fsearch" class="local_sch01 local_sch" method="get">
			<select name="sc" id="sc">
			    <option value="mem_nick">닉네임</option>
			</select>
			<input type="text" name="searchText" value="" id="stx" class="frm_input">
			<input type="submit" class="btn_submit" value="검색">
		</form>
	
		<div class="local_desc01 local_desc">
		    <p>
				현재 자신이 신청한  예약정보를 볼 수 있습니다.
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
					        	<a href="">가이드</a>
					        </th>
					        <th scope="col" id="mb_list_auth" >메세지</th>
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
						        	<a class="btn btn_03" onclick="window.open('/message/selectMessage11?login_id=${loginInfo.mem_id}&mem_id=${reservationForMyPageVo.mem_id}','window_name','width=417,height=500,location=no,status=no,scrollbars=yes');">메세지</a>
						        </td>
						        <td headers="mb_list_grp" class="td_numsmall">
						        	<a href="javascript: reservationDeleteCheck('${reservationForMyPageVo.reser_id}')" class="btn btn_01" >삭제</a>
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