<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../header.jsp" %>

<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/js/font-awesome/css/font-awesome.min.css">

<script type="text/javascript">
function button_event(){
	if (confirm("정말 삭제하시겠습니까??")){    //확인
	    var ff = document.deletePosts;
	    ff.submit();
	}else{   //취소
		alert("삭제취소"); //취소시 이벤트 처리
		return;
	}
}

</script>

<div class="main_con" id="main_con">
	<div id="container">
		<div class="view_btn">
			<ul>
				<c:if test="${postsVo.userid == S_USER.userId}">
					<li>
						<form action="/board/updateBoardView" method="get">
							<input type="hidden"  name="postsId" value="${postsVo.po_id}">
							<input class="btn_bd col_03" type="submit" value="수정">
						</form>
					</li>
					<li>
						<form action="/board/deleteBoard" method="post" name="deletePosts">
							<input type="hidden"  name="po_id" value="${postsVo.po_id}">
							<input type="hidden"  name="po_delete" value="Y">
							<input type="hidden"  name="nt_id" value="${postsVo.nt_id}">
							<input class="btn_bd col_02" type="button" onclick="button_event();" value="삭제">	 					
						</form>
					</li>
				</c:if>
			
				<li>
					<form action="/board/insertReplyView" method="get">
						<input type="hidden" name="po_id" value="${postsVo.po_id}">
						<input class="btn_bd col_01" type="submit" value="답글">
					</form>
				</li>
				
			</ul>
		</div>
		<h2 class="view_title">${postsVo.po_subject}</h2>
		<ul class="view_header">
			<li><span class="profile_img"><img src="/img/no_profile.gif" alt="no_profile" width="20" height="20" title=""></span><b>&nbsp;&nbsp;${postsVo.userid}</b> 님에 글 입니다.</li>
			<li><i class="fa fa-clock-o" aria-hidden="true"></i> &nbsp;<fmt:formatDate value="${postsVo.po_date}" pattern="yyyy-MM-dd"/></li>
		</ul>
		
		<p class="view_con">
			 ${postsVo.po_contents}
		</p>
		
		
		<br/><br/><br/>
		
		<section id="bo_v_file">
        	<h2>첨부파일 </h2>
        	<ul>
       			<c:choose>
        			<c:when test="${fileVo.size() != 0}">
        				<c:forEach items="${fileVo}" var="fv">
			              	<li>
				                <i class="fa fa-download" aria-hidden="true"></i>
				                <a href="/download?path=${path}&fileName=${fv.fl_file}" class="view_file_download">
				                    <strong>${fv.fl_oname}</strong>
				                </a>

			            	</li>
		            	</c:forEach>
	            	</c:when>
	            	<c:otherwise>
			       	 	<li>
			       	 		<strong>첨부파일 이 없습니다.</strong>
			       	 	</li>
					</c:otherwise>
					
				</c:choose>

           	</ul>
   		</section>
			
    	
    	<button type="button" class="cmt_btn"><i class="fa fa-commenting-o" aria-hidden="true"></i> 댓글목록</button>
		
		<c:choose>
			<c:when test="${comList.size() != 0}">
				<c:forEach items="${comList}" var="co">
					<article id="c_489">
				        <header style="z-index:3">
				            <h3>${co.userid} 님의  댓글</h3>
				            <br/>
				            <span class="sv_wrap">
				            <span class="bo_vc_hdinfo">
				            	<i class="fa fa-clock-o" aria-hidden="true"></i>
		            			<fmt:formatDate value="${co.co_date}" pattern="yyyy-MM-dd"/>
				            </span>
				        </header>
			        	<!-- 댓글 출력 -->
				        <div class="cmt_contents">
					        <c:choose>
			            		<c:when test="${co.co_delete != 'Y'}">
			            			<p>${co.co_contents}</p>
			            		</c:when>
			            		<c:otherwise>
			            			<p>삭제된 게시글 입니다.</p>
			            		</c:otherwise>
				            </c:choose>
				        </div>
				        <c:if test="${co.userid == S_USER.userId }">
					        <ul class="bo_vc_act">
	                			<li>
	                				<form action="/board/deleteComment" method="post">
	                					<input type="hidden" name="po_id" value="${co.po_id}">
	                					<input type="hidden" name="co_id" value="${co.co_id}">
	                					<input type="hidden" name="co_delete" value="Y">
	                					<c:if test="${co.co_delete != 'Y'}">
	                						<input class="btn_b03" type="submit" value="삭제">
	                					</c:if>
	                				</form>
	                			</li>            
	                		</ul>
                		</c:if>
		   	 		</article>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<article id="c_489">
					  <header style="z-index:3">
				            <h3>댓글이 없습니다.</h3>
				        </header>
				</article>
				
			</c:otherwise>
		</c:choose>
		
		<div class="commentWrite">
			<form action="/board/insertComment" method="post">
				<ul>
					<li>
						<input type="text" name="co_contents" placeholder="내용을 적어주세요." required="required">
						<input type="hidden" name="po_id" value="${param.postsId}"> 
						<input type="hidden" name="userId" value="${S_USER.userId}">
					</li>
					<li><input class="btn_bd col_01" type="submit" value="댓글 작성"></li>
				</ul>
			</form>
		</div>
		
	</div>
</div>


<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
    