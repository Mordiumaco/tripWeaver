<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../adminHead.jsp" %>
 
<section>
	<script type="text/javascript">
		$(document).ready(function() {
			memberPage(1);
			
			$("#memberPage").on("click", ".update", function() {
				var tr = $(this).parent().parent();
				var mem_id = tr.children().eq(1).find('span').text();
				var target = document.getElementById(mem_id);
				var mem_author = target.options[target.selectedIndex].value;
				var page = tr.children().eq(1).find('input').val();
				console.log("page : " + page);
				memberUpdate(mem_id, mem_author, page);
			});
			
		});
		function memberPage(page) {
			var pageSize = 10;
			
			$.ajax({
				url : "/manage/memberViewAjax",
				type : "get",
				data : "page=" + page + "&pageSize=" + pageSize,
				success : function(dt) {
					$("#memberPage").html(dt);
				}
			});
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
	</script>
	<div class="container_wr" id="memberPage">
	
	</div>
</section>
 
<%@include file="../adminTail.jsp" %>