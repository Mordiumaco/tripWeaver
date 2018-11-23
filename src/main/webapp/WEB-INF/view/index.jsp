<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="head.jsp" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a5f2e82aa9bad5f393255b6d8c3200cb"></script>
<div class="filter_rap">
	<div class="filter">
		<ul>
			<li>
				<select>
					<option>테마</option>
				</select>
			</li>
			<li>
				<select>
					<option>시즌</option>
				</select>
			</li>
			<li>
				<select>
					<option>가격</option>
				</select>
			</li>
			<li>
				<select>
					<option>구성원별</option>
				</select>
			</li>
			<li>
				<select>
					<option>성별</option>
				</select>
			</li>
			<li>
				<span>지역 검색</span>
				<input type="text" placeholder="원하시는 지역을 적어주세요.">
				<input type="submit"  value="검색"> 
			</li>
		</ul>
	</div>
</div>

<div class="main_con_01">

	<div id="map" class="main_map" style="width:100%;height:600px;"></div>
	
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new daum.maps.LatLng(33.450701, 126.570667),
			level: 3
		};
	
		var map = new daum.maps.Map(container, options);
	</script>
	
	<div class="main_map main_list">
		<ul>
			<li class="essay_list">
				<a href="">
					<div class="essay_img">
						<img src="/img/main_01.jpg"/>
					</div>
					<ul class="essay_info">
						<li>20 <span>만원</span> <h6>박  진</h6></li>
						<li>여행지  : 충청북도 박진집</li>
						<li>먹거리  / 겨울  /  혼자 </li>
					</ul>
				</a>
			</li>
			
			<li class="essay_list">
				<a href="">
					<div class="essay_img">
						<img src="/img/main_06.jpg"/>
					</div>
					<ul class="essay_info">
						<li>200<span>만원</span> <h6>날아라호빵맨길길길길</h6></li>
						<li>여행지  : 충청북도 박진집</li>
						
						<li>먹거리  / 겨울  /  혼자 </li>
					</ul>
				</a>
			</li>
			
			<li class="essay_list">
				<a href="">
					<div class="essay_img">
						<img src="/img/main_02.jpg"/>
					</div>
					<ul class="essay_info">
						<li>20 <span>만원</span> <h6>qweqweqweqweqweqweqw</h6></li>
						<li>여행지  : 충청북도 박진집</li>
						
						<li>먹거리  / 겨울  /  혼자 </li>
					</ul>
				</a>
			</li>
			
			<li class="essay_list">
				<a href="">
					<div class="essay_img">
						<img src="/img/main_03.jpg"/>
					</div>
					<ul class="essay_info">
						<li>20 <span>만원</span> <h6>박  진</h6></li>
						<li>여행지  : 충청북도 박진집</li>
						
						<li>먹거리  / 겨울  /  혼자 </li>
					</ul>
				</a>
			</li>
			
			<li class="essay_list">
				<a href="">
					<div class="essay_img">
						<img src="/img/main_04.jpg"/>
					</div>
					<ul class="essay_info">
						<li>20 <span>만원</span> <h6>박  진</h6></li>
						<li>여행지  : 충청북도 박진집</li>
						
						<li>먹거리  / 겨울  /  혼자 </li>
					</ul>
				</a>
			</li>
			
			<li class="essay_list">
				<a href="">
					<div class="essay_img">
						<img src="/img/main_05.jpg"/>
					</div>
					<ul class="essay_info">
						<li>20 <span>만원</span> <h6>박  진</h6></li>
						<li>여행지  : 충청북도 박진집</li>
						
						<li>먹거리  / 겨울  /  혼자 </li>
					</ul>
				</a>
			</li>
			
			<li class="essay_list">
				<a href="">
					<div class="essay_img">
						<img src="/img/main_06.jpg"/>
					</div>
					<ul class="essay_info">
						<li>20 <span>만원</span> <h6>박  진</h6></li>
						<li>여행지  : 충청북도 박진집</li>
						
						<li>먹거리  / 겨울  /  혼자 </li>
					</ul>
				</a>
			</li>
			
			<li class="essay_list">
				<a href="">
					<div class="essay_img">
						<img src="/img/main_01.jpg"/>
					</div>
					<ul class="essay_info">
						<li>20 <span>만원</span> <h6>박  진</h6></li>
						<li>여행지  : 충청북도 박진집</li>
						
						<li>먹거리  / 겨울  /  혼자 </li>
					</ul>
				</a>
			</li>
			
			<li class="essay_list">
				<a href="">
					<div class="essay_img">
						<img src="/img/main_01.jpg"/>
					</div>
					<ul class="essay_info">
						<li>20 <span>만원</span> <h6>박  진</h6></li>
						<li>여행지  : 충청북도 박진집</li>
						
						<li>먹거리  / 겨울  /  혼자 </li>
					</ul>
				</a>
			</li>
			
			<li class="essay_list">
				<a href="">
					<div class="essay_img">
						<img src="/img/main_01.jpg"/>
					</div>
					<ul class="essay_info">
						<li>20 <span>만원</span> <h6>박  진</h6></li>
						<li>여행지  : 충청북도 박진집</li>
						<li>먹거리  / 겨울  /  혼자 </li>
					</ul>
				</a>
			</li>
			
			<li class="essay_list">
				<a href="">
					<div class="essay_img">
						<img src="/img/main_01.jpg"/>
					</div>
					<ul class="essay_info">
						<li>20 <span>만원</span> <h6>박  진</h6></li>
						<li>여행지  : 충청북도 박진집</li>
						
						<li>먹거리  / 겨울  /  혼자 </li>
					</ul>
				</a>
			</li>
			
		</ul>
		
	</div>
	

</div>



<%@include file="tail.jsp" %>