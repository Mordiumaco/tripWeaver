<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../adminHead.jsp"%>

<script src="https://cdn.zingchart.com/zingchart.min.js"></script>

<style>
@import 'https://fonts.googleapis.com/css?family=Open+Sans';

html, body {
	height: 100%;
	width: 100%;
	margin: 0;
	padding: 0;
}

#myChart {
	height: 500px;
	width: 100%;
	min-height: 150px;
}

.zc-ref {
	display: none;
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
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- <link rel="stylesheet" type="text/css" media="screen" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.14/themes/base/jquery-ui.css"> -->

<!-- 통계차트 -->
<script src="https://cdn.zingchart.com/zingchart.min.js"></script>
<script> 
	zingchart.MODULESDIR = "https://cdn.zingchart.com/modules/";
	ZC.LICENSE = ["569d52cefae586f634c54f86dc99e6a9","ee6b7db5b51705a13dc2339db3edaf6d"];
</script>
<script>

	$('.content li').hide();
	$('.content li#web1').show();
	$('.tab a').click(function(){
		$('.tab a').removeClass('select');
		//모든 a태그에 select 클래스 없애준다.
		$(this).addClass('select');
		//클릭한 a태그에 select 클래스 적용
		$('.content li').hide();//모든 내용을 안보이게 해줌
		$($(this).attr('href')).slideDown();
	});

	$(document).ready(function() {
		$('#datepicker').val('${year}.${input_str_day}');
		$( "#datepicker" ).datepicker({
			dateFormat: "yy.mm.dd"
		});
		
		$('#search_btn').on('click', function() {
			$('#conStat_form').submit();
		});
		
		zingchart.THEME="classic";
		
		var myConfig_count = {
				 "graphset":[
				        {
				            "globals": {
				                "font-family": "Arial"
				            },
				            "type":"mixed",
				            "width":"100%",
				            "background-color":"#FFFFFF",
				            "title":{
				                "text":"Essay 게시물 수 : 000건",
				                "x":"40px",
				                "y":"5px",
				                "align":"left",
				                "bold":false,
				                "font-size":"20px",
				                "font-color":"#000000",
				                "background-color":"none"
				            },
				            "legend":{
				                "x":"32px",
				                "y":"80px",
				                "layout":"float",
				                "background-color":"none",
				                "toggle-action":"remove",
				                "border-width":0,
				                "shadow":0,
				                "marker":{
				                    "type":"circle"
				                },
				                "item":{
				                    "font-color":"#7E7E7E"
				                }
				            },
				            "plot":{
				                "bar-space":20
				            },
				            "plotarea":{
				                "margin":"125px 45px 30px 45px"
				            },
				            "scale-x":{
				                "values":["WEEK 1","WEEK 2","WEEK 3","WEEK 4"],
				                "line-color":"#D9D7D5",
				                "line-width":"1px",
				                "tick":{
				                    "visible":false
				                },
				                "guide":{
				                    "visible":false
				                },
				                "item":{
				                    "color":"#8B8B8B"
				                }
				            },
				            "scale-y":{
				                "values":"0:25:5",
				                "line-color":"#D9D7D5",
				                "line-width":"1px",
				                "tick":{
				                    "visible":false
				                },
				                "guide":{
				                    "line-style":"dotted"
				                },
				                "item":{
				                    "color":"#8B8B8B"
				                }
				            },
				            "series":[
				                {
				                    "type":"bar",
				                    "text":"가이드 에세이",
				                    "values":[15,10,4,13],
				                    "background-color":"#F29E4A",
				                    "bar-width":"10px",
				                    "hover-state":{
				                        "visible":false
				                    }
				                },
				                {
				                    "type":"bar",
				                    "text":"일반 에세이",
				                    "values":[3,2,4,5],
				                    "background-color":"#7BBADE",
				                    "bar-width":"10px",
				                    "hover-state":{
				                        "visible":false
				                    }
				                },
				                {
				                    "type":"line",
				                    "text":"합계",
				                    "aspect":"spline",
				                    "values":[22,14,13,24],
				                    "line-color":"#8B8B8B",
				                    "line-width":"2px",
				                    "highlight":false,
				                    "marker":{
				                        "background-color":"#FFFFFF",
				                        "border-color":"#8B8B8B",
				                        "border-width":"2px",
				                        "shadow":false
				                    }
				                }
				            ]
				        }
				    ]
			};
		
		var myChart_class = {
		    "layout":"h",
		     "globals":{
		        "font-family":"Roboto"
		    },
		    "graphset":[
		        {
		            "type":"pie",
		            "background-color":"#FFFFFF",
		            "legend":{
		                "background-color":"none",
		                "border-width":0,
		                "shadow":false,
		                "layout":"float",
		                "margin":"auto auto 16% auto",
		                "marker":{
		                    "border-radius":3,
		                    "border-width":0
		                },
		                "item":{
		                    "color":"%backgroundcolor"
		                }
		            },
		            "title":{
		                "text":"",
		                "background-color":"none",
		                "font-size":16,
		                "color":"#626262",
		                "x":-20,
		                "y":80
		            },
		            "plotarea":{
		                "background-color":"#FFFFFF",
		                "border-color":"#DFE1E3",
		                "border-width":1,
		                "border-radius":3,
		                "margin":"15% 5%"
		            },
		            "labels":[
		                {
		                    "x":"45%",
		                    "y":"47%",
		                    "width":"10%",
		                    "text":"시즌",
		                    "font-size":24
		                }    
		            ],
		            "plot":{
		                "size":100,
		                "slice":70,
		                "margin-right":100,
		                "border-width":0,
		                "shadow":0,
		                "value-box":{
		                    "visible":false
		                },
		                "tooltip":{
		                    "text":"%v 건",
		                    "shadow":false,
		                    "border-radius":3
		                }
		            },
		            "series":[
		                {
		                    "values":[12],
		                    "text":"봄",
		                    "background-color":"#FFE08C"
		                },
		                {
		                    "values":[22],
		                    "text":"여름",
		                    "background-color":"#5CD1E5"
		                },
		                {
		                    "values":[15],
		                    "text":"가을",
		                    "background-color":"#CE723D"
		                },
		                {
		                    "values":[11],
		                    "text":"겨울",
		                    "background-color":"#D4F4FA"
		                },
		                {
		                    "values":[8],
		                    "text":"무관",
		                    "background-color":"#D5D5D5"
		                }
		            ]
		        },
		        {
		            "type":"pie",
		            "background-color":"#FFFFFF",
		            "legend":{
		                "background-color":"none",
		                "border-width":0,
		                "shadow":false,
		                "layout":"float",
		                "margin":"auto auto 16% auto",
		                "marker":{
		                    "border-radius":3,
		                    "border-width":0
		                },
		                "item":{
		                    "color":"%backgroundcolor"
		                }
		            },
		            "title":{
		                "text":"",
		                "background-color":"none",
		                "color":"#626262",
		                "font-size":16,
		                "x":-52,
		                "y":80
		            },
		            "plotarea":{
		                "background-color":"#FFFFFF",
		                "border-color":"#DFE1E3",
		                "border-width":1,
		                "border-radius":3,
		                "margin":"15% 5%"
		            },
		            "labels":[
		                {
		                    "x":"45%",
		                    "y":"47%",
		                    "width":"10%",
		                    "text":"테마",
		                    "font-size":24
		                }    
		            ],
		            "plot":{
		                "size":100,
		                "slice":70,
		                "border-width":0,
		                "shadow":0,
		                "value-box":{
		                    "visible":false
		                },
		                 "tooltip":{
		                    "text":"%v 건 몇%",
		                    "shadow":false,
		                    "border-radius":3
		                }
		            },
		            "series":[
		                {
		                    "values":[2.33],
		                    "text":"먹거리",
		                    "background-color":"#CC3D3D"
		                },
		                {
		                    "values":[2.02],
		                    "text":"레저",
		                    "background-color":"#CCA63D"
		                },
		                {
		                    "values":[1.85],
		                    "text":"쇼핑",
		                    "background-color":"#9FC93C"
		                },
		                {
		                    "values":[1.85],
		                    "text":"자연",
		                    "background-color":"#3DB7CC"
		                },
		                {
		                    "values":[1.85],
		                    "text":"문화",
		                    "background-color":"#4641D9"
		                },
		                {
		                    "values":[1.85],
		                    "text":"축제",
		                    "background-color":"#D941C5"
		                }
		            ]
		        },
		        {
		            "type":"pie",
		            "background-color":"#FFFFFF",
		            "legend":{
		                "background-color":"none",
		                "border-width":0,
		                "shadow":false,
		                "layout":"float",
		                "margin":"auto auto 16% auto",
		                "marker":{
		                    "border-radius":3,
		                    "border-width":0
		                },
		                "item":{
		                    "color":"%backgroundcolor"
		                }
		            },
		            "title":{
		                "text":"",
		                "background-color":"none",
		                "color":"#626262",
		                "font-size":16,
		                "x":-52,
		                "y":80
		            },
		            "plotarea":{
		                "background-color":"#FFFFFF",
		                "border-color":"#DFE1E3",
		                "border-width":1,
		                "border-radius":3,
		                "margin":"15% 5%"
		            },
		            "labels":[
		                {
		                    "x":"45%",
		                    "y":"47%",
		                    "width":"10%",
		                    "text":"인원",
		                    "font-size":24
		                }    
		            ],
		            "plot":{
		                "size":100,
		                "slice":70,
		                "border-width":0,
		                "shadow":0,
		                "value-box":{
		                    "visible":false
		                },
		                 "tooltip":{
		                    "text":"%v BN",
		                    "shadow":false,
		                    "border-radius":3
		                }
		            },
		            "series":[
		                {
		                    "values":[2.33],
		                    "text":"혼자",
		                    "background-color":"#CC3D3D"
		                },
		                {
		                    "values":[2.02],
		                    "text":"커플",
		                    "background-color":"#CCA63D"
		                },
		                {
		                    "values":[1.85],
		                    "text":"친구들과",
		                    "background-color":"#9FC93C"
		                },
		                {
		                    "values":[1.85],
		                    "text":"가족",
		                    "background-color":"#3DB7CC"
		                },
		                {
		                    "values":[1.85],
		                    "text":"단체",
		                    "background-color":"#4641D9"
		                },
		                {
		                    "values":[1.85],
		                    "text":"여자끼리",
		                    "background-color":"#D941C5"
		                },
		                {
		                    "values":[1.85],
		                    "text":"남자끼리",
		                    "background-color":"#747474"
		                }
		            ]
		        }
		    ]
		};
		
		var myChart_writer = 
        {
            "type": "bar",
            "stacked": true,
            "stack-type": "normal",
            "background-color": "#FFFFFF",
            "title": {
                "text": "성별, 연령대별",
                "font-family": "arial",
                "x": "40px",
                "y": "5px",
                "align": "left",
                "bold": false,
                "font-size": "16px",
                "font-color": "#000000",
                "background-color": "none"
            },
            "plot": {
                "bar-width": "25px",
                "hover-state": {
                    "visible": false
                },
                "animation":{
                  "delay":300,
                  "sequence":1
                }
            },
            "labels":[
                {
                    "text": "남성",
                    "background-color": "#1E82FF",
                    "font-size": "14px",
                    "font-family": "arial",
                    "font-weight": "normal",
                    "font-color": "#FFFFFF",
                    "padding": "10%",
                    "border-radius": "3px",
                    "offset-y":-30,
                    "shadow": false,
                    "callout": true,
                    "callout-height": "10px",
                    "callout-width": "15px",
                    "hook":"node:plot=2;index=4"
                },
                {
                    "text": "여성",
                    "background-color": "#FF4646",
                    "font-size": "14px",
                    "font-family": "arial",
                    "font-weight": "normal",
                    "font-color": "#FFFFFF",
                    "padding": "10%",
                    "border-radius": "3px",
                    "shadow": false,
                    "callout": true,
                    "callout-height": "10px",
                    "callout-width": "15px",
                    "hook":"node:plot=2;index=5",
                    "offset-y": -30
                }
            ],
            "scale-x": {
                "values": [
                    "0-9",
                    "10-19",
                    "20-29",
                    "30-39",
                    "40-49",
                    "50-59",
                    "60-"
                ],
                "line-color": "#7E7E7E",
                "tick": {
                    "visible": false
                },
                "guide": {
                    "visible": false
                },
                "item": {
                    "font-family": "arial",
                    "font-color": "#8B8B8B"
                }
            },
            "scale-y": {
                "values": "0:70000:10000",
                "short": true,
                "line-color": "#7E7E7E",
                "tick": {
                    "visible": false
                },
                "guide": {
                    "line-style": "solid"
                },
                "item": {
                    "font-family": "arial",
                    "font-color": "#8B8B8B"
                }
            },
            "series": [
                {
                    "values": [
                        15000,
                        12000,
                        42000,
                        13000,
                        19500,
                        9750,
                        11500
                    ],
                    "background-color": "#1E82FF"
                },
                {
                    "values": [
                        13000,
                        8000,
                        5000,
                        20000,
                        17000,
                        10000,
                        34000
                    ],
                    "background-color": "#FF4646"
                },
                {
                    "values": [
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0
                    ],
                    "background-color": "#90A23B"
                }
            ],
            "tooltip": {
                "visible": false
            }
        }
;
		 
		zingchart.render({ 
			id : 'myChart_count', 
			data : myConfig_count, 
		});
		zingchart.render({ 
			id : 'myChart_class', 
			data : myChart_class, 
		});
		zingchart.render({ 
			id : 'myChart_writer', 
			data : myChart_writer, 
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

<div class="mypage_right">

	<ul class="tab">
		<li><a href="#web1" class="select web1">Essay</a></li>
		<li><a href="#web2" class="web2">PostCard</a></li>
	</ul>

	<ul class="content">
		<li id="web1"></li>
		<li id="web2"></li>
	</ul>

</div>
<div class="container_art">
	<div class="local_ov01 local_ov">
		<input type="button" id="month" class="ov_listall term_btn" value="월간">
		<input type="button" id="week" class="ov_listall term_btn" value="주간">
		<input type="button" id="day" class="ov_listall term_btn" value="일간">
	</div>
	<form id="date_btn" action="/">
		<input type="hidden" name="dateType" id="dateType_btn">
		<input type="hidden" name="classification" id="classification_btn">
		<input type="hidden" name="page" value="1">
		<input type="hidden" name="pageSize" value="10">
	<label for="datepicker"><span id="dateTypeName"></span>
		<input type="text" id="datepicker" name="datepicker" class="datepicker" placeholder="기간을 선택해주세요"/>
	</label>
	
	<input type="hidden" id="dateType" name="dateType">
	<input type="button" value="검색" class="btn_submit" id="search_btn">
	</form>
</div>

<div id="myChart_count">
	<a class="zc-ref" href="https://www.zingchart.com">Powered by ZingChart</a>
</div>
<div id="myChart_class">
	<a class="zc-ref" href="https://www.zingchart.com">Powered by ZingChart</a>
</div>
<div id="myChart_writer">
	<a class="zc-ref" href="https://www.zingchart.com">Powered by ZingChart</a>
</div>

<%@include file="../adminTail.jsp"%>