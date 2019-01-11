<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@include file="../adminHead.jsp"%>

	<div class="main_con" id="main_con">
		
		<div class="local_ov01 local_ov">
		    <span class="btn_ov01">
		    	<span class="ov_txt">전체 게시판</span>
		    	<span class="ov_num">${boardAllCnt }</span>
		    </span>
		    
		    <a class="btn_ov01">
			    <span class="ov_txt">사용 </span>
			    <span class="ov_num">${boardUseCnt }</span>
		    </a>
		    
		    <a class="btn_ov01"> 
		    	<span class="ov_txt">비사용  </span>
		    	<span class="ov_num">${boardNotUseCnt }</span>
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
			<c:forEach items="${boardList}" var="cr" varStatus="status">
			
			<li>
				<form method="post" action="/board/boardUpdate">	
					<ul class="create_borad_ul">
						<li>
<%-- 							<a href="">123</a> 클릭시 파라미터 url 링크로 해당 게시판 리스트로 이동 --%>
							<input type="text" name="board_id" value="${cr.board_id}" readonly="readonly"/>
						</li>
						<li>
							<input name="board_title" class="sm_${status.index}" required="required" type="text" value="${cr.board_title}">
<%-- 							<input type="hidden" name="board_id" value="${cr.board_id}"> --%>
						</li>
						<li>
							<select class="sm_${status.index}" name="board_use">
								<option value="Y" ${cr.board_use.equals("Y")? "selected":"" }>사용</option>
								<option value="N" ${cr.board_use != 'Y'? "selected":""}>비사용</option>
							</select>
						</li>
						<li>
							<input class="sm_${status.index} subBtn" type="submit" onclick="return confirm('수정하시겠습니까?');" value="수정">
						</li>
						<li>  
							<a href="/board/boardDelete?board_id=${cr.board_id}" class="subBtn subBtn2 subBtn5" onclick="return confirm('삭제하시겠습니까?');">삭제</a>
						</li>
					</ul>
				</form>
			</li>
			
			</c:forEach>
			<li>
				<form method="post" action="/board/boardCreate">	
					<ul class="create_borad_ul">
						<li>
							<input type="text" required="required" name="board_id" value="" disabled="disabled" >
						</li>
						<li>
							<input type="text" required="required" name="board_title" value="" autofocus  >
						</li>
						<li>
							<select name="board_use">
								<option value="Y">사용</option>
								<option value="N">비사용</option>
							</select>
						</li>
						<li>
							<input type="submit" value="생성">
						</li>
					</ul>
				</form>
			</li>
		</ul>
	</div>
<%@include file="../adminTail.jsp"%>