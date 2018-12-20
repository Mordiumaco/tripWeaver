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


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a5f2e82aa9bad5f393255b6d8c3200cb&libraries=clusterer"></script>
<div class="filter_rap">
	<div class="filter">
		<ul>
			<li>
				<select name="theme">
					<option value="">테마</option>
					<c:forEach items="${themeList}" var="theme" varStatus="i">
						<option value="${i.index+1}">${theme}</option>
					</c:forEach>
				</select>
			</li>
			<li>
				<select name="season">
					<option value="">시즌</option>
					<c:forEach items="${seasonList}" var="season" varStatus="i">
						<option value="${i.index+1}">${season}</option>
					</c:forEach>
				</select>
			</li>
			<li>
				<select name="price">
					<option value="">가격</option>
					<option value="10000~100000" >1~10만</option>
					<option value="100000~300000">10~30만</option>
					<option value="300000~500000">30~50만</option>
					<option value="500000~700000">50~70만</option>
					<option value="700000~1000000">70~100만</option>
					<option value="1000000~">100만~</option>
				</select>
			</li>
			<li>
				<select name="peoType">
					<option value="">구성원별</option>
					<c:forEach items="${peotypeList}" var="peotype" varStatus="i">
						<option value="${i.index+1}">${peotype}</option>
					</c:forEach>
				</select>
			</li>
			<li>
				<input id="searchText" type="text" placeholder="지역을 적어주세요.">
				<input type="submit"  value="검색" onclick="onSearching();"> 
			</li>
			
			<li>
				<a href="/essay/write">Essay 글쓰기</a>
			</li>
		</ul>
	</div>
</div>

