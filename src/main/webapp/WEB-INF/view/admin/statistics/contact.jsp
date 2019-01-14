<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../adminHead.jsp"%>


  
<script src="https://cdn.zingchart.com/zingchart.min.js"></script>

<style>
@import 'https://fonts.googleapis.com/css?family=Open+Sans';

.zc-ref {
	display: none;
}
</style>
<script src="/js/jquery-3.3.1.min.js"></script>

<!-- 데이트피커 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- <link rel="stylesheet" type="text/css" media="screen" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.14/themes/base/jquery-ui.css"> -->

<!-- 통계차트 -->
<script>
	zingchart.MODULESDIR = "https://cdn.zingchart.com/modules/";
	ZC.LICENSE = [ "569d52cefae586f634c54f86dc99e6a9",
			"ee6b7db5b51705a13dc2339db3edaf6d" ];
</script>

<script>

	var dateType = '${dateType}';
	var classification = '${classification}';
	
	$(document).ready(function() {
		var term_btn = document.getElementById(dateType); 
		$(term_btn).css({'background' : '#006400'});
		if(dateType == 'week'){
			
            var date = new Date();
            startDate = new Date(date.getFullYear(), date.getMonth(), date.getDate() - date.getDay());
            endDate = new Date(date.getFullYear(), date.getMonth(), date.getDate() - date.getDay() + 6);
            startDate = getTimeStamp(startDate, '');
            endDate = getTimeStamp(endDate, '');
			$('#datepicker').val(startDate + '-' + endDate);
		} else {
			$('#datepicker').val(getTimeStamp(new Date(), dateType));
		}
		$('#dateType').val(dateType);
		$('#sel_ca_id').val(classification);
		//주간용 날짜 변수
		var startDate;
	    var endDate;
	    
		if (dateType == 'month') {
			$('#dateTypeName').text('월간');
			//월별
			$("#datepicker").datepicker({
		        dateFormat: 'yyyyMM',
		        changeMonth: true,
		        changeYear: true,
		        showWeek : true,
		        showButtonPanel: true,
		        onClose: function(dateText, inst) {
		            var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
		            var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
		            $(this).val(getTimeStamp(new Date(year, month, 1), dateType));
		        },
		        maxDate : new Date()
		    });

		    $("#datepicker").focus(function () {
		        $(".ui-datepicker-calendar").hide();
		        $("#ui-datepicker-div").position({
		            my: "center top",
		            at: "center bottom",
		            of: $(this)
		        });
		    });
		} else if (dateType == 'week') {
			$('#dateTypeName').text('주간');
			//주간
			$('#datepicker').datepicker( {
		        showOtherMonths: true,
		        selectOtherMonths: true,
				selectWeek:true,
		        onSelect: function(dateText, inst) { 
		        	
		        	var part = dateText.split('/');
		            var date = new Date(part[2], part[0] - 1, part[1]);
		            startDate = new Date(date.getFullYear(), date.getMonth(), date.getDate() - date.getDay());
		            endDate = new Date(date.getFullYear(), date.getMonth(), date.getDate() - date.getDay() + 6);
		            startDate = getTimeStamp(startDate, '');
		            endDate = getTimeStamp(endDate, '');
					$('#datepicker').val(startDate + '-' + endDate);
		            setTimeout("applyWeeklyHighlight()", 100);
		        },
				beforeShow : function() {
					setTimeout("applyWeeklyHighlight()", 100);
				},
		        maxDate : new Date()
		    });
		} else {
			$('#dateTypeName').text('일간');
			//일간
			$( "#datepicker" ).datepicker({
				dateFormat: "yy.mm.dd",
		        maxDate : new Date()
			});
		}
		
		contact_list(1);
		contact_graph();
		
		$("#search_btn").on("click", function() {
			contact_graph();
		});
		
		$('#sel_ca_id').on('change', function() {
			classification = $('#sel_ca_id').val();
		});
		
		$(".term_btn").on('click', function() {
			var dt = $(this).val();
			if(dt == '월간'){
				dateType = 'month';
				
			} else if (dt == '주간') {
				dateType = 'week';
			} else {
				dateType = 'day';
			}
			$('#dateType_btn').val(dateType);
			$('#classification_btn').val(classification);
			
			$('#date_btn').submit();
		});
	});

	//ajax 
	function contact_list(page) {
		var pageSize = 10;
		$.ajax({
			url : '/connStat/contactListAjax',
			type : 'get',
			data : 'page=' + page + '&pageSize=' + pageSize,
			success : function(data) {
				$('#contact_list_ajax').html(data);
			}
		});
	}
	function contact_graph() {
		var params = $('form[name=search]').serialize();
		$.ajax({
			url : '/connStat/contactGraphAjax',
			type : 'get',
			data : params,
			success : function(data) {
				var cdata = {
					    "globals":{
					        "font-family":"Lucida Sans Unicode"
					    },
					    "graphset":[
					        {
					            "type":"pie",
					            "x":0,
					            "y":30,
					            "width":450,
					            "height":400,
					            "plotarea":{
					                "margin":30,
					            },
					            "tooltip":{
					                "border-width":1,
					                "border-color":"#666",
					                "border-radius":11,
					                "background-color":"#fff",
					                "color":"#000",
					                "padding":10,
					                "text-align":"left",
					                "text":"<b style='font-size:17px;'>%node-percent-value%</b><br>%plot-text",
					                "shadow":true
					            },
					            "plot":{
					                "ref-angle":90,
					                "border-width":0,
					                "value-box":{
					                    "text":"%data-index",
					                    "color":"#000",
					                    "font-size":20,
					                    "font-weight":"normal",
					                    "offset-r":"55%",
					                    "connector":{
					                        "visible":false    
					                    }
					                }
					            },//그래프
					            "series": ''
					        },
					        {
					            "type":"grid",
					            "x":480,
					            "y":70,
					            "width":400,
					            "height":400,
					            "plotarea":{
					                "margin":"15 0 0 0"
					            },
					            "options":{
					                "col-labels":["순위","구분","비율","합계"],
					                "col-widths":["15%","35%","20%","30%"],
					                "style":{
					                    ".th":{
					                        "background-color":"#fff",
					                        "color":"#666",
					                        "font-size":20,
					                        "font-weight":"normal",
					                        "border-bottom":"1px solid #aaa",
					                        "border-right":"0px solid #fff"
					                    },
					                    ".td":{
					                        "height":50,
					                        "font-size":20,
					                        "background-color":"#fff",
					                        "border-bottom":"1px solid #aaa",
					                        "font-weight":"normal",
					                        "border-right":"0px solid #fff"
					                    },
					                    ".td_1":{
					                        "offset-x":-60,
					                        "padding-left":68
					                    },
					                    ".td_2":{
					                        "offset-x":-60,
					                        "padding-left":68
					                    },
					                    ".td_3":{
					                        "offset-x":-60,
					                        "padding-left":68
					                    },
					                    ".td_0_0":{
					                        "text-align":"center",
					                        "border-radius":21,
					                        "border-top":null,
					                        "border-right":null,
					                        "border-bottom":null,
					                        "border-left":null,
					                        "border-color":"none",
					                        "border-width":8,
					                        "color":"#000"
					                    },
					                    ".td_1_0":{
					                        "text-align":"center",
					                        "border-radius":21,
					                        "border-top":null,
					                        "border-right":null,
					                        "border-bottom":null,
					                        "border-left":null,
					                        "border-color":"none",
					                        "border-width":8,
					                        "color":"#000"
					                    },
					                    ".td_2_0":{
					                        "text-align":"center",
					                        "border-radius":21,
					                        "border-top":null,
					                        "border-right":null,
					                        "border-bottom":null,
					                        "border-left":null,
					                        "border-color":"none",
					                        "border-width":8,
					                        "color":"#000"
					                    },
					                    ".td_3_0":{
					                        "text-align":"center",
					                        "border-radius":21,
					                        "border-top":null,
					                        "border-right":null,
					                        "border-bottom":null,
					                        "border-left":null,
					                        "border-color":"none",
					                        "border-width":8,
					                        "color":"#000"
					                    },
					                    ".td_4_0":{
					                        "text-align":"center",
					                        "border-radius":21,
					                        "border-top":null,
					                        "border-right":null,
					                        "border-bottom":null,
					                        "border-left":null,
					                        "border-color":"none",
					                        "border-width":8,
					                        "color":"#000"
					                    },
					                    ".td_5_0":{
					                        "text-align":"center",
					                        "border-radius":21,
					                        "border-top":null,
					                        "border-right":null,
					                        "border-bottom":null,
					                        "border-left":null,
					                        "border-color":"none",
					                        "border-width":8,
					                        "color":"#000"
					                    },
					                    ".td_6_0":{
					                        "text-align":"center",
					                        "border-radius":21,
					                        "border-top":null,
					                        "border-right":null,
					                        "border-bottom":null,
					                        "border-left":null,
					                        "border-color":"none",
					                        "border-width":8,
					                        "color":"#000"
					                    },
					                    ".td_7_0":{
					                        "text-align":"center",
					                        "border-radius":21,
					                        "border-top":null,
					                        "border-right":null,
					                        "border-bottom":null,
					                        "border-left":null,
					                        "border-color":"none",
					                        "border-width":8,
					                        "color":"#000"
					                    }
					                }
					            },//표
					            "series": ''
					        }
					    ]    
					};
				
					cdata.graphset[0].series = data.series_graph;
					cdata.graphset[1].series = data.series_table;
					zingchart.render({ 
						id: "myChart", 
						data: cdata, 
						modules : "grid"
					});
					var total = 0;
					$.each(data.series_graph, function(idx, val) {
						total += parseInt(val.values);
					})
					$('#total').text(total);
			}
		});
	}
	
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
	 
	function applyWeeklyHighlight() {
	
		$('.ui-datepicker-calendar tr').each(function() {
	
			if ($(this).parent().get(0).tagName == 'TBODY') {
				$(this).mouseover(function() {
					$(this).find('a').css({
						'background' : '#ffffcc',
						'border' : '1px solid #dddddd'
					});
					$(this).find('a').removeClass('ui-state-default');
					$(this).css('background', '#ffffcc');
				});
				
				$(this).mouseout(function() {
					$(this).css('background', '#ffffff');
					$(this).find('a').css('background', '');
					$(this).find('a').addClass('ui-state-default');
				});
			}
	
		});
	}
