<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../head.jsp" %>

<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/js/font-awesome/css/font-awesome.min.css">   

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a5f2e82aa9bad5f393255b6d8c3200cb"></script>

<script type="text/javascript">
$( function() {
    $('#datepicker').datepicker({
      showOn: "button",
      buttonImage: "/img/calendar.gif",
      buttonImageOnly: true,
      buttonText: "Select date",
      changeYear : true,
      changeMonth : true,
      yearRange : "1930:2020",
      dateFormat: "yy-mm-dd"
    });
} );

</script>

<form action="" method="get">
<div class="sub_container">
	
	<h1 class="mypage_title">나의여행 일정 작성</h1>	
	<div class="essay_filter">
		<ul style=" height: 60px; line-height: 60px;">
			<li>제목: <b><input type="text" placeholder="제목을 적어주세요." size="72" style="height: 40px; padding-left: 10px;"></b></li>
			<li>대표이미지 : <b><input type="file"></b></li>
		</ul>
	
		<ul>
			<li><b>3 박 4일</b> </li>
			<li>
				<b>
					<select>
						<option>테마</option>
						<option>테마1</option>
						<option>테마2</option>
						<option>테마3</option>
					</select>
				</b>
			</li>
			<li>
				<b>
					<select>
						<option>구성원</option>
						<option>구성원1</option>
						<option>구성원2</option>
						<option>구성원3</option>
					</select>
				</b>
			</li>
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
			
			<tr>
				<td>
					<span>11월27일(금)</span><br/>
					<b>DAY 1</b>
				</td>
				<td>
					미시령<br/>
					대관령
				</td>
				<td>
					<textarea rows="" cols="">
					
					</textarea>
				</td>
				<td>
					<textarea rows="" cols="">
					
					</textarea>
				</td>
				<td>
					<textarea rows="" cols="">
					
					</textarea>
				</td>
			</tr>
	
		</table>
	</div>
	
	<br/><br/>
	<div class="view_btn">
		<ul>
			<li class="essay_filterLi">
				<input class="btn_bd col_03 " type="submit" value="완료">
			</li>
			<li class="essay_filterLi">
				<input class="btn_bd col_02 " type="button" onclick="button_event();" value="취소">	 					
			</li>
		</ul>
	</div> 

</div>	
</form>
<%@include file="../../tail.jsp" %> 