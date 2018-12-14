<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../head.jsp" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/js/font-awesome/css/font-awesome.min.css">

<!-- jQuery -->
<!-- <script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/jquery-ui.min.js"></script>-->

<script type="text/javascript" src="/js/jquery-3.3.1.min.js"></script>


<script src="/SE2/js/HuskyEZCreator.js"></script>
<script type="text/javascript">
var oEditors = []; // 개발되어 있는 소스에 맞추느라, 전역변수로 사용하였지만, 지역변수로 사용해도 전혀 무관 함.

$(document).ready(function() {
	// Editor Setting
	nhn.husky.EZCreator.createInIFrame({
		oAppRef : oEditors, // 전역변수 명과 동일해야 함.
		elPlaceHolder : "smarteditor", // 에디터가 그려질 textarea ID 값과 동일 해야 함.
		sSkinURI : "/SE2/SmartEditor2Skin.html", // Editor HTML
		fCreator : "createSEditor2", // SE2BasicCreator.js 메소드명이니 변경 금지 X
		htParams : {
			// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseToolbar : true,
			// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseVerticalResizer : true,
			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
			bUseModeChanger : true, 
		}
	});

	// 전송버튼 클릭이벤트
	$("#savebutton").click(function(){
		if(confirm("저장하시겠습니까?")) {
			// id가 smarteditor인 textarea에 에디터에서 대입
			oEditors.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []);

			// 이부분에 에디터 validation 검증
			if(validation()) {
				$("#frm").submit('');
			}
		}
	})
});

// 필수값 Check
function validation(){
	var contents = $.trim(oEditors[0].getContents());
	if(contents === '<p>&nbsp;</p>' || contents === ''){ // 기본적으로 아무것도 입력하지 않아도 <p>&nbsp;</p> 값이 입력되어 있음. 
		alert("내용을 입력하세요.");
		oEditors.getById['smarteditor'].exec('FOCUS');
		return false;
	}

	return true;
}


$(document).ready(function(){
	var j = 1;
	$(".plus_btn").on("click",function(){
		if( j < 5){
			j++;
			$(".file_list").append("<li class='file_list_li"+j+"'><b>첨부 파일 :</b> &nbsp;&nbsp; <input type='file' name='fl_flie' >");
		} else {
			alert("파일은 최대 5개 까지 입니다.");
			return ;	
		}
	});
	
	$(".minus_btn").on("click",function(){
	 if(j<2){
            return false;
        }else{
   			$('.file_list_li'+j).remove();
   			j--;
        }
	});
});



</script>


<div class="main_con" id="main_con">

<div id="container">
	<form action="/board/insertBoard" method="post" id="frm" enctype="multipart/form-data">
	

	<div class="write_warp">
		<select name="nt_id">
			<c:forEach items="${menuList}" var="ml">
				<option value="${ml.nt_id}">${ml.nt_name}</option>
			</c:forEach>
		</select>
	</div>

	
	
	<div class="write_warp">
		<ul class="write_warpL">
			<li><b>이름 &nbsp;&nbsp;: </b></li>
			<li><label > ${loginInfo.mem_id} </label></li>
			<input type="hidden" id="userId" name="mem_id">
		</ul>
				
	</div>
	
	<div class="write_warp">
		<ul class="write_warpL">
			<li><b>제목  &nbsp;&nbsp;: </b></li>
			<li><input id="po_subject" name="po_subject" type="text"></li>
		</ul>
	</div>
	
	<div class="write_warp">
		<h3>내용</h3><br/>
			<textarea name="smarteditor" id="smarteditor" rows="10" cols="100" style="width:100%; height:500px;"></textarea> 
	</div>
	
		
	
	
	<div class="write_warp">
		<ul class="file_list">
			<li class="file_list_li1"><b>첨부 파일 :</b> &nbsp;&nbsp; <input type="file" name="fl_flie" multiple="multiple" ><div class="plus_btn">+</div> <div class="minus_btn">-</div></li>	
		</ul>
	</div>

	
		<input type="submit" class="btn_bd col_01" id="savebutton"  value="작성 완료" />
		<input type="button" class="btn_bd col_02" onclick="javascript:history.back()" value="취소" />
	
	</form>
	
</div>

</div>

<%@include file="../tail.jsp" %> 