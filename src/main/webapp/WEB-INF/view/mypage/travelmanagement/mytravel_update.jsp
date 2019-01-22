<%@page import="kr.co.tripweaver.util.file.FilePath"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%pageContext.setAttribute("crlf", "\r\n");%>
<%@include file="../../head.jsp" %>

<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/js/font-awesome/css/font-awesome.min.css">   

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=<%=FilePath.MAPKEY%>"></script>

<script type="text/javascript">
$( function() {
    
    $("#tripplan_season option[value="+'${tripplanVo.tripplan_season}'+"]").prop("selected",true);
    
    $("#tripplan_theme option[value="+'${tripplanVo.tripplan_theme}'+"]").prop("selected",true);
    
    $("#tripplan_peo_type option[value="+'${tripplanVo.tripplan_peo_type}'+"]").prop("selected",true);
    
} );

	function tripplanImageDelete(){
		confirm('기존 대표 이미지를 삭제하실껀가요?');
		var imageBtn = '<img id="image_section"/><li>대표이미지 : <input id="tripplan_image_file" name="tripplan_image_file" type="file" onchange="loadFile(event)"/></li>';
		$(".tripplanImageList").text("");
		$(".tripplanImageList").append(imageBtn)
		
	}
	
	function goMypage(){
		location.href = '/main/mypage'
	}
	
	function formChecker(){
		
		let peopleCount = $(':input[name=tripplan_peo_count]').val();
		
		if(peopleCount < 0){
			alert('인원수를 0보다 큰 값을 입력해주세요!');
			return false;
		}
		
		return true;
	}
</script>

<div class="sub_container">
<form action="/myplan/mytravelFormUpdate" method="post" enctype="multipart/form-data" onsubmit="return formChecker();">
	<input name="tripplan_id" type="hidden" value="${tripplanVo.tripplan_id}">
	<h1 class="mypage_title">나의여행 일정 수정</h1>	
	<div class="essay_filter">
		<ul style=" height: 60px; line-height: 60px;">
			<li>제목:<b><input id="tripplan_title" name="tripplan_title" type="text" placeholder="제목을 적어주세요." size="72" style="height: 40px; padding-left: 10px;" value="${tripplanVo.tripplan_title}"></b></li>
		</ul>
		<ul style=" height: 60px; line-height: 60px;">
			<c:choose>
				<c:when test="${tripplanVo.tripplan_image eq ''}">
					<li>대표이미지 : <b><input id="tripplan_image_file" name="tripplan_image_file" type="file" onchange="loadFile(event)"/></b></li>
				</c:when>
				<c:when test="${tripplanVo.tripplan_image == null}">
					<li>대표이미지 : <b><input id="tripplan_image_file" name="tripplan_image_file" type="file" onchange="loadFile(event)"/></b></li>
				</c:when>
				<c:otherwise>
					<li class="tripplanImageList">대표이미지: <b>${tripplanVo.tripplan_image}</b><input id="tripplanImageDeleteBtn" type="button" onclick="tripplanImageDelete()" value="삭제"/><input type="hidden" name="fileCheck" value="${tripplanVo.tripplan_image}" /></li>
				</c:otherwise>
			</c:choose>
			<script>
			  var loadFile = function(event) {
			    var output = document.getElementById('image_section');
			    output.src = URL.createObjectURL(event.target.files[0]);
			    output.style.height = "40px";
			  };
			</script>
		</ul>
		<ul>
			<li><b>${tripplanVo.tripplan_days-1}박 ${tripplanVo.tripplan_days}일</b> </li>
			<li>
				<b>
					<!-- 시즌 코드를 받는 부분 -->
					<select id="tripplan_season" name="tripplan_season">
						<option value="1">봄</option>
						<option value="2">여름</option>
						<option value="3">가을</option>
						<option value="4">겨울</option>
						<option value="5">무관</option>
					</select>
				</b>
			</li>
			<li>
				<b>
					<select id="tripplan_theme" name="tripplan_theme">
						<option value="1">먹거리</option>
						<option value="2">레저</option>
						<option value="3">쇼핑</option>
						<option value="4">자연</option>
						<option value="5">문화</option>
						<option value="6">축제</option>
					</select>
				</b>
			</li>
			<li>
				<b>
					<select id="tripplan_peo_type" name="tripplan_peo_type">
						<option value="1">혼자</option>
						<option value="2">커플</option>
						<option value="3">친구</option>
						<option value="4">가족</option>
						<option value="5">단체</option>
						<option value="6">여자끼리</option>
						<option value="7">남자끼리</option>
					</select>
				</b>
			</li>
			<li> 인원수 : <input name="tripplan_peo_count" type="number" placeholder="1인 이상" required value="${tripplanVo.tripplan_peo_count}"> <b>인</b></li>
		</ul>
		
	</div>
	<br/><br/>
	<div class="essay_calendar">
		<table>
			<colgroup>
				<col width="20%">
				<col width="20%">
				<col width="20%">
				<col width="20%">
				<col width="20%">
			</colgroup>
			<tr>
				<th><i class="fa fa-calendar-alt" ></i> 날짜</th>
				<th><i class="fas fa-city"></i> 도시</th>
				<th><i class="fas fa-bus"></i> 교통</th>
				<th><i class="far fa-calendar-alt"></i> 일정</th>
				<th><i class="fas fa-bed"></i> 숙소</th>
			</tr>
			<c:forEach items="${dailyPlanList}" var="dailyPlanVo">
				<tr>
					<td>
						 <fmt:parseDate var="date" value="${dailyPlanVo.dailyplan_day}" pattern="yyyy-MM-dd"/>
						 <span><fmt:formatDate value="${dailyPlanVo.dailyplan_day}" pattern="MM월dd일(E)"/></span><br>
						 <b>DAY ${dailyPlanVo.dailyplan_order}</b>
					</td>
					<td class="address_collect">
						${dailyPlanVo.dailyplan_area}
					</td>
					<td>
						<c:set var="temp1" value="${fn:replace(dailyPlanVo.dailyplan_traffic, '<br/>', crlf)}"/>
						<textarea name="dailyplan_traffic" id="dailyplan_traffic" maxlength="600">${temp1} </textarea>
					</td>
					<td>
						<c:set var="temp2" value="${fn:replace(dailyPlanVo.dailyplan_cnt, '<br/>', crlf)}"/>
						<textarea name="dailyplan_cnt" id="dailyplan_cnt" maxlength="600">${temp2} </textarea>
					</td>
					<td>
						<c:set var="temp3" value="${fn:replace(dailyPlanVo.dailyplan_room, '<br/>', crlf)}"/>
						<textarea name="dailyplan_room" id="dailyplan_room" maxlength="600">${temp3} </textarea>
					</td>
				</tr>
			</c:forEach>
	
		</table>
	</div>
	
	<br/><br/>
	<div class="view_btn">
		<ul>
			<li class="essay_filterLi">
				<input class="btn_bd col_03 " type="submit" value="수정">
			</li>
			<li class="essay_filterLi">
				<input class="btn_bd col_02 " type="button" onclick="goMypage();" value="취소">	 					
			</li>
		</ul>
	</div> 

	</div>	
</form>
<%@include file="../../tail.jsp" %> 