<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../head.jsp" %>

<script type="text/javascript">

//캘린더
$( function() {
    $('#datepicker1').datepicker({
      showOn: "button",
      buttonImage: "/img/calendar.gif",
      buttonImageOnly: true,
      buttonText: "Select date",
      changeYear : true,
      changeMonth : true,
      yearRange : "1930:2020",
      dateFormat: "yymmdd"
    });
} );

$( function() {
    $('#datepicker2').datepicker({
      showOn: "button",
      buttonImage: "/img/calendar.gif",
      buttonImageOnly: true,
      buttonText: "Select date",
      changeYear : true,
      changeMonth : true,
      yearRange : "1930:2020",
      dateFormat: "yymmdd"
    });
} );



// key
var key = "Mslgp6qkRb0NprdclOGja92DX%2BGabfSzvMkTSnHGEnr4%2FmIN3T81Cj%2BeING4U0MHaqyUibfiHnzCKSuf4WdXTg%3D%3D";

var pageNum = "";
var areacode = "";
var sigungucode = "";

var eventStartDate = "";
var eventEndDate = "";
var cat1 = "";
var cat2 = "";
var cat3 = "";

var startNum = 0;
var endNum = 10;

var pagingCount = null;
var PagingUrl = "";

// 검색 버튼 이벤트 실행
$(document).ready(function searchsearch(){
	
	$('.searchUtill p strong').text("");
	$('#search').on('click', function () {
		// 시군구 파라미터 검색 변수 
		areacode = $("select[name=areacode]").val();
		sigungucode = $("select[name=sigungucode]").val();
		
		
		// 시작날 끝나는날 검색조건
		eventStartDate = $("input[name=eventStartDate]").val() ;
		eventEndDate = $("input[name=eventEndDate]").val();
		
		//카테고리 분류
		cat1 = $("select[name=cat1]").val();
		cat2 = $("select[name=cat2]").val();
		cat3 = $("select[name=cat3]").val();
	
		var searchUrl ="http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchFestival?ServiceKey="+key+"&eventStartDate="+eventStartDate+"&eventEndDate="+eventEndDate+"&areaCode="+areacode+"&sigunguCode="+sigungucode+"&cat1="+cat1+"&cat2="+cat2+"&cat3="+cat3+"&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=12&pageNo=1" ;
		
		console.log(searchUrl);
		
		ajaxSearch(searchUrl);
		
	
	})
	//트리거 첫 페이지 접속시 검색조건 실행 시키기
	$('#search').trigger('click');
});


// 페이징 버튼 클릭시 url 이동
$(document).ready(function(){
	$('.pg_wrap').on('click','.pg_page', function name() {
		
		if(Number($(this).text()) > pagingCount){
			pageNum = pagingCount;
		}else{
			pageNum = $(this).text();
		}
		
		PagingUrl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchFestival?ServiceKey="+key+"&eventStartDate="+eventStartDate+"&eventEndDate="+eventEndDate+"&areaCode="+areacode+"&sigunguCode="+sigungucode+"&cat1="+cat1+"&cat2="+cat2+"&cat3="+cat3+"&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=12&pageNo="+pageNum;

		ajaxSearch(PagingUrl);
	});
	$('.pg_wrap').on('click','.pg_next', function() {
		startNum = startNum + 10;
		
		if(endNum + 10 > pagingCount){
			endNum = pagingCount; 
			
		}else{ 
			endNum = endNum + 10;
		}; 
		
		ajaxSearch(PagingUrl);
	});
	
	$('.pg_wrap').on('click','.pg_prev', function() {
		startNum = startNum - 10;
		
		if(endNum -10 < 10){
			endNum = 10;
		}else{
			endNum = endNum - 10;
		}
		
		ajaxSearch(PagingUrl);
	});
	
	$('.pg_wrap').on('click','.pg_start', function() {
		startNum = 0;
		endNum = 0 + 10;
		
		ajaxSearch(PagingUrl);
	});
	
	$('.pg_wrap').on('click','.pg_end', function() {
		
		startNum = (parseInt(Number(pagingCount)/10))*10;
		
		
		endNum = pagingCount;
				
		ajaxSearch(PagingUrl);
	});
});

