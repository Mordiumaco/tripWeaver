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


// 메인 최시글 리스트에서 필요없는 태그요소 지우기
/* text = "${recentEssayVo.essay_cnt}"
text = text.replace(/<br\/>/ig, "\n"); 
text = text.replace(/<(\/)?([a-zA-Z]*)(\s[a-zA-Z]*=[^>]*)?(\s)*(\/)?>/ig, "");
text = text.replace("&nbsp;",""); */
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
				<c:if test="${loginInfo != null}">
					<a href="/essay/write">Essay 글쓰기</a>
				</c:if>
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
						console.log(data);
				        var markers = $(data.clusterList).map(function(i, clusterInfo) {
				        	
				            var marker = new daum.maps.Marker({
				            	image: markerImage, // 마커이미지 설정 
				                position : new daum.maps.LatLng(clusterInfo.mapmark_y_coor, clusterInfo.mapmark_x_coor)
				            });
				            
				            daum.maps.event.addListener(marker, 'click', function() {
				            	location.href='/essay/essayView?essay_id='+clusterInfo.essay_id;
						    });
				            
				            return marker;
				            
				        });
				        
				        
				        // 클러스터러에 마커들을 추가합니다
				        clusterer.addMarkers(markers);
					}
				}); 
		    }
		    
		    initMain();
		    
		    
	    });
	    
	    
	    var clusterPositions = [];
	    
	    
	    // 마커 클러스터러에 클릭이벤트를 등록합니다
	    // 마커 클러스터러를 생성할 때 disableClickZoom을 true로 설정하지 않은 경우
	    // 이벤트 헨들러로 cluster 객체가 넘어오지 않을 수도 있습니다
	    daum.maps.event.addListener(clusterer, 'clusterclick', function(cluster) {

	        // 현재 지도 레벨에서 1레벨 확대한 레벨
	        var level = map.getLevel()-1;
	       	//console.log( cluster.getMarkers());
	        //console.log( cluster.getClusterMarker() );
	        // 지도를 클릭된 클러스터의 마커의 위치를 기준으로 확대합니다
	        map.setLevel(level, {anchor: cluster.getCenter()});
	        //console.log( cluster );
	     
	    });
	    
	    
	    
	    //클러스터링이 완료됐을 때 발생한다.
	    //이벤트 핸들러 함수 인자로는 생성된 Cluster 객체 전체가 배열로 넘어온다.

	    daum.maps.event.addListener( clusterer, 'clustered', function( clusters ) {
	        //console.log( clusters.length );
	        console.log(clusters);
	        clusterPositions = [];
	        
	        for(let i = 0 ; i < clusters.length; i++){
	        	for(let j = 0 ; j < clusters[i].getMarkers().length; j++){
	        		clusterPositions.push(clusters[i].getMarkers()[j].getPosition());
	        	}
	        }
	        
	        var totalObj = new Object();
	        totalObj.positions = clusterPositions;
	        var jsonInfo = JSON.stringify(totalObj);
	        //console.log(jsonInfo);
	        $("#essay_list_ul").html("");
	        reload();
	        
	        
	        
	         function reload(){
	        	$("#essay_list_ul").html("");
	        	$.ajax({
					type: "GET",
					url:"/main/reload",
					data : "markers="+encodeURI(jsonInfo),
					success : function(data){
						$("#essay_list_ul").html("");
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
			    			let theme = ""; //테마
			    			let season = ""; //계절
			    			let peo_type = ""; //인원타입
			    			switch(clusterInfo.tripplan_theme){
				    			case "1" : theme = "먹거리";	break;
				    			case "2" : theme = "레저";	break;
				    			case "3" : theme = "쇼핑";	break;
				    			case "4" : theme = "자연";	break;
				    			case "5" : theme = "문화";	break;
				    			case "6" : theme = "축제";	break;
			    			}
			    			switch(clusterInfo.tripplan_season){
				    			case "1" : season = "봄";	break;
				    			case "2" : season = "여름";	break;
				    			case "3" : season = "가을";	break;
				    			case "4" : season = "겨울";	break;
				    			case "5" : season = "무관";	break;
		    				}
			    			switch(clusterInfo.tripplan_peo_type){
			    			
				    			case "1" : peo_type = "혼자";	break;
				    			case "2" : peo_type = "커플";	break;
				    			case "3" : peo_type = "친구";	break;
				    			case "4" : peo_type = "가족";	break;
				    			case "5" : peo_type = "단체";	break;
				    			case "6" : peo_type = "여자끼리";	break;
				    			case "7" : peo_type = "남자끼리";	break;
	    					}
			    		
				            essayContent += '<li class="essay_list">';
				            essayContent +=	'<a href="/essay/essayView?essay_id='+clusterInfo.essay_id+'">';
				            essayContent += '<div class="essay_img">';
				            
				            
				            if(clusterInfo.essay_filter == 'G'){
				            	essayContent += '<b>가이드</b>';
				            	essayContent += '<span></span>';
				            }
				            
				            essayContent += '<img src="/upload/'+clusterInfo.tripplan_image+'" onerror="imgError(this)";/>';
				            essayContent += '</div>';
				            essayContent += '<ul class="essay_info">';
				            essayContent += '<li>'+(parseInt((clusterInfo.essay_meal_exp+clusterInfo.essay_room_exp+clusterInfo.essay_traffic_exp+clusterInfo.essay_other_exp)/10000))+'<span> 만원</span> <h6>'+clusterInfo.mem_nick+'</h6></li>';
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
	    	$("#essay_list_ul").html("");
	    	let theme = document.getElementsByName("theme")[0];
	    	let season = document.getElementsByName("season")[0];
	    	let peoType = document.getElementsByName("peoType")[0];
	    	let price = document.getElementsByName("price")[0];
	    	
	    	
	    	let themeValue = encodeURI(theme.options[theme.selectedIndex].value);
	    	let seasonValue = encodeURI(season.options[season.selectedIndex].value);
	    	let peoTypeValue = encodeURI(peoType.options[peoType.selectedIndex].value);
	    	let priceValue = encodeURI(price.options[price.selectedIndex].value);
	    	let searchValue = encodeURI($("#searchText").val().replace(/\s\s+/g, ' '));
	    	
	    	//console.log(themeValue);
	    	//console.log(seasonValue);
	    	//console.log(peoTypeValue);
	    	//console.log(priceValue);
	    	//console.log(searchValue);
	    	
	    	clusterer.clear();
	    	
	    	$.ajax({
				type: "GET",
				url:"/main/searchAjax",
				data : "seasonValue="+seasonValue+"&themeValue="+themeValue+"&peoTypeValue="+peoTypeValue+"&priceValue="+priceValue+"&searchValue="+searchValue,
				success : function(data){
					$("#essay_list_ul").html("");
				   console.log(data);
				   if(data.clusterList.length == 0){
					   console.log("여기로 들어와따");
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
					   
					   var marker = new daum.maps.Marker({
			            	image: markerImage, // 마커이미지 설정 
			                position : new daum.maps.LatLng(clusterInfo.mapmark_y_coor, clusterInfo.mapmark_x_coor)
			            });
					   
					   
					    daum.maps.event.addListener(marker, 'click', function() {
			            	location.href='/essay/essayView?essay_id='+clusterInfo.essay_id;
					    });
					   
			            return marker;
			            
			            
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
			
			
		</ul>
		
	</div>
	

</div>


<div class="main_con_02">
	<div class="flexslider">
	  	<ul class="slides">
		    	<c:forEach items="${recentPostCardList}" var="recentPostCardVo" varStatus="loop">
		    		<c:if test="${loop.index % 2 == 0}">
		    			<li>
		    		</c:if>
		    		<a>
				      	<div class="sl_left">
		      				<img src="/file/read?file=/postcard/${recentPostCardVo.attachmentList[0].att_file_name}" onerror="imgError(this)">
				      	</div>
				      	<div class="sl_right">
				      		<ul>
				      			<li>Post Card<%-- <c:forEach items="${recentPostCardVo.hashTagList}" var="hashTagVo">${hashTagVo.tag_word} </c:forEach> --%></li>
				      			<c:choose>
				      				<c:when test="${fn:length(recentPostCardVo.hashTagList) == 0}">
				      					<li>[ 태그 없음 ]</li>
				      				</c:when>
				      				<c:otherwise>
				      					<li class="hashTagSection">
				      						<c:forEach items="${recentPostCardVo.hashTagList}" var="hashTagVo">
				      							#<a href="/postCard/postCardList?mem_id=${loginInfo.mem_id}&tag_search=${hashTagVo}" style="color:#0064ff !important;">
				      								${hashTagVo}
				      							</a>
				      						</c:forEach>
				      					</li>
				      				</c:otherwise>
				      			</c:choose>
				      			<li>${recentPostCardVo.pc_cnt}</li>
				      		</ul>
				      	</div>
			      	</a>
			      	<c:if test="${loop.index % 2 == 1}">
		    			</li>
		    		</c:if>
		    	</c:forEach>
		
		</ul>
	</div>
</div>

<div class="main_con_03">
	
	
	<c:forEach items="${recentEssayList}" var="recentEssayVo">
	<div class="con_03_List">
		<a href="/essay/essayView?essay_id=${recentEssayVo.essay_id}">
			<ul>
				<li>Essay</li>
				<li>${recentEssayVo.essay_title}</li>
			
				<c:choose>
					<c:when test="${fn:length(recentEssayVo.essay_cnt) > 50 }">
						<li class="essay_cnt">
							<c:set var="essay_cnt1" value="${fn:substring(recentEssayVo.essay_cnt.replaceAll('\\\<.*?\\\>',''),0,150)}"></c:set>
							<c:out  value="${essay_cnt1.replaceAll('&nbsp;',' ')}"/>
						</li>
					</c:when>
					<c:when test="${recentEssayVo.essay_cnt == null}">
						<li>&nbsp;&nbsp;</li>
					</c:when>
					<c:when test="${fn:length(recentEssayVo.essay_cnt) == 0}">
						<li>&nbsp;&nbsp;</li>
					</c:when>
					<c:otherwise>
						<li>${recentEssayVo.essay_cnt}&nbsp;</li>
					</c:otherwise>
				</c:choose>
				<li><i class="fa fa-clock-o" aria-hidden="true"></i> <fmt:formatDate value="${recentEssayVo.essay_date}" pattern="YYYY. MM. dd"/></li>
				<li class="essayImageSection"><img src="/file/read?file=/${recentEssayVo.tripplan_image}" onerror="imgError(this)"/></li>
			</ul>
		</a>
	</div>
	</c:forEach> 
	
</div>

<div class="main_con_04">
	<div class="con_04_wrap">
		<div class="flexslider">
		  <ul class="slides">
		    <li>
			    <h2 class="RankingTitle"> 이번 달 짠내 랭킹 </h2>
			    <a href="/moneyBest" class="RankingA">
			    	<ul class="listRanking">
			    		<li><span>${moneyBestList[0].rnum}</span></li>
			    		<li>
			    			<c:choose>
								<c:when test="${moneyBestList[0].mem_profile eq ''}">
									<b class="my_profile my_profile12">
										<img src="/img/no_profile.png">
									</b> 
								</c:when>
								<c:otherwise>
									<b class="my_profile my_profile12">
										<img src="/file/read?file=${moneyBestList[0].mem_profile}" onerror="src='/img/no_profile.png';"> 
									</b>
								</c:otherwise>
							</c:choose>
						</li>
			    		<li>
			    			닉네임 : <b>${moneyBestList[0].mem_nick}</b> &nbsp; &nbsp;<span>투어 평균 금액 : <b><fmt:formatNumber value="${moneyBestList[0].totalmoney}"></fmt:formatNumber></b></span> <h6>좋아요 : <b> ${moneyBestList[0].essay_like_count}</b></h6>
			    		</li>
			    	</ul>
		    	</a>
		    	<a href="/moneyBest" class="RankingA">
			    	<ul class="listRanking">
			    		<li><span>${moneyBestList[1].rnum}</span></li>
			    		<li>
			    			<c:choose>
								<c:when test="${moneyBestList[1].mem_profile eq ''}">
									<b class="my_profile my_profile12">
										<img src="/img/no_profile.png">
									</b> 
								</c:when>
								<c:otherwise>
									<b class="my_profile my_profile12">
										<img src="/file/read?file=${moneyBestList[1].mem_profile}" onerror="src='/img/no_profile.png';"> 
									</b>
								</c:otherwise>
							</c:choose>
			    		</li>
			    		<li>
			    			닉네임 : <b>${moneyBestList[1].mem_nick}</b> &nbsp; &nbsp;<span>투어 평균 금액 : <b><fmt:formatNumber value="${moneyBestList[1].totalmoney}"></fmt:formatNumber></b></span> <h6>좋아요 : <b> ${moneyBestList[1].essay_like_count}</b></h6>
			    		</li>
			    	</ul>
		    	</a>
		    	<a href="/moneyBest" class="RankingA">
			    	<ul class="listRanking">
			    		<li><span>${moneyBestList[2].rnum}</span></li>
			    		<li>
			    			<c:choose>
								<c:when test="${moneyBestList[2].mem_profile eq ''}">
									<b class="my_profile my_profile12">
										<img src="/img/no_profile.png">
									</b> 
								</c:when>
								<c:otherwise>
									<b class="my_profile my_profile12">
										<img src="/file/read?file=${moneyBestList[2].mem_profile}" onerror="src='/img/no_profile.png';"> 
									</b>
								</c:otherwise>
							</c:choose>
			    		</li>
			    		<li>
			    			닉네임 : <b>${moneyBestList[2].mem_nick}</b> &nbsp; &nbsp;<span>투어 평균 금액 : <b><fmt:formatNumber value="${moneyBestList[2].totalmoney}"></fmt:formatNumber></b></span> <h6>좋아요 : <b> ${moneyBestList[2].essay_like_count}</b></h6>
			    		</li>
			    	</ul>
		    	</a>
		    </li>
		    
		     <li>
			    <h2 class="RankingTitle"> 이번 달 에세이 랭킹 </h2>
			    <a href="/essayBest" class="RankingA">
			    	<ul class="listRanking">
			    		<li><span>${essayBestList[0].rnum}</span></li>
			    		<li>
			    			<c:choose>
								<c:when test="${essayBestList[0].mem_profile eq ''}">
									<b class="my_profile my_profile12">
										<img src="/img/no_profile.png">
									</b> 
								</c:when>
								<c:otherwise>
									<b class="my_profile my_profile12">
										<img src="/file/read?file=${essayBestList[0].mem_profile}" onerror="src='/img/no_profile.png';"> 
									</b>
								</c:otherwise>
							</c:choose>
			    		</li>
			    		<li>
			    			닉네임 : <b>${essayBestList[0].mem_nick}</b> &nbsp; &nbsp;<span> 조회수 : ${essayBestList[0].essay_view_count}</span> <h6>좋아요 : <b> ${essayBestList[0].essay_like_count}</b></h6>
			    		</li>
			    	</ul>
		    	</a>
		    	<a href="/essayBest" class="RankingA">
			    	<ul class="listRanking">
			    		<li><span>${essayBestList[1].rnum}</span></li>
			    		<li>
			    			<c:choose>
								<c:when test="${essayBestList[1].mem_profile eq ''}">
									<b class="my_profile my_profile12">
										<img src="/img/no_profile.png">
									</b> 
								</c:when>
								<c:otherwise>
									<b class="my_profile my_profile12">
										<img src="/file/read?file=${essayBestList[1].mem_profile}" onerror="src='/img/no_profile.png';"> 
									</b>
								</c:otherwise>
							</c:choose>
			    		</li>
			    		<li>
			    			닉네임 : <b>${essayBestList[1].mem_nick}</b> &nbsp; &nbsp;<span> 조회수 : ${essayBestList[1].essay_view_count}</span> <h6>좋아요 : <b> ${essayBestList[1].essay_like_count}</b></h6>
			    		</li>
			    	</ul>
		    	</a>
		    	<a href="/essayBest" class="RankingA">
			    	<ul class="listRanking">
			    		<li><span>${essayBestList[2].rnum}</span></li>
			    		<li>
			    			<c:choose>
								<c:when test="${essayBestList[2].mem_profile eq ''}">
									<b class="my_profile my_profile12">
										<img src="/img/no_profile.png">
									</b> 
								</c:when>
								<c:otherwise>
									<b class="my_profile my_profile12">
										<img src="/file/read?file=${essayBestList[2].mem_profile}" onerror="src='/img/no_profile.png';"> 
									</b>
								</c:otherwise>
							</c:choose>
			    		</li>
			    		<li>
			    			닉네임 : <b>${essayBestList[2].mem_nick}</b> &nbsp; &nbsp;<span> 조회수 : ${essayBestList[2].essay_view_count}</span> <h6>좋아요 : <b> ${essayBestList[2].essay_like_count}</b></h6>
			    		</li>
			    	</ul>
		    	</a>
		    </li>
		    
		     <li>
			    <h2 class="RankingTitle"> 이번 달 포스트 카드 랭킹 </h2>
			    <a href="/postBest" class="RankingA">
			    	<ul class="listRanking">
			    		<li><span>1</span></li>
			    		<li>
			    			<b class="my_profile my_profile12">
			    				<img src="/file/read?file=${postcardVo[0].mem_profile}">
			    			</b>
			    		</li>
			    		<li>
			    			닉네임 : <b>${postcardVo[0].mem_nick}</b> 
			    			<div class="main_ranring_tag">
			    			태그 : 
								<c:forEach items="${postcardVo[0].hashTagList}" var="hash">
									<b>&nbsp;#${hash}&nbsp;</b>
								</c:forEach>
							</div>
			    			 &nbsp;<span> 수 : ${postcardVo[0].comt_count}</span> <h6>좋아요 : <b> ${postcardVo[0].pc_like_count}</b></h6>
			    		</li>
			    	</ul>
		    	</a>
		    	<a href="/postBest" class="RankingA">
			    	<ul class="listRanking">
			    		<li><span>2</span></li>
			    		<li>
			    			<b class="my_profile my_profile12">
			    				<img src="/file/read?file=${postcardVo[1].mem_profile}">
			    			</b>
			    		</li>
			    		<li>
			    			닉네임 : <b>${postcardVo[1].mem_nick}</b>
			    			<div class="main_ranring_tag">
			    			태그 : 
								<c:forEach items="${postcardVo[1].hashTagList}" var="hash">
									<b>&nbsp;#${hash}&nbsp;</b>
								</c:forEach>
							</div> 
			    			 &nbsp;<span> 수 : ${postcardVo[1].comt_count}</span> <h6>좋아요 : <b> ${postcardVo[1].pc_like_count}</b></h6>
			    		</li>
			    	</ul>
		    	</a>
		    	<a href="/postBest" class="RankingA">
			    	<ul class="listRanking">
			    		<li><span>3</span></li>
			    		<li>
			    			<b class="my_profile my_profile12">
			    				<img src="/file/read?file=${postcardVo[2].mem_profile}">
			    			</b>
			    		</li>
			    		<li>
			    			닉네임 : <b>${postcardVo[2].mem_nick}</b>
			    			<div class="main_ranring_tag"> 
			    			태그 : 
								<c:forEach items="${postcardVo[2].hashTagList}" var="hash">
									<b>&nbsp;#${hash}&nbsp;</b>
								</c:forEach>
							</div>
			    			 &nbsp;<span> 수 : ${postcardVo[2].comt_count}</span> <h6>좋아요 : <b> ${postcardVo[2].pc_like_count}</b></h6>
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