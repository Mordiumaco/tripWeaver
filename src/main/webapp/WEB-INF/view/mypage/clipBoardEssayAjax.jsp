<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

    
<h1 class="mypage_title">Essay 클립보드</h1>
				
<form id="fsearch" name="fsearch" class="local_sch01 local_sch" method="get">
	<label for="sfl" class="sound_only">검색대상</label>
	<select name="search_title" id="sfl">
		<option value="e.essay_title">제목</option>
	    <option value="e.essay_cnt">내용</option>
	</select>
	<label for="stx" class="sound_only">검색어<strong class="sound_only"> 필수</strong></label>
	<input type="text" name="stx" value="" id="stx" required="" class="required frm_input">
	<input type="button" class="btn_submit" value="검색">
</form>

<br/>

<div class="clipBoard_list">
	<%-- <c:forEach items="${clipVo}" var="clip"> --%>
		<ul>
			<li><img src="/img/p_04.jpg"></li>
			<li class="clipBoard_btn">
				<ul>
					<li><b>&#10084;</b></li>
					<li><i class="fa fa-commenting-o fa-commenting-o2" aria-hidden="true"></i></li>
					<li><i class="fa fa-share-alt fa-share-alt2" aria-hidden="true"></i></li>
					<li><img src="/img/icon/declaration.png"></li>
				</ul>
			</li>
			<li><b>&#10084; 좋아요 527개</b> <span>HIT <b>258</b></span> </li>
			<li>감성 힐링 경천여행</li>
			<li>2018. 01 .24</li>
			<li>
				내용을 먹여서 내용이 나오고 내용이 나와서 내용이 보이고 내용이 보여서 
			</li>
		</ul>
	<%-- </c:forEach> --%>
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