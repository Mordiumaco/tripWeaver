<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../adminHead.jsp" %>

<script type="text/javascript">

$(function() {
	getAjaxList('','','',1);
	
	$('.container_wr').on('click','.btn_submit', function() {
		var sfl1 = $('#sfl1').val();
		var sfl2 = $('#sfl2').val();
		var sfl3 = $('#sfl3').val();
		getAjaxList( sfl1 , sfl2, sfl3, '1');
	});
	
	$('.container_wr').on('click','.btn_ov_01', function() {
		getAjaxList( '' , '', '', 1);
	});
	
	$('.container_wr').on('click','.btn_ov_02', function() {
		getAjaxList( '' , '', 'Y', 1);
	});
	
	$('.container_wr').on('click','.btn_ov_03', function() {
		getAjaxList( '' , '', 'N', 1);
	});
	
})


function getAjaxList(filter_id, rep_rea_id, report_proc_sta, page) {
	var pageSize = 10;

	$.ajax({
		url : "/report/declarationAjax",
		type : "get",
		data : "filter_id="+filter_id+"&rep_rea_id="+rep_rea_id+"&report_proc_sta="+report_proc_sta+"&page="+page+"&pageSize="+pageSize,
		success : function(dt){
			$(".tb_wrap").html(dt);
		}
	});
}

</script>


<section>
	<div class="container_wr">
    
		<div class="local_ov01 local_ov">
		    <a class="ov_listall btn_ov_01">전체목록</a>
		    <span class="btn_ov01">
		    	<span class="ov_txt">신고 수 </span>
		    	<span class="ov_num"> ${selectRepostAll}명</span> 
		    </span>
		    
		    <a class="btn_ov01 btn_ov_02"> 
		    	<span class="ov_txt">완료 </span>
		    	<span class="ov_num">${selectRepostY}명</span>
		    </a>
		    
		    <a class="btn_ov01 btn_ov_03"> 
		    	<span class="ov_txt">미완료  </span>
		    	<span class="ov_num">${selectRepostN}명</span>
		    </a>
		</div>

		<form id="fsearch" name="fsearch" class="local_sch01 local_sch" method="get">
			<label for="sfl" class="sound_only">검색대상</label>
			<select name="filter_id" id="sfl1">
				<option value="">전체</option>
			    <option value="essay">에세이</option>
			    <option value="postcard">포스트</option>
			</select>
			<select name="rep_rea_id" id="sfl2">
				<option value="">전체</option>
			    <option value="0">음란물유포</option>
			    <option value="1">욕설</option>
			    <option value="2">도배</option>
			    <option value="3">폭력성 짙은 글</option>
			    <option value="4">기타</option>
			</select>
			<select name="report_proc_sta" id="sfl3">
				<option value="">전체</option>
			    <option value="N">처리 미완료</option>
			    <option value="Y">처리 완료</option>
			</select>
			<input type="button" class="btn_submit" value="검색">
		</form>

		<div class="local_desc01 local_desc">
		    <p>
				사용자가 신고한 게시글, 댓글 등을 관리합니다.
		    </p>
		</div>
		
		<div class="btn_fixed_top">
		    <input type="submit" name="act_button" value="선택수정" onclick="document.pressed=this.value" class="btn btn_02">
		</div>
		
		<div class="tb_wrap">
			
		</div>
	
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