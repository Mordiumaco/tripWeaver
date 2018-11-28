<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../adminHead.jsp"%>

	<div class="main_con" id="main_con">
		
		<div class="local_ov01 local_ov">
		    <span class="btn_ov01"><span class="ov_txt">전체 게시판</span>
		    <span class="ov_num"> 1,460개 </span></span>
		    
		    <a class="btn_ov01"> 
		    	<span class="ov_txt">사용 </span>
		    	<span class="ov_num">0개</span>
		    </a>
		    
		    <a class="btn_ov01"> 
		    	<span class="ov_txt">비사용  </span>
		    	<span class="ov_num">18개</span>
		    </a>
		</div>
		<br/>
		
		<ul class="create_borad">
			<li>
				<ul class="create_borad_th create_borad_ul">
					<li>게시판 코드</li>
					<li>게시판 이름</li>
					<li>사용여부</li>
					<li>수정</li>
					<li>삭제</li>
				</ul>
			</li>
			<c:forEach items="${noticeList}" var="cr" varStatus="status">
			
			<li>
				<form method="post" action="/board/updateNotice">	
				<ul class="create_borad_ul">
					<li>
						<a href="">123</a> <%-- 클릭시 파라미터 url 링크로 해당 게시판 리스트로 이동 --%>
					</li>
					
					<li>
						<input name="nt_name" class="sm_${status.index}" required="required" type="text" value="${cr.nt_name}">
						<input type="hidden" name="nt_id" value="${cr.nt_id}">
					</li>
					<li>
						<select class="sm_${status.index}" name="nt_ues">
							<option value="Y" ${cr.nt_ues.equals("Y")? "selected":"" }>사용</option>
							<option value="N" ${cr.nt_ues != 'Y'? "selected":""}>비사용</option>
						</select>
					</li>
					<li><input class="sm_${status.index} subBtn" type="submit" value="수정"></li>
					<li><input class="sm_${status.index} subBtn subBtn2" type="submit" value="삭제"></li>
				</ul>
				</form>
			</li>

			</c:forEach>
		
			<li>
				<form method="post" action="/board/insertNotice">	
				<ul class="create_borad_ul">
					<li>
						
					</li>
					<li><input type="text" required="required" name="nt_name" value="" autofocus  ></li>
					<li>
						<select name="nt_ues">
							<option value="Y">사용</option>
							<option value="N">비사용</option>
						</select>
					</li>
					<li><input type="submit" value="생성"></li>
					<li> </li>
				</ul>
				</form>
			</li>
		</ul>
		
	</div>
	
<%@include file="../adminTail.jsp"%>