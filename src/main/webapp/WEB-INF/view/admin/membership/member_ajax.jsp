<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="local_desc01 local_desc">
    <p>
		회원자료 삭제 시 다른 회원이 기존 회원아이디를 사용하지 못하도록 회원아이디, 이름, 닉네임은 삭제하지 않고 영구 보관합니다.
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
		    	<col width="10%">
		    	<col width="8%">
		    	<col width="12%">
		    	<col width="15%">
		    	<col width="12%">
		    	<col width="8%">
		    	<col width="5%">
		    	<col width="10%">
		    	<col width="8%">
		    	<col width="8%">
		    </colgroup>
		    
		    <thead>
			    <tr>
			        <th scope="col" id="mb_list_chk" rowspan="2">
			            <label for="chkall" class="sound_only">회원 전체</label>
			            <input type="checkbox" name="chkall" id="chkall">
			        </th>
			        <th scope="col" id="mb_list_mailc">
			        	<a href="javascript:memberSort('mem_id')">아이디</a>
			        </th>
			        <th scope="col" id="mb_list_id">
			        	<a href="javascript:memberSort('mem_name')">이름</a>
			        </th>
			        <th scope="col" id="mb_list_mobile">닉네임</th>
			        <th scope="col" id="mb_list_mailc">
			        	<a href="javascript:memberSort('mem_email')">이메일</a>
			        </th>
			        <th scope="col" rowspan="2" id="mb_list_cert">
			        	<a href="javascript:memberSort('mem_tel')">휴대폰</a>
			        </th>
			        <th scope="col" id="mb_list_open">
			        	<a href="javascript:memberSort('mem_age')">연령대</a>
			        </th>
			        <th scope="col" id="mb_list_mailr">
			        	<a href="javascript:memberSort('mem_gender')">성별</a>
			        </th>
			        <th scope="col" id="mb_list_auth">회원권한</th>
			        <th scope="col" id="mb_list_lastcall">
			        	수정
			        </th>
			        <th scope="col" id="mb_list_lastcall">
			        	삭제
			        </th>
			    </tr>
		    </thead>
		    
		    <tbody>
				<c:choose>
					<c:when test="${memberVOs.size() > 0}">
		        <c:forEach items="${memberVOs}" var="memberVO">
				    <tr class="bg0">
				        <td headers="mb_list_chk" class="td_chk" >
				            <input type="hidden" name="mb_id[0]" value="pcpcggg3@naver.com" id="mb_id_0">
				            <label for="chk_0" class="sound_only">pcpcggg3@naver.com 님</label>
				            <input type="checkbox" name="chk" id="chk">
				        </td>
				        <td headers="mb_list_id"  class="td_name sv_use">
				            <span>${memberVO.mem_id}</span>
				            <input type="hidden" value="${pageVO.page}">                  
				        </td>
				        <td headers="mb_list_cert"  class="td_mbcert">
				            ${memberVO.mem_name} 
				        </td>
				        <td headers="mb_list_mailc">
				        	${memberVO.mem_nick}
				        </td>
				        <td headers="mb_list_id"  class="td_name sv_use">
				            ${memberVO.mem_email}             
				        </td>
				        <td headers="mb_list_open">
				            ${memberVO.mem_tel} 
				        </td>
				        <td headers="mb_list_mailr">
				            ${memberVO.mem_age} 
				        </td>
				        <td headers="mb_list_auth" class="td_mbstat">
				           	${memberVO.mem_gender}        
				        </td>
				        <td headers="mb_list_mobile" class="td_tel">
				        	<select id="${memberVO.mem_id}">
				        		<option value=0 ${memberVO.mem_author == 0 ? "selected" : ""}>관리자</option>
				        		<option value=1 ${memberVO.mem_author == 1 ? "selected" : ""}>일반</option>
				        		<option value=2 ${memberVO.mem_author == 2 ? "selected" : ""}>가이드</option>
				        		<option value=3 ${memberVO.mem_author == 3 ? "selected" : ""}>블랙리스트</option>
				        	</select>
				        </td>
				        <td headers="mb_list_grp" class="td_numsmall">
				        	<input type="button" class="btn btn_02 update" value="수정">
				        </td>
				        <td headers="mb_list_grp" class="td_numsmall">
				        	<input type="button" class="btn btn_03 delete" value="삭제">
				        </td>
				    </tr>
		        </c:forEach>
		        	</c:when>
		        	<c:otherwise>
		        		<tr  class="bg0">
		        			<th colspan="11">
		        				조회된 리스트가 없습니다
		        			</th>
		        		</tr>
		        	</c:otherwise>
		        </c:choose>
		  </tbody>
		</table>
	</div>
	<div class="btn_fixed_top">
	    <input type="button" id="chkUpdate" name="act_button" value="선택수정" class="btn btn_02">
	    <input type="button" id="chkDelete" name="act_button" value="선택삭제" class="btn btn_02">
	</div>
