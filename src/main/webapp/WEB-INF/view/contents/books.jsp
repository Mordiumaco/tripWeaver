<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../head.jsp" %>

<script type="text/javascript">


$(function(){
	$('.bookList').hover(function(){
		$(this).find('.text').fadeIn(100);
	}, function(){//마우스가 아웃되었을 때
		$(this).find('.text').fadeOut(100);
	});
});


$(function search(){

	$("#search").click(function(){
		$('#startNum').val(1);
		$('#endNum').val(10);
		
		if($('.d_titl').val() == ""){
			alert("책 제목을 입력해 주세요.");
		}else{
			$("#frm").submit();	
		}
		
	});	
	
});


$(document).ready(function listMove() {
	
	var startNum = Number("${param.startNum == "" ? 1 : param.startNum }");
	var endNum = null;
	
	if(${param.endNum == ""}){
		endNum = 10;
	}else if (${param.endNum < 35}){
		endNum = "${param.endNum}"; 
	}else{
		endNum = 34;
	}
	
	var pageNo = "${param.display}";

	var total = 0;
	var pageTotal = null ;
	
	// 검색된 리스트 숫자
	total = "${bookList[0].total}";
	// 페이징 처리할 게시물 숫자
	var counList = 30;
	
	pageTotal = (total / counList);
	
	if ( total % counList > 0 ){
		pageTotal++;
		pageTotal = parseInt(pageTotal);
	}else{
		pageTotal = parseInt(pageTotal);
	}
	
	var aTag = "";
	
	if(startNum > 9){
		aTag += "<a  class='pg_page pg_start' style='cursor: pointer;'>1</a>";
		aTag += "<a class='pg_page pg_prev' style='cursor: pointer;'>"+(Number(pageNo)-10)+"</a>";
	}
	for(var i =1; i < pageTotal; i++){
		if( startNum <= i && i <= endNum){ 
    		if((Number(pageNo)+29)/counList == (i)){
    			selectNum = " background:#4c4f6f; color:#fff;";
    				aTag += "<a class='pg_page' style='cursor: pointer;"+selectNum+"'>"+(i)+"</a>";
    			continue;
    		}
    		aTag += "<a class='pg_page' style='cursor: pointer;'>"+(i)+"</a>";
		}
	}
	
	if(endNum < pageTotal && endNum < 34 ){
		aTag += "<a class='pg_page pg_next' style='cursor: pointer;'>"+ Number(Number(pageNo)+10) +"</a>";
		aTag += "<a  class='pg_page pg_end' style='cursor: pointer;'>"+Number(pageTotal)+"</a>";
	}
	
	$('.pg_wrap span').html(aTag);
	
	
	$('.pg_wrap').on('click','.pg_page', function name() {
		
		if(Number($(this).text()) > pageTotal){
			pageNum = pageTotal;
		}else{
			pageNum = $(this).text();
		}
		
		$('#display').val(pageNum * counList - 29);
		
		$("#frm").submit();	
		
	});
	
	$('.pg_wrap').on('click','.pg_next', function() {
		
		$('#display').val(((startNum + 10) * counList) - 29);
		
		$('#startNum').val(Number(Number("${param.startNum == "" ? 1 : param.startNum }") + 10));
		
		if(Number(endNum) + 10 > 34){
			$('#endNum').val(34);
		}else{ 
			$('#endNum').val(Number(Number("${param.endNum == "" ? 10 : param.endNum}") + 10));
		}; 

		$("#frm").submit();	
		 
	});
	
	$('.pg_wrap').on('click','.pg_prev', function() {
		
		$('#display').val(((startNum -10) * counList) - 29);
		
		$('#startNum').val(Number(Number("${param.startNum == "" ? 1 : param.startNum }") - 10));
		
		if (Number(endNum) % 10 != 0){
			endNum = Math.floor(Number(endNum) / 10)* 10;
			$('#endNum').val(endNum);
		}else if(Number(endNum) - 10 < 10){
			endNum = 10 ;
			$('#endNum').val(endNum);
		}else{
			$('#endNum').val(Number(Number("${param.endNum == "" ? 10 : param.endNum}") - 10));
		} 
		
		$("#frm").submit();	
	});
	
	$('.pg_wrap').on('click','.pg_start', function() {
		startNum = 0;
		$('#startNum').val(startNum);
		endNum = 0 + 10;
		$('#endNum').val(endNum);
		
		$("#frm").submit();
	});
	
	$('.pg_wrap').on('click','.pg_end', function() {
		 
		if (pageTotal > 34){
			$('#display').val(991);
			
			endNum = 34;
			$('#endNum').val(endNum);
			
			startNum = 30;
			$('#startNum').val(startNum);
		}else{
			endNum = pageTotal;
			$('#endNum').val(endNum);
			
			startNum = (parseInt(Number(pageTotal)/10))*10;
			$('#startNum').val(startNum);
		}
		
		$('#endNum').val(endNum);
				 
		$("#frm").submit();
	});
	
});


