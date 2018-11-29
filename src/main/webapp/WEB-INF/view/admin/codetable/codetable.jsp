<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../adminHead.jsp" %>


<link rel="stylesheet" href="/css/zTreeStyle/zTreeStyle.css" type="text/css">
<style>
	body {
	background-color: white;
	margin:0; padding:0;
	text-align: center;
	}
	div, p, table, th, td {
		list-style:none;
		margin:0; padding:0;
		color:#333; font-size:12px;
		font-family:dotum, Verdana, Arial, Helvetica, AppleGothic, sans-serif;
	}
	#testIframe {margin-left: 10px;}
</style> 
<script type="text/javascript" src="/js/zTree_v3/jquery.ztree.core.js"></script>   
   
<script type="text/javascript" >
	var zTree; 
	
	var setting = {
		view: {
			dblClickExpand: false,
			showLine: true,
			selectedMulti: false
		},
		data: {
			simpleData: {
				enable:true,
				idKey: "code",
				pIdKey: "p_code",
				rootPId: ""
			}
		},
		callback: {
			beforeClick: function(treeId, treeNode) {
				setClear();
				 
				 $('#code').val(treeNode.code);
				 $('#p_code').val(treeNode.p_code);				 
				 $('#level').val(treeNode.level);				 
				 $('#name').val(treeNode.name);
				 $('#icon').val(treeNode.icon);	
				 $('#country').val(treeNode.country);
				
				 if(treeNode.level !='2'){
					 $('#add_level').val( parseInt(treeNode.level,10) +1);
					 $('#add_p_code').val(treeNode.code);
				 }					 		 
				return true; 
			}
		}
	};
	
	var zNodes =[];
	
	$(document).ready(function(){ 
		getCa();
	});
	function setClear(){
	 	$('#code').val('');
		 $('#p_code').val('');
		 $('#level').val('');
		 $('#name').val('');
		 $('#icon').val('');	
		 $('#country').val('');
		 $('#add_level').val('');
		 $('#add_p_code').val('');
		 $('#add_name').val('');
		 $('#add_icon').val('');
		 $('#add_country').val('');
	}
	
	//조회
	function getCa(){
		$.ajax({
	        type: "POST"
	        ,url: "" 
	        ,data: {
	        	mode:"listAdmin" 
	        }
	        ,beforeSend: function()		{//console.log("beforeSend");
	        },complete: function()		{//console.log("complete");
	        },success: function(data)	{//console.log(data); 	     
	        	var t = $("#tree");
	       		zNodes = data.list;
	       		t = $.fn.zTree.init(t, setting, zNodes); 
				var zTree = $.fn.zTree.getZTreeObj("tree");	
				setClear();		 
	        },fail: function() 			{//console.log("fail"); 
	        },error:function(request,status,error){
	       		console.log(" error code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	     		 }	 
	    });
	}
	//하위추가
	function addCa(){ 
		if($('#add_p_code').val()==''){
			alert('상위코드를 선택하세요.\r\n카테고리는3단계까지 가능합니다.');
			return false;
		} 
		if($('#add_name').val()==''){
			alert('신규 코드명을 입력하세요.');
			return false;
		} 
		 
		$.ajax({
	        type: "POST"
	        ,url: "" 
	        ,data: {
	        	mode:"save" 
	        	,pcode:$('#add_p_code').val()
	        	,level: $('#add_level').val()
	        	,name:$('#add_name').val()
	        	,icon:$('#add_icon').val()
	        	,country:$('#add_country').val()
	        }
	        ,beforeSend: function()		{//console.log("beforeSend");
	        },complete: function()		{//console.log("complete");
	        },success: function(data)	{//console.log(data); 	     
	        	 alert('등록되었습니다.');
	       	 	 getCa();
	       	 	 setClear();
	        },fail: function() 			{//console.log("fail"); 
	        },error:function(request,status,error){
	       		console.log(" error code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	     		 }	 
	    });	    
	}
	//수정
	function updateCa(){ 
		if($('#code').val()==''){
			alert('코드를 선택하세요.');
			return false;
		} 
		if($('#name').val()==''){
			alert('코드명을 입력하세요.');
			return false;
		}  
		 
		$.ajax({
	        type: "POST"
	        ,url: "" 
	        ,data: {
	        	mode:"save" 
	        	,code:$('#code').val()
	        	,name:$('#name').val()
	
	        }
	        ,beforeSend: function()		{//console.log("beforeSend");
	        },complete: function()		{//console.log("complete");
	        },success: function(data)	{//console.log(data); 	     
	        	 alert('수정되었습니다.');
	       	 	 getCa();
	       	 	setClear();
	        },fail: function() 			{//console.log("fail"); 
	        },error:function(request,status,error){
	       		console.log(" error code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	     		 }	 
	    });	    
	}
	//삭제
	function deleteCa(){
		if($('#code').val() == ''){
			alert('삭제할 코드를 선택하세요.');
			return false;
		}
		if($('#level').val()=='0'){
			alert('1차 카테고리는 삭제할 수 없습니다.');
			return false;
		}
		$.ajax({
	        type: "POST"
	        ,url: "" 
	        ,data: {
	        	mode:"delete" 
	        	,code:$('#code').val() 
	        }
	        ,beforeSend: function()		{//console.log("beforeSend");
	        },complete: function()		{//console.log("complete");
	        },success: function(data)	{//console.log(data); 	     
	       	 	 alert('삭제되었습니다.');
	       	 	 getCa();
	       	 	setClear();
	        },fail: function() 			{//console.log("fail"); 
	        },error:function(request,status,error){
	       		console.log(" error code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	     		 }	 
	    });
	}
	
	function loadReady() {
		var bodyH = demoIframe.contents().find("body").get(0).scrollHeight,
		htmlH = demoIframe.contents().find("html").get(0).scrollHeight,
		maxH = Math.max(bodyH, htmlH), minH = Math.min(bodyH, htmlH),
		h = demoIframe.height() >= maxH ? minH:maxH ;
		if (h < 530) h = 530;
		demoIframe.height(h);
	}
</script>

<TABLE border=0 height=600px align=left>
	<TR>
		<TD rowspan="2" width=260px align=left valign=top style="BORDER-RIGHT: #999999 1px dashed">
			<ul id="tree" class="ztree" style="width:260px; overflow:auto;"></ul>
		</TD>
		<TH height="20px" align=left valign=top >수정</TH> 
		<TD align=left valign=top >코드<TD>
		<TD align=left valign=top >
			<input readonly type="text" id="code" />
		</TD> 
		<TD align=left valign=top >상위코드<TD>
		<TD align=left valign=top >
			<input readonly type="text" id="p_code" />
		</TD> 
		<TD align=left valign=top >레벨<TD>
		<TD align=left valign=top >
			<input readonly type="text" id="level" />
		</TD> 
		<TD align=left valign=top >코드명<TD>
		<TD align=left valign=top >
			<input type="text" id="name" />
		</TD> 

		<TD align=left valign=top >
			<input type="button" value="수정" onclick="updateCa();" /> 
			<input type="button" value="삭제" onclick="deleteCa();" />
		</TD>  
	</tr>
	<tr>
		<TH align=left valign=top >하위추가</TH> 
		<TD align=left valign=top ><TD>
		<TD align=left valign=top ></TD> 
		<TD align=left valign=top >상위코드<TD>
		<TD align=left valign=top >
			<input readonly type="text" id="add_p_code" />
		</TD> 
		<TD align=left valign=top >레벨<TD>
		<TD align=left valign=top >
			<input readonly type="text" id="add_level" />
		</TD> 
		<TD align=left valign=top >코드명<TD>
		<TD align=left valign=top >
			<input type="text" id="add_name" />
		</TD> 
		<TD align=left valign=top >
			<input type="button" value="신규" onclick="addCa();" />
			<input type="button" value="초기화" onclick="setClear();" />
		</td>	
	</TR>
</TABLE> 

<%@include file="../adminTail.jsp" %>