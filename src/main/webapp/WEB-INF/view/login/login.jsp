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
<body>
<!-- 로그인 시작 { -->
<div id="mb_login" class="mbskin">
    <h1>로그인</h1>
    <form name="flogin" action="" onsubmit="return flogin_submit(this);" method="post">
	    <input type="hidden" name="url" value="">
	    <fieldset id="login_fs">
	        <legend>회원로그인</legend>
	        <label for="login_id" class="sound_only">회원아이디<strong class="sound_only"> 필수</strong></label>
	        <input type="text" name="mb_id" id="login_id" required class="frm_input required" size="20" maxLength="20" placeholder="아이디" >
	        <label for="login_pw" class="sound_only">비밀번호<strong class="sound_only"> 필수</strong></label>
	        <input type="password" name="mb_password" id="login_pw" required class="frm_input required" size="20" maxLength="20" placeholder="비밀번호" >
	        <input type="submit" value="로그인" class="btn_submit">
	        <input type="checkbox" name="auto_login" id="login_auto_login">
	        <label for="login_auto_login">자동로그인</label>
	    </fieldset>
		<div id="sns_login" class="login-sns sns-wrap-32 sns-wrap-over">
		    <h3>소셜계정으로 로그인</h3>
		    <div class="sns-wrap">
		    	<a href="" class="sns-icon social_link sns-naver" title="네이버">
		    		<span class="ico"></span>
		            <span class="txt">네이버<i> 로그인</i></span>
		        </a>
		    </div>
		</div>
	    <aside id="login_info">
	        <h2>회원로그인 안내</h2>
	        <div class="sns-wrap">
	            <a href="/main/idPw_lost" target="_blank" id="login_password_lost" class="social_link">아이디 비밀번호 찾기</a>
	            <a href="/main/register">회원 가입</a>
	        </div>
	    </aside>
    </form>
</div>
<script>
$(function(){
    $("#login_auto_login").click(function(){
        if (this.checked) {
            this.checked = confirm("자동로그인을 사용하시면 다음부터 회원아이디와 비밀번호를 입력하실 필요가 없습니다.\n\n공공장소에서는 개인정보가 유출될 수 있으니 사용을 자제하여 주십시오.\n\n자동로그인을 사용하시겠습니까?");
        }
    });
});
function flogin_submit(f)
{
    return true;
}
</script>
<script>
     jQuery(function($){
         $(".sns-wrap").on("click", "a.social_link", function(e){
             e.preventDefault();

             var pop_url = $(this).attr("href");
             var newWin = window.open(
                 pop_url, 
                 "social_sing_on", 
                 "location=0,status=0,scrollbars=1,width=600,height=500"
             );

             if(!newWin || newWin.closed || typeof newWin.closed=='undefined')
                  alert('브라우저에서 팝업이 차단되어 있습니다. 팝업 활성화 후 다시 시도해 주세요.');

             return false;
         });
     });
</script>
</body>
</html>