</script>


<div class="container_wr">


	<div class="local_ov01 local_ov">
		<input type="button" id="month" class="ov_listall term_btn" value="월간">
		<input type="button" id="week" class="ov_listall term_btn" value="주간">
		<input type="button" id="day" class="ov_listall term_btn" value="일간">
	</div>
	<form id="date_btn" action="/connStat/connStatList">
		<input type="hidden" name="dateType" id="dateType_btn">
		<input type="hidden" name="classification" id="classification_btn">
		<input type="hidden" name="page" value="1">
		<input type="hidden" name="pageSize" value="10">
	</form>

	<form name="search" id="search" class="local_sch01 local_sch" >
		<input type="hidden" name="doc" value=""> <input type="hidden"
			name="sort1" value="ct_status_sum"> <input type="hidden"
			name="sort2" value="desc"> <input type="hidden" name="page"
			value="1"> <label for="sel_ca_id" class="sound_only">검색대상</label>
		<select name="sel_ca_id" id="sel_ca_id">
			<option value="browser">브라우저</option>
			<option value="divice">접속기기</option>
			<option value="referer">유입경로</option>
			<option value="os">운영체제</option>
		</select> 
		
		<label for="datepicker"><span id="dateTypeName"></span>
			<input type="text" id="datepicker" name="datepicker" class="datepicker" placeholder="기간을 선택해주세요" readonly="readonly"/>
		</label>
		
		<input type="hidden" id="dateType" name="dateType">
		<input type="button" value="검색" class="btn_submit" id="search_btn">
	</form>

	<div>
		<label for="total_label"><span id="total_label">총합 : </span></label><span id="total"></span>
	</div>
	<div id="contact_graph_ajax">
		<div id='myChart'><a class="zc-ref" href="https://www.zingchart.com/">Charts by ZingChart</a></div>
		<!-- contact_graph_ajax 페이지 -->
	</div>

	<div class="local_desc01 local_desc">
		<p>접속자 집계 통계 리스트 입니다.</p>
	</div>


	<div id="contact_list_ajax">
		<!-- contact_list_ajax 페이지 -->
	</div>

</div>

<%@include file="../adminTail.jsp"%>