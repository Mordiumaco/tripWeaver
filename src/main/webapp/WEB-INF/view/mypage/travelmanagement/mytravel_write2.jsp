<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../head.jsp" %>


<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/js/font-awesome/css/font-awesome.min.css">   

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a5f2e82aa9bad5f393255b6d8c3200cb"></script>

<script type="text/javascript">
	$(function() {
		
		generateDetailDays(daysArray);
		$('.totalDays').text(totalDays+'박 '+(totalDays+1)+'일');
		$('.tripplan_days').val(totalDays+1);
		$('.tripplan_start_day').val('${departDate}');
		$('.triparea_stay_days').val(daysArray);
		$('.mapMarkers').val('${positionInfo}');
		
	} );
	function goMypage(){
		location.href = '/main/mypage'
	}
	
	var jsonInfo = JSON.parse('${positionInfo}');
	console.log(jsonInfo.positions);
	
	var departDate = new Date('${departDate}');
	console.log(departDate);
	var daysArray = new Array();
	var totalDays = 0;
	var dayCheck = 0;
	
	console.log('${days[0]}');
	
	
	var thisScheduleDays;
	
	<c:forEach items='${days}' varStatus="loop">
		thisScheduleDays = '${days[loop.index]}';
		daysArray.push(parseInt(thisScheduleDays));
		totalDays += parseInt(thisScheduleDays);
	</c:forEach>
		
	console.log(daysArray);
	console.log(totalDays);
	
	function generateDetailDays(daysArray){
		
		let tempValue = '';
		let frontValue = '';
		let allZero = true;
		for(let i=0; i< daysArray.length; i++){
			if(daysArray[i] > 0){
				allZero = false;	
			}
		}
		
		
		for(let i=0; i < daysArray.length; i++){
			
			let zeroCheck = false;
			let daysArrayCount = 0;
			for(let k = i; k< daysArray.length; k++){
				if(daysArray[k] > 0){
					daysArrayCount++;
					if(daysArrayCount > 1){
						zeroCheck = true;
					}
				}
				
			}
			daysArrayCount = 0;
			
			if(daysArray[i] == 0){
				tempValue += jsonInfo.address_names[i]+'<br/>';
				zeroCheck = false;
				
			}else if((daysArray[i] != 0 && daysArray[i+1] == undefined) || (daysArray[i] != 0 && zeroCheck == false)){
				
				for(let j = 0; j < daysArray[i]+1; j++){
					if(0 == j && i > 0){
						frontValue = jsonInfo.address_names[i-1]+'<br/>';
					}
					
					let detailSchedule = '<tr>';
					detailSchedule +='<td>';
					detailSchedule +='<input class="dailyplan_day" name="dailyplan_day" type="hidden" value='+departDate.getFullYear()+'-'+(departDate.getMonth()+1)+'-'+departDate.getDate()+'>';
					detailSchedule +='<span>'+(departDate.getMonth()+1)+'월'+departDate.getDate()+'일</span><br/>';
					departDate.setDate(departDate.getDate()+1);
					dayCheck += 1;
					detailSchedule +='<input class="dailyplan_order" name="dailyplan_order" type="hidden" value='+dayCheck+'>';
					detailSchedule +='<b>DAY '+(dayCheck)+'</b>';
					detailSchedule +='</td>';
					detailSchedule +='<td class="address_collect">';
					detailSchedule +=frontValue+tempValue+jsonInfo.address_names[i]+'<br/>';
					detailSchedule +='<input class="dailyplan_area" name="dailyplan_area" type="hidden" value="'+frontValue+tempValue+jsonInfo.address_names[i]+'">';
					detailSchedule +='</td>';
					detailSchedule +='<td>';
					detailSchedule +='<textarea name="dailyplan_traffic" id="dailyplan_traffic"> ';
					detailSchedule +='</textarea>';
					detailSchedule +='</td>';
					detailSchedule +='<td>';
					detailSchedule +='<textarea name="dailyplan_cnt" id="dailyplan_cnt"> ';
					detailSchedule +='</textarea>';
					detailSchedule +='</td>';
					detailSchedule +='<td>';
					detailSchedule +='<textarea name="dailyplan_room" id="dailyplan_room"> ';
					detailSchedule +='</textarea>';
					detailSchedule +='</td>';
					detailSchedule +='</tr>';
					
					$("#essay_table").append(detailSchedule);
					tempValue = '';
					frontValue = '';
					
				}
			}else if(daysArray[i] != 0){
				for(let j = 0; j < daysArray[i]; j++){
					let frontValue = '';
					if(0 == j && i > 0){
						frontValue = jsonInfo.address_names[i-1]+'<br/>';
					}
					
					let detailSchedule = '<tr>';
					detailSchedule +='<td>';
					detailSchedule +='<input class="dailyplan_day" name="dailyplan_day" type="hidden" value='+departDate.getFullYear()+'-'+(departDate.getMonth()+1)+'-'+departDate.getDate()+'>';
					detailSchedule +='<span>'+(departDate.getMonth()+1)+'월'+departDate.getDate()+'일</span><br/>';
					departDate.setDate(departDate.getDate()+1);
					dayCheck += 1;
					detailSchedule +='<input class="dailyplan_order" name="dailyplan_order" type="hidden" value='+dayCheck+'>';
					detailSchedule +='<b>DAY '+(dayCheck)+'</b>';
					detailSchedule +='</td>';
					detailSchedule +='<td class="address_collect">';
					detailSchedule +='<input class="dailyplan_area" name="dailyplan_area" type="hidden" value="'+frontValue+tempValue+jsonInfo.address_names[i]+'">';
					detailSchedule +=frontValue+tempValue+jsonInfo.address_names[i]+'<br/>';
					detailSchedule +='</td>';
					detailSchedule +='<td>';
					detailSchedule +='<textarea name="dailyplan_traffic" id="dailyplan_traffic"> ';
					detailSchedule +='</textarea>';
					detailSchedule +='</td>';
					detailSchedule +='<td>';
					detailSchedule +='<textarea name="dailyplan_cnt" id="dailyplan_cnt"> ';
					detailSchedule +='</textarea>';
					detailSchedule +='</td>';
					detailSchedule +='<td>';
					detailSchedule +='<textarea name="dailyplan_room" id="dailyplan_room"> ';
					detailSchedule +='</textarea>';
					detailSchedule +='</td>';
					detailSchedule +='</tr>';
					
					$("#essay_table").append(detailSchedule);
					tempValue = '';
					frontValue = '';
					
				}
				zeroCheck = false;
			}
			
			if(daysArray.length-1 == i &&  daysArray[i] == 0 && tempValue != ''){
				$(".address_collect").last().append(tempValue);
				//tempValue = '';
			}
			
		}
		

		if(allZero == true){
			let detailSchedule = '<tr>';
			detailSchedule +='<td>';
			detailSchedule +='<input class="dailyplan_day" name="dailyplan_day" type="hidden" value='+departDate.getFullYear()+'-'+(departDate.getMonth()+1)+'-'+departDate.getDate()+'>';
			detailSchedule +='<span>'+(departDate.getMonth()+1)+'월'+departDate.getDate()+'일</span><br/>';
			departDate.setDate(departDate.getDate()+1);
			dayCheck += 1;
			detailSchedule +='<input class="dailyplan_order" name="dailyplan_order" type="hidden" value='+dayCheck+'>';
			detailSchedule +='<b>DAY '+(dayCheck)+'</b>';
			detailSchedule +='</td>';
			detailSchedule +='<td class="address_collect">';
			detailSchedule +=tempValue+'<br/>';
			detailSchedule +='<input class="dailyplan_area" name="dailyplan_area" type="hidden" value="'+tempValue+'">';
			detailSchedule +='</td>';
			detailSchedule +='<td>';
			detailSchedule +='<textarea name="dailyplan_traffic" id="dailyplan_traffic" maxlength="200"> ';
			detailSchedule +='</textarea>';
			detailSchedule +='</td>';
			detailSchedule +='<td>';
			detailSchedule +='<textarea name="dailyplan_cnt" id="dailyplan_cnt" maxlength="200"> ';
			detailSchedule +='</textarea>';
			detailSchedule +='</td>';
			detailSchedule +='<td>';
			detailSchedule +='<textarea name="dailyplan_room" id="dailyplan_room" maxlength="200"> ';
			detailSchedule +='</textarea>';
			detailSchedule +='</td>';
			detailSchedule +='</tr>';
			
			$("#essay_table").append(detailSchedule);
			tempValue = '';
		}
	}
	

	function formChecker(){
		
		let peopleCount = $(':input[name=tripplan_peo_count]').val();
		let title = $(':input[name=tripplan_title]').val();
		
		if(title.length < 2){
			alert('최소한 2자 이상의 제목을 입력해주세요');
			return false;
		}
		
		if(peopleCount < 0){
			alert('인원수를 0보다 큰 값을 입력해주세요!');
			return false;
		}
		
		return true;
	}
	
