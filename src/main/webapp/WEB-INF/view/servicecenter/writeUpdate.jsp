<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../head.jsp" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/js/font-awesome/css/font-awesome.min.css">


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
	//var j = 1;
	var j = $('ul.file_list').length;
	$('ul.file_list').on("click",".plus_btn",function(){
		if( j < 5){
			j++;
			$(".file_list").append("<li class='file_list_li"+j+"'><b>첨부 파일 :</b> &nbsp;&nbsp; <input type='file' name='attachments' >");
		} else {
			alert(" 최대 5개 까지 입니다.");
			return ;	
		}
	});
	
	$('ul.file_list').on("click",".minus_btn",function(){
	 if(j<2){
            return false;
        }else{
   			$('.file_list_li'+j).remove();
   			j--;
        }
	});
	
	
});

function fileDelete(buttonSection){
	
	confirm('해당 파일을 지우시겠습니까?');
	
	var fileName = $(buttonSection).siblings("label").text();
	
	$.ajax({
		type: "POST",
		url:"/article/deleteFileAjax",
		data :"fileName="+encodeURI(fileName),
		success: function(data){
			
			if(data == 0){
				alert('db 오류 발생');
			}else{
				alert('정상적으로 파일삭제가 이루어 졌습니다.')
				
				var ulLength = $('ul.file_list').length;
				if(ulLength == 1){
					$(".file_list").append("<li class='file_list_li'><b>첨부 파일 :</b> &nbsp;&nbsp; <input type='file' name='attachments' >&nbsp;&nbsp;&nbsp;&nbsp;<div class='plus_btn'>+</div> <div class='minus_btn'>-</div>");			
					$(buttonSection).parents('li').remove();
				}
			}
			
		}
	});
	
	
}


</script>


<div class="main_con" id="main_con">

<div id="container">
	<form action="/article/updateArticle" method="post" id="frm" enctype="multipart/form-data">
	

	<div class="write_warp">
		<input type="hidden" readonly="readonly" name="board_id" value="${articleVo.board_id}">
		<input type="hidden" readonly="readonly" name="art_id" value="${articleVo.art_id}">
		<input type="hidden" readonly="readonly" name="art_par_id" value="${articleVo.art_par_id}"/>
	</div>

	<div class="write_warp">
		<ul class="write_warpL">
			<li><b>비밀글 &nbsp;&nbsp;: </b></li>
			<input type="checkbox" name="art_secret" >
		</ul>
	</div>
	
	
	<div class="write_warp">
		<ul class="write_warpL">
			<li><b>이름 &nbsp;&nbsp;: </b></li>
			<li><label > ${loginInfo.mem_id} </label></li>
			<input type="hidden" id="userId" name="${loginInfo.mem_id}">
		</ul>
				
	</div>
	
	<div class="write_warp">
		<ul class="write_warpL">
			<li><b>제목  &nbsp;&nbsp;: </b></li>
			<li><input id="art_title" name="art_title" type="text" value="${articleVo.art_title}"></li>
		</ul>
	</div>
	
	<div class="write_warp">
		<h3>내용</h3><br/>
			<textarea name="art_cnt" id="smarteditor" rows="10" cols="100" style="width:100%; height:500px;">
				${articleVo.art_cnt}
			</textarea> 
	</div>
	
		
	
	
	<div class="write_warp">
		<ul class="file_list">
			<c:choose>
				<c:when test="${fn:length(attachmentList) == 0}">
					<li class="file_list_li1}"><b>첨부 파일 :</b> &nbsp;&nbsp; <input type="file" name="attachments"><label>${fv.fl_file}</label>&nbsp;&nbsp;&nbsp;&nbsp;<div class="plus_btn">+</div> <div class="minus_btn">-</div></li>
				</c:when>
				
				<c:otherwise>
					<c:forEach items="${attachmentList}" var="fv" begin="0" end="5" varStatus="sta">
						<c:choose>
							<c:when test="${sta.index == 0}">
								<li class="file_list_li${sta.index+1}"><b>첨부 파일 :</b> &nbsp;&nbsp; <label>${fv.att_file_name}</label>&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" class="btn_bd col_02" onclick="fileDelete(this)" value="삭제"/>&nbsp;&nbsp;&nbsp;&nbsp;<div class="plus_btn">+</div> <div class="minus_btn">-</div></li>	
							</c:when>
							<c:otherwise>
								<li class="file_list_li${sta.index+1}"><b>첨부 파일 :</b> &nbsp;&nbsp; <label>${fv.att_file_name}</label><input type="button" class="btn_bd col_02" onclick="fileDelete(this)" value="삭제"/></li>	
							</c:otherwise>
						</c:choose>
						<input type="hidden" name="att_id" value="${fv.att_id}">
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</ul>
		
	</div>

	
		<input type="submit" class="btn_bd col_03" id="savebutton"  value="수정 완료" />
		<input type="button" class="btn_bd col_02" onclick="javascript:history.back()" value="취소" />
	
	</form>
	
</div>

</div>