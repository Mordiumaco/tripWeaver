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

<div class="sub_container">

	<h2 class="lodgment_title">Essay Best</h2>
	
	<div class="ranking_top ranking_top1">
		<span>1</span>
		<div class="ranking_profile">
			<b class="my_profile my_profile4">
				<img src="/upload/profile/profile1.jpg">
			</b>
		</div>
		<ul>
			<li><b>닉네임 자리다</b><span>에세이 여행글 제목이다.</span></li>
			<li><span><i class="far fa-comment"></i> 60개 </span><span><i class="fas fa-heart likeDel" style="color:#ff0000;"></i> 30개</span><span><i class="fas fa-eye"></i> 60 View</span></li>
		</ul>
	</div>
	
	
	<div class="ranking_top ranking_top2">
		<span>2</span>
		<div class="ranking_profile">
			<b class="my_profile my_profile4">
				<img src="/upload/profile/profile1.jpg">
			</b>
		</div>
		<ul>
			<li><b>닉네임 자리다</b><span>에세이 여행글 제목이다.</span></li>
			<li><span><i class="far fa-comment"></i> 60개 </span><span><i class="fas fa-heart likeDel" style="color:#ff0000;"></i> 30개</span><span><i class="fas fa-eye"></i> 60 View</span></li>
		</ul>
	</div>
	
	<div class="ranking_top ranking_Mar ranking_top3">
		<span>3</span>
		<div class="ranking_profile">
			<b class="my_profile my_profile4">
				<img src="/upload/profile/profile1.jpg">
			</b>
		</div>
		<ul>
			<li><b>닉네임 자리다</b><span>에세이 여행글 제목이다.</span></li>
			<li><span><i class="far fa-comment"></i> 60개 </span><span><i class="fas fa-heart likeDel" style="color:#ff0000;"></i> 30개</span><span><i class="fas fa-eye"></i> 60 View</span></li>
		</ul>
	</div>

	<div id="container" class="bestContainer">
	<table class="board_list_wrap">
		<colgroup>
			<col width="5%">
			<col width="20%">
			<col width="20%">
			<col width="25%">
			<col width="10%">
			<col width="10%">
			<col width="10%">
		</colgroup>
		
		<thead>
			<tr>
				<th>순위</th>
				<th>위버</th>
				<th>여행지역</th>
				<th>제목</th>
				<th>댓글수</th>
				<th>좋아요</th>
				<th>조회수</th>
			</tr>
		</thead>
		
		<tbody class="board_listF board_listBest">
			<tr>
				<td>1</td>
				<td>
					<b class="my_profile my_profile3">
						<img src="/upload/profile/profile1.jpg">
					</b>
					<span class="my_profile_nick">닉네임</span>
				</td>
				<td >대전광역시 중구</td>
				<td>즐거운 대전 여행</td>
				<td class="center_td">10 개</td>
				<td>258개</td>
				<td>500뷰</td>
			</tr>	
		</tbody>
		
	</table>

	<nav class="pg_wrap">
		<span class="pg">
		
			<c:set var="pageSize" value="10"/>
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
			
		</span>
	</nav>
	
</div>

<%@include file="../tail.jsp" %> 