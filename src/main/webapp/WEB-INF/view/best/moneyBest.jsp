<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../head.jsp" %>
<link rel="stylesheet" href="/css/style.css">

<style>
.lodgment_title {
	width: 100%;
	text-align: center;
	font-size: 3em;
	margin: 20px 0 30px 0;
	color: #1087e3;
}
</style>

<script>
	
	$(function(){
		$(".essaySection").css("cursor", "pointer");
		
		$(".board_listF").on("click", "tr", function(){
	 		
			let essay_id = $(this).find("td").eq(1).text();
	 		
			location.href = "/essay/essayView?essay_id="+essay_id;
	 	});	
	});
 	
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

<div class="sub_container">

	<h2 class="lodgment_title">짠내 Best</h2>
	
	<div class="local_desc01 local_desc">
	    <p>
			짠내 Best는 매월 1일 부터 마지막일을 기준으로 상위권 30인을 기준으로 합니다.
	    </p>
	</div>
	
	<form  method="get" action="/moneyBest">
			
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
				<c:choose>
					<c:when test="${essayList[0].mem_profile eq ''}">
						<img src="/img/no_profile.png"> 
					</c:when>
					<c:otherwise>
						<img src="/upload/${essayList[0].mem_profile}" onerror="src='/img/no_profile.png';"> 
					</c:otherwise>
				</c:choose>
			</b>
		</div>
		<ul>
			<li><b>${essayList[0].mem_nick}</b><span>${essayList[0].essay_title}</span></li>
			<li><b class="money"><fmt:formatNumber value="${essayList[0].totalmoney}"></fmt:formatNumber>원</b><span><i class="fas fa-heart likeDel" style="color:#ff0000;"></i>${essayList[0].essay_like_count}개</span><span><i class="fas fa-eye"></i> ${essayList[0].essay_view_count} View</span></li>
		</ul>
	</div>
	
	
	<div class="ranking_top ranking_top2">
		<span>2</span>
		<div class="ranking_profile">
			<b class="my_profile my_profile4">
				<c:choose>
					<c:when test="${essayList[1].mem_profile eq ''}">
						<img src="/img/no_profile.png"> 
					</c:when>
					<c:otherwise>
						<img src="/upload/${essayList[1].mem_profile}" onerror="src='/img/no_profile.png';"> 
					</c:otherwise>
				</c:choose>
			</b>
		</div>
		<ul>
			<li><b>${essayList[0].mem_nick}</b><span>${essayList[1].essay_title}</span></li>
			<li><b class="money"><fmt:formatNumber value="${essayList[1].totalmoney}"></fmt:formatNumber>원</b><span><i class="fas fa-heart likeDel" style="color:#ff0000;"></i>${essayList[1].essay_like_count}개</span><span><i class="fas fa-eye"></i> ${essayList[1].essay_view_count} View</span></li>
		</ul>
	</div>
	
	<div class="ranking_top ranking_Mar ranking_top3">
		<span>3</span>
		<div class="ranking_profile">
			<b class="my_profile my_profile4">
				<c:choose>
					<c:when test="${essayList[1].mem_profile eq ''}">
						<img src="/img/no_profile.png"> 
					</c:when>
					<c:otherwise>
						<img src="/upload/${essayList[2].mem_profile}" onerror="src='/img/no_profile.png';"> 
					</c:otherwise>
				</c:choose>
			</b>
		</div>
		<ul>
			<li><b>${essayList[2].mem_nick}</b><span>${essayList[2].essay_title}</span></li>
			<li><b class="money"><fmt:formatNumber value="${essayList[2].totalmoney}"></fmt:formatNumber>원</b><span><i class="fas fa-heart likeDel" style="color:#ff0000;"></i>${essayList[1].essay_like_count}개</span><span><i class="fas fa-eye"></i> ${essayList[2].essay_view_count} View</span></li>
		</ul>
	</div>

	<h1>TOP 30</h1>
	<div id="container" class="bestContainer">
	<table class="board_list_wrap">
		<colgroup>
			<col width="5%">
			<col width="20%">
			<col width="10%">
			<col width="20%">
			<col width="25%">
			<col width="10%">
			<col width="10%">
		</colgroup>
		
		<thead>
			<tr>
				<th>순위</th>
				<th>위버</th>
				<th>금액</th>
				<th>여행지역</th>
				<th>제목</th>
				<th>좋아요</th>
				<th>HIT</th>
			</tr>
		</thead>
		
		<tbody class="board_listF board_listBest">
			<c:forEach items="${essayList}" var="essayVo" >
				<tr class="essaySection">
					<td>${essayVo.rnum}</td>
					<td style="display: none;">${essayVo.essay_id}</td>	
					<td>
						<b class="my_profile my_profile3">
							<c:choose>
								<c:when test="${essayVo.mem_profile eq ''}">
									<img src="/img/no_profile.png"> 
								</c:when>
								<c:otherwise>
									<img src="/upload/${essayVo.mem_profile}" onerror="src='/img/no_profile.png';"> 
								</c:otherwise>
							</c:choose>
						</b>
						<span class="my_profile_nick">${essayVo.mem_nick}</span>
					</td>
					<td class="center_td money"><fmt:formatNumber value="${essayVo.totalmoney}"></fmt:formatNumber></td>
					<td >${essayVo.mapmark_sido} ${essayVo.mapmark_sigungu}</td>
					<td>${essayVo.essay_title}</td>
					<td>${essayVo.essay_like_count}개</td>
					<td>${essayVo.essay_view_count}뷰</td>
				</tr>
					
			</c:forEach>
		</tbody>
		
	</table>

	<nav class="pg_wrap">
		<span class="pg">
		
		<%-- 	<c:set var="pageSize" value="10"/>
			
			
				<a class="pg_start pg_page" href="/main/board?board_id=${board_id}&page=1&pageSize=${pageSize}"></a>
				<a class="pg_page pg_prev" href="/main/board?board_id=${board_id}&page=${param.page - 1}&pageSize=${pageSize}"></a>			
			
			<c:forEach var="pageWrap"  varStatus="status" begin="1" end="${pageCnt}">

				<c:choose>
					<c:when test="${status.index == param.page}"><a class="pg_current" href="/main/board?board_id=${board_id}&page=${status.index}&pageSize=${pageSize}">${status.index}</a></c:when>
					<c:otherwise><a class="pg_page" href="/main/board?board_id=${board_id}&page=${status.index}&pageSize=${pageSize}">${status.index}</a></c:otherwise>
				</c:choose>

			</c:forEach>
			
				<a class="pg_page pg_next" href="/main/board?board_id=${board_id}&page=${param.page + 1}&pageSize=${pageSize}"></a>
				<a class="pg_page pg_end" href="/main/board?board_id=${board_id}&page=${pageCnt}&pageSize=${pageSize}"></a>
			 --%>
		
			
			
		</span>
	</nav>
	
</div>

<%@include file="../tail.jsp" %> 