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

	var dateType = '${dateType}';
	var datepickerVal = '${datepicker}';
	console.log("dateType : " + dateType + " datepicker : " + datepickerVal);

	var guide_bar = new Array();
	var normal_bar = new Array();
	var total_line = new Array();
	<c:forEach items="${guide}" var="cnt">
		guide_bar.push(${cnt});
	</c:forEach>	
	<c:forEach items="${normal}" var="cnt">
		normal_bar.push(${cnt});
	</c:forEach>	
	<c:forEach items="${total}" var="cnt">
		total_line.push(${cnt});
	</c:forEach>
	var dateStr = new Array();
	<c:forEach items="${dateStr}" var="cnt">
		dateStr.push("${cnt}");
	</c:forEach>
	

	var spr = 0;
	var sum = 0;
	var aut = 0;
	var win = 0;
	var oth = 0;
	
	<c:forEach items="${season}" var="sea">
		if(${sea.ess_season eq 1}){
			spr = ${sea.ess_season_count};
		} else if(${sea.ess_season eq 2}){
			sum = ${sea.ess_season_count};
		} else if(${sea.ess_season eq 3}){
			aut = ${sea.ess_season_count};
		} else if(${sea.ess_season eq 4}){
			win = ${sea.ess_season_count};
		} else {
			oth = ${sea.ess_season_count};
		}
	</c:forEach>	
	
	var food = 0;
	var raz = 0;
	var sho = 0;
	var nat = 0;
	var cul = 0;
	var fes = 0;
	<c:forEach items="${theme}" var="the">
		if(${the.ess_theme eq 1}){
			food = ${the.ess_theme_count};
		} else if(${the.ess_theme eq 2}){
			raz = ${the.ess_theme_count};
		} else if(${the.ess_theme eq 3}){
			sho = ${the.ess_theme_count};
		} else if(${the.ess_theme eq 4}){
			nat = ${the.ess_theme_count};
		} else if(${the.ess_theme eq 5}){
			cul = ${the.ess_theme_count};
		} else {
			fes = ${the.ess_theme_count};
		}
	</c:forEach>	
	
	var one = 0;
	var cou = 0;
	var fri = 0;
	var fam = 0;
	var gro = 0;
	var women = 0;
	var men = 0;
	<c:forEach items="${peo}" var="p">
		if(${p.ess_peo eq 1}){
			one = ${p.ess_peo_count};
		} else if(${p.ess_peo eq 2}){
			cou = ${p.ess_peo_count};
		} else if(${p.ess_peo eq 3}){
			fri = ${p.ess_peo_count};
		} else if(${p.ess_peo eq 4}){
			fam = ${p.ess_peo_count};
		} else if(${p.ess_peo eq 5}){
			gro = ${p.ess_peo_count};
		} else if(${p.ess_peo eq 6}){
			women = ${p.ess_peo_count};
		} else {
			men = ${p.ess_peo_count};
		}
	</c:forEach>	

	
	var male = new Array();
	var female = new Array();
	<c:forEach items="${male}" var="gender">
		male.push(${gender});
	</c:forEach>		
	<c:forEach items="${female}" var="gender">
		female.push(${gender});
	</c:forEach>
	
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
		
		var term_btn = document.getElementById(dateType); 
		$(term_btn).css({'background' : '#006400'});
		
		if(datepickerVal == null || datepickerVal == ""){
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
		} else {
			$('#datepicker').val(datepickerVal);
		}
		
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
		        }
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
				}
		    });
		} else {
			$('#dateTypeName').text('일간');
			//일간
			$( "#datepicker" ).datepicker({
				dateFormat: "yy.mm.dd"
			});
		}
		
		$(".term_btn").on('click', function() {
			var dt = $(this).val();
			if(dt == '월간'){
				dateType = 'month';
			} else if (dt == '주간') {
				dateType = 'week';
			} else {
				dateType = 'day';
			}
			$('#dateType').val(dateType);
			$('#datepicker').val("");
			
			$('#search').submit();
		});
		
		$('#search_btn').on('click', function() {
			$('#dateType').val(dateType);
			$('#search').submit();
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
				                "text":"",
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
				                "values":dateStr,
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
				                    "values":guide_bar,
				                    "background-color":"#F29E4A",
				                    "bar-width":"10px",
				                    "hover-state":{
				                        "visible":false
				                    }
				                },
				                {
				                    "type":"bar",
				                    "text":"일반 에세이",
				                    "values":normal_bar,
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
				                    "values":total_line,
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
		                    "values":[spr],
		                    "text":"봄",
		                    "background-color":"#FFE08C"
		                },
		                {
		                    "values":[sum],
		                    "text":"여름",
		                    "background-color":"#5CD1E5"
		                },
		                {
		                    "values":[aut],
		                    "text":"가을",
		                    "background-color":"#CE723D"
		                },
		                {
		                    "values":[win],
		                    "text":"겨울",
		                    "background-color":"#D4F4FA"
		                },
		                {
		                    "values":[oth],
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
		                    "text":"%v 건",
		                    "shadow":false,
		                    "border-radius":3
		                }
		            },
		            "series":[
		                {
		                    "values":[food],
		                    "text":"먹거리",
		                    "background-color":"#CC3D3D"
		                },
		                {
		                    "values":[raz],
		                    "text":"레저",
		                    "background-color":"#CCA63D"
		                },
		                {
		                    "values":[sho],
		                    "text":"쇼핑",
		                    "background-color":"#9FC93C"
		                },
		                {
		                    "values":[nat],
		                    "text":"자연",
		                    "background-color":"#3DB7CC"
		                },
		                {
		                    "values":[cul],
		                    "text":"문화",
		                    "background-color":"#4641D9"
		                },
		                {
		                    "values":[fes],
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
		                    "text":"%v 건",
		                    "shadow":false,
		                    "border-radius":3
		                }
		            },
		            "series":[
		                {
		                    "values":[one],
		                    "text":"혼자",
		                    "background-color":"#CC3D3D"
		                },
		                {
		                    "values":[cou],
		                    "text":"커플",
		                    "background-color":"#CCA63D"
		                },
		                {
		                    "values":[fri],
		                    "text":"친구들과",
		                    "background-color":"#9FC93C"
		                },
		                {
		                    "values":[fam],
		                    "text":"가족",
		                    "background-color":"#3DB7CC"
		                },
		                {
		                    "values":[gro],
		                    "text":"단체",
		                    "background-color":"#4641D9"
		                },
		                {
		                    "values":[women],
		                    "text":"여자끼리",
		                    "background-color":"#D941C5"
		                },
		                {
		                    "values":[men],
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
                    "hook":"node:plot=2;index=1"
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
                    "hook":"node:plot=2;index=3",
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
                "values": "0:10:1",
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
                    "values": male,
                    "background-color": "#1E82FF"
                },
                {
                    "values": female,
                    "background-color": "#FF4646"
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

<div class="mypage_right">

	<ul class="tab">
		<li><a href="/artstat/artstatEssay" class="select web1">Essay</a></li>
		<li><a href="/artstat/artstatPostcard" class="web2">PostCard</a></li>
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
	<form id="search" action="/artstat/artstatEssay">
		<label for="datepicker"><span id="dateTypeName"></span>
			<input type="text" id="datepicker" name="datepicker" class="datepicker" placeholder="기간을 선택해주세요" readonly="readonly"/>
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