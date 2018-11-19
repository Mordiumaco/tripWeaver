
		
$(function(){
	$("#search").autocomplete({
		source: function(request, response){
			$.ajax({
				url: "/utility/tagInfoJson",
				type: 'POST',
				dataType: "json",
				data: GLOBAL_CSRF_NAME+'='+GLOBAL_CSRF_VALUE+'&keyWord='+request.term,
				timeout: 1000,	
				async: false,		
				success:function(json){
					response($.map(json,function(item){
						return{
							label:item.data,
							value:item.data
						};
					}));
				},
				error:function(xhr){
					//alert("err"+xhr);
					if(xhr.status=="403"){
						location.href = location.href;
					}
				}
			});
		},
		minLength: 2,
		select: function( event, ui ) {
			$( "#search" ).val( ui.item.value );
			fncGlobalSearch();
		}
	});
	
	fncDomainReplace();
});

$(document).ready(function(){
	//뉴스레터 팝업
	var $check = $('#box-popupNewsletter .check-wrap');
	$check.find('> input').on('change',function(){
		if ($(this).prop("checked") ==  true)
		{
			$(this).siblings('label').addClass('on');
		}else{
			$(this).siblings('label').removeClass('on');
		}
	});
	$check.find('> input').each(function(){
		if ($(this).is(':checked'))
		{
			$(this).siblings('label').addClass('on');
		}
	});
	$check.focusin(function(){
		$(this).find('label').addClass('focus');
	});
	$check.focusout(function(){
		$(this).find('label').removeClass('focus');
	});

	// 팝업 닫기
	$('#box-popupNewsletter .btn-close').on('click',function(e){
		e.preventDefault();
		setCookie('fixLayerNewsletter', 'Y', 1);
		$('#box-popupNewsletter').removeClass('show');
	});
});

function setCookie(name, value, expiredays) {
	var today = new Date();
	    today.setDate(today.getDate() + expiredays);
 
	    document.cookie = name + '=' + escape(value) + '; path=/; expires=' + today.toGMTString() + ';'
}

function getCookie(name) { 
    var cName = name + "="; 
    var x = 0; 
    while ( x <= document.cookie.length ) 
    { 
        var y = (x+cName.length); 
        if ( document.cookie.substring( x, y ) == cName ) 
        { 
            if ( (endOfCookie=document.cookie.indexOf( ";", y )) == -1 ) 
                endOfCookie = document.cookie.length;
            return unescape( document.cookie.substring( y, endOfCookie ) ); 
        } 
        x = document.cookie.indexOf( " ", x ) + 1; 
        if ( x == 0 ) 
            break; 
    } 
    return ""; 
}

function fncDomainReplace(){
	var _Dns = location.href;
	if(_Dns.indexOf("www.lonelyplanet.co.kr") > -1){
		location.href = _Dns.replace("www.lonelyplanet.co.kr", "lonelyplanet.co.kr");
	} else if(_Dns.indexOf("m.lonelyplanet.co.kr") > -1){
		location.href = _Dns.replace("m.lonelyplanet.co.kr", "lonelyplanet.co.kr");
	}
}

function fncProtocolHttps(){
	// 도메인 정보 변경
	var _Protocol = location.protocol;
	var _Dns = location.href;

	if(_Protocol != "https:"){
		if(_Dns.indexOf(GLOBAL_DOMAIN_HTTP) > -1 && GLOBAL_DOMAIN_HTTP!=GLOBAL_DOMAIN_HTTPS){
			location.href = _Dns.replace(GLOBAL_DOMAIN_HTTP, GLOBAL_DOMAIN_HTTPS);
		}
	}
}

function fncGlobalNewsletter() {
	
	/* 
	location.href = '/member/newsletter/add';
	*/
	
	var frm = document.frmGlobalNewsletter;
	var userEmail = frm.elements["userEmail"].value;
	if(userEmail==""){
		alert("이메일 주소를 입력하세요.");
		frm.elements["userEmail"].focus();
		return false;
	}
	
	var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	if(!re.test(userEmail)){
		alert("이메일 형식을 확인하세요.");
		frm.elements["userEmail"].focus();
		return false;
	}
	
	frm.target = "_self";
	frm.action = "/member/newsletter/add";
	frm.submit();
}

