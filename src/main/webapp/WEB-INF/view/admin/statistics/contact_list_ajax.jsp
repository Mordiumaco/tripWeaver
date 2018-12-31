<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="/js/jquery-3.3.1.min.js"></script>
<div class="tbl_head01 tbl_wrap">
	<table>
		<caption>접속자 목록</caption>
		<colgroup>
			<col width="13%">
			<col width="18%">
			<col width="15%">
			<col width="30%">
			<col width="8%">
			<col width="8%">
			<col width="8%">
		</colgroup>
		<thead>
			<tr>
				<th scope="col"><a>일시</a></th>
				<th scope="col"><a>회원아이디</a></th>
				<th scope="col">아이피(IP)</th>
				<th scope="col">접속경로</th>
				<th scope="col"><a>브라우저</a></th>
				<th scope="col"><a>OS</a></th>
				<th scope="col"><a>접속기기</a></th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(connStatVOs) ne 0}">
					<c:forEach items="${connStatVOs}" var="connStatVO">
						<tr class="bg0">
							<td class="td_num"><fmt:formatDate
									value="${connStatVO.conn_time}" pattern="yyyy.MM.dd HH:mm:ss" /></td>
							<td class="td_num">${connStatVO.mem_id}</td>
							<td class="td_left">${connStatVO.conn_ip}</td>
							<td class="td_num">${connStatVO.conn_ref}</td>
							<td class="td_num">${connStatVO.conn_browser}</td>
							<td class="td_num">${connStatVO.conn_os}</td>
							<td class="td_num">${connStatVO.conn_divice}</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr class="bg0">
						<td colspan="7">조회된 내용이 없습니다.</td>
					</tr>
				</c:otherwise>			
			</c:choose>
		</tbody>
	</table>
</div>

<nav class="pg_wrap">
	<span class="pg"> <fmt:parseNumber var="pages"
			integerOnly="true" value="${pageVO.page/pageVO.pageSize}" /> <c:set
			var="start" value="${pages*pageVO.pageSize + 1}" /> <c:set var="end"
			value="${start + 9 > pageCnt? pageCnt : start + 9}" /> <c:if
			test="${pageVO.page != 1}">
			<a href="javascript:contact_list(1)"
				class="pg_page pg_start">맨앞</a>
			<a href="javascript:contact_list(${pageVO.page - 1})"
				class="pg_page pg_prev">이전</a>
		</c:if> <c:forEach varStatus="i" begin="${start}" end="${end}">
			<c:choose>
				<c:when test="${i.index == pageVO.page}">
					<strong class="pg_current">${i.index}</strong>
				</c:when>
				<c:otherwise>
					<a href="javascript:contact_list(${i.index})"
						class="pg_page ">${i.index}<span class="sound_only">페이지</span></a>
				</c:otherwise>
			</c:choose>
		</c:forEach> <c:if test="${pageVO.page != pageCnt}">
<%-- 			<a href="/connStat/contactListAjax?page=${pageVO.page + 1}&pageSize=10" --%>
			<a href="javascript:contact_list(${pageVO.page + 1})"
				class="pg_page pg_next">다음</a>
			<a href="javascript:contact_list(${pageCnt})"
<%-- 			<a href="/connStat//contactListAjax?page=${pageCnt}&pageSize=10" --%>
				class="pg_page pg_end">맨끝</a>
		</c:if>

	</span>
</nav>