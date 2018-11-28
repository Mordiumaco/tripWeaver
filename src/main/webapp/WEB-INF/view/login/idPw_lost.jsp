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
</head>

<body style= "min-width:600px; overflow-x: hidden; ">
	
<!-- 회원정보 찾기 시작 { -->
<div id="find_info" class="new_win">
    <h1 id="win_title">회원정보 찾기</h1>
    <div class="new_win_con">
   		<form name="fpasswordlost"
			action="https://demo.sir.kr/gnuboard5/bbs/password_lost2.php"
			onsubmit="return fpasswordlost_submit(this);" method="post"
			autocomplete="off">
			<fieldset id="info_fs">
				<p>
					회원가입 시 등록하신 이름, 전화번호, 생년월일을 적어주세요.
				</p>
				<br/>
				<label for="mb_email" >
					이름
					
				</label> 
				<input type="text" name="mb_email"
					id="mb_email" required=""
					class="required frm_input full_input email" size="30"
					placeholder="이름을 적어주세요.">
					
				<label for="mb_email" >
					전화번호
					
				</label> 
				<input type="text" name="mb_email"
					id="mb_email" required=""
					class="required frm_input full_input email" size="30"
					placeholder="010-0000-0000">	
					
				<label for="mb_email" >
					생년월일
				</label> 
				<input type="text" name="mb_email"
					id="mb_email" required=""
					class="required frm_input full_input email" size="30"
					placeholder="19911223">	
				
				
			</fieldset>
			
			
			
			<input type="submit" value="확인" class="btn_submit">
			
			<br/>
			<br/>
			<br/>
			
			<label for="mb_email">
					아이디
			</label> 
			<input type="text" name="mb_email"
				id="mb_email" required="" readonly="readonly"
				class="frm_input full_input email" size="30">	

		</form>
   
    </div>


	<div class="new_win_con">
		<form name="fpasswordlost"
			action="https://demo.sir.kr/gnuboard5/bbs/password_lost2.php"
			onsubmit="return fpasswordlost_submit(this);" method="post"
			autocomplete="off">
			<fieldset id="info_fs">
				<p>
					회원가입 시 등록하신 이메일 주소를 입력해 주세요.<br> 해당 이메일로  비밀번호 정보를
					보내드립니다.
				</p>
				<label for="mb_email" class="sound_only">E-mail 주소<strong
					class="sound_only">필수</strong></label> <input type="text" name="mb_email"
					id="mb_email" required=""
					class="required frm_input full_input email" size="30"
					placeholder="E-mail 주소">
			</fieldset>
			
			<input type="submit" value="확인" class="btn_submit">

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