<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="pageSize" value="10"/>

<c:if test="${param.page != 1}">
	<a class="pg_page pg_start" href="javascript:getAjaxList(${1},'${param.search_key}','${param.search_value}');"></a>
	<a class="pg_page pg_prev" href="javascript:getAjaxList(${pageVo.page - 1},'${param.search_key}','${param.search_value}');"></a>			
</c:if>


<c:forEach var="pageWrap"  varStatus="status" begin="1" end="${pageCnt}">

	<c:choose>
		<c:when test="${status.index == param.page}"><a class="pg_current" href="javascript:getAjaxList(${status.index}, '${param.search_key}', '${param.search_value}');">${status.index}</a></c:when>
		<c:otherwise><a class="pg_page" href="javascript:getAjaxList(${status.index},'${param.search_key}','${param.search_value}');">${status.index}</a></c:otherwise>
	</c:choose>

</c:forEach>

<c:if test="${pageCnt > param.page}">
	<a class="pg_page pg_next" href="javascript:getAjaxList(${pageVo.page + 1},'${param.search_key}','${param.search_value}');"></a>
	<a class="pg_page pg_end" href="javascript:getAjaxList(${pageCnt},'${param.search_key}','${param.search_value}');"></a>
</c:if>