<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../adminHead.jsp" %>
 
<section>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#sfl").val("${sfl}").prop("selected", true);
			$("#stx").val("${stx}");
			memberPage(1);
			
			$("#memberPage").on("click", ".update", function() {
				var tr = $(this).parent().parent();
				var mem_id = tr.children().eq(1).find('span').text();
				var target = document.getElementById(mem_id);
				var mem_author = target.options[target.selectedIndex].value;
				var page = tr.children().eq(1).find('input').val();
				memberUpdate(mem_id, mem_author, page);
			});
			
			$("#memberPage").on("click", ".delete", function() {
				var tr = $(this).parent().parent();
				var mem_id = tr.children().eq(1).find('span').text();
				var page = tr.children().eq(1).find('input').val();
				memberDelete(mem_id, page);
			});
			
			$("#search").on("click", function() {
				memberPage(1);
			});
			
		});
		function memberPage(page) {
			var pageSize = 10;
			var target = document.getElementById("sfl");
			var sfl = target.options[target.selectedIndex].value;
			var stx = $("#stx").val();
			console.log("stx : " + stx + " sfl : " + sfl);
			$.ajax({
				url : "/manage/memberViewAjax",
				type : "get",
				data : "page=" + page + "&pageSize=" + pageSize + "&sfl=" + sfl + "&stx=" + stx,
				success : function(dt) {
					$("#memberPage").html(dt);
				}
			});
			$("#sfl").val(sfl).prop("selected", true);
			$("#stx").val(stx);
		}
		function memberUpdate(mem_id, mem_author,page) {
			var pageSize = ${pageVO.pageSize};
			$.ajax({
				url : "/manage/memberUpdateAjax",
				type : "post",
				data : {"mem_id":mem_id,"mem_author":mem_author,"page":page,"pageSize":pageSize}, 
				success : function(dt) {
					$("#memberPage").html(dt);
				}
			});
		}
		function memberDelete(mem_id, page) {
			var pageSize = ${pageVO.pageSize};
			$.ajax({
				url : "/manage/memberDeleteAjax",
				type : "post",
				data : {"mem_id":mem_id,"page":page,"pageSize":pageSize}, 
				success : function(dt) {
					$("#memberPage").html(dt);
				}
			});
		}
	</script>
	
	<div class="local_ov01 local_ov">
    <a href="" class="ov_listall">전체목록</a>
    
    <span class="btn_ov01"><span class="ov_txt">총회원수 </span>
    <span class="ov_num"> ${memberCnt}명 </span></span>
    
    <a href="" class="btn_ov01"> 
    	<span class="ov_txt">차단 </span>
    	<span class="ov_num">0명</span>
    </a>
    
    <a href="" class="btn_ov01"> 
    	<span class="ov_txt">탈퇴  </span>
    	<span class="ov_num">0명</span>
    </a>
	</div>
	
	<form id="fsearch" name="fsearch" class="local_sch01 local_sch" method="get">
		<label for="sfl" class="sound_only">검색대상</label>
		<select name="sfl" id="sfl">
		    <option value="mem_nick">닉네임</option>
		    <option value="mem_name">이름</option>
		    <option value="mem_email">E-MAIL</option>
		</select>
		<label for="stx" class="sound_only">검색어<strong class="sound_only"> 필수</strong></label>
		<input type="text" name="stx" value="" id="stx" required="" class="required frm_input">
		<input type="button" id="search" class="btn_submit" value="검색">
	</form>
	
	<div class="container_wr" id="memberPage">
	
	</div>
</section>
 
<%@include file="../adminTail.jsp" %>