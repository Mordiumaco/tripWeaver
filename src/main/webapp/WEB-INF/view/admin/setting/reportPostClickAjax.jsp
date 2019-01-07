<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript">
/* 이미지 슬라이드 */
$(document).ready(function(){
  $('.flexslider2').flexslider({
    animation: "slide",
    slideshowSpeed : 10000
    
  });
});
</script>

<c:choose>
	<c:when test="${postcardVo.pc_del == 'N'}">	
		<ul class="postCard_con">
			<li>
				<div class="postli_l">
					<b>
						<img src="/file/read?file=${postcardVo.mem_profile}">
					</b>
					<span>${postcardVo.mem_nick}</span>
					<input type="hidden" id="pc_id" name="pc_id" value="${postcardVo.pc_id}">
				</div> 
				
			</li>
			<li>
				<div class="flexslider2">
				  	<ul class="slides">
						<c:forEach items="${attVo}" var="att">
							<c:choose>
								<c:when test="${fn:length(attVo) == 0}">
								</c:when>
								<c:when test="${fn:length(attVo) == 1}">
									<img src="/file/read?file=/postcard/${att.att_file_name}">
								</c:when>
								<c:otherwise>
										  	<li>
										  		<img src="/file/read?file=/postcard/${att.att_file_name}">
										    </li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</ul>
				</div>
			</li>
			<li>
				
			</li>
			<li class="likeNumLi"></li>
			<li class="postli5">
				<div class="postli5_con content">${postcardVo.pc_cnt}</div>
			</li>
			<li class="hashTaglink">
				
				<c:forEach items="${postcardVo.hashTagList}" var="htl">
					#<a>${htl}</a>
				</c:forEach>
			</li>
			<li><fmt:formatDate value="${postcardVo.pc_date}" pattern="yyyy. MM. dd"/></li>
			
		</ul>
	</c:when>
</c:choose>
