<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../head.jsp" %>

<link rel="stylesheet" href="/css/style.css">
<!-- 데이트피커 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
$(function() {
	
	if($('#datepicker').val() == '' ){
		$('#datepicker').val(getTimeStamp(new Date(), dateType));
	}
	
	$("#datepicker").datepicker({
	    dateFormat: 'yyyyMM',
	    changeMonth: true,
	    changeYear: true,
	    showWeek : true,
	    showButtonPanel: true,
	    onClose: function(dateText, inst) {
	        var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
	        var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
	        $(this).val(getTimeStamp(new Date(year, month, 1), dateType));
	    }
	});
	
	$("#datepicker").focus(function () {
        $(".ui-datepicker-calendar").hide();
        $("#ui-datepicker-div").position({
            my: "center top",
            at: "center bottom",
            of: $(this)
        });
    });
	
});

function getTimeStamp(d, dType) {
   var s = leadingZeros(d.getFullYear(), 4) + leadingZeros(d.getMonth() + 1, 2);
   return s;
 }

function leadingZeros(n, digits) {
	var zero = '';
	n = n.toString();
	
	if (n.length < digits) {
	  for (i = 0; i < digits - n.length; i++)
	    zero += '0';
	}
	return zero + n;
}


</script>

<style>
.lodgment_title {
	width: 100%;
	text-align: center;
	font-size: 3em;
	margin: 20px 0 30px 0;
	color: #1087e3;
}
</style>

<div class="sub_container">

	<h2 class="lodgment_title">PostCard Best</h2>
	
	<div class="local_desc01 local_desc">
	    <p>
			PostCard Best는 매월 1일 부터 마지막일을 기준으로 상위권 30인을 기준으로 합니다.
	    </p>
	</div>
	
	<form  method="get" action="/postBest">
			
		<label for="datepicker"><span id="dateTypeName"></span>
			<input type="text" id="datepicker" name="datepicker" class="datepicker" placeholder="기간을 선택해주세요" required="required" readonly="readonly" value="${param.datepicker}">
		</label>
		
		<input type="hidden" id="dateType" name="dateType" required="required" value="">
		<input type="submit" value="검색" class="btn_submit333" id="search_btn">
	</form>
	
	<br/>
	<br/>
	<div class="ranking_top ranking_top1">
		<span>1</span>
		<div class="ranking_profile">
			<b class="my_profile my_profile4">
				<img src="/file/read?mem_profile=${postcardVo[0].mem_profile}">
			</b>
		</div>
		<ul>
			<li>
				<b>${postcardVo[0].mem_nick}</b>
				<span class="hashtag_text">
					<c:forEach items="${postcardVo[0].hashTagList}" var="hash">
						#<a href="/postCard/postCardList?mem_id=${loginInfo.mem_id}&tag_search=${hash}">${hash}</a>
					</c:forEach>
				</span>
			</li>
			<li>
				<span><i class="fas fa-heart likeDel" style="color:#ff0000;"></i> ${postcardVo[0].pc_like_count} 개</span>
				<span><span><i class="far fa-comment"></i> ${postcardVo[0].comt_count} 개 </span></span>
			</li>
		</ul>
	</div>
	
	
	<div class="ranking_top ranking_top2">
		<span>2</span>
		<div class="ranking_profile">
			<b class="my_profile my_profile4">
				<img src="/file/read?mem_profile=${postcardVo[1].mem_profile}">
			</b>
		</div>
		<ul>
			<li>
				<b>${postcardVo[1].mem_nick}</b>
				<span class="hashtag_text">
					<c:forEach items="${postcardVo[1].hashTagList}" var="hash">
						#<a href="/postCard/postCardList?mem_id=${loginInfo.mem_id}&tag_search=${hash}">${hash}</a>
					</c:forEach>
				</span>
			</li>
			<li>
				<span><i class="fas fa-heart likeDel" style="color:#ff0000;"></i> ${postcardVo[1].pc_like_count} 개</span>
				<span><span><i class="far fa-comment"></i> ${postcardVo[1].comt_count} 개 </span></span>
			</li>
		</ul>
	</div>
	
	<div class="ranking_top ranking_Mar ranking_top3">
		<span>3</span>
		<div class="ranking_profile">
			<b class="my_profile my_profile4">
				<img src="/file/read?mem_profile=${postcardVo[2].mem_profile}">
			</b>
		</div>
		<ul>
			<li>
				<b>${postcardVo[2].mem_nick}</b>
				<span class="hashtag_text">
					<c:forEach items="${postcardVo[2].hashTagList}" var="hash">
						#<a href="/postCard/postCardList?mem_id=${loginInfo.mem_id}&tag_search=${hash}">${hash}</a>
					</c:forEach>
				</span>
			</li>
			<li>
				<span><i class="fas fa-heart likeDel" style="color:#ff0000;"></i> ${postcardVo[2].pc_like_count} 개</span>
				<span><span><i class="far fa-comment"></i> ${postcardVo[2].comt_count} 개 </span></span>
			</li>
		</ul>
	</div>
	<div class="top_num"><b>TOP 30</b></div>
	<div id="container" class="bestContainer">
	<table class="board_list_wrap">
		<colgroup>
			<col width="5%">
			<col width="20%">
			<col width="55%">
			<col width="10%">
			<col width="10%">
		</colgroup>
		
		<thead>
			<tr>
				<th>순위</th>
				<th>위버</th>
				<th>해시태그</th>
				<th>댓글 수</th>
				<th>좋아요</th>
			</tr>
		</thead>
		
		<tbody class="board_listF board_listBest">
			<c:forEach items="${postcardVo}" var="post" varStatus="i">
				<tr>
					<td>${i.index + 1}</td>
					<td>
						<b class="my_profile my_profile3">
							<img src="/file/read?mem_profile=${post.mem_profile}">
						</b>
						<span class="my_profile_nick">${post.mem_nick}</span>
					</td>
					<td class="center_td00 hashtag_text">
						<c:forEach items="${post.hashTagList}" var="hash">
							#<a href="/postCard/postCardList?mem_id=${loginInfo.mem_id}&tag_search=${hash}">${hash}</a>
						</c:forEach>
					</td>
					<td >${post.comt_count} 개</td>
					<td>${post.pc_like_count} 개</td>
				</tr>	
			</c:forEach>
			
		</tbody>
		
	</table>

	
</div>

<%@include file="../tail.jsp" %> 