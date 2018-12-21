<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../head.jsp" %>
<link rel="stylesheet" href="/css/flexslider2.css" type="text/css" media="screen" />


<script type="text/javascript">
//실시간 이미지 섬네일 변경
function imageView1(e){
	var file = e.target.files;
	var fileArr = Array.prototype.slice.call(file);	
	var fileValue = $("#input_img1").val().split("\\");
	var fileName = fileValue[fileValue.length-1]; // 파일명
	fileArr.forEach(function(f){
		if(!f.type.match("image.*")){
			alert('미리보기는 이미지 파일만 가능합니다.');
			return;
		}
		if(fileName != "" ){
			$("#btn_delAttach1").show();
			
		}else{
			$("#btn_delAttach1").hide();
		}
		sel_file=f;
		
		var reader = new FileReader();
		reader.onload = function(e){
			$("#img1").attr('src',e.target.result);
		}
		reader.readAsDataURL(f);
	});
}

function imageView2(e){
	var file = e.target.files;
	var fileArr = Array.prototype.slice.call(file);	
	var fileValue = $("#input_img2").val().split("\\");
	var fileName = fileValue[fileValue.length-1]; // 파일명
	fileArr.forEach(function(f){
		if(!f.type.match("image.*")){
			alert('미리보기는 이미지 파일만 가능합니다.');
			return;
		}
		if(fileName != "" ){
			$("#btn_delAttach2").show();
			
		}else{
			$("#btn_delAttach2").hide();
		}
		sel_file=f;
		
		var reader = new FileReader();
		reader.onload = function(e){
			$("#img2").attr('src',e.target.result);
		}
		reader.readAsDataURL(f);
	});
}

function imageView3(e){
	var file = e.target.files;
	var fileArr = Array.prototype.slice.call(file);	
	var fileValue = $("#input_img3").val().split("\\");
	var fileName = fileValue[fileValue.length-1]; // 파일명
	fileArr.forEach(function(f){
		if(!f.type.match("image.*")){
			alert('미리보기는 이미지 파일만 가능합니다.');
			return;
		}
		if(fileName != "" ){
			$("#btn_delAttach3").show();
			
		}else{
			$("#btn_delAttach3").hide();
		}
		sel_file=f;
		
		var reader = new FileReader();
		reader.onload = function(e){
			$("#img3").attr('src',e.target.result);
		}
		reader.readAsDataURL(f);
	});
}

function imageView4(e){
	var file = e.target.files;
	var fileArr = Array.prototype.slice.call(file);	
	var fileValue = $("#input_img4").val().split("\\");
	var fileName = fileValue[fileValue.length-1]; // 파일명
	fileArr.forEach(function(f){
		if(!f.type.match("image.*")){
			alert('미리보기는 이미지 파일만 가능합니다.');
			return;
		}
		if(fileName != "" ){
			$("#btn_delAttach4").show();
			
		}else{
			$("#btn_delAttach4").hide();
		}
		sel_file=f;
		
		var reader = new FileReader();
		reader.onload = function(e){
			$("#img4").attr('src',e.target.result);
		}
		reader.readAsDataURL(f);
	});
}


// 이미지 체인지
$(function(){
	$('#input_img1').on("change",imageView1);
	$('#input_img2').on("change",imageView2);
	$('#input_img3').on("change",imageView3);
	$('#input_img4').on("change",imageView4);
	
}); 




// 이미지 경로 비우기 

$(document).ready(function(){
	$("#btn_delAttach1").click(function(){
		$("#input_img1").val("");
		$("#img1").attr('src','/img/no_image.png')
		$("#btn_delAttach1").hide();
	});
	$("#btn_delAttach2").click(function(){
		$("#input_img2").val("");
		$("#img2").attr('src','/img/no_image.png')
		$("#btn_delAttach2").hide();
	});
	$("#btn_delAttach3").click(function(){
		$("#input_img3").val("");
		$("#img3").attr('src','/img/no_image.png')
		$("#btn_delAttach3").hide();
	});
	$("#btn_delAttach4").click(function(){
		$("#input_img4").val("");
		$("#img4").attr('src','/img/no_image.png')
		$("#btn_delAttach4").hide();
	});
	
});


// 파일 리셋 버튼 히든 처리
$(document).ready(function(){
	$("#btn_delAttach1, #btn_delAttach2, #btn_delAttach3, #btn_delAttach4").hide();
});

</script>

		

<style>
.col_01 { background: #253dbe;}
.col_02 { background: #d13f4a;}
.col_03 { background: #4c4f6f;}

.btn_bd {
	width: 80px;
	height: 30px;
	color: #fff;
	border: none;
}

</style>


	
	<div class="sub_container postWrap">
		
		<div class="write_wrap">
			<h1>포스트카드  수정하기</h1>
		</div>
		<form method="post" action="/postCard/updatePostcard">
			<div class="write_wrap">
				<h1>사진을 선택해주세요.</h1>
				
				<ul class="writeUl1">
					<li><img id="img1" src="/img/no_image.png" ></li>
					<li><img id="img2" src="/img/no_image.png" ></li>
					<li><img id="img3" src="/img/no_image.png" ></li>
					<li><img id="img4" src="/img/no_image.png" ></li>
				</ul>
				<ul class="writeUl2">
					<li>
						<input id="input_img1" name="att_file_ori_name" type="file">
						<button type="button" id="btn_delAttach1">&nbsp;X&nbsp;</button>
					</li>
					<li>
						<input id="input_img2" name="att_file_ori_name" type="file">
						<button type="button" id="btn_delAttach2">&nbsp;X&nbsp;</button>
					</li>
					<li>
						<input id="input_img3" name="att_file_ori_name" type="file">
						<button type="button" id="btn_delAttach3">&nbsp;X&nbsp;</button>
					</li>
					<li>
						<input id="input_img4" name="att_file_ori_name" type="file">
						<button type="button" id="btn_delAttach4">&nbsp;X&nbsp;</button>
					</li>
				</ul>
				
			</div>
		
			<div class="write_wrap">
				<h1>내용을 적어주세요. <span>해쉬태그는 #으로 구분을 합니다.</span></h1>
				<textarea placeholder="내용을 적어주세요. #해시태그 #이렇게사용" name="pc_cnt">${pc_cnt}</textarea>
				<input type="hidden" name="mem_id" value="${mem_id}"> 
				<input type="hidden" name="pc_id" value="${pc_id}"> 
			</div>
			
			<div class="write_wrap">
				<input type="submit" class="btn_bd col_01" id="savebutton"  value="수정 완료" />
				<input type="button" class="btn_bd col_02" onclick="javascript:history.back()" value="취소" />
			</div>
		</form>
	</div>
	
	
<%@include file="../tail.jsp" %>