</form>


<nav class="pg_wrap"><span class="pg">
	<c:choose>
		<c:when test="${memberVOs.size() > 0}">
			<fmt:parseNumber var="page" value="${pageVO.page/10}" integerOnly="true"/>
			<c:choose>
				<c:when test="${page != 0 && pageVO.page%10 == 0}">
					<c:set var="startIndex" value="${((page) * 10)-9}"/>
					<c:set var="endIndex" value="${(page) * 10 <= pageCnt ? (page) * 10 : pageCnt}"/>
				</c:when>
				<c:otherwise>
					<c:set var="startIndex" value="${((page + 1) * 10)-9}"/>
					<c:set var="endIndex" value="${(page + 1) * 10 <= pageCnt ? (page + 1) * 10 : pageCnt}"/>
				</c:otherwise>
			</c:choose>
			<span class="sound_only">열린</span>
				<c:if test="${pageVO.page != 1}">
					<a href="javascript:memberPage(1)" class="pg_page pg_start">맨앞</a>
					<a href="javascript:memberPage(${pageVO.page - 1})" class="pg_page pg_prev">이전</a>
				</c:if>
				<c:forEach begin="${startIndex}" end="${endIndex}" varStatus="i">
					<c:choose>
						<c:when test="${pageVO.page == i.index}">
							<strong class="pg_current">${i.index}</strong><span class="sound_only">페이지</span>
						</c:when>
						<c:otherwise>
							<a href="javascript:memberPage(${i.index})" class="pg_page">${i.index}<span class="sound_only">페이지</span></a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${pageVO.page != pageCnt}">
					<a href="javascript:memberPage(${pageVO.page + 1})" class="pg_page pg_next">다음</a>
					<a href="javascript:memberPage(${pageCnt})" class="pg_page pg_end">맨끝</a>
				</c:if>
			</span>
		</c:when>
		<c:otherwise>
			<strong class="pg_current">1</strong><span class="sound_only">페이지</span>
		</c:otherwise>
	</c:choose>
</nav>

<script>
	function fmemberlist_submit(f)
	{
	    if (!is_checked("chk[]")) {
	        alert(document.pressed+" 하실 항목을 하나 이상 선택하세요.");
	        return false;
	    }
	
	    if(document.pressed == "선택삭제") {
	        if(!confirm("선택한 자료를 정말 삭제하시겠습니까?")) {
	            return false;
	        }
	    }
	
	    return true;
	}
</script>
   <noscript>
       <p>
                       귀하께서 사용하시는 브라우저는 현재 <strong>자바스크립트를 사용하지 않음</strong>으로 설정되어 있습니다.<br>
           <strong>자바스크립트를 사용하지 않음</strong>으로 설정하신 경우는 수정이나 삭제시 별도의 경고창이 나오지 않으므로 이점 주의하시기 바랍니다.
       </p>
   </noscript>
