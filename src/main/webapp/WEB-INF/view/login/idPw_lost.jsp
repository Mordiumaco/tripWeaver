<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TripWeaver</title>

<link rel="shortcut icon" type="image/x-icon" href="/img/favicon.ico" />
<link rel="stylesheet" href="/css/default.css">
<script src="/js/jquery-3.3.1.min.js"></script>
<script>
		function findIdCheck(){
			let mem_name = $('#mem_name').val();
			let mem_tel = $('#mem_tel').val();
			let mem_email = $('#mem_email').val();
			if(mem_name.length < 2){
				alert("2자 이상의 이름을 적어주세요");
				return;
			}
			
			if(mem_tel.length < 5){
				alert("제대로 된 전화번호를 적어주세요");
				return;
			}
			
			if(mem_email.length < 5){
				alert("제대로 된 이메일을 적어주세요");
				return;
			}
			
		    $.ajax({
			   	type: "GET",
			   	url:"/main/findIdCheck",
			   	data : {"mem_name":mem_name, "mem_tel":mem_tel, "mem_email":mem_email},
			   	success : function(data){
			           
			   		console.log(data);
			   		if(data == null || data ==""){
			   			
			   			alert("해당 회원에 대한 정보가 없습니다.");
			   			
			   		}else{
			   			
			   			alert("해당 정보에 대한 회원의 아이디는 "+data+"입니다.");
			   		}
			           	
			   	}
			 });
		}
	
		function findPassCheck(){
			
			let mem_id = $('#mem_id').val();
			let mem_email = $('#mem_email2').val();
			
			if(mem_id.length < 2){
				alert("2자 이상의 아이디를 적어주세요");
				return;
			}
			
			if(mem_email.length < 5){
				alert("제대로 된 이메일을 적어주세요");
				return;
			}
			
			 $.ajax({
				 
				   	type: "GET",
				   	url:"/main/findPassCheck",
				   	data : {"mem_id":mem_id, "mem_email":mem_email},
				   	success : function(data){
				           
				   		console.log(data);
				   		if(data == null || data ==""){
				   			
				   			alert("해당 회원에 대한 정보가 없습니다.");
				   			
				   		}else{
				   			
				   			alert("해당 정보에 대한 회원의 비밀번호는 "+data+"입니다.");
				   		}
				           	
				   	}
				 });
		}
		
		
</script>
</head>
<body style="min-width: 600px; overflow-x: hidden;">
	<!-- 회원정보 찾기 시작 { -->
	<div id="find_info" class="new_win">
		<h1 id="win_title">회원정보 찾기</h1>
		<div class="new_win_con">
			<h1>아이디 찾기</h1>
			<form name="fIdlost" action="" method="post" autocomplete="off">
				<fieldset id="info_fs">
					<p>회원가입 시 등록하신 이름, 전화번호, 생년월일을 적어주세요.<br/> 
					네이버 아이디 인 경우에는 네이버에서 찾기를 해주세요 </p>
					<br /> 
					<label for="mb_email"> 이름 </label> 
					<input type="text" name="mem_name" id="mem_name" required="" class="required frm_input full_input email" size="30" placeholder="이름을 적어주세요."> 
					<label for="mb_email">전화번호 </label> 
					<input type="text" name="mem_tel" id="mem_tel" required="" class="required frm_input full_input email" size="30" placeholder="ex) 01000000000"> 
					<label for="mb_email">이메일 </label> <input type="text" name="mem_email" id="mem_email" required="" class="required frm_input full_input email" size="30"	placeholder="ex) tripweaver@naver.com">
				</fieldset>
				<input type="button" value="확인" class="btn_submit" onclick="findIdCheck()"/>
				<br /> 
			</form>
		</div>
		<div class="new_win_con">
			<h1>비밀번호 찾기</h1>
			<form name="fpasswordlost" action="" method="post" autocomplete="off">
				<br />
				<br /> 
				<label for="mb_email"> 아이디 </label> 
				<input type="text" name="mem_id" id="mem_id" required="" class="frm_input full_input email" size="30" placeholder="아이디를 적어주세요">
				<fieldset id="info_fs">
					<p>
						회원가입 시 등록하신 이메일 주소를 입력해 주세요.<br> 해당 이메일로 비밀번호 정보를 보내드립니다.
					</p>
					<label for="mb_email" class="sound_only">E-mail 주소<strong class="sound_only">필수</strong></label> 
					<input type="text" name="mem_email" id="mem_email2" required="" class="required frm_input full_input email" size="30" placeholder="E-mail 주소">
				</fieldset>
				<input type="button" value="확인" class="btn_submit" onclick="findPassCheck()">
			</form>
		</div>
		<button type="button" onclick="window.close();" class="btn_close">창닫기</button>
	</div>
	<script>
		function fpasswordlost_submit(f)
		{
		    if (!chk_captcha()) return false;
		    return true;
		}
		$(function() {
		    var sw = screen.width;
		    var sh = screen.height;
		    var cw = document.body.clientWidth;
		    var ch = document.body.clientHeight;
		    var top  = sh / 2 - ch / 2 - 100;
		    var left = sw / 2 - cw / 2;
		    moveTo(left, top);
		});
	</script>
	<!-- } 회원정보 찾기 끝 -->

	<!-- ie6,7에서 사이드뷰가 게시판 목록에서 아래 사이드뷰에 가려지는 현상 수정 -->
	<!--[if lte IE 7]>
<script>
$(function() {
    var $sv_use = $(".sv_use");
    var count = $sv_use.length;

    $sv_use.each(function() {
        $(this).css("z-index", count);
        $(this).css("position", "relative");
        count = count - 1;
    });
});
</script>
<![endif]-->
</body>
</html>