</script>
<!-- 모든 정보를 받아올 폼 -->
<form name="planForm" class="planForm" action="/myplan/mytravelForm" method="post" enctype="multipart/form-data" runat="server" onsubmit="return formChecker();">
<div class="sub_container">
	<h1 class="mypage_title">나의여행 일정 작성 </h1>	
	<div class="essay_filter">
		<ul style=" height: 60px; line-height: 60px;">
			<!-- tripplan table 제목 -->
			<li>제목: <b><input name="tripplan_title" type="text" placeholder="제목을 적어주세요." size="72" style="height: 40px; padding-left: 10px;" required="required"></b></li>
			<!-- 이미지 파일 받을 부분 -->
		</ul>
		<ul style=" height: 60px; line-height: 60px;">
			<!-- 이미지 파일 받을 부분 -->
			<img id="image_section"/>
			<li>대표이미지 : <b><input name="tripplan_image_file" type="file" onchange="loadFile(event)"/></b></li>
		</ul>
		<img id="output"/>
		<script>
		  var loadFile = function(event) {
		    var output = document.getElementById('image_section');
		    output.src = URL.createObjectURL(event.target.files[0]);
		    output.style.height = "40px";
		  };
		</script>
		<!-- 총 여행일수 tripplan table에 들어갈 부분 -->
		<input class="tripplan_days" name="tripplan_days" type="hidden"/>
		<!-- 출발일 -->
		<input class="tripplan_start_day" name="tripplan_start_day" type="hidden"/>
		<!-- 일수에 대한 input -->
		<input class="triparea_stay_days" name="triparea_stay_days" type="hidden"/>
		<!-- db markers 에 대한 정보를 담아놓은 json -->
		<input class="mapMarkers" name="mapMarkers" type="hidden"/>
		<ul>
			<li><b class="totalDays">박일</b> </li>
				<li>
				<b>
					<!-- 시즌 코드를 받는 부분 -->
					<select name="tripplan_season">
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
					<select name="tripplan_theme">
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
					<select name="tripplan_peo_type">
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
			<li> 인원수 : <input name="tripplan_peo_count" type="number" placeholder="1인 이상" required> <b>인</b></li>
		</ul>
		
	</div>
	<br/><br/>
	<div class="essay_calendar">
		<table class="essay_table" id="essay_table">
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
			
			<!-- <tr>
				<td>
					<span>11월27일(금)</span><br/>
					<b>DAY 1</b>
				</td>
				<td>
					미시령<br/>
					대관령
				</td>
				<td>
					<textarea name="traffic" id="trafficArea">
					
					</textarea>
				</td>
				<td>
					<textarea name="plan" id="planArea" >
					
					</textarea>
				</td>
				<td>
					<textarea name="accommodation" id="accommondationArea">
					
					</textarea>
				</td>
			</tr> -->
	
		</table>
	</div>
	
	<br/><br/>
	<div class="view_btn">
		<ul>
			<li class="essay_filterLi">
				<input class="btn_bd col_03 " type="submit" value="완료">
			</li>
			<li class="essay_filterLi">
				<input class="btn_bd col_02 " type="button" onclick="goMypage();" value="취소">	 					
			</li>
		</ul>
	</div> 

</div>	
</form>
<%@include file="../../tail.jsp" %> 