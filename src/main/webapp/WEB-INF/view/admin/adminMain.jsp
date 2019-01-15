<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="adminHead.jsp" %>
 
<section>
    
    <h2>신규가입회원 5건 목록</h2>
    
    <div class="local_desc01 local_desc">
	    <p>
	               신규 가입자  5건
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
				    	<col width="15%">
				    	<col width="10%">
				    	<col width="12%">
				    	<col width="12%">
				    	<col width="12%">
				    	<col width="8%">
				    	<col width="10%">
				    	<col width="8%">
				    	<col width="8%">
				    </colgroup>
				    
				    <thead>
					    <tr>
					        <th scope="col" id="mb_list_mailc"><a href="">이메일</a></th>
					        <th scope="col" id="mb_list_id"><a href="">이름</a></th>
					        <th scope="col" id="mb_list_mobile">닉네임</th>
					        <th scope="col" rowspan="2" id="mb_list_cert"><a href="">휴대폰</a></th>
					        <th scope="col" id="mb_list_open"><a href="">연령대</a></th>
					        <th scope="col" id="mb_list_mailr"><a href="">성별</a></th>
					    </tr>
				    </thead>
				    
				    <tbody>
				    	<c:forEach items="${memberList}" var="memberVo">
				    		<tr class="bg0">
						        <td headers="mb_list_id"  class="td_name sv_use">
						            ${memberVo.mem_email}                  
						        </td>
						        <td headers="mb_list_cert"  class="td_mbcert">
						            ${memberVo.mem_name}
						        </td>
						        <td headers="mb_list_mailc">${memberVo.mem_nick}</td>
						        <td headers="mb_list_open">
						           ${memberVo.mem_tel}
						        </td>
						        <td headers="mb_list_mailr">
						            ${memberVo.mem_age}
						        </td>
						        <td headers="mb_list_auth" class="td_mbstat">
						           	<c:choose>
						           		<c:when test="${memberVo.mem_gender == 'M'}">남</c:when>
						           		<c:when test="${memberVo.mem_gender == 'F'}">여</c:when>
						           	</c:choose>       
						        </td>
						    </tr>
				    	</c:forEach>
				  </tbody>
				</table>
			</div>
		</form>
			
			<div class="btn_list03 btn_list">
		        <a href="/manage/memberView?page=1&pageSize=10">회원 전체보기</a>
		    </div>

			<h2>신규 가이드 지원 5건 목록</h2>
    
    <div class="local_desc01 local_desc">
	    <p>
	               신규 가이드 지원  5건
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
				    	<col width="15%">
				    	<col width="10%">
				    	<col width="12%">
				    	<col width="12%">
				    	<col width="12%">
				    	<col width="8%">
				    	<col width="10%">
				    	<col width="8%">
				    	<col width="8%">
				    </colgroup>
				    
				    <thead>
					    <tr>
					        <th scope="col" id="mb_list_mailc"><a href="">이메일</a></th>
					        <th scope="col" id="mb_list_id"><a href="">이름</a></th>
					        <th scope="col" id="mb_list_mobile">닉네임</th>
					        <th scope="col" rowspan="2" id="mb_list_cert"><a href="">휴대폰</a></th>
					        <th scope="col" id="mb_list_open"><a href="">연령대</a></th>
					        <th scope="col" id="mb_list_mailr"><a href="">성별</a></th>
					    </tr>
				    </thead>
				    
				    <tbody>
				   		<c:forEach items="${articleList}" var="memberVo">
				    		<tr class="bg0">
						        <td headers="mb_list_id"  class="td_name sv_use">
						            ${memberVo.mem_email}                  
						        </td>
						        <td headers="mb_list_cert"  class="td_mbcert">
						            ${memberVo.mem_name}
						        </td>
						        <td headers="mb_list_mailc">${memberVo.mem_nick}</td>
						        <td headers="mb_list_open">
						           ${memberVo.mem_tel}
						        </td>
						        <td headers="mb_list_mailr">
						            ${memberVo.mem_age}
						        </td>
						        <td headers="mb_list_auth" class="td_mbstat">
						           	<c:choose>
						           		<c:when test="${memberVo.mem_gender == 'M'}">남</c:when>
						           		<c:when test="${memberVo.mem_gender == 'F'}">여</c:when>
						           	</c:choose>       
						        </td>
						    </tr>
				    	</c:forEach>
				  </tbody>
				</table>
			</div>
		</form>
			
   		<div class="btn_list03 btn_list">
		     <a href="/main/board?board_id=bd00003">가이드 지원 전체보기</a>
		</div>
</section>
 
<%@include file="adminTail.jsp" %>