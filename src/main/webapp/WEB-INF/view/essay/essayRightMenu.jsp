<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script>
$(document).ready(function(){
	$('.fold_wrap').on('click','.fold_btn',function () {
		$('.mypage_right2').animate({ right : '-260px'},200);
		$('.fold_btn').animate({ right : '-1px'},200);
		$('.fold_btn').addClass('fold_btnAfter');
	}); 
	
	$('.fold_wrap').on('click','.fold_btnAfter',function () {
		$('.mypage_right2').animate({ right : '0px'},200);
		$('.fold_btn').animate({ right : '260px'},200);
		$('.fold_btn').removeClass('fold_btnAfter');
	});
});

$(document).ready(function(){
	$('.reservation_list1').on('click', function() {
		$("input:radio[id='re1']").prop("checked", true); /* by ID */
	});
	$('.reservation_list2').on('click', function() {
		$("input:radio[id='re2']").prop("checked", true); /* by ID */
	});
	$('.reservation_list3').on('click', function() {
		$("input:radio[id='re3']").prop("checked", true); /* by ID */
	});
	$('.reservation_list4').on('click', function() {
		$("input:radio[id='re4']").prop("checked", true); /* by ID */
	});
});

</script>


    
<div class="fold_wrap">
	<div class="fold_btn"></div>    
	<div class="mypage_left mypage_right2">
		<ul>
			<li>
				<img src="/img/p_01.png"> 
			</li>
			<li>닉네임입니다. <span>가이드</span></li>
		</ul>
		<ul class="mypage_leftUl2">
			<li> <span>20대</span> <a href="/main/memModified">쪽지 보내기</a></li>
			<li class="mypage_leftUl2_li2"><a href=""><b>1234</b> 팔로잉</a> <a href=""><b>1231</b> 팔로워</a></li>
		</ul>
		
		<h6 class="leftUl2_title">예약 가능한 날짜</h6>
		<table class="reservation_list reservation_list1">
			<tr>
				<th>날짜</th>
				<td>2018. 01. 10</td>
			</tr>
			<tr>
				<th>선택</th>
				<td><input type="radio" id="re1" name="re"></td>
				
				
			</tr>
			<tr>
				<th>예약 가능인원</th>
				<td>8</td>
			</tr>
	
		</table>
		
		<table class="reservation_list reservation_list2">
			<tr>
				<th>날짜</th>
				<td>2018. 01. 10</td>
			</tr>
			<tr>
				<th>선택</th>
				<td><input type="radio"  id="re2" name="re"></td>
				
				
			</tr>
			<tr>
				<th>예약 가능인원</th>
				<td>8</td>
			</tr>
	
		</table>
		<table class="reservation_list reservation_list3">
			<tr>
				<th>날짜</th>
				<td>2018. 01. 10</td>
			</tr>
			<tr>
				<th>선택</th>
				<td><input type="radio" id="re3" name="re"></td>
				
				
			</tr>
			<tr>
				<th>예약 가능인원</th>
				<td>8</td>
			</tr>
	
		</table>
		<table class="reservation_list reservation_list4">
			<tr>
				<th>날짜</th>
				<td>2018. 01. 10</td>
			</tr>
			<tr>
				<th>선택</th>
				<td><input type="radio" id="re4" name="re"></td>
				
				
			</tr>
			<tr>
				<th>예약 가능인원</th>
				<td>8</td>
			</tr>
	
		</table>
		
		<div class="reservation_num"> 동행 인원 : <input type="number" placeholder="숫자만 입력하세요."> 명</div>
		<input class="reservation_btn classname" type="submit" value="예약하기">
	
	</div>

</div>