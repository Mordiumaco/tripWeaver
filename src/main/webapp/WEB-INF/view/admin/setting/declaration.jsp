<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../adminHead.jsp" %>
 
<section>
	<div class="container_wr">
    
		<div class="local_ov01 local_ov">
		    <a href="" class="ov_listall">전체목록</a>
		    
		    <span class="btn_ov01"><span class="ov_txt">신고 수 </span>
		    <span class="ov_num"> 1,460명 </span></span>
		    
		    <a href="" class="btn_ov01"> 
		    	<span class="ov_txt">완료 </span>
		    	<span class="ov_num">0명</span>
		    </a>
		    
		    <a href="" class="btn_ov01"> 
		    	<span class="ov_txt">미완료  </span>
		    	<span class="ov_num">18명</span>
		    </a>
		</div>

		<form id="fsearch" name="fsearch" class="local_sch01 local_sch" method="get">
			<label for="sfl" class="sound_only">검색대상</label>
			<select name="sfl" id="sfl">
				<option value="mb_nick">전체</option>
			    <option value="mb_nick">일반게시판</option>
			    <option value="mb_name">댓글</option>
			    <option value="mb_email">에세이</option>
			    <option value="mb_email">포스트</option>
			</select>
			<select name="sfl" id="sfl">
				<option value="mb_nick">전체</option>
			    <option value="mb_nick">음란물유포</option>
			    <option value="mb_name">욕설</option>
			    <option value="mb_email">도배</option>
			    <option value="mb_email">폭력성 짙은 글</option>
			    <option value="mb_email">기타</option>
			</select>
			<select name="sfl" id="sfl">
				<option value="mb_nick">전체</option>
			    <option value="mb_nick">처리 미완료</option>
			    <option value="mb_name">처리 완료</option>
			</select>
			<input type="submit" class="btn_submit" value="검색">
		</form>

		<div class="local_desc01 local_desc">
		    <p>
		        	사용자가 신고한 게시글, 댓글 등을 관리합니다.
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
				    	<col width="7%">
				    	<col width="34%">
				    	<col width="12%">
				    	<col width="12%">
				    	<col width="10%">
				    	<col width="10%">
				    	<col width="10%">
				    </colgroup>
				    
				    <thead>
					    <tr>
					        <th scope="col" id="mb_list_chk" rowspan="2">
					            <label for="chkall" class="sound_only">회원 전체</label>
					            <input type="checkbox" name="chkall" value="1" id="chkall" onclick="check_all(this.form)">
					        </th>
					        <th scope="col" id="mb_list_mailc"><a href="">신고코드</a></th>
					        <th scope="col" id="mb_list_id"><a href="">신고내용</a></th>
					        <th scope="col" id="mb_list_mobile"><a href="">신고 게시물 종류</a></th>
					        <th scope="col" rowspan="2" id="mb_list_cert"><a href="">신고 게시물(댓글) 코드</a></th>
					        <th scope="col" id="mb_list_mailr"><a href="">신고자</a></th>
					        <th scope="col" id="mb_list_open"><a href="">상태</a></th>
					        <th scope="col" id="mb_list_mailr"><a href="">처리</a></th>
					    </tr>
				    </thead>
				    
				    <tbody>
					    <tr class="bg0">
					        <td headers="mb_list_chk" class="td_chk" rowspan="2">
					            <input type="hidden" name="mb_id[0]" value="pcpcggg3@naver.com" id="mb_id_0">
					            <label for="chk_0" class="sound_only">pcpcggg3@naver.com 님</label>
					            <input type="checkbox" name="chk[]" value="0" id="chk_0">
					        </td>
					        <td headers="mb_list_id"  class="td_name sv_use">
					            11                 
					        </td>
					        <td headers="mb_list_cert"  class="td_mbcert">
					            	이상한 내용이에요
					        </td>
					        <td headers="mb_list_mailc">음란물 유포</td>
					        <td headers="mb_list_open">
					            254
					        </td>
					        <td headers="mb_list_auth" class="td_mbstat">
					           	 박   진      
					        </td>
					        <td headers="mb_list_mailr">
					            	처리 완료
					        </td>
					      					
					        <td headers="mb_list_grp" class="td_numsmall">
					        	<a href="" class="btn btn_02">처리 완료</a>
					        </td>
					       
					    </tr>
				
				  </tbody>
				</table>
			</div>
		
			<div class="btn_fixed_top">
			    <input type="submit" name="act_button" value="선택수정" onclick="document.pressed=this.value" class="btn btn_02">
			    <input type="submit" name="act_button" value="선택삭제" onclick="document.pressed=this.value" class="btn btn_02">
			</div>
		
		
		</form>

		<nav class="pg_wrap"><span class="pg">
			<span class="sound_only">열린</span>
				<strong class="pg_current">1</strong><span class="sound_only">페이지</span>
				<a href="" class="pg_page">2<span class="sound_only">페이지</span></a>
				<a href="" class="pg_page">3<span class="sound_only">페이지</span></a>
				<a href="" class="pg_page">4<span class="sound_only">페이지</span></a>
				<a href="" class="pg_page">5<span class="sound_only">페이지</span></a>
				<a href="" class="pg_page">6<span class="sound_only">페이지</span></a>
				<a href="" class="pg_page">7<span class="sound_only">페이지</span></a>
				<a href="" class="pg_page">8<span class="sound_only">페이지</span></a>
				<a href="" class="pg_page">9<span class="sound_only">페이지</span></a>
				<a href="" class="pg_page">10<span class="sound_only">페이지</span></a>
				<a href="" class="pg_page pg_next">다음</a>
				<a href="" class="pg_page pg_end">맨끝</a>
			</span>
		</nav>
	
		<script>
		function fmemberlist_submit(f)
		{
		    if (!is_checked("chk[]")) {
		        alert(document.pressed+" 하실 항목을 하나 이상 선택하세요.");
		        return false;
		    }
		
		    if(document.pressed == "선택삭제") {
		        if(!confirm("선택한 자료를 정말 삭제하시겠습니까?")) {
		            return false;
		        }
		    }
		
		    return true;
		}
		</script>


	    <noscript>
	        <p>
	                        귀하께서 사용하시는 브라우저는 현재 <strong>자바스크립트를 사용하지 않음</strong>으로 설정되어 있습니다.<br>
	            <strong>자바스크립트를 사용하지 않음</strong>으로 설정하신 경우는 수정이나 삭제시 별도의 경고창이 나오지 않으므로 이점 주의하시기 바랍니다.
	        </p>
	    </noscript>

	</div>
	
</section>
 
<%@include file="../adminTail.jsp" %>