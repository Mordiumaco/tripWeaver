<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../head.jsp" %>

<script type="text/javascript">
// 기본형식
$(function(){
	getAjaxList1(1, '', 'e.essay_title');
	getAjaxList2(1, '', 'm.mem_nick');
	
	
	$('.content li').hide();
	$('.content li#web1').show();
	$('.tab a').click(function(){
		$('.tab a').removeClass('select');
		//모든 a태그에 select 클래스 없애준다.
		$(this).addClass('select');
		//클릭한 a태그에 select 클래스 적용
		$('.content li').hide();//모든 내용을 안보이게 해줌
		$($(this).attr('href')).slideDown();
	});
	
	
	$('#web1').on('click','.btn_submit2', function() {
		var tag_search = $(this).parents('#fsearch').find('#stx').val();
		var search_title = $(this).parents('#fsearch').find('#sfl').val();
		
		getAjaxList1(1, tag_search, search_title);
	})
	
	
	$('#web2').on('click','.btn_submit', function() {
		var tag_search = $(this).parents('#fsearch').find('#stx').val();
		var search_title = $(this).parents('#fsearch').find('#sfl').val();
		
		getAjaxList2(1, tag_search, search_title);
	})
	
});

function getAjaxList1(page, tag_search, search_title) {
	var pageSize = 9;
	var mem_id = "${loginInfo.mem_id}";
	
	$.ajax({
		url : "/clipEssayAjaxList",
		type : "get",
		data : "page="+page+"&pageSize="+pageSize+"&mem_id="+mem_id+"&tag_search="+tag_search+"&search_title="+search_title,
		success : function(dt){
			$("#web1").html(dt);
		}
	});
}	

function getAjaxList2(page, tag_search, search_title) {
	var pageSize = 9;
	var mem_id = "${loginInfo.mem_id}";
	
	$.ajax({
		url : "/clipPostAjaxList",
		type : "get",
		data : "page="+page+"&pageSize="+pageSize+"&mem_id="+mem_id+"&tag_search="+tag_search+"&search_title="+search_title,
		success : function(dt){
			console.log('123');
			$("#web2").html(dt);
		}
	});
}	


</script>


<div class="sub_container">
	<%@include file="myPageLeftMenu.jsp" %>
	
	<div class="mypage_right">
	
		<ul class="tab">
			<li><a href="#web1" class="select web1">Essay</a></li>
			<li><a href="#web2" class="web2">PostCard</a></li>
		</ul>
		
		<ul class="content">
			<li id="web1">
				
			</li>
			<li id="web2">
				
			</li>
			 
			
		</ul>
		
	</div>
</div>


<%@include file="../tail.jsp" %> 