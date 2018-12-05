<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../adminHead.jsp" %>
 
<section>
<style>
.cursor {cursor: pointer;}
</style>

	<script type="text/javascript">
		var author = "";
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
			
			$("#memberPage").on("click", "#chkDelete", function() {
				var delArr = "";
				var page = "";
				//페크된 멤버 아이디
				$("input:checkbox[name=chk]:checked").each(function(i, e) {
					var tr = $(e).parent().parent();
					var mem_id = tr.children().eq(1).find('span').text();
					page = tr.children().eq(1).find('input').val();
					delArr += mem_id + ";";
				});
				if(delArr == ""){
					alert("삭제할 인원을 선탣해주세요");
				} else {
					memberChkDelete(delArr, page);
				}
			});
			
			$("#memberPage").on("click", "#chkUpdate", function() {
				var upArr = "";
				var auArr = "";
				var page = "";
				//채크된 멤버 아이디/권합값
				$("input:checkbox[name=chk]:checked").each(function(i, e) {
					var tr = $(e).parent().parent();
					var mem_id = tr.children().eq(1).find('span').text();
					var target = document.getElementById(mem_id);
					var mem_author = target.options[target.selectedIndex].value;
					page = tr.children().eq(1).find('input').val();
					upArr += mem_id + ";";
					auArr += mem_author + ";";
				});
				console.log("upArr, auArr, page : " + upArr + " " + auArr + " " + page);
				if(upArr == ""){
					alert("수정할 인원을 선택해주세요");
				} else {
					memberChkUpdate(upArr, auArr, page);
				}				
			});
			
			//체크박스 전테체크
			$("#memberPage").on("click", "#chkall", function() {
				if($("#chkall").prop("checked")){
					$("input[name=chk]").prop("checked", true);
				} else {
					$("input[name=chk]").prop("checked", false);
				}
			});
			
			//블랙리스트 버튼
			$("#memberCnt").on("click", "#author4", function() {
				author = 3;
				
				console.log("author : " + author);
				memberAuthorBlack(1);
			});
		});
		function memberAuthorBlack(page) {
			var pageSize = 10;
			var sfl = "mem_nick";
			var stx = "";
			$.ajax({
				url : "/manage/memberViewAjax",
				type : "get",
				data : "page=" + page + "&pageSize=" + pageSize + "&sfl=" + sfl + "&stx=" + stx + "&author=" + author,
				success : function(dt) {
					$("#memberPage").html(dt);
				}
			});
			$.ajax({
				url : "/manage/memberCntAjax",
				success : function(dt) {
					$("#memberCnt").html(dt);
				}
			});
			$("#sfl").val(sfl).prop("selected", true);
			$("#stx").val(stx);
		}
		function memberListAll(page) {
			var pageSize = 10;
			var sfl = "mem_nick";
			var stx = "";
			$.ajax({
				url : "/manage/memberViewAjax",
				type : "get",
				data : "page=" + page + "&pageSize=" + pageSize + "&sfl=" + sfl + "&stx=" + stx + "&author=" + author,
				success : function(dt) {
					$("#memberPage").html(dt);
				}
			});
			$.ajax({
				url : "/manage/memberCntAjax",
				success : function(dt) {
					$("#memberCnt").html(dt);
				}
			});
			$("#sfl").val(sfl).prop("selected", true);
			$("#stx").val(stx);
			author = "";
			console.log("author : " + author);
		}
		function memberPage(page) {
			var pageSize = 10;
			var target = document.getElementById("sfl");
			var sfl = target.options[target.selectedIndex].value;
			var stx = $("#stx").val();
			
			console.log("sfl, stx, author : " + sfl + " " + stx + " " + author);
			
			$.ajax({
				url : "/manage/memberViewAjax",
				type : "get",
				data : "page=" + page + "&pageSize=" + pageSize + "&sfl=" + sfl + "&stx=" + stx + "&author=" + author,
				success : function(dt) {
					$("#memberPage").html(dt);
				}
			});
			$.ajax({
				url : "/manage/memberCntAjax",
				success : function(dt) {
					$("#memberCnt").html(dt);
				}
			});
			$("#sfl").val(sfl).prop("selected", true);
			$("#stx").val(stx);
		}
		function memberUpdate(mem_id, mem_author,page) {
			var pageSize = ${pageVO.pageSize};
			var target = document.getElementById("sfl");
			var sfl = target.options[target.selectedIndex].value;
			var stx = $("#stx").val();
			$.ajax({
				url : "/manage/memberUpdateAjax",
				type : "post",
				data : {"mem_id":mem_id,"mem_author":mem_author,"page":page,"pageSize":pageSize,"sfl":sfl,"stx":stx, "author":author}, 
				success : function(dt) {
					$("#memberPage").html(dt);
				},
				error : function() {
					alert("에러-아작스실패");	
				}
			});
			$.ajax({
				url : "/manage/memberCntAjax",
				success : function(dt) {
					$("#memberCnt").html(dt);
				}
			});
		}
		function memberDelete(mem_id, page) {
			var pageSize = ${pageVO.pageSize};
			var target = document.getElementById("sfl");
			var sfl = target.options[target.selectedIndex].value;
			var stx = $("#stx").val();
			$.ajax({
				url : "/manage/memberDeleteAjax",
				type : "post",
				data : {"mem_id":mem_id,"page":page,"pageSize":pageSize,"sfl":sfl,"stx":stx, "author":author}, 
				success : function(dt) {
					$("#memberPage").html(dt);
				}
			});
			$.ajax({
				url : "/manage/memberCntAjax",
				success : function(dt) {
					$("#memberCnt").html(dt);
				}
			});
		}
		function memberChkUpdate(upArr, auArr, page) {
			var pageSize = ${pageVO.pageSize};
			var target = document.getElementById("sfl");
			var sfl = target.options[target.selectedIndex].value;
			var stx = $("#stx").val();
			$.ajax({
				url : "/manage/memberChkUpdateAjax",
				type : "post",
				data : {"upArr":upArr,"auArr":auArr,"page":page,"pageSize":pageSize,"sfl":sfl,"stx":stx, "author":author},
				success : function(dt) {
					$("#memberPage").html(dt);
				},
				error : function() {
					alert("에러-아작스실패");	
				}
			});
			$.ajax({
				url : "/manage/memberCntAjax",
				success : function(dt) {
					$("#memberCnt").html(dt);
				}
			});
		}
		function memberChkDelete(delArr, page) {
			var pageSize = ${pageVO.pageSize};
			var target = document.getElementById("sfl");
			var sfl = target.options[target.selectedIndex].value;
			var stx = $("#stx").val();
			$.ajax({
				url : "/manage/memberChkDeleteAjax",
				type : "post",
				data : {"delArr":delArr,"page":page,"pageSize":pageSize,"sfl":sfl,"stx":stx, "author":author},
				success : function(dt) {
					$("#memberPage").html(dt);
				}
			});
			$.ajax({
				url : "/manage/memberCntAjax",
				success : function(dt) {
					$("#memberCnt").html(dt);
				}
			});
		}
	</script>
	
	<div class="local_ov01 local_ov" id="memberCnt">
	    
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