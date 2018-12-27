<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

    
<h1 class="mypage_title">PostCard 클립보드</h1>
				
<form id="fsearch" name="fsearch" class="local_sch01 local_sch" method="get">
	<label for="sfl" class="sound_only">검색대상</label>
	<select name="search_title" id="sfl">
	    <option value="p.pc_cnt">내용</option>
	    <option value="m.mem_nick">닉네임</option>
	</select>
	<label for="stx" class="sound_only">검색어<strong class="sound_only"> 필수</strong></label>
	<input type="text" name="stx" value="" id="stx" required="" class="required frm_input">
	<input type="button" class="btn_submit" value="검색">
</form>

<br/>

<div class="clipBoard_list">
	<c:forEach items="${clipVo}" var="clip">
		<ul>
			<li>
				<img src="/upload${clip.att_path}/${clip.att_file_name}">
			</li> 
			<li class="clipBoard_btn clipBoard_btnP">
				<ul>
					<li><b>&#10084;</b> <span>좋아요 ${clip.pc_like_count}개</span> </li>
					<li></li>
					<li></li>
					<li><img src="/img/icon/declaration.png"></li>
				</ul>
			</li>
			<li></li>
			<li>${clip.mem_nick}</li>
			<li><fmt:formatDate value="${clip.pc_date}" pattern="yyyy. MM. dd"/></li>
			<li>
				${clip.pc_cnt}
			</li>
		</ul>
	</c:forEach>
</div>

<nav class="pg_wrap"><span class="pg"> 
	<span class="sound_only">열린</span>  

		<c:if test="${param.page != 1}"> 
			<a class="pg_page pg_start" href="javascript:getAjaxList2(1,'${tag_search}');"></a>
			<a class="pg_page pg_prev" href="javascript:getAjaxList2('${param.page -1}','${tag_search}');"></a>			
		</c:if>
		
		<c:forEach var="pageWrap"  varStatus="status" begin="1" end="${pageSize}">

			<c:choose>
				<c:when test="${status.index == param.page}"><a class="pg_current" href="javascript:getAjaxList2(${status.index},'${tag_search}');">${status.index}</a></c:when>
				<c:otherwise><a class="pg_page" href="javascript:getAjaxList2(${status.index},'${tag_search}');">${status.index}</a></c:otherwise>
			</c:choose>

		</c:forEach>
		
		<c:if test="${pageSize > param.page}">
			<a class="pg_page pg_next" href="javascript:getAjaxList2(${param.page +1},'${tag_search}');"></a>
			<a class="pg_page pg_end" href="javascript:getAjaxList2(${pageSize},'${tag_search}');"></a>
		</c:if>

		
	</span>
</nav>