function fncLayerNewsletter() {
	
	if(!$("#LNemailAgree").is(':checked')){
		alert("개인정보 수집 및 이용동의에 체크해주세요.");
		$("#LNemailAgree").focus();
		$("#txtLayerNewsletter").html("개인정보 수집 및 이용동의에 체크해주세요.");
		$("#txtLayerNewsletter").show();
		return false;
	}else{
		$("#txtLayerNewsletter").html("");
		$("#txtLayerNewsletter").hide();
	}

	var userEmail = $("#LNuserEmail").val();
	if(userEmail==""){
		alert("이메일 주소를 입력하세요.");
		$("#LNuserEmail").focus();
		$("#txtLayerNewsletter").html("이메일 주소를 입력하세요.");
		$("#txtLayerNewsletter").show();
		return false;
	}else{
		$("#txtLayerNewsletter").html("");
		$("#txtLayerNewsletter").hide();
	}
	
	var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	if(!re.test(userEmail)){
		alert("이메일 형식을 확인하세요.");
		$("#LNuserEmail").focus();
		$("#txtLayerNewsletter").html("이메일 형식을 확인하세요.");
		$("#txtLayerNewsletter").show();
		return false;
	}else{
		$("#txtLayerNewsletter").html("");
		$("#txtLayerNewsletter").hide();
	}
	
	$.ajax({
		url: '/member/newsletter/addJson',
		type: 'POST',
		dataType: 'json',	
		data: GLOBAL_CSRF_NAME+'='+GLOBAL_CSRF_VALUE+'&userEmail='+userEmail,		
		timeout: 1000,	
		async: false,		
		error: function(xhr){
			//alert('fncChangeCategory1 xhr (' + xhr.status + ':'+ xhr.statusText + ':' + xhr.responseText + ')');
			if(xhr.status=="403"){
				location.href = location.href;
			}
		},
		success:fncCreateLayerNewsletter
	});

}

function fncCreateLayerNewsletter(respnoseText){
	var returnCode = respnoseText.returnCode;
	var returnMsg = respnoseText.returnMsg;
	
	setCookie('fixLayerNewsletter', 'Y', 1);
	$("#txtLayerNewsletter").html(returnMsg);
	$("#txtLayerNewsletter").show();
}

// 팝업 열기
function boxPopupNewsletterOpen(){
	$('#box-popupNewsletter').addClass('show');
	$('#box-popupNewsletter').focus();
	setCookie('cntLayerNewsletter', 0, 1);
}

// 다음기사 전송
function fncDaumXmlForArticle(articleId){
	if(articleId!=""){
		$.ajax({
			url: '/magazine/articles/daumJson',
			type: 'POST',
			dataType: 'json',	
			data: GLOBAL_CSRF_NAME+'='+GLOBAL_CSRF_VALUE+'&articleId='+articleId,		
			timeout: 1000,	
			async: false,		
			error: function(xhr){
				//alert('fncChangeState xhr (' + xhr.status + ':'+ xhr.statusText + ':' + xhr.responseText + ')');				
			},
			success: function(respnoseText){
				//alert(respnoseText.resultMsg);
			}
		});
	}
}

function fncGlobalSearch(){
	var query = $("#search").val();
    if(query == ""){
		alert("검색어를 입력해주세요.");
		return;
	}
    $('#COMM_AREA_LOADING').show();
    $("#globalKeyword").val(encodeURIComponent(query));
	$("#frmGlobalSearch").attr("action", "/search");
	$("#frmGlobalSearch").attr("target", "_self");
	$("#frmGlobalSearch").submit();
}

function fncGlobalSearchKeyword(query){
    $("#globalKeyword").val(encodeURIComponent(query));
	$("#frmGlobalSearch").attr("action", "/search");
	$("#frmGlobalSearch").attr("target", "_self");
	$("#frmGlobalSearch").submit();
}

