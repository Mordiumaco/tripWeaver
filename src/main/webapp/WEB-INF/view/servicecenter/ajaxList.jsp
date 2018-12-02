<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<c:forEach items="${postsList}" var="pv" varStatus="status"  >
	<c:choose >
		<c:when test="${pv.po_delete != 'Y'}">
			<tr class="postsClick">
				<td>${pv.po_id}</td>
				<td>${pv.lp_subject}</td>
				<td>${pv.userid}</td>
				<td><fmt:formatDate value="${pv.po_date}" pattern="yyyy-MM-dd"/></td>
			</tr>
		</c:when>
		<c:otherwise>
			<tr>
				<td>${pv.po_id}</td>
				<td><span class="list_decoration">삭제된 글 입니다.</span></td>
				<td>${pv.userid}</td>
				<td><fmt:formatDate value="${pv.po_date}" pattern="yyyy-MM-dd"/></td>
			</tr>
		</c:otherwise>
	</c:choose>
</c:forEach>