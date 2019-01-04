<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../adminHead.jsp" %>

<script src="https://cdn.zingchart.com/zingchart.min.js"></script>

<style>
@import 'https://fonts.googleapis.com/css?family=Open+Sans';

html, body {
	height:100%;
	width:100%;
	margin:0;
	padding:0;
}
#myChart {
	height:500px;
	width:100%;
	min-height:150px;
}
.zc-ref {
	display:none;
}
div .connstat_table {
	width: 100%;
	height: 600px;
}
.connstat_table table {
	width: 100%;
	height: 500px;
}

.connstat_table .table_div {
	width: 40%;
	height: 490px;
	float: left;
	margin: 10px;
}

</style>
<script src="/js/jquery-3.3.1.min.js"></script>

<!-- 데이트피커 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- <link rel="stylesheet" type="text/css" media="screen" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.14/themes/base/jquery-ui.css"> -->

<!-- 통계차트 -->
<script src= "https://cdn.zingchart.com/zingchart.min.js"></script>
<script> 
	zingchart.MODULESDIR = "https://cdn.zingchart.com/modules/";
	ZC.LICENSE = ["569d52cefae586f634c54f86dc99e6a9","ee6b7db5b51705a13dc2339db3edaf6d"];
</script>
<script>
	var day = new Array();
	var arr_day; 
	<c:forEach items="${day}" var="connstatVO">
		arr_day = new Array();	
		arr_day.push(${connstatVO.timestat_date});
		arr_day.push(${connstatVO.timestat_count});
		day.push(arr_day);
	</c:forEach>
	
	var eve_day = new Array();
	var arr_eve_day;	
	<c:forEach items="${eve_day}" var="connstatVO">
		arr_eve_day = new Array();
		arr_eve_day.push(${connstatVO.timestat_date});
		arr_eve_day.push(${connstatVO.timestat_count});
		eve_day.push(arr_eve_day);
	</c:forEach>
	var last_month = new Array();
	var arr_last_month;	
	<c:forEach items="${last_month}" var="connstatVO">
		arr_last_month = new Array();
		arr_last_month.push(${connstatVO.timestat_date});
		arr_last_month.push(${connstatVO.timestat_count});
		last_month.push(arr_last_month);
	</c:forEach>
	
	$(document).ready(function() {
		$('#datepicker').val('${year}.${input_str_day}');
		$( "#datepicker" ).datepicker({
			dateFormat: "yy.mm.dd"
		});
		
		$('#search_btn').on('click', function() {
			$('#conStat_form').submit();
		});
		
		var myConfig = {
		 	type: 'line', 
		 	legend:{
		 	  adjustLayout: true,
		 	  align: 'center',
		 	  verticalAlign: 'bottom'
		 	},
		 	title:{
		 	  adjustLayout: true,
		 	  text:"시간대별 접속자 수"
		 	},
		 	plot:{
		 	  valueBox:{
		 	    text:"%v"
		 	  }
		 	},
		 	plotarea:{
		 	  margin:"dynamic 50 dynamic dynamic"
		 	},
		 	scaleX:{
				"values" : "0:23:1"
		 	},
		 	scaleY:{
		 	  guide:{
		 	    lineStyle:'solid'
		 	  },
		 	  label:{
		 	    text: '접속자 수'
		 	  },
		 	  markers:[
		 	    {
		 	      type:'line',
		 	      range: [23],
		 	      lineColor:'#c62828',
		 	      lineStyle:'dashed',
		 	      label:{
		 	        text:'지난달 최대 접속자 수',
		 	        placement: 'right'
		 	      }
		 	    }
		 	    ]
		 	},
		 	tooltip:{
		 	  text:"%v<br>%kv",
		 	  borderRadius: 2
		 	},
		 	crosshairX:{
		 	  exact: true,
		 	  lineColor:'#000',
		    scaleLabel:{
		      borderRadius: 2
		    },
		    marker:{
		      size: 5,
		      backgroundColor:'white',
		      borderWidth: 2,
		      borderColor:'#000'
		    }
		 	},
			series: [
				{
					text: '${str_day}',
					values: day,
					lineColor:'#2F9D27',
					marker:{
					  backgroundColor:'#2F9D27'
					}
				},
				{
					text: '${str_eve_day}',
					values: eve_day,
					lineColor:'#59DA50',
					marker:{
					  backgroundColor:'#59DA50'
				  }
				},
				{
					text: '${str_last_month}',
					values: last_month,
					lineColor:'#E0844F',
					marker:{
					backgroundColor:'#E0844F'
				  }
				}
			]
		};
		 
		zingchart.render({ 
			id: 'myChart', 
			data: myConfig, 
			height: '100%', 
			width: '100%' 
		});
	});
	
	
	function getTimeStamp(d, dType) {
		   var s = leadingZeros(d.getFullYear(), 4) + '.' + leadingZeros(d.getMonth() + 1, 2);
			   s += (dType == 'month'? '' :  '.' + leadingZeros(d.getDate(), 2));
		   return s;
		 }

	 function leadingZeros(n, digits) {
	   var zero = '';
	   n = n.toString();

	   if (n.length < digits) {
	     for (i = 0; i < digits - n.length; i++)
	       zero += '0';
	   }
	   return zero + n;
	 }
	 