function fncGlobalShare(channel){
	var snsTitle = $("#snsTitle").val();
	var snsSummary = $("#snsSummary").val();
	var snsUrl = $("#snsUrl").val();
	var snsImage = $("#snsImage").val();
	if(channel == "googleplus"){
		fncShareGooglePlus(snsTitle, snsSummary, snsUrl);
	}else if(channel == "band"){
		fncShareBand(snsTitle, snsSummary, snsUrl);
	}else if(channel == "facebook"){
		fncShareFacebook(snsTitle, snsSummary, snsUrl);
	}else if(channel == "twitter"){
		fncShareTwitter(snsTitle, snsSummary, snsUrl);
	}else if(channel == "kakao"){
		fncShareKakao(snsTitle, snsSummary, snsUrl, snsImage);
	}else if(channel == "kakaotalk"){
		fncShareKakaoTalk(snsTitle, snsSummary, snsUrl, snsImage);
	}else if(channel == "kakaostory"){
		fncShareKakaoStory(snsTitle, snsSummary, snsUrl, snsImage);
	}
}

//공유하기 - 카카오스토리, 카카오톡
function fncShareKakao(sharer_title, sharer_content, sharer_URL, share_image) {
	var UserAgent = navigator.userAgent; 
	if (UserAgent.match(/iPhone|iPod|iPad|Android|Windows CE|BlackBerry|Symbian|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson/i) != null || UserAgent.match(/LG|SAMSUNG|Samsung/) != null)
	{
	    Kakao.Link.sendTalkLink({
	  	  label: sharer_title,
		  image: {
		    src: share_image,
		    width: '380',
		    height: '130'
		  },
		  webLink: {
			    text: '론리플래닛코리아 바로가기',
			    url: sharer_URL // 앱 설정의 웹 플랫폼에 등록한 도메인의 URL이어야 합니다.
			  }
	    });
	}
    else
    {
	    Kakao.Story.share({
	      url: sharer_URL,
	      text: ''	//sharer_title
	    });
    }
}

//공유하기 - 카카오톡
function fncShareKakaoTalk(sharer_title, sharer_content, sharer_URL, share_image) {
    Kakao.Link.sendTalkLink({
  	  label: sharer_title,
	  image: {
	    src: share_image,
	    width: '380',
	    height: '130'
	  },
	  webLink: {
		    text: '론리플래닛코리아 바로가기',
		    url: sharer_URL // 앱 설정의 웹 플랫폼에 등록한 도메인의 URL이어야 합니다.
		  }
    });
}

//공유하기 - 카카오스토리
function fncShareKakaoStory(sharer_title, sharer_content, sharer_URL, share_image) {
    Kakao.Story.share({
      url: sharer_URL,
      text: ''	//sharer_title
    });
}