// xml 파싱 + 아작스 검색
function ajaxSearch(searchUrl){

	$.ajax({
	    url : searchUrl,
	    type : "GET",
	    
	    dataType : "xml",
	    success : function(xml){
	    	
	    	var ul = "";
	        
	    	var img = "";
	    	
	        $.each($(xml).find("item"), function(idx, item) {
	        	ul += ("<ul>");
	        	
	        		// 컨텐츠 이미지 없을때 대체 이미지 적용
	        		
	        		if($(item).find('firstimage').val() == null){
	        			img = "/img/no_image.png";
	        		}else{
	        			img = $(item).find('firstimage').text()
	        		};	
	        		
	        		// 컨텐츠 내용 넣기
	     
	        		ul += ("<li> <input type='hidden' name='areacode' value='"+ $(item).find('areacode').text() +"'></li>");
	        		ul += ("<li> <input type='hidden' name='cat1' value='"+ $(item).find('cat1').text() +"'></li>");
	        		ul += ("<li> <input type='hidden' name='cat2' value='"+ $(item).find('cat2').text() +"'></li>");
	        		ul += ("<li> <input type='hidden' name='cat3' value='"+ $(item).find('cat3').text() +"'></li>");
	        		ul += ("<li> <input type='hidden' name='contentid' value='"+ $(item).find('contentid').text() +"'></li>");
	        		ul += ("<li> <input type='hidden' name='contenttypeid' value='"+ $(item).find('contenttypeid').text() +"'></li>");
	        		ul += ("<li> <input type='hidden' name='sigungucode' value='"+ $(item).find('sigungucode').text() +"'></li>");
	        		ul += ("<li><img src='"+ img +"'</li>");
	        		ul += ("<li>"+ $(item).find('title').text() +"</li>");
	        		ul += ("<li>"+ $(item).find('addr1').text() +"</li>");
	        		ul += ("<li> Tel : "+ $(item).find('tel').text() +"</li>");
	        	
	        	ul += "</ul>";
	        	
	        	
	        });
	        
	        /*  페이징 버튼 처리 */
	        // XML 현재 검색 결과 총 게시글 수 가져오기
	        totalCount = $(xml).find('totalCount').text();
		    
	        // 한페이지 나오는 리스트 수
	    	var counList = 12;
	    	
	        // xml 현재 페이지 값 가져오기
	    	var pageNo = Number($(xml).find('pageNo').text());
	    	console.log(pageNo);
	        
	        var aTag = "";
	    	var selectNum = "";
	    	
	    	// 총 결과 리스트 수  페이징 페이지 숫자로 변환 (총토탈 / 게시물수{12} )
			pagingCount = (totalCount / counList) ;
	    	
	    	if ( totalCount % counList >0 ){
	    		pagingCount++;
	    		pagingCount = parseInt(pagingCount);
	    	}else{
	    		pagingCount = parseInt(pagingCount);
	    	}
	        
	    	// a 태그로 페이징 번호들 html에 삽입
	        $('.sub_container2').html(ul);
	        
	        if(startNum > 9){
				aTag += "<a  class='pg_page pg_start' style='cursor: pointer;'>1</a>";
				aTag += "<a class='pg_page pg_prev' style='cursor: pointer;'>"+(Number(pageNo)-10)+"</a>";
			}
	    	for(var i =0; i < pagingCount; i++){
	    		if( startNum <= i && i < endNum){ 
		    		if(Number(pageNo) == (i+1)){
		    			selectNum = " background:#4c4f6f; color:#fff;";
		    				aTag += "<a class='pg_page' style='cursor: pointer;"+selectNum+"'>"+(i+1)+"</a>";
		    			continue;
		    		}
		    		aTag += "<a class='pg_page' style='cursor: pointer;'>"+(i+1)+"</a>";
	    		}
	    	}
	    	
	    	if(endNum < pagingCount){
	    		aTag += "<a class='pg_page pg_next' style='cursor: pointer;'>"+ Number(Number(pageNo)+10) +"</a>";
	    		aTag += "<a  class='pg_page pg_end' style='cursor: pointer;'>"+Number(pagingCount)+"</a>";
	    	}
	    	
	    	$('.pg_wrap span').html(aTag);
	    	
	    	// 총 게시물 숫자 html 태그에 삽입하기
	    	$('.searchUtill strong').html(totalCount);
	    	searchUrl += "&numOfRows="+counList+"&pageNo="+1 ;

	    }
	});
};





// 시군구 선택
function getSigunguList(value){
	
	var SigunguList_1 = "<option value=''>시군구 선택</option><option value='1'>강남구</option><option value='2'>강동구</option><option value='3'>강북구</option><option value='4'>강서구</option><option value='5'>관악구</option><option value='6'>광진구</option><option value='7'>구로구</option><option value='8'>금천구</option><option value='9'>노원구</option><option value='10'>도봉구</option><option value='11'>동대문구</option><option value='12'>동작구</option><option value='13'>마포구</option><option value='14'>서대문구</option><option value='15'>서초구</option><option value='16'>성동구</option><option value='17'>성북구</option><option value='18'>송파구</option><option value='19'>양천구</option><option value='20'>영등포구</option><option value='21'>용산구</option><option value='22'>은평구</option><option value='23'>종로구</option><option value='24'>중구</option><option value='25'>중랑구</option>";
	var SigunguList_2 = "<option value=''>시군구 선택</option><option value='1'>강화군</option><option value='2'>계양구</option><option value='3'>남구</option><option value='4'>남동구</option><option value='5'>동구</option><option value='6'>부평구</option><option value='7'>서구</option><option value='8'>연수구</option><option value='9'>옹진군</option><option value='10'>중구</option> ";
	var SigunguList_3 = "<option value=''>시군구 선택</option><option value='1'>대덕구</option><option value='2'>동구</option><option value='3'>서구</option><option value='4'>유성구</option><option value='5'>중구</option> ";
	var SigunguList_4 = "<option value=''>시군구 선택</option><option value='1'>남구</option><option value='2'>달서구</option><option value='3'>달성군</option><option value='4'>동구</option><option value='5'>북구</option><option value='6'>서구</option><option value='7'>수성구</option><option value='8'>중구</option> ";
	var SigunguList_5 = "<option value=''>시군구 선택</option><option value='1'>광산구</option><option value='2'>남구</option><option value='3'>동구</option><option value='4'>북구</option><option value='5'>서구</option> ";
	var SigunguList_6 = "<option value=''>시군구 선택</option><option value='1'>강서구</option><option value='2'>금정구</option><option value='3'>기장군</option><option value='4'>남구</option><option value='5'>동구</option><option value='6'>동래구</option><option value='7'>부산진구</option><option value='8'>북구</option><option value='9'>사상구</option><option value='10'>사하구</option><option value='11'>서구</option><option value='12'>수영구</option><option value='13'>연제구</option><option value='14'>영도구</option><option value='15'>중구</option><option value='16'>해운대구</option> ";
	var SigunguList_7 = "<option value=''>시군구 선택</option><option value='1'>중구</option><option value='2'>남구</option><option value='3'>동구</option><option value='4'>북구</option><option value='5'>울주군</option> ";
	var SigunguList_8 = "<option value=''>시군구 선택</option><option value='1'>세종특별자치시</option> ";
	var SigunguList_31 = "<option value=''>시군구 선택</option><option value='1'>가평군</option><option value='2'>고양시</option><option value='3'>과천시</option><option value='4'>광명시</option><option value='5'>광주시</option><option value='6'>구리시</option><option value='7'>군포시</option><option value='8'>김포시</option><option value='9'>남양주시</option><option value='10'>동두천시</option><option value='11'>부천시</option><option value='12'>성남시</option><option value='13'>수원시</option><option value='14'>시흥시</option><option value='15'>안산시</option><option value='16'>안성시</option><option value='17'>안양시</option><option value='18'>양주시</option><option value='19'>양평군</option><option value='20'>여주시</option><option value='21'>연천군</option><option value='22'>오산시</option><option value='23'>용인시</option><option value='24'>의왕시</option><option value='25'>의정부시</option><option value='26'>이천시</option><option value='27'>파주시</option><option value='28'>평택시</option><option value='29'>포천시</option><option value='30'>하남시</option><option value='31'>화성시</option> ";
	var SigunguList_32 = "<option value=''>시군구 선택</option><option value='1'>강릉시</option><option value='2'>고성군</option><option value='3'>동해시</option><option value='4'>삼척시</option><option value='5'>속초시</option><option value='6'>양구군</option><option value='7'>양양군</option><option value='8'>영월군</option><option value='9'>원주시</option><option value='10'>인제군</option><option value='11'>정선군</option><option value='12'>철원군</option><option value='13'>춘천시</option><option value='14'>태백시</option><option value='15'>평창군</option><option value='16'>홍천군</option><option value='17'>화천군</option><option value='18'>횡성군</option> ";
	var SigunguList_32 = "<option value=''>시군구 선택</option><option value='1'>괴산군</option><option value='2'>단양군</option><option value='3'>보은군</option><option value='4'>영동군</option><option value='5'>옥천군</option><option value='6'>음성군</option><option value='7'>제천시</option><option value='8'>진천군</option><option value='9'>청원군</option><option value='10'>청주시</option><option value='11'>충주시</option><option value='12'>증평군</option> ";
	var SigunguList_34 = "<option value=''>시군구 선택</option><option value='1'>공주시</option><option value='2'>금산군</option><option value='3'>논산시</option><option value='4'>당진시</option><option value='5'>보령시</option><option value='6'>부여군</option><option value='7'>서산시</option><option value='8'>서천군</option><option value='9'>아산시</option><option value='11'>예산군</option><option value='12'>천안시</option><option value='13'>청양군</option><option value='14'>태안군</option><option value='15'>홍성군</option><option value='16'>계룡시</option> ";
	var SigunguList_35 = "<option value=''>시군구 선택</option><option value='1'>경산시</option><option value='2'>경주시</option><option value='3'>고령군</option><option value='4'>구미시</option><option value='5'>군위군</option><option value='6'>김천시</option><option value='7'>문경시</option><option value='8'>봉화군</option><option value='9'>상주시</option><option value='10'>성주군</option><option value='11'>안동시</option><option value='12'>영덕군</option><option value='13'>영양군</option><option value='14'>영주시</option><option value='15'>영천시</option><option value='16'>예천군</option><option value='17'>울릉군</option><option value='18'>울진군</option><option value='19'>의성군</option><option value='20'>청도군</option><option value='21'>청송군</option><option value='22'>칠곡군</option><option value='23'>포항시</option> ";
	var SigunguList_36 = "<option value=''>시군구 선택</option><option value='1'>거제시</option><option value='2'>거창군</option><option value='3'>고성군</option><option value='4'>김해시</option><option value='5'>남해군</option><option value='6'>마산시</option><option value='7'>밀양시</option><option value='8'>사천시</option><option value='9'>산청군</option><option value='10'>양산시</option><option value='12'>의령군</option><option value='13'>진주시</option><option value='14'>진해시</option><option value='15'>창녕군</option><option value='16'>창원시</option><option value='17'>통영시</option><option value='18'>하동군</option><option value='19'>함안군</option><option value='20'>함양군</option><option value='21'>합천군</option>";
	var SigunguList_37 = "<option value=''>시군구 선택</option><option value='1'>고창군</option><option value='2'>군산시</option><option value='3'>김제시</option><option value='4'>남원시</option><option value='5'>무주군</option><option value='6'>부안군</option><option value='7'>순창군</option><option value='8'>완주군</option><option value='9'>익산시</option><option value='10'>임실군</option><option value='11'>장수군</option><option value='12'>전주시</option><option value='13'>정읍시</option><option value='14'>진안군</option> ";
	var SigunguList_38 = "<option value=''>시군구 선택</option><option value='1'>강진군</option><option value='2'>고흥군</option><option value='3'>곡성군</option><option value='4'>광양시</option><option value='5'>구례군</option><option value='6'>나주시</option><option value='7'>담양군</option><option value='8'>목포시</option><option value='9'>무안군</option><option value='10'>보성군</option><option value='11'>순천시</option><option value='12'>신안군</option><option value='13'>여수시</option><option value='16'>영광군</option><option value='17'>영암군</option><option value='18'>완도군</option><option value='19'>장성군</option><option value='20'>장흥군</option><option value='21'>진도군</option><option value='22'>함평군</option><option value='23'>해남군</option><option value='24'>화순군</option> ";
	var SigunguList_39 = "<option value=''>시군구 선택</option><option value='1'>남제주군</option><option value='2'>북제주군</option><option value='3'>서귀포시</option><option value='4'>제주시</option>";
	
	if(value == 1){
		$('.sigungucode').html(SigunguList_1);
	}else if (value == 2){
		$('.sigungucode').html(SigunguList_2);
	}else if (value == 3){
		$('.sigungucode').html(SigunguList_3);
	}else if (value == 4){
		$('.sigungucode').html(SigunguList_4);
	}else if (value == 5){
		$('.sigungucode').html(SigunguList_5);
	}else if (value == 6){
		$('.sigungucode').html(SigunguList_6);
	}else if (value == 7){
		$('.sigungucode').html(SigunguList_7);
	}else if (value == 8){
		$('.sigungucode').html(SigunguList_8);
	}else if (value == 31){
		$('.sigungucode').html(SigunguList_31);
	}else if (value == 32){
		$('.sigungucode').html(SigunguList_32);
	}else if(value == 33){
		$('.sigungucode').html(SigunguList_33);
	}else if (value == 34){
		$('.sigungucode').html(SigunguList_34);
	}else if (value == 35){
		$('.sigungucode').html(SigunguList_35);
	}else if (value == 36){
		$('.sigungucode').html(SigunguList_36);
	}else if (value == 37){
		$('.sigungucode').html(SigunguList_37);
	}else if (value == 38){
		$('.sigungucode').html(SigunguList_38);
	}else if (value == 39){
		$('.sigungucode').html(SigunguList_39);
	}
}

//행사 소분류 
function getCat3List(value){
	
	var getCat3List_1 = "<option value=''>소분류</option><option value='A02070100'>문화관광축제</option><option value='A02070200'>일반축제</option>";
	var getCat3List_2 = "<option value=''>소분류</option><option value='A02080100'>전통공연</option><option value='A02080200'>연극</option><option value='A02080300'>뮤지컬</option><option value='A02080400'>오페라</option><option value='A02080500'>전시회</option><option value='A02080600'>박람회</option><option value='A02080700'>컨벤션</option><option value='A02080800'>무용</option><option value='A02080900'>클래식음악회</option><option value='A02081000'>대중콘서트</option><option value='A02081100'>영화</option><option value='A02081200'>스포츠경기</option><option value='A02081300'>기타행사</option>";
	
	if(value == 'A0207'){
		$('.getCat3List').html(getCat3List_1);
	}else if(value == 'A0208'){
		$('.getCat3List').html(getCat3List_2);
	}
	
}

</script>

<style>

.sub_container { }
.sub_container ul { width:49%; height:150px; background:#f1f1f1; margin: 10px 0; border: 1px solid #ddd; margin-right: 2%; float: left;  }
.sub_container ul:hover { background: #fff;}
.sub_container ul:nth-child(even) { margin-right: 0;}

.sub_container ul li:nth-child(8) { width: 40%; height:150px; overflow:hidden; float:left;  text-align: center; border-right: 1px solid #ddd; box-sizing: border-box;}
.sub_container ul li:nth-child(8) img { height:148px; }

.sub_container ul li:nth-child(9) {width:60%; height:40px; margin:18px 0 10px 0;  float:left; padding-left: 10px; font-size: 1.4em; font-weight: bolder;}
.sub_container ul li:nth-child(10) {width:60%; height:25px; margin:5px 0; float:left; padding-left: 10px; font-size: 1.3em;}
.sub_container ul li:nth-child(11) { width:60%; height:24px; margin:5px 0; float:left; padding-left: 10px; font-size: 1.3em;}


.searchUtill { margin: 20px 0 10px 0; border-bottom: 1px solid #ddd; padding-bottom: 10px; font-size: 1.2em;}

.bbsSearch th { background: #f1f1f1; height: 50px; width: 112px !important; border-bottom: 1px solid #ddd; border-left: 1px solid #ddd; border-right: 1px solid #ddd; }
.bbsSearch td { border-bottom: 1px solid #ddd; border-right: 1px solid #ddd;}
.bbsSearch td select { margin-left: 10px; height: 30px; }
.bbsSearch td input[type=radio] { margin-left: 10px; margin-right: 5px; width: 20px; height: 20px;}
.bbsSearch td input[type=text] { margin-left: 10px; margin-right: 5px;} 
.bbsSearch td label { margin-right: 10px;} 
.search_btn00 { background: #253dbe; color: #fff; padding: 10px; border: 0; cursor: pointer;}

.lodgment_title {
	width: 100%;
	text-align: center;
	font-size: 3em;
	margin: 20px 0 30px 0;
	color: #1087e3;
}
</style>

<div class="sub_container">
	
	<h2 class="lodgment_title">축제기간 정보 (날짜)</h2>
	<fieldset>
		<legend>날짜검색</legend>					
	
		<div class="tableWrap searchWrap mgNone">
	 	<table class="bbsSearch">
				<caption>검색 순서 1 – 관광데이터 검색을 위한 언어선택</caption>
				<colgroup>
					<col style="width:10%;">
					<col style="width:90%;">
				</colgroup>
				<tbody>
					<tr>
						<td></td>
						<td>
						     <input type="hidden" name="rlangtype" title="한국어" value="KOR" id="rlangType_KOR">
						</td>
					</tr>
				</tbody>
			</table>	
			<div id="selectDate">
				<table class="bbsSearch" style="border:0px;">
					<caption>검색 순서 2 - 관광데이터 검색을 위한 서비스 분류 선택(대, 중, 소), 지역 선택</caption>
					<colgroup>
						<col style="width:10%;">
						<col width="width:90% !important;">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row"><label for="cat1">서비스분류</label></th>
							<td class="dataSearch">
								<div>
									<span>
										<select title="대분류" name="cat1">
											<option value="">대분류</option>
											<option value="A02">인문(문화/예술/역사)</option>		
										</select>
										<select name="cat2" title="중분류" onchange="getCat3List(this.value);"> 
											<option value="">중분류</option>
											<option value="A0207">축제</option>
											<option value="A0208">공연/행사</option>
										</select>
										
										<select class="getCat3List" name="cat3" style="width:308px;" title="소분류">
											<option value="">소분류</option>
										</select>
									</span>
									
								</div>
				
							</td>
						</tr>
						<tr>
							<th scope="row"><label for="areacode">지역</label></th>
							<td>
								<select id="areacode" title="지역선택" name="areacode" onchange="getSigunguList(this.value);">
									<option value="" selected="selected">지역선택</option>
									<option value="1">서울</option>
									<option value="2">인천</option>
									<option value="3">대전</option>
									<option value="4">대구</option>
									<option value="5">광주</option>
									<option value="6">부산</option>
									<option value="7">울산</option>
									<option value="8">세종특별자치시</option>
									<option value="31">경기도</option>
									<option value="32">강원도</option>
									<option value="33">충청북도</option>
									<option value="34">충청남도</option>
									<option value="35">경상북도</option>
									<option value="36">경상남도</option>
									<option value="37">전라북도</option>
									<option value="38">전라남도</option>
									<option value="39">제주도</option>
								</select>
							
								<select class="sigungucode" name="sigungucode" title="시군구선택">
									<option value="">시군구 선택</option>
						 		</select>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
	 		
			<table class="bbsSearch" id="datebase">
				<caption>검색 순서 3  - 날짜 검색 시작일,종료일 선택 후 검색버튼을 클릭하면(엔터)하면 관광데이터 검색 결과를 확인할 수 있음</caption>
				<colgroup>
					<col style="width:10%;">
						<col width="width:90% !important;">
				</colgroup>
				<tbody>				
					<tr>	
						<th class="last wHacki8" scope="row">시작일</th>
						<td>
							<input id="datepicker1" class="datepicker" type="text" name="eventStartDate" placeholder="시작일" style="width: 35%" readonly="readonly" >
							
						</td>
					</tr>
					<tr>	
						<th class="last wHacki8" scope="row">종료일</th>
						<td>
							<input id="datepicker2" class="datepicker" type="text" name="eventEndDate" placeholder="종료일" style="width: 35%" readonly="readonly">
							&nbsp;&nbsp; <input class="search_btn00" type="submit" id="search" value="검색" >
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</fieldset>
	<div class="searchUtill">
		<p>총 데이터 수 <strong></strong>개</p>
		
	</div>
	
	<div class="sub_container2">
		
	</div>
	
	
	<nav class="pg_wrap"><span class="pg">
		<span class="sound_only">열린</span>
			<a href="" class="pg_page pg_start">시작</a>
			<a href="" class="pg_page pg_prev">이전</a>
			
			<a href="" class="pg_page pg_next">다음</a>
			<a href="" class="pg_page pg_end">맨끝</a>
		</span>
	</nav>
</div>

<%@include file="../tail.jsp" %>