</script>
	
	<form action="/connStat/connStatTime" id="conStat_form" method="get">
		<label for="datepicker"><span id="dateTypeName">날짜선택 : </span>
			<input type="text" id="datepicker" name="datepicker" class="datepicker" placeholder="기간을 선택해주세요" readonly="readonly"/>
			<input type="button" value="검색" class="btn_submit" id="search_btn">
		</label>
	</form>
	
	<div id="myChart"><a class="zc-ref" href="https://www.zingchart.com">Powered by ZingChart</a></div>
	
	<div class="local_desc01 local_desc">
	    <p>시간대별 접속자 수</p>
	</div>

	<div class="tbl_head01 tbl_wrap connstat_table">
		<div class="table_div">
			<table>
				<caption>00 ~ 11</caption>
				<colgroup>
					<col width="19%">
					<col width="27%">
					<col width="27%">
					<col width="27%">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">시간</th>
						<th scope="col">${str_day}</th>
						<th scope="col">${str_eve_day}</th>
						<th scope="col">${str_last_month}</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach begin="0" end="11" varStatus="i">
						<tr class="bg0">
							<td class="td_num">${i.index < 10 ? '0' + i.index : i.index}시</td>
							<td class="td_num">${day[i.index].timestat_count == null ? '-' : day[i.index].timestat_count}</td>
							<td class="td_num">${eve_day[i.index].timestat_count == null ? '-' : eve_day[i.index].timestat_count}</td>
							<td class="td_num">${last_month[i.index].timestat_count == null ? '-' : last_month[i.index].timestat_count}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

		<div class="table_div">
			<table>
				<caption>12 ~ 23</caption>
				<colgroup>
					<col width="19%">
					<col width="27%">
					<col width="27%">
					<col width="27%">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">시간</th>
						<th scope="col">${str_day}</th>
						<th scope="col">${str_eve_day}</th>
						<th scope="col">${str_last_month}</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach begin="12" end="23" varStatus="i">
						<tr class="bg0">
							<td class="td_num">${i.index < 10 ? '0' + i.index : i.index}시</td>
							<td class="td_num">${day[i.index].timestat_count == null ? '-' : day[i.index].timestat_count}</td>
							<td class="td_num">${eve_day[i.index].timestat_count == null ? '-' : eve_day[i.index].timestat_count}</td>
							<td class="td_num">${last_month[i.index].timestat_count == null ? '-' : last_month[i.index].timestat_count}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>		
		
	</div>
</div>

<%@include file="../adminTail.jsp" %>