//공유하기 - 페이스북
function fncShareFacebook(sharer_title, sharer_content, sharer_URL){
    var sharer_str = encodeURIComponent(sharer_title.replace(/#/gi,"") + sharer_content);
    var sharer_url = encodeURIComponent(sharer_URL);
    
    var href = "http://www.facebook.com/sharer.php?u="+ sharer_url +"&t="+ sharer_str;
    var a = window.open(href, "facebook", "width=800, height=500");
    if( a ) {
    	a.focus();
    }
}

//공유하기 - 트위터
function fncShareTwitter(sharer_title, sharer_content, sharer_URL){
    var sharer_str = encodeURI(sharer_title.replace(/#/gi,"") + sharer_content);
    var sharer_link = encodeURIComponent(sharer_URL);
    var sharer_hash = encodeURIComponent("론리플래닛");
    var href = "https://twitter.com/intent/tweet?text=" + sharer_str + "&url=" + sharer_link + "&hashtags=" + sharer_hash;
    
    var a = window.open(href, "twitter", "width=800, height=500");
    if( a ) {
    	a.focus();
    }
}

//공유하기 - 핀터레스트
function fncSharePinterest(sharer_title, sharer_content, sharer_URL, share_IMG){
    var sharer_str = encodeURIComponent(sharer_title.replace(/#/gi,"") + sharer_content);
    var sharer_url = encodeURIComponent(sharer_URL);
    var sharer_img = encodeURIComponent(sharer_IMG);
    
    var href = "http://www.pinterest.com/pin/create/button/?url=" + sharer_url + "&media=" + sharer_img + "&description=" + sharer_str;
    var a = window.open(href, "pinterest", "width=800, height=500");
    if( a ) {
    	a.focus();
    }
}

//공유하기 - 밴드
function fncShareBand(sharer_title, sharer_content, sharer_URL){
    var sharer_str = encodeURIComponent(sharer_title.replace(/#/gi,"") + sharer_content);
    var sharer_url = encodeURIComponent(sharer_URL);
    
    var href = "http://www.band.us/plugin/share?body="+ sharer_str +"&route="+ sharer_url;
    var a = window.open(href, "band", "width=410, height=540, resizable=no");
    if( a ) {
    	a.focus();
    }
}

//공유하기 - 라인
function fncShareLine(sharer_title, sharer_content, sharer_URL){
    var sharer_str = encodeURI(sharer_title.replace(/#/gi,"") + sharer_content)+ " : " + encodeURIComponent(sharer_URL);
    
    var href = "http://line.me/R/msg/text/?"+ sharer_str;
    var a = window.open(href, "line", "width=800, height=500");
    if( a ) {
    	a.focus();
    }
}

//공유하기 - 구글+
function fncShareGooglePlus(sharer_title, sharer_content, sharer_URL){
    var sharer_str = encodeURIComponent(sharer_title.replace(/#/gi,"") + sharer_content);
    var sharer_url = encodeURIComponent(sharer_URL);
    
    var href = "https://plus.google.com/share?url="+ sharer_url +"&t="+ sharer_url;
    var a = window.open(href, "google+", "width=410, height=540, resizable=no");
    if( a ) {
    	a.focus();
    }
}

function fncShareUrl(sharer_URL){
	sharer_URL = fncBitly(sharer_URL);
	bResult = window.clipboardData.setData("Text",sharer_URL);
	if (bResult) alert('복사되었습니다. 블로그에서 붙여넣기(Ctrl+V)를 이용하세요.'); 
}

/*
 * textbox에 엔터 쳤을때 callback 함수 호출
 */
function fncEnterCallback(callback)
{
	if( navigator.userAgent.indexOf('Firefox') >= 0 ) {
		var eventNames = ["mousedown", "mouseover", "mouseout", 
		                            "mousemove", "mousedrag", "click", "dblclick",
		                            "keydown", "keypress", "keyup" ]; 
			
		for( var i = 0 ; i < eventNames.length; i++ ) {
			window.addEventListener( eventNames[i], function(e) {
				window.event = e;
			}, true );
		}
	}
	if( window.event.keyCode == 13 )
    {
   		callback();
        return false;
    }
}

/*
 * 구글맵 지도 레이어 처리
 */
var GLOBAL_MAP_SPOT_ID;
var GLOBAL_MAP_SPOT_NUM;
var GLOBAL_MAP_SPOT_LAT;
var GLOBAL_MAP_SPOT_LNG;
function fncMapSearch(){
	GLOBAL_MAP_SPOT_ID = "";
	GLOBAL_MAP_SPOT_NUM = "";
	GLOBAL_MAP_SPOT_LAT = "";
	GLOBAL_MAP_SPOT_LNG = "";
	
	var keyMapWord = $("#keyMapWord").val();
	if(keyMapWord==""){
		alert("검색어를 입력하세요.");
		return;
	}else{
		fncMapLayerCall("", "", "", keyMapWord);
	}			
}

function fncMapLayerCall(cityCd, neighborhoodCd, spotId, keyMapWord){
	if(spotId!=""){
		GLOBAL_MAP_SPOT_ID = spotId;
	}
	$.ajax({
		url: '/guide/cities/spotJson',
		type: 'POST',
		dataType: 'json',	
		data: GLOBAL_CSRF_NAME+'='+GLOBAL_CSRF_VALUE+'&cityCd='+cityCd+'&neighborhoodCd='+neighborhoodCd+'&spotId='+spotId+'&page=1&pageSize=50&keyGeo=Y&keyWord='+keyMapWord,		
		timeout: 1000,	
		async: false,		
		error: function(xhr){
			//alert('fncMapLayerCall xhr (' + xhr.status + ':'+ xhr.statusText + ':' + xhr.responseText + ')');
			//console.log('fncMapLayerCall xhr (' + xhr.status + ':'+ xhr.statusText + ':' + xhr.responseText + ')');
			fncMapLayerCreate("");
		},
		success:fncMapLayerCreate
	});
}

function fncMapLayerCreate(respnoseText){
	spotInfoLength = 0;
	if(respnoseText!=""){
		spotInfoLength = respnoseText.spotInfoList.length;
	}

	var locations = [];
	var strTemp = "";
	var mapLayerTab0 = "";
	var mapLayerTab1 = "";
	var mapLayerTab2 = "";
	var mapLayerTab3 = "";
	var noData = '<li><div class="no-data">다른 곳으로<br>여행을 떠나시는건<br>어떨까요?</div></li>';
	var j = 0;
	
	for(var i = 0; i < spotInfoLength; i++ ){
		strTemp = "";
		if(GLOBAL_MAP_SPOT_ID == respnoseText.spotInfoList[i].spotId){
			GLOBAL_MAP_SPOT_NUM = i;
			GLOBAL_MAP_SPOT_LAT = respnoseText.spotInfoList[i].geoLatitude;
			GLOBAL_MAP_SPOT_LNG = respnoseText.spotInfoList[i].geoLongitude;

			strTemp += '<li class="li-sel">';
		}else{
			strTemp += '<li>';
		}

		if(respnoseText.spotInfoList[i].geoLatitude!="" && respnoseText.spotInfoList[i].geoLongitude!=""){
			strTemp += '<a href="#none" onclick="fncMapClick('+ "'"+ j + "'" +', '+ "'"+ respnoseText.spotInfoList[i].geoLatitude + "'" +', '+ "'"+ respnoseText.spotInfoList[i].geoLongitude + "'" +');">';
			j++;
		}else{
			strTemp += '<a href="/guide/cities/'+respnoseText.spotInfoList[i].cityUrltitle+'/spots/'+respnoseText.spotInfoList[i].spotUrltitle+'">';
		}
		
		strTemp += '<span class="box-text">';
		strTemp += '<span class="text-1">'+respnoseText.spotInfoList[i].spotTitle+'</span>';
		strTemp += '<span class="text-2">'+respnoseText.spotInfoList[i].spotEngtitle+'</span>';
		strTemp += '</span>';
		if(respnoseText.spotInfoList[i].fileName!=""){
			strTemp += '<span class="img" style="background:url('+ "'"+GLOBAL_UPLOAD_URL+''+respnoseText.spotInfoList[i].fileName + "'" +') no-repeat center center;background-size:cover;"></span>';
		}
		strTemp += '</a>';
		strTemp += '</li>';
		
		mapLayerTab0	+= strTemp;
		if(respnoseText.spotInfoList[i].categoryCd == "01"){
			mapLayerTab1	+= strTemp;
		}else if(respnoseText.spotInfoList[i].categoryCd == "02"){
			mapLayerTab2	+= strTemp;
		}else if(respnoseText.spotInfoList[i].categoryCd == "03"){
			mapLayerTab3	+= strTemp;
		}
		
		if(respnoseText.spotInfoList[i].geoLatitude!="" && respnoseText.spotInfoList[i].geoLongitude!=""){
			locations[i] = [];
			locations[i][0] = respnoseText.spotInfoList[i].geoLatitude;
			locations[i][1] = respnoseText.spotInfoList[i].geoLongitude;
			locations[i][2] = respnoseText.spotInfoList[i].spotTitle;
			locations[i][3] = respnoseText.spotInfoList[i].spotEngtitle;
			locations[i][4] = '/guide/cities/'+respnoseText.spotInfoList[i].cityUrltitle+'/spots/' + respnoseText.spotInfoList[i].spotUrltitle;
		}
	}
	
	if(mapLayerTab0 == ""){
		mapLayerTab0	= noData;
	}
	if(mapLayerTab1 == ""){
		mapLayerTab1	= noData;
	}
	if(mapLayerTab2 == ""){
		mapLayerTab2	= noData;
	}
	if(mapLayerTab3 == ""){
		mapLayerTab3	= noData;
	}
	$('#mapLayerTab0').html(mapLayerTab0);
	$('#mapLayerTab1').html(mapLayerTab1);
	$('#mapLayerTab2').html(mapLayerTab2);
	$('#mapLayerTab3').html(mapLayerTab3);
	
    fncMapLayerLoad(locations);
}

var markers = [];
var map;
function fncMapLayerLoad(locations) {
	var geoLatitude = $("#geoLatitude").val();
	var geoLongitude = $("#geoLongitude").val();
	var myLatlng = new google.maps.LatLng(geoLatitude, geoLongitude);
	var myOptions = {
			zoom: 10,
			center: myLatlng,
			mapTypeId: google.maps.MapTypeId.ROADMAP
	}
	map = new google.maps.Map(document.getElementById("map_canvas_layer"), myOptions);
	
    var marker, i, contentString;
    var infowindow = new google.maps.InfoWindow();
    var image = '/static/images/bl/bl_mapCk.png';
	
    //마커 삭제
    deleteMarkers();
    
    //마커 생성
    for (i = 0; i < locations.length; i++) {  
    	marker = new google.maps.Marker({
    		position: new google.maps.LatLng(locations[i][0], locations[i][1]),
    		map: map,
    	    icon: image,
			title: locations[i][2]
    	});
    	google.maps.event.addListener(marker, 'click', (function(marker, i) {
    		return function() {
				contentString =	'<div class="box-mapCk">'+
							    '<a href="' + locations[i][4] + '">'+
							    '<p class="mTt-1">' + locations[i][2] + '</p>'+
							    '<p class="mTt-2">' + locations[i][3] + '</p>'+
							    '</a>'+
							    '</div>';
    			infowindow.setContent(contentString);
    			infowindow.open(map, marker);
    		}
    	})(marker, i));
    	markers.push(marker);
    }
    if(GLOBAL_MAP_SPOT_ID!="" && GLOBAL_MAP_SPOT_NUM>-1 && GLOBAL_MAP_SPOT_LAT!=0 && GLOBAL_MAP_SPOT_LNG!=0){
    	fncMapClick(GLOBAL_MAP_SPOT_NUM, GLOBAL_MAP_SPOT_LAT, GLOBAL_MAP_SPOT_LNG);
    }
}
// Sets the map on all markers in the array.
function setMapOnAll(map) {
	for (var i = 0; i < markers.length; i++) {
		markers[i].setMap(map);
	}
}

// Removes the markers from the map, but keeps them in the array.
function clearMarkers() {
	setMapOnAll(null);
}

// Shows any markers currently in the array.
function showMarkers() {
	setMapOnAll(map);
}

// Deletes all markers in the array by removing references to them.
function deleteMarkers() {
	clearMarkers();
	markers = [];
}		

function fncMapClick(id, lat, lng){
    google.maps.event.trigger(markers[id], 'click');
    
    var chicago = {lat: Number(lat), lng: Number(lng)};
    map.setCenter(chicago);

    $('#box-mapLayer').find('.tab-map .ul > li > a').on('click focus', function(e){
        e.preventDefault();

        $('#box-mapLayer').find('.tab-map li').removeClass('li-sel');
        $(this).parent('li').addClass('li-sel');
    });
};
