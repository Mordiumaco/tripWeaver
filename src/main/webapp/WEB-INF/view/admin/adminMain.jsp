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
					        <th scope="col" id="mb_list_chk" rowspan="2">
					            <label for="chkall" class="sound_only">회원 전체</label>
					            <input type="checkbox" name="chkall" value="1" id="chkall" onclick="check_all(this.form)">
					        </th>
					        <th scope="col" id="mb_list_mailc"><a href="">이메일</a></th>
					        <th scope="col" id="mb_list_id"><a href="">이름</a></th>
					        <th scope="col" id="mb_list_mobile">닉네임</th>
					        <th scope="col" rowspan="2" id="mb_list_cert"><a href="">휴대폰</a></th>
					        <th scope="col" id="mb_list_open"><a href="">생년월일</a></th>
					        <th scope="col" id="mb_list_mailr"><a href="">성별</a></th>
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
					            pcpcggg3@naver.com                   
					        </td>
					        <td headers="mb_list_cert"  class="td_mbcert">
					            	박찬배
					        </td>
					        <td headers="mb_list_mailc">박진이 바보</td>
					        <td headers="mb_list_open">
					            010-6216-6693
					        </td>
					        <td headers="mb_list_mailr">
					            1988-02-13
					        </td>
					        <td headers="mb_list_auth" class="td_mbstat">
					           	 남       
					        </td>
					    </tr>
				  </tbody>
				</table>
			</div>
		</form>
			
			<div class="btn_list03 btn_list">
		        <a href="./member_list.php">회원 전체보기</a>
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
					        <th scope="col" id="mb_list_chk" rowspan="2">
					            <label for="chkall" class="sound_only">회원 전체</label>
					            <input type="checkbox" name="chkall" value="1" id="chkall" onclick="check_all(this.form)">
					        </th>
					        <th scope="col" id="mb_list_mailc"><a href="">이메일</a></th>
					        <th scope="col" id="mb_list_id"><a href="">이름</a></th>
					        <th scope="col" id="mb_list_mobile">닉네임</th>
					        <th scope="col" rowspan="2" id="mb_list_cert"><a href="">휴대폰</a></th>
					        <th scope="col" id="mb_list_open"><a href="">생년월일</a></th>
					        <th scope="col" id="mb_list_mailr"><a href="">성별</a></th>
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
					            pcpcggg3@naver.com                   
					        </td>
					        <td headers="mb_list_cert"  class="td_mbcert">
					            	박찬배
					        </td>
					        <td headers="mb_list_mailc">박진이 바보</td>
					        <td headers="mb_list_open">
					            010-6216-6693
					        </td>
					        <td headers="mb_list_mailr">
					            1988-02-13
					        </td>
					        <td headers="mb_list_auth" class="td_mbstat">
					           	 남       
					        </td>
					    </tr>
				
				  </tbody>
				</table>
			</div>
		</form>
			
   		<div class="btn_list03 btn_list">
		     <a href="./member_list.php">가이드 지원 전체보기</a>
		</div>
</section>
 
<%@include file="adminTail.jsp" %>