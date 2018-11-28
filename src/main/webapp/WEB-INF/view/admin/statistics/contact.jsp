<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../adminHead.jsp" %>

<script src= "https://cdn.zingchart.com/zingchart.min.js"></script>
<script> zingchart.MODULESDIR = "https://cdn.zingchart.com/modules/"; ZC.LICENSE = ["569d52cefae586f634c54f86dc99e6a9","ee6b7db5b51705a13dc2339db3edaf6d"];</script>

<style>
	@import 'https://fonts.googleapis.com/css?family=Open+Sans';
 
	.zc-ref {
	  display: none;
	}
</style>

<script>


jQuery(function($){
    $.datepicker.regional["ko"] = {
        closeText: "닫기",
        prevText: "이전달",
        nextText: "다음달",
        currentText: "오늘",
        monthNames: ["1월(JAN)","2월(FEB)","3월(MAR)","4월(APR)","5월(MAY)","6월(JUN)", "7월(JUL)","8월(AUG)","9월(SEP)","10월(OCT)","11월(NOV)","12월(DEC)"],
        monthNamesShort: ["1월","2월","3월","4월","5월","6월", "7월","8월","9월","10월","11월","12월"],
        dayNames: ["일","월","화","수","목","금","토"],
        dayNamesShort: ["일","월","화","수","목","금","토"],
        dayNamesMin: ["일","월","화","수","목","금","토"],
        weekHeader: "Wk",
        dateFormat: "yymmdd",
        firstDay: 0,
        isRTL: false,
        showMonthAfterYear: true,
        yearSuffix: ""
    };
	$.datepicker.setDefaults($.datepicker.regional["ko"]);
});
</script>

<div class="container_wr">


<div class="local_ov01 local_ov">
    <a href="" class="ov_listall">월간</a>
    <a href="" class="ov_listall">주간</a>
    <a href="" class="ov_listall">일간</a>    
</div>

<form name="flist" class="local_sch01 local_sch">
<input type="hidden" name="doc" value="">
<input type="hidden" name="sort1" value="ct_status_sum">
<input type="hidden" name="sort2" value="desc">
<input type="hidden" name="page" value="1">

<label for="sel_ca_id" class="sound_only">검색대상</label>
<select name="sel_ca_id" id="sel_ca_id">
    <option value="">전체분류</option>
    <option value="20">TOP/PANTS</option>
<option value="2010">&nbsp;&nbsp;&nbsp;TOP</option>
<option value="201010">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;셔츠</option>
<option value="20101010">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;체크/슬림</option>
<option value="2010101010">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;체크</option>
<option value="2010101020">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;슬림</option>
<option value="20101020">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;드레스셔츠</option>
<option value="201020">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;티</option>
<option value="2020">&nbsp;&nbsp;&nbsp;PANTS</option>
<option value="30">테스트</option>
</select>

기간설정
<label for="fr_date" class="sound_only">시작일</label>
<input type="text" name="fr_date" value="" id="fr_date" required="" class="required frm_input hasDatepicker" size="8" maxlength="8"> 에서
<label for="to_date" class="sound_only">종료일</label>
<input type="text" name="to_date" value="20181128" id="to_date" required="" class="required frm_input hasDatepicker" size="8" maxlength="8"> 까지
<input type="submit" value="검색" class="btn_submit">

</form>



<div id='myChart'><a class="zc-ref" href="https://www.zingchart.com/">Charts by ZingChart</a></div>

<script type="text/javascript">
var myConfig = {
	 	type: "pie", 

	 	plot: {
	 	  borderColor: "#2B313B",
	 	  borderWidth: 5,
	 	  // slice: 90,
	 	  valueBox: {
	 	    placement: 'out',
	 	    text: '%t\n%npv%',
	 	    fontFamily: "Open Sans"
	 	  },
	 	  tooltip:{
	 	    fontSize: '18',
	 	    fontFamily: "Open Sans",
	 	    padding: "5 10",
	 	    text: "%npv%"
	 	  },
	 	  animation:{
	      effect: 2, 
	      method: 5,
	      speed: 500,
	      sequence: 1
	    }
	 	},
	 	source: {
	 	  text: 'gs.statcounter.com',
	 	  fontColor: "#8e99a9",
	 	  fontFamily: "Open Sans"
	 	},
	 	title: {
	 	  fontColor: "#fff",
	 	  text: 'Global Browser Usage',
	 	  align: "left",
	 	  offsetX: 10,
	 	  fontFamily: "Open Sans",
	 	  fontSize: 25
	 	},
	 	subtitle: {
	 	  offsetX: 10,
	 	  offsetY: 10,
	 	  fontColor: "#8e99a9",
	 	  fontFamily: "Open Sans",
	 	  fontSize: "16",
	 	  text: 'May 2016',
	 	  align: "left"
	 	},
	 	plotarea: {
	 	  margin: "20 0 0 0"  
	 	},
		series : [
			{
				values : [11.38],
				text: "Internet Explorer",
			  backgroundColor: '#50ADF5',
			},
			{
			  values: [56.94],
			  text: "Chrome",
			  backgroundColor: '#FF7965'
			},
			{
			  values: [14.52],
			  text: 'Firefox',
			  backgroundColor: '#FFCB45'
			},
			{
			  text: 'Safari',
			  values: [9.69],
			  backgroundColor: '#6877e5'
			},
			{
			  text: 'Other',
			  values: [7.48],
			  backgroundColor: '#6FB07F'
			}
		]
	};
	 
	zingchart.render({ 
		id : 'myChart', 
		data : myConfig, 
		height: 600, 
		width: 500 
	});



