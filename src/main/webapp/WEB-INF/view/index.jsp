<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="head.jsp" %>

<script type="text/javascript">
$(document).ready(function(){
  $('.flexslider').flexslider({
    animation: "slide"
  });
});

$(function() {
    $("#top_btn").on("click", function() {
        $("html, body").animate({scrollTop:0}, '500');
        return false;
    });
});


$(document).ready(function () {
      $('.con_03_List a').hover(function(){
          $(this).animate({ top : '20px'},100).addClass('an');
      }, function(){
    	    $(this).animate({ top : '60px'},100).removeClass('an');
      });
 });



</script>


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
				<input type="text" placeholder="지역을 적어주세요.">
				<input type="submit"  value="검색"> 
			</li>
			<li>
				<a href="">Essay 글쓰기</a>
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
				<a href="/main/essay_view">
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
				<a href="/main/essay_view">
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
				<a href="/main/essay_view">
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
				<a href="/main/essay_view">
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
				<a href="/main/essay_view">
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
				<a href="/main/essay_view">
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
				<a href="/main/essay_view">
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
				<a href="/main/essay_view">
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
				<a href="/main/essay_view">
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


<div class="main_con_02">
	<div class="flexslider">
	  	<ul class="slides">
		    <li>
		    	<a href="">
			      	<div class="sl_left"><img src="/img/main_01.jpg" /></div>
			      	<div class="sl_right">
			      		<ul>
			      			<li>Post Card</li>
			      			<li>엄청나게 좋은 여행 잇힝</li>
			      			<li>내용이지롱 내용   꾸꾸꾸 꾸 끄끄끄 내용이지롱 내용   꾸꾸꾸 꾸 끄끄끄 내용이지롱 내용   꾸꾸꾸 꾸 끄끄끄 내용이지롱 내용   꾸꾸꾸 꾸 끄끄끄</li>
			      		</ul>
			      	</div>
		      	</a>
		      	<a href="">
			      	<div class="sl_left"><img src="/img/main_01.jpg" /></div>
			      	<div class="sl_right">
			      		<ul>
			      			<li>Post Card</li>
			      			<li>엄청나게 좋은 여행 잇힝</li>
			      			<li>내용이지롱 내용   꾸꾸꾸 꾸 끄끄끄 내용이지롱 내용   꾸꾸꾸 꾸 끄끄끄 내용이지롱 내용   꾸꾸꾸 꾸 끄끄끄 내용이지롱 내용   꾸꾸꾸 꾸 끄끄끄</li>
			      		</ul>
			      	</div>
		      	</a>
		    </li>
		    <li>
		    	<a href="">
			      	<div class="sl_left"><img src="/img/main_01.jpg" /></div>
			      	<div class="sl_right">
			      		<ul>
			      			<li>Post Card</li>
			      			<li>엄청나게 좋은 여행 잇힝</li>
			      			<li>내용이지롱 내용   꾸꾸꾸 꾸 끄끄끄 내용이지롱 내용   꾸꾸꾸 꾸 끄끄끄 내용이지롱 내용   꾸꾸꾸 꾸 끄끄끄 내용이지롱 내용   꾸꾸꾸 꾸 끄끄끄</li>
			      		</ul>
			      	</div>
		      	</a>
		      	<a href="">
			      	<div class="sl_left"><img src="/img/main_01.jpg" /></div>
			      	<div class="sl_right">
			      		<ul>
			      			<li>Post Card</li>
			      			<li>엄청나게 좋은 여행 잇힝</li>
			      			<li>내용이지롱 내용   꾸꾸꾸 꾸 끄끄끄 내용이지롱 내용   꾸꾸꾸 꾸 끄끄끄 내용이지롱 내용   꾸꾸꾸 꾸 끄끄끄 내용이지롱 내용   꾸꾸꾸 꾸 끄끄끄</li>
			      		</ul>
			      	</div>
		      	</a>
		    </li>
		    <li>
		    	<a href="">
			      	<div class="sl_left"><img src="/img/main_01.jpg" /></div>
			      	<div class="sl_right">
			      		<ul>
			      			<li>Post Card</li>
			      			<li>엄청나게 좋은 여행 잇힝</li>
			      			<li>내용이지롱 내용   꾸꾸꾸 꾸 끄끄끄 내용이지롱 내용   꾸꾸꾸 꾸 끄끄끄 내용이지롱 내용   꾸꾸꾸 꾸 끄끄끄 내용이지롱 내용   꾸꾸꾸 꾸 끄끄끄</li>
			      		</ul>
			      	</div>
		      	</a>
		      	<a href="">
			      	<div class="sl_left"><img src="/img/main_01.jpg" /></div>
			      	<div class="sl_right">
			      		<ul>
			      			<li>Post Card</li>
			      			<li>엄청나게 좋은 여행 잇힝</li>
			      			<li>내용이지롱 내용   꾸꾸꾸 꾸 끄끄끄 내용이지롱 내용   꾸꾸꾸 꾸 끄끄끄 내용이지롱 내용   꾸꾸꾸 꾸 끄끄끄 내용이지롱 내용   꾸꾸꾸 꾸 끄끄끄</li>
			      		</ul>
			      	</div>
		      	</a>
		    </li>
		   
		</ul>
	</div>
</div>

