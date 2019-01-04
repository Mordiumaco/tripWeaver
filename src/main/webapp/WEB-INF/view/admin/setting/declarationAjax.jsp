<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

	<div class="tbl_head01 tbl_wrap">
	    <table>
		    <caption>회원관리 목록</caption>
		    <colgroup>
		    	<col width="5%">
		    	<col width="7%">
		    	<col width="34%">
		    	<col width="12%">
		    	<col width="12%">
		    	<col width="10%">
		    	<col width="10%">
		    	<col width="10%">
		    </colgroup>
		    <thead>
			    <tr>
			        <th scope="col" id="mb_list_chk" rowspan="2">
			            <label for="chkall" class="sound_only">회원 전체</label>
			            <input type="checkbox" name="chkall" value="1" id="chkall" >
			        </th>
			        <th scope="col" id="mb_list_mailc">신고코드</th>
			        <th scope="col" id="mb_list_id">신고내용</th>
			        <th scope="col" id="mb_list_mobile">신고 게시물 종류</th>
			        <th scope="col" rowspan="2" id="mb_list_cert">신고 게시물 코드</th>
			        <th scope="col" id="mb_list_mailr">신고자</th>
			        <th scope="col" id="mb_list_open">상태</th>
			        <th scope="col" id="mb_list_mailr">처리</th>
			    </tr>
		    </thead>
		    
		    <tbody>
		    	<c:forEach items="${pareamsMap.reportVo}" var="repostVo">
				    <tr class="bg0">
				        <td headers="mb_list_chk" class="td_chk">
				            <input type="checkbox" name="chk" value="0" id="chk" class="ab">
				        </td>
				        <td headers="mb_list_id"  class="td_name sv_use">${repostVo.report_id}</td>
				        <td headers="mb_list_cert"  class="td_mbcert">${repostVo.rep_cnt}</td>
				        <td headers="mb_list_mailc">
				        	<c:choose>
				        		<c:when test="${repostVo.rep_rea_id == 0}">
				        			음란물 유포
				        		</c:when>
				        		<c:when test="${repostVo.rep_rea_id == 1}">
				        			욕설
				        		</c:when>
				        		<c:when test="${repostVo.rep_rea_id == 2}">
				        			도배
				        		</c:when>
				        		<c:when test="${repostVo.rep_rea_id == 3}">
				        			폭력성 짙은 글
				        		</c:when>
				        		<c:when test="${repostVo.rep_rea_id == 4}">
				        			기타
				        		</c:when>
				        	</c:choose>
				        	
				        </td>
				        <td headers="mb_list_open" class="mb_list_open">
				        <c:set value="${fn:substring(repostVo.report_rel_art_id,0,1)}" var="letter"></c:set>
				        	 <c:choose>
				        		<c:when test="${ letter eq 'p' }" >
				        			<form class="updateReport" method="post" action="/report/updatePostReport">
				        				<input type="hidden" name="pc_id" value="${repostVo.report_rel_art_id}">
					        			
						        		<c:choose>
				        					<c:when test="${repostVo.report_proc_sta == 'N'}">
				        						<a class="postBtn" href="javascript::" onclick="layer_open1('layer_1');return false;" >${repostVo.report_rel_art_id}</a>
				        					</c:when>
				        					<c:otherwise>
				        						${repostVo.report_rel_art_id}
				        					</c:otherwise>
				        				</c:choose>
						        	</form>
				        		</c:when>
				        		<c:otherwise>
				        			<form class="updateReport" method="post" action="/report/updateEssayReport">
				        				<input type="hidden" name="essay_id" value="${repostVo.report_rel_art_id}">
				        				<c:choose>
				        					<c:when test="${repostVo.report_proc_sta == 'N'}">
				        						<a href="/essay/essayView?essay_id=${repostVo.report_rel_art_id}" target="blink" >${repostVo.report_rel_art_id}</a>
				        					</c:when>
				        					<c:otherwise>
				        						${repostVo.report_rel_art_id}
				        					</c:otherwise>
				        				</c:choose>
					        			
							        </form>
				        		</c:otherwise>
				        	</c:choose>
				        </td>
				        <td headers="mb_list_auth" class="td_mbstat">${repostVo.mem_id}</td>
				        <td headers="mb_list_mailr">${repostVo.report_proc_sta}</td>
				        <td headers="mb_list_grp" class="td_numsmall">
				        	<c:choose>
				        		<c:when test="${repostVo.report_proc_sta == 'N'}">
				        			<a class="btn btn_02">처리 완료</a>
				        		</c:when>
				        	</c:choose>
				        </td>
				    </tr>
		    	</c:forEach>
		  </tbody>
		</table>
	</div>
	

	<nav class="pg_wrap"><span class="pg">
		<span class="sound_only">열린</span>
			<c:if test="${param.page != 1}"> 
				<a class="pg_page pg_start" href="javascript:getAjaxList('${filter_id}','${rep_rea_id }','${report_proc_sta }',1);"></a>
				<a class="pg_page pg_prev" href="javascript:getAjaxList('${filter_id}','${rep_rea_id }','${report_proc_sta }','${param.page -1}');"></a>			
			</c:if>
			
			<c:forEach var="pageWrap"  varStatus="status" begin="1" end="${pareamsMap.pageSize}">
	
				<c:choose>
					<c:when test="${status.index == param.page}"><a class="pg_current" href="javascript:getAjaxList('${filter_id}','${rep_rea_id }','${report_proc_sta }','${status.index}');">${status.index}</a></c:when>
					<c:otherwise><a class="pg_page" href="javascript:getAjaxList('${filter_id}','${rep_rea_id }','${report_proc_sta }','${status.index}');">${status.index}</a></c:otherwise>
				</c:choose>
	
			</c:forEach>
			
			<c:if test="${pareamsMap.pageSize > param.page}">
				<a class="pg_page pg_next" href="javascript:getAjaxList('${filter_id}','${rep_rea_id }','${report_proc_sta }','${param.page +1}');"></a>
				<a class="pg_page pg_end" href="javascript:getAjaxList('${filter_id}','${rep_rea_id }','${report_proc_sta }','${pareamsMap.pageSize}');"></a>
			</c:if>
		</span>
	</nav>
	
