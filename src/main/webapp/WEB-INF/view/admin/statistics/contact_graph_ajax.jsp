<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<script type="text/javascript">
var cdata = {
	    "globals":{
	        "font-family":"Lucida Sans Unicode"
	    },
	    "graphset":[
	        {
	            "type":"pie",
	            "x":0,
	            "y":0,
	            "width":362,
	            "height":250,
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
	                    "font-size":11,
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
	            "x":362,
	            "y":0,
	            "width":362,
	            "height":250,
	            "plotarea":{
	                "margin":"15 0 0 0"
	            },
	            "options":{
	                "col-labels":[" ","TYPE","PCT","TOTAL"],
	                "col-widths":["30","50%","20%","30%"],
	                "style":{
	                    ".th":{
	                        "background-color":"#fff",
	                        "color":"#666",
	                        "font-size":10,
	                        "font-weight":"normal",
	                        "border-bottom":"1px solid #aaa",
	                        "border-right":"0px solid #fff"
	                    },
	                    ".td":{
	                        "height":30,
	                        "background-color":"#fff",
	                        "border-bottom":"1px solid #aaa",
	                        "font-weight":"normal",
	                        "border-right":"0px solid #fff"
	                    },
	                    ".td_1":{
	                        "offset-x":-30,
	                        "padding-left":38
	                    },
	                    ".td_2":{
	                        "offset-x":-30,
	                        "padding-left":38
	                    },
	                    ".td_3":{
	                        "offset-x":-30,
	                        "padding-left":38
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
	                        "background-color":"#FF9900",
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
	                        "background-color":"#9DCC09",
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
	                        "background-color":"#71BDE9",
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
	                        "background-color":"#DE6829",
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
	                        "background-color":"#EDCE00",
	                        "color":"#000"
	                    }
	                }
	            },//표
	            "series":[
	                {
	                    "values":["1", "Technical", "50%", "1023"]    
	                },
	                {
	                    "values":["2", "Creative", "30%", "614"]    
	                },
	                {
	                    "values":["3", "Management", "10%", "204"]    
	                },
	                {
	                    "values":["4", "Marketing", "7%", "143"]    
	                },
	                {
	                    "values":["5", "Other", "3%", "61"]    
	                }
	            ]
	        }
	    ]    
	};
	 
	zingchart.render({ 
		id: "myChart", 
		data: cdata, 
		modules : "grid"
	});
</script>

<div id='myChart'><a class="zc-ref" href="https://www.zingchart.com/">Charts by ZingChart</a></div>