<div class="main_con_03">
	<div class="con_03_List">
		<a href="/main/essay_view">
			<ul>
				<li>Essay</li>
				<li>일본 술을 마시다.</li>
				<li>글 쓰는 셰프 박찬일의 일본 여행과 음식 이야기.</li>
				<li><i class="fa fa-clock-o" aria-hidden="true"></i> 2018. 12. 01</li>
				<li><img src="/img/main_01.jpg" /></li>
			</ul>
		</a>
	</div>
	<div class="con_03_List">
		<a href="/main/essay_view">
			<ul>
				<li>Essay</li>
				<li>일본 술을 마시다.</li>
				<li>글 쓰는 셰프 박찬일의 일본 여행과 음식 이야기.</li>
				<li><i class="fa fa-clock-o" aria-hidden="true"></i> 2018. 12. 01</li>
				<li><img src="/img/main_01.jpg" /></li>
			</ul>
		</a>
	</div>
	<div class="con_03_List">
		<a href="/main/essay_view">
			<ul>
				<li>Essay</li>
				<li>일본 술을 마시다.</li>
				<li>글 쓰는 셰프 박찬일의 일본 여행과 음식 이야기.</li>
				<li><i class="fa fa-clock-o" aria-hidden="true"></i> 2018. 12. 01</li>
				<li><img src="/img/main_01.jpg" /></li>
			</ul>
		</a>
	</div>
	<div class="con_03_List">
		<a href="/main/essay_view">
			<ul>
				<li>Essay</li>
				<li>일본 술을 마시다.</li>
				<li>글 쓰는 셰프 박찬일의 일본 여행과 음식 이야기.</li>
				<li><i class="fa fa-clock-o" aria-hidden="true"></i> 2018. 12. 01</li>
				<li><img src="/img/main_01.jpg" /></li>
			</ul>
		</a>
	</div>
	<div class="con_03_List">
		<a href="/main/essay_view">
			<ul>
				<li>Essay</li>
				<li>일본 술을 마시다.</li>
				<li>글 쓰는 셰프 박찬일의 일본 여행과 음식 이야기.</li>
				<li><i class="fa fa-clock-o" aria-hidden="true"></i> 2018. 12. 01</li>
				<li><img src="/img/main_01.jpg" /></li>
			</ul>
		</a>
	</div>
	<div class="con_03_List">
		<a href="/main/essay_view">
			<ul>
				<li>Essay</li>
				<li>일본 술을 마시다.</li>
				<li>글 쓰는 셰프 박찬일의 일본 여행과 음식 이야기.</li>
				<li><i class="fa fa-clock-o" aria-hidden="true"></i> 2018. 12. 01</li>
				<li><img src="/img/main_01.jpg" /></li>
			</ul>
		</a>
	</div>
</div>

<div class="main_con_04">
	<div class="con_04_wrap"">
		<div class="flexslider">
		  <ul class="slides">
		    <li>
			    <h2 class="RankingTitle"> 이번 달 짠내 랭킹 </h2>
			    <a href="" class="RankingA">
			    	<ul class="listRanking">
			    		<li><span>1</span></li>
			    		<li><img src="/img/p_01.png" /></li>
			    		<li>
			    			닉네임 : <b>최유정</b> &nbsp; &nbsp;<span>투어 평균 금액 : <b>500</b></span> <h6>좋아요 : <b> 4852</b></h6>
			    		</li>
			    	</ul>
		    	</a>
		    	<a href="" class="RankingA">
			    	<ul class="listRanking">
			    		<li><span>2</span></li>
			    		<li><img src="/img/p_02.png" /></li>
			    		<li>
			    			닉네임 : <b>최유정</b> &nbsp; &nbsp;<span>투어 평균 금액 : <b>500</b></span> <h6>좋아요 : <b> 4852</b></h6>
			    		</li>
			    	</ul>
		    	</a>
		    	<a href="" class="RankingA">
			    	<ul class="listRanking">
			    		<li><span>3</span></li>
			    		<li><img src="/img/p_03.png" /></li>
			    		<li>
			    			 닉네임 : <b>최유정</b> &nbsp; &nbsp;<span>투어 평균 금액 : <b>500</b></span> <h6>좋아요 : <b> 4852</b></h6>
			    		</li>
			    	</ul>
		    	</a>
		    </li>
		    
		     <li>
			    <h2 class="RankingTitle"> 이번 달 짠내 랭킹 </h2>
			    <a href="" class="RankingA">
			    	<ul class="listRanking">
			    		<li><span>1</span></li>
			    		<li><img src="/img/p_01.png" /></li>
			    		<li>
			    			닉네임 : <b>최유정</b> &nbsp; &nbsp;<span>투어 평균 금액 : <b>500</b></span> <h6>좋아요 : <b> 4852</b></h6>
			    		</li>
			    	</ul>
		    	</a>
		    	<a href="" class="RankingA">
			    	<ul class="listRanking">
			    		<li><span>2</span></li>
			    		<li><img src="/img/p_02.png" /></li>
			    		<li>
			    			닉네임 : <b>최유정</b> &nbsp; &nbsp;<span>투어 평균 금액 : <b>500</b></span> <h6>좋아요 : <b> 4852</b></h6>
			    		</li>
			    	</ul>
		    	</a>
		    	<a href="" class="RankingA">
			    	<ul class="listRanking">
			    		<li><span>3</span></li>
			    		<li><img src="/img/p_03.png" /></li>
			    		<li>
			    			닉네임 : <b>최유정</b> &nbsp; &nbsp;<span>투어 평균 금액 : <b>500</b></span> <h6>좋아요 : <b> 4852</b></h6>
			    		</li>
			    	</ul>
		    	</a>
		    </li>
		    
		    
		  </ul>
		</div>
	</div>
</div>


<button type="button" id="top_btn"><i class="fa fa-arrow-up" aria-hidden="true"></i></button>

<%@include file="tail.jsp" %>