<div class="main_con_01">

	<div id="map" class="main_map" style="width:100%;height:600px;"></div>
	
	<script>
	    function imgError(image) {
	        image.onerror = "";
	        image.src = "/img/no_image.png";
	        return true;
	    }
	
	   
	    
		var container = document.getElementById('map');
		var options = {
		   center : new daum.maps.LatLng(35.7683, 128.708), // 지도의 중심좌표
	       level : 13 // 지도의 확대 레벨
		};
	
		var map = new daum.maps.Map(container, options);
		
		//마커 이미지 관련 로직 ------------
		var imageSrc = '/img/marker.png', // 마커이미지의 주소입니다    
	    imageSize = new daum.maps.Size(35,47), // 마커이미지의 크기입니다
	    imageOption = {offset: new daum.maps.Point(14,47)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
	      
		// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
		var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption);
		//마커 이미지 로직 끝 ------------
		
		var clusterer = new daum.maps.MarkerClusterer({
	        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체
	        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정
	        minLevel: 7, // 클러스터 할 최소 지도 레벨
	        disableClickZoom: true // 클러스터 마커를 클릭했을 때 지도가 확대되지 않도록 설정한다
	    });

		
	    // 데이터를 가져오기 위해 jQuery를 사용합니다
	    // 데이터를 가져와 마커를 생성하고 클러스터러 객체에 넘겨줍니다
	    
	    $(function(){
	    	
	     	function initMain(){
			    $.ajax({
					type: "GET",
					url:"/main/initMain",
					data : null,
					success : function(data){
						//data(사용자 json 데이터)를 바탕으로 
						//사용자 리스트를 갱신
						//1. 기존 리스트를 삭제 
						//2. data를 이용하여 table 태그(tr) 작성
						//3. 기존 리스트 위치에다가 붙여 넣기
						
						var bounds = new daum.maps.LatLngBounds();
						console.log(data);
				        var markers = $(data.clusterList).map(function(i, clusterInfo) {
				        	
				        	bounds.extend(new daum.maps.LatLng(clusterInfo.mapmark_y_coor, clusterInfo.mapmark_x_coor));
				        	
				            return new daum.maps.Marker({
				            	image: markerImage, // 마커이미지 설정 
				                position : new daum.maps.LatLng(clusterInfo.mapmark_y_coor, clusterInfo.mapmark_x_coor)
				            });
				            
				        });
				        // 클러스터러에 마커들을 추가합니다
				        clusterer.addMarkers(markers);
				        map.setBounds(bounds);
					}
				}); 
		    }
		    
		    initMain();
		    
	    	
		    
	    })
	    
	   /*  $.get("/main/initMain", function(data) {
	        // 데이터에서 좌표 값을 가지고 마커를 표시합니다
	        // 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다
	        var markers = $(data).map(function(i, position) {
	            return new daum.maps.Marker({
	            	image: markerImage, // 마커이미지 설정 
	                position : new daum.maps.LatLng(position.mapmark_y_coor, position.mapmark_x_coor)
	            });
	        });

	        // 클러스터러에 마커들을 추가합니다
	        clusterer.addMarkers(markers);
	    }); */
		
	    
	    var clusterPositions = [];
	    
	    
	    // 마커 클러스터러에 클릭이벤트를 등록합니다
	    // 마커 클러스터러를 생성할 때 disableClickZoom을 true로 설정하지 않은 경우
	    // 이벤트 헨들러로 cluster 객체가 넘어오지 않을 수도 있습니다
	    daum.maps.event.addListener(clusterer, 'clusterclick', function(cluster) {

	        // 현재 지도 레벨에서 1레벨 확대한 레벨
	        var level = map.getLevel()-1;
	        console.log( cluster.getMarkers());
	        console.log( cluster.getClusterMarker() );
	        // 지도를 클릭된 클러스터의 마커의 위치를 기준으로 확대합니다
	        map.setLevel(level, {anchor: cluster.getCenter()});
	        console.log( cluster );
	     
	    });
	    
	    //클러스터링이 완료됐을 때 발생한다.
	    //이벤트 핸들러 함수 인자로는 생성된 Cluster 객체 전체가 배열로 넘어온다.

	    daum.maps.event.addListener( clusterer, 'clustered', function( clusters ) {
	        //console.log( clusters.length );
	        //console.log(clusters)
	        clusterPositions = [];
	        
	        for(let i = 0 ; i < clusters.length; i++){
	        	for(let j = 0 ; j < clusters[i].getMarkers().length; j++){
	        		
	        		clusterPositions.push(clusters[i].getMarkers()[j].getPosition());
	        		
	        	}
	        }
	        
	        var totalObj = new Object();
	        totalObj.positions = clusterPositions;
	        var jsonInfo = JSON.stringify(totalObj);
	        console.log(jsonInfo);
	        $("#essay_list_ul").html("");
	        reload();	        
	        //test = clusters[0];
	        function reload(){
	        	
	        	$.ajax({
					type: "GET",
					url:"/main/reload",
					data : "markers="+encodeURI(jsonInfo),
					success : function(data){
						if(data.clusterList == ""){
							var essayContent ="";
							essayContent += '<li class="essay_list">';
				            essayContent += '<div class="essay_img">';
				            essayContent += '</div>';
				            essayContent += '<ul class="essay_info">';
				            essayContent += '<li><h6><span>검색 결과 값이 존재하지 않습니다.</span></h6></li>';
				            essayContent += '<li></li>';
				            essayContent += '<li></li>';
				            essayContent += '</ul>';
				            essayContent += '</a>';
				            essayContent += '</li>';
							$("#essay_list_ul").append(essayContent);
						}
						
				        var markers = $(data.clusterList).map(function(i, clusterInfo) {
			        	    var essayContent ="";
			    			let theme = "";
			    			switch(clusterInfo.tripplan_theme){
				    			case "1" : theme = "먹거리";
				    			break;
				    			case "2" : theme = "레저";
				    			break;
				    			case "3" : theme = "쇼핑";
				    			break;
				    			case "4" : theme = "자연";
				    			break;
				    			case "5" : theme = "문화";
				    			break;
				    			case "6" : theme = "축제";
				    			break;
			    			}
			    			
			    			let season = "";
			    			switch(clusterInfo.tripplan_season){
				    			case "1" : season = "봄";
				    			break;
				    			case "2" : season = "여름";
				    			break;
				    			case "3" : season = "가을";
				    			break;
				    			case "4" : season = "겨울";
				    			break;
				    			case "5" : season = "무관";
				    			break;
				    			
		    				}
			    			
			    			let peo_type = "";
			    			
			    			switch(clusterInfo.tripplan_peo_type){
			    			
				    			case "1" : peo_type = "혼자";
				    			break;
				    			case "2" : peo_type = "커플";
				    			break;
				    			case "3" : peo_type = "친구";
				    			break;
				    			case "4" : peo_type = "가족";
				    			break;
				    			case "5" : peo_type = "단체";
				    			break;
				    			case "6" : peo_type = "여자끼리";
				    			break;
				    			case "7" : peo_type = "남자끼리";
				    			break;
	    					}
			    		
				            essayContent += '<li class="essay_list">';
				            essayContent +=	'<a href="/main/essay_view">';
				            essayContent += '<div class="essay_img">';
				            essayContent += '<img src="/upload/'+clusterInfo.tripplan_image+'" onerror="imgError(this)";/>';
				            essayContent += '</div>';
				            essayContent += '<ul class="essay_info">';
				            essayContent += '<li>200<span>만원</span> <h6>'+clusterInfo.mem_nick+'</h6></li>';
				            essayContent += '<li>여행지  : '+clusterInfo.mapmark_sido+' '+clusterInfo.mapmark_sigungu+'</li>';
				            essayContent += '<li>'+theme+' / '+ season+ ' / '+ peo_type +'</li>';
				            essayContent += '</ul>';
				            essayContent += '</a>';
				            essayContent += '</li>';
				            
				            $("#essay_list_ul").append(essayContent);
				            
				     });

					 	
					}
				});
	        }
	        
	    });
	    
	    
	    function onSearching(){
	    	
	    	let theme = document.getElementsByName("theme")[0];
	    	let season = document.getElementsByName("season")[0];
	    	let peoType = document.getElementsByName("peoType")[0];
	    	let price = document.getElementsByName("price")[0];
	    	
	    	
	    	let themeValue = encodeURI(theme.options[theme.selectedIndex].value);
	    	let seasonValue = encodeURI(season.options[season.selectedIndex].value);
	    	let peoTypeValue = encodeURI(peoType.options[peoType.selectedIndex].value);
	    	let priceValue = encodeURI(price.options[price.selectedIndex].value);
	    	let searchValue = encodeURI($("#searchText").val().replace(/\s\s+/g, ' '));
	    	
	    	console.log(themeValue);
	    	console.log(seasonValue);
	    	console.log(peoTypeValue);
	    	console.log(priceValue);
	    	console.log(searchValue);
	    	
	    	clusterer.clear();
	    	
	    	$.ajax({
				type: "GET",
				url:"/main/searchAjax",
				data : "seasonValue="+seasonValue+"&themeValue="+themeValue+"&peoTypeValue="+peoTypeValue+"&priceValue="+priceValue+"&searchValue="+searchValue,
				success : function(data){
				   
				   console.log(data);
				   if(data.clusterList.length == 0){
					   console.log("여기로 들어와따");
					   $("#essay_list_ul").html("");
					   var essayContent ="";
						essayContent += '<li class="essay_list">';
			            essayContent += '<div class="essay_img">';
			            essayContent += '</div>';
			            essayContent += '<ul class="essay_info">';
			            essayContent += '<li><h6><span>검색 결과 값이 존재하지 않습니다.</span></h6></li>';
			            essayContent += '<li></li>';
			            essayContent += '<li></li>';
			            essayContent += '</ul>';
			            essayContent += '</a>';
			            essayContent += '</li>';
						$("#essay_list_ul").append(essayContent);
					   return;
				   }
				   
				   var bounds2 = new daum.maps.LatLngBounds();
				   var markers = $(data.clusterList).map(function(i, clusterInfo) {
			        	
					   bounds2.extend(new daum.maps.LatLng(clusterInfo.mapmark_y_coor, clusterInfo.mapmark_x_coor));
					   
			            return new daum.maps.Marker({
			            	image: markerImage, // 마커이미지 설정 
			                position : new daum.maps.LatLng(clusterInfo.mapmark_y_coor, clusterInfo.mapmark_x_coor)
			            });
			            
			            
			        });
			        // 클러스터러에 마커들을 추가합니다
			        clusterer.addMarkers(markers);
			        map.setBounds(bounds2);
				}
	    	})
	    }
	    
	</script>
	
	<div class="main_map main_list">
		<ul id="essay_list_ul">
			<!-- <li class="essay_list">
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
			</li> -->
			
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