</script>


<div class="local_desc01 local_desc">
    <p>접속자 집계 통계 리스트 입니다.</p>
</div>

<div class="btn_fixed_top">
    <a href="./itemstocklist.php" class="btn_02 btn">상품재고관리</a>
    <a href="./itemlist.php" class="btn_01 btn">상품등록</a>
</div>

<div class="tbl_head01 tbl_wrap">
    <table>
    <caption>상품판매순위 목록</caption>
    <colgroup>
    	<col width="15%">
    	<col width="53%">
    	<col width="8%">
    	<col width="8%">
    	<col width="8%">
    	<col width="8%">
    </colgroup>
    <thead>
    <tr>
        <th scope="col">아이피(IP)</th>
        <th scope="col">접속경로</th>
        <th scope="col"><a>브라우저</a></th>
        <th scope="col"><a>OS</a></th>
        <th scope="col"><a>접속기기</a></th>
        <th scope="col"><a>일시</a></th>
 
    </tr>
    </thead>
    <tbody>
            <tr class="bg0">
            <td class="td_num">192.168.35.168</td>
            <td class="td_left">https://yandex.ru/clck/jsredir?</td>
            <td class="td_num">Chrome</td>
            <td class="td_num">Windows7</td>
            <td class="td_num">mobile</td>
            <td class="td_num">2018-11-28 13:29:59</td>
            
        </tr>
            <tr class="bg1">
            <td class="td_num">192.168.35.168</td>
            <td class="td_left">https://yandex.ru/clck/jsredir?</td>
            <td class="td_num">Chrome</td>
            <td class="td_num">Windows7</td>
            <td class="td_num">mobile</td>
            <td class="td_num">2018-11-28 13:29:59</td>
            
        </tr>
        
     


 
            </tbody>
    </table>
</div>

<nav class="pg_wrap"><span class="pg"><span class="sound_only">열린</span><strong class="pg_current">1</strong><span class="sound_only">페이지</span>
<a href="/gnuboard5/adm/shop_admin/itemsellrank.php?sst=&amp;sod=&amp;sfl=&amp;stx=&amp;fr_date=&amp;to_date=20181128&amp;sel_ca_id=&amp;page=2" class="pg_page">2<span class="sound_only">페이지</span></a>
<a href="/gnuboard5/adm/shop_admin/itemsellrank.php?sst=&amp;sod=&amp;sfl=&amp;stx=&amp;fr_date=&amp;to_date=20181128&amp;sel_ca_id=&amp;page=3" class="pg_page">3<span class="sound_only">페이지</span></a>
<a href="/gnuboard5/adm/shop_admin/itemsellrank.php?sst=&amp;sod=&amp;sfl=&amp;stx=&amp;fr_date=&amp;to_date=20181128&amp;sel_ca_id=&amp;page=4" class="pg_page">4<span class="sound_only">페이지</span></a>
<a href="/gnuboard5/adm/shop_admin/itemsellrank.php?sst=&amp;sod=&amp;sfl=&amp;stx=&amp;fr_date=&amp;to_date=20181128&amp;sel_ca_id=&amp;page=4" class="pg_page pg_end">맨끝</a>
</span></nav>
<script>
$(function() {
    $("#fr_date, #to_date").datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: "yymmdd",
        showButtonPanel: true,
        yearRange: "c-99:c+99",
        maxDate: "+0d"
    });
});
</script>



</div>

<%@include file="../adminTail.jsp" %>