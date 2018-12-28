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
	 <c:forEach items="${essayVOs}" var="essay">
		<ul>
			<li>
				<c:choose>
					<c:when test="${essay.tripplan_image == null}">
						<img src="/img/no_image.png">
					</c:when>
					<c:otherwise>
						<img src="/update/${essay.tripplan_image}">
					</c:otherwise>
				</c:choose>
			</li>
			<li class="clipBoard_btn">
				<ul>
					<li><b>&#10084;</b></li>
					<li><i class="far fa-comment fa-commenting-o2" aria-hidden="true"></i></li>
					<li><i class="fa fa-share-alt fa-share-alt2" aria-hidden="true"></i></li>
					<li><img src="/img/icon/declaration.png"></li>
				</ul>
			</li>
			<li><b>&#10084; 좋아요 ${essay.essay_like_count}개</b> <span>HIT <b>${essay.essay_view_count}</b></span> </li>
			<li>${essay.essay_title}</li>
			<li><fmt:formatDate value="${essay.essay_date}" pattern="yyyy. MM. dd"/></li>
			<li>
				${essay.essay_cnt}  
			</li>
		</ul>
	</c:forEach>
</div>

<nav class="pg_wrap"><span class="pg"> 
	<span class="sound_only">열린</span>  

		<c:if test="${param.page != 1}"> 
			<a class="pg_page pg_start" href="javascript:getAjaxList1(1,'${tag_search}','${search_title }');"></a>
			<a class="pg_page pg_prev" href="javascript:getAjaxList1('${param.page -1}','${tag_search}','${search_title }');"></a>			
		</c:if>
		
		<c:forEach var="pageWrap"  varStatus="status" begin="1" end="${pageSize}">

			<c:choose>
				<c:when test="${status.index == param.page}"><a class="pg_current" href="javascript:getAjaxList1('${status.index}','${tag_search}','${search_title }');">${status.index}</a></c:when>
				<c:otherwise><a class="pg_page" href="javascript:getAjaxList1('${status.index}','${tag_search}','${search_title }');">${status.index}</a></c:otherwise>
			</c:choose>

		</c:forEach>
		
		<c:if test="${pageSize > param.page}">
			<a class="pg_page pg_next" href="javascript:getAjaxList1('${param.page +1}','${tag_search}','${search_title }');"></a>
			<a class="pg_page pg_end" href="javascript:getAjaxList1('${pageSize}','${tag_search}','${search_title }');"></a>
		</c:if>

		
	</span>
</nav>