</script>

<style>

.lodgment_title {
	width: 100%;
	text-align: center;
	font-size: 3em;
	margin: 20px 0 30px 0;
	color: #1087e3;
}

.bbsSearch th { background: #f1f1f1; height: 50px; width: 112px !important; border-bottom: 1px solid #ddd; border-left: 1px solid #ddd; border-right: 1px solid #ddd; }
.bbsSearch td { border-bottom: 1px solid #ddd; border-right: 1px solid #ddd;}
.bbsSearch td select { margin-left: 10px; height: 30px; }
.bbsSearch td input[type=text] { margin-left: 10px; margin-right: 5px; height: 30px; padding-left: 10px;} 
.bbsSearch td label { margin-right: 10px;} 
.search_btn00 { background: #253dbe; color: #fff; padding: 7px 10px; border: 0; cursor: pointer;}

.bookList { width: 363px; height:515px; display:inline-block; float: left; line-height: 150%; border: 1px solid #ddd; margin-right: 30px; margin-bottom: 30px;  font-size: 1.4em; background: #f1f1f1; position: relative; cursor: pointer;}
.bookList:nth-child(3n) { margin-right: 0;}
.bookList li { margin: 10px 0; padding: 0px 10px; }
.bookList li:nth-child(1) { text-align: center; overflow: hidden; border-bottom: 1px solid #ddd; background: #fff !important; margin: 0; padding: 10px;}
.bookList li:nth-child(2) { margin: 15px auto; text-align: center;     width: 340px;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: normal;
    height: 76px;
    text-align: left;
    word-wrap: break-word;
    display: -webkit-box;
    -webkit-line-clamp: 3;
    -webkit-box-orient: vertical;
    line-height: 150%;  } 
.bookList img { height: 230px; }
.bookList span { width: 60px; display: inline-block;}
.searchUtill { margin: 20px 0 10px 0; border-bottom: 1px solid #ddd; padding-bottom: 10px; font-size: 1.2em;}

.text { background-color: rgba(0,0,0,0.7); width:363px; height: 515px; position: absolute; top:0; left: 0; color: #fff; padding: 20px; line-height: 160%; font-size: 1.2em; display: none;}
.pagingWrap { display: inline-block;}
</style>


<div class="sub_container">
	<h2 class="lodgment_title">여행 도서 검색하기</h2>
	
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
					<td></td>
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
						<th scope="row"><label for="cat1">도서 종류 선택</label></th>
						<td class="dataSearch">
							<div>
								<span>
									 <form method="get" action="/recommendation/books" id="frm">
							        	<select name="d_catg">
							        		<option value="">선택하세요.</option>
							        		<option value="270" ${param.d_catg == 270 ? "selected" : "" }>여행/지도</option>
							        		<option value="270010" ${param.d_catg == 270010 ? "selected" : "" }>국내여행</option>
							        		<option value="270020" ${param.d_catg == 270020 ? "selected" : "" }>해외여행</option>
							        		<option value="270030" ${param.d_catg == 270030 ? "selected" : "" }>테마여행</option>
							        		<option value="290080" ${param.d_catg == 290080 ? "selected" : "" }>취미여행</option>
							        	</select>
							            <input type="text" class="d_titl" name="d_titl" value="${param.d_titl}" required="required" placeholder="책 제목을 입력하세요.">
							            <input type="hidden" value="" name="keyword">
							            <input type="hidden" value="1" name="display" id="display">
							            <input type="hidden" value="${param.startNum}" name="startNum" id="startNum">
							            <input type="hidden" value="${param.endNum}" name="endNum" id="endNum">
							            <input type="button" value="검색" class="search_btn00" id="search">
							        </form>
								</span>
								
							</div>
			
						</td>
					</tr>
					
				</tbody>
			</table>
		</div>
	
	<div class="searchUtill">
		<p>총 데이터 수 <strong>${bookList[0].total}</strong>개</p>
		
	</div>
	

        
     <c:choose>
     	<c:when test="${bookList.size() < 1}">
           	검색한 결과가 없습니다.
        </c:when>
     		
     	<c:otherwise>
	        <c:forEach items="${bookList}" var ="b">
	        	<ul class="bookList">
	        		<li><img src="${b.image}"></li>
	        		<li>${b.title}</li>
	        		<li><span>작가 </span>: ${b.author}</li>
	        		<li><span>가격</span>: ${b.price }</li>
	        		<li><span>출판사</span>: ${b.publisher }</li>
	        		<li><span>출판일</span>: ${b.pubdate }</li>
	        		<li><div class="text">${b.description}</div></li>
	        	</ul>
	        </c:forEach>
     	</c:otherwise>
	</c:choose>
	
	<nav class="pg_wrap"><span class="pg">
		<span class="sound_only">열린</span>
			
		</span>
	</nav>

</div>
</div>

<%@include file="../tail.jsp" %>