<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../head.jsp" %>

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

function commentEdit(m){
	
	
	let comt_id= $(m).siblings("#comt_id").val();
	let comt_cnt = $(m).siblings("#comt_cnt").val();
	
	console.log(comt_id);
	console.log(comt_cnt);
	
	 let contents = '';	
	 contents +=  '<form action="/article/updateComment" method="post">';
	 contents +=  '<input type="hidden" name="comt_id" value="'+comt_id+'">';
	 contents +=  '<input type="hidden" name="art_id" value="${articleVo.art_id}">';
	 contents +=  '<input type="text" name="comt_cnt" value="'+comt_cnt+'" required="required" style="width:80%;height:2em;">';
	 contents +=  '&nbsp;<input class="btn_bd col_01" type="submit" value="수정">';
	 contents +=  '</form>';
	
	$(m).parents(".bo_vc_act").siblings('.cmt_contents').html(contents);
	$(m).parents(".bo_vc_act").remove();
}	


</script>

<div class="main_con" id="main_con">
	<div id="container">
		<div class="view_btn">
			<ul>
				<c:if test="${articleVo.mem_id eq loginInfo.mem_id}">
				<li><button class="btn_bd col_03" type="submit" onclick="location.href='/main/board?board_id=${board_id}&page=1&pageSize=10&search_key=art_title&search_value='">목록</button></li>
					<li>
						<form action="/article/updateArticle" method="get">
							<input type="hidden"  name="art_id" value="${articleVo.art_id}">
							<input class="btn_bd col_03" type="submit" value="수정">
						</form>
					</li>
					<li>
						<form action="/article/deleteArticle" method="post" name="deletePosts">
							<input type="hidden"  name="art_id" value="${articleVo.art_id}">
							<input type="hidden"  name="art_del" value="Y">
							<input type="hidden"  name="board_id" value="${articleVo.board_id}">
							<input class="btn_bd col_02" type="button" onclick="button_event();" value="삭제">	 					
						</form>
					</li>
				</c:if>
			
				<li>
					<form action="/article/insertReplyView" method="get">
						<input type="hidden" name="art_id" value="${articleVo.art_id}">
						<input type="hidden" name="board_id" value="${articleVo.board_id}">
						<input type="hidden" name="art_par_id" value="${articleVo.art_id}">
						<input class="btn_bd col_01" type="submit" value="답글">
					</form>
				</li>
				
			</ul>
		</div>
		<h2 class="view_title">${articleVo.art_title}</h2>
		<ul class="view_header">
			<li><span class="profile_img"><img src="/img/no_profile.png" alt="no_profile" width="20" height="20" title=""></span><b>&nbsp;&nbsp;${articleVo.mem_id}</b> 님에 글 입니다.</li>
			<li><i class="fa fa-clock-o" aria-hidden="true"></i> &nbsp;<fmt:formatDate value="${articleVo.art_date}" pattern="yyyy-MM-dd"/></li>
		</ul>
		
		<p class="view_con">
			 ${articleVo.art_cnt}
		</p>
		
		
		<br/><br/><br/>
		
		<section id="bo_v_file">
        	<h2>첨부파일 </h2>
        	<ul>
       			<c:choose>
        			<c:when test="${attachmentVo.size() != 0}">
        				<c:forEach items="${attachmentList}" var="fv">
			              	<li>
				                <i class="fa fa-download" aria-hidden="true"></i>
<%-- 				                <img src="/upload//attachment/${fv.att_file_name}"> --%>
				                <a href="/fileS/attachment/${fv.att_file_name}" class="view_file_download">
				                    <strong>${fv.att_file_ori_name}</strong>
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
			<c:when test="${comtList.size() != 0}">
				<c:forEach items="${comtList}" var="co">
					<article id="c_489">
				        <header style="z-index:3">
				            <h3>${co.mem_id} 님의  댓글</h3>
				            <br/>
				            <span class="sv_wrap">
				            <span class="bo_vc_hdinfo">
				            	<i class="fa fa-clock-o" aria-hidden="true"></i>
		            			<fmt:formatDate value="${co.comt_date}" pattern="yyyy-MM-dd"/>
				            </span>
				        </header>
			        	<!-- 댓글 출력 -->
				        <div class="cmt_contents">
					        <c:choose>
			            		<c:when test="${co.comt_del != 'Y'}">
			            			<p>${co.comt_cnt}</p>
			            		</c:when>
			            		<c:otherwise>
			            			<p>삭제된 댓글 입니다.</p>
			            		</c:otherwise>
				            </c:choose>
				        </div>
				        <c:if test="${co.mem_id == loginInfo.mem_id }">
					        <ul class="bo_vc_act">
	                			<li>
	                				<form action="/article/deleteComment" method="post">
	                					<input type="hidden" name="art_id" value="${articleVo.art_id}">
 	                					<input type="hidden" name="comt_id" value="${co.comt_id}">
 	                					<input type="hidden" name="filter_id" value="article">
	                					<input type="hidden" name="comt_rel_art_id" value="${co.comt_rel_art_id}">
	                					<input type="hidden" name="comt_del" value="Y">
	                					<c:if test="${co.comt_del != 'Y'}">
	                						<input class="btn_b03" type="submit" value="삭제">
	                					</c:if>
	                					
	                				</form>
	                				<c:if test="${co.comt_del != 'Y'}">
	                					<input type="hidden" name="comt_id" value="${co.comt_id}" id="comt_id">
	                					<input type="hidden" name="comt_cnt" value="${co.comt_cnt}" id="comt_cnt">
	                					<input class="btn_b03" type="button" value="수정" onclick="commentEdit(this)"/>
                					</c:if>
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
			<form action="/article/insertComment" method="post">
				<ul>
					<li>
						<input type="text" name="comt_cnt" placeholder="내용을 적어주세요." required="required">
						<input type="hidden" name="art_id" value="${param.art_id}"> 
						<input type="hidden" name="board_id" value="${loginInfo.mem_id}">
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
    