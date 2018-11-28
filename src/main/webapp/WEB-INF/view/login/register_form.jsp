<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../head.jsp" %>

<div id="container">
	<h2 id="container_title">
		<span title="회원 가입">회원 가입</span>
	</h2>

	<!-- 회원정보 입력/수정 시작 { -->

	<script src="https://demo.sir.kr/gnuboard5/js/jquery.register_form.js"></script>

	<form id="fregisterform" name="fregisterform"
		action="https://demo.sir.kr/gnuboard5/bbs/register_form_update.php"
		onsubmit="return fregisterform_submit(this);" method="post"
		enctype="multipart/form-data" autocomplete="off">
		<input type="hidden" name="w" value=""> <input type="hidden"
			name="url" value="%2Fgnuboard5%2Fbbs%2Fregister_form.php"> <input
			type="hidden" name="agree" value="1"> <input type="hidden"
			name="agree2" value="1"> <input type="hidden"
			name="cert_type" value=""> <input type="hidden"
			name="cert_no" value=""> <input type="hidden" name="mb_sex"
			value="">
		<div id="register_form" class="form_01">
			<div>
				<h2>사이트 이용정보 입력</h2>
				<ul>
					<li><label for="reg_mb_id" class="sound_only">아이디<strong>필수</strong></label>
						<input type="text" name="mb_id" value="" id="reg_mb_id"
						required="" class="frm_input half_input required " minlength="3"
						maxlength="20" placeholder="아이디"> <span id="msg_mb_id"></span>
						<span class="frm_info">영문자, 숫자, _ 만 입력 가능. 최소 3자이상 입력하세요.</span></li>
					<br/>
					
					<li><label for="reg_mb_password" class="sound_only">비밀번호<strong
							class="sound_only">필수</strong></label> <input type="password"
						name="mb_password" id="reg_mb_password" required=""
						class="frm_input half_input required" minlength="3" maxlength="20"
						placeholder="비밀번호"> <label for="reg_mb_password_re"
						class="sound_only">비밀번호 확인<strong>필수</strong></label> <input
						type="password" name="mb_password_re" id="reg_mb_password_re"
						required="" class="frm_input half_input right_input required"
						minlength="3" maxlength="20" placeholder="비밀번호 확인"></li>
					<br/>
				</ul>
			</div>

			<div class="tbl_frm01 tbl_wrap">
				<h2>개인정보 입력</h2>

				<ul>
					<li><label for="reg_mb_name" class="sound_only">이름<strong>필수</strong></label>
						<input type="text" id="reg_mb_name" name="mb_name" value=""
						required="" class="frm_input half_input required " size="10"
						placeholder="이름">
					</li>
					<br/>
					<li><label for="reg_mb_nick" class="sound_only">닉네임<strong>필수</strong></label>

						<input type="hidden" name="mb_nick_default" value=""> <input
						type="text" name="mb_nick" value="" id="reg_mb_nick" required=""
						class="frm_input required nospace  half_input" size="10"
						maxlength="20" placeholder="닉네임"> <span id="msg_mb_nick"></span>
						<span class="frm_info"> 공백없이 한글,영문,숫자만 입력 가능 (한글2자, 영문4자
							이상)<br> 닉네임을 바꾸시면 앞으로 60일 이내에는 변경 할 수 없습니다.
					</span>
					</li>
					<br/>

					<li><label for="reg_mb_email" class="sound_only">E-mail<strong>필수</strong></label>

						<input type="hidden" name="old_email" value=""> <input
						type="text" name="mb_email" value="" id="reg_mb_email" required=""
						class="frm_input email full_input required" size="70"
						maxlength="100" placeholder="E-mail"></li>
					<br/>


					<li></li>


					<li><strong class="sound_only">필수</strong> <label
						for="reg_mb_zip" class="sound_only">우편번호<strong
							class="sound_only"> 필수</strong></label> <input type="text" name="mb_zip"
						value="" id="reg_mb_zip" required="" class="frm_input required"
						size="5" maxlength="6" placeholder="우편번호">
						<button type="button" class="btn_frmline"
							onclick="win_zip('fregisterform', 'mb_zip', 'mb_addr1', 'mb_addr2', 'mb_addr3', 'mb_addr_jibeon');">주소
							검색</button>
						<br> <input type="text" name="mb_addr1" value=""
						id="reg_mb_addr1" required=""
						class="frm_input frm_address full_input required" size="50"
						placeholder="기본주소"> <label for="reg_mb_addr1"
						class="sound_only">기본주소<strong> 필수</strong></label><br> <input
						type="text" name="mb_addr2" value="" id="reg_mb_addr2"
						class="frm_input frm_address full_input" size="50"
						placeholder="상세주소"> <label for="reg_mb_addr2"
						class="sound_only">상세주소</label> <br> <input type="text"
						name="mb_addr3" value="" id="reg_mb_addr3"
						class="frm_input frm_address full_input" size="50"
						readonly="readonly" placeholder="참고항목"> <label
						for="reg_mb_addr3" class="sound_only">참고항목</label> <input
						type="hidden" name="mb_addr_jibeon" value=""></li>
				</ul>
			</div>

			<div class="tbl_frm01 tbl_wrap">
				<h2>기타 개인설정</h2>
				<ul>




					<li><label for="reg_mb_mailling" class="frm_label">메일링서비스</label>
						<input type="checkbox" name="mb_mailling" value="1"
						id="reg_mb_mailling" checked=""> 정보 메일을 받겠습니다.</li>


					<li><label for="reg_mb_open" class="frm_label">정보공개</label> <input
						type="hidden" name="mb_open_default" value=""> <input
						type="checkbox" name="mb_open" value="1" checked=""
						id="reg_mb_open"> 다른분들이 나의 정보를 볼 수 있도록 합니다. <span
						class="frm_info"> 정보공개를 바꾸시면 앞으로 0일 이내에는 변경이 안됩니다. </span></li>



					<li class="is_captcha_use">자동등록방지
						<fieldset id="captcha" class="captcha recaptcha">
							<script src="https://www.google.com/recaptcha/api.js?hl=ko"></script>
							<script
								src="https://demo.sir.kr/gnuboard5/plugin/recaptcha/recaptcha.js"></script>
							<div class="g-recaptcha"
								data-sitekey="6Lc1ujkUAAAAAOfWnj3UEheB87jjS_WF4sI_Q9YL">
								<div style="width: 304px; height: 78px;">
									<div>
										<iframe
											src="https://www.google.com/recaptcha/api2/anchor?ar=1&amp;k=6Lc1ujkUAAAAAOfWnj3UEheB87jjS_WF4sI_Q9YL&amp;co=aHR0cHM6Ly9kZW1vLnNpci5rcjo0NDM.&amp;hl=ko&amp;v=v1542004393985&amp;size=normal&amp;cb=i6ln7aeaq00q"
											width="304" height="78" role="presentation"
											name="a-i3yduftk8e5b" frameborder="0" scrolling="no"
											sandbox="allow-forms allow-popups allow-same-origin allow-scripts allow-top-navigation allow-modals allow-popups-to-escape-sandbox"></iframe>
									</div>
									<textarea id="g-recaptcha-response" name="g-recaptcha-response"
										class="g-recaptcha-response"
										style="width: 250px; height: 40px; border: 1px solid rgb(193, 193, 193); margin: 10px 25px; padding: 0px; resize: none; display: none;"></textarea>
								</div>
							</div>
						</fieldset>
					</li>
				</ul>
			</div>

		</div>
		<div class="btn_confirm">
			<a href="/main/main" class="btn_cancel">취소</a> <input
				type="submit" value="회원가입" id="btn_submit" class="btn_submit"
				accesskey="s">
		</div>
	</form>

	<script>
    $(function() {
        $("#reg_zip_find").css("display", "inline-block");

                    });

    // submit 최종 폼체크
    function fregisterform_submit(f)
    {
        // 회원아이디 검사
        if (f.w.value == "") {
            var msg = reg_mb_id_check();
            if (msg) {
                alert(msg);
                f.mb_id.select();
                return false;
            }
        }

        if (f.w.value == "") {
            if (f.mb_password.value.length < 3) {
                alert("비밀번호를 3글자 이상 입력하십시오.");
                f.mb_password.focus();
                return false;
            }
        }

        if (f.mb_password.value != f.mb_password_re.value) {
            alert("비밀번호가 같지 않습니다.");
            f.mb_password_re.focus();
            return false;
        }

        if (f.mb_password.value.length > 0) {
            if (f.mb_password_re.value.length < 3) {
                alert("비밀번호를 3글자 이상 입력하십시오.");
                f.mb_password_re.focus();
                return false;
            }
        }

        // 이름 검사
        if (f.w.value=="") {
            if (f.mb_name.value.length < 1) {
                alert("이름을 입력하십시오.");
                f.mb_name.focus();
                return false;
            }

            /*
            var pattern = /([^가-힣\x20])/i;
            if (pattern.test(f.mb_name.value)) {
                alert("이름은 한글로 입력하십시오.");
                f.mb_name.select();
                return false;
            }
            */
        }

        
        // 닉네임 검사
        if ((f.w.value == "") || (f.w.value == "u" && f.mb_nick.defaultValue != f.mb_nick.value)) {
            var msg = reg_mb_nick_check();
            if (msg) {
                alert(msg);
                f.reg_mb_nick.select();
                return false;
            }
        }

        // E-mail 검사
        if ((f.w.value == "") || (f.w.value == "u" && f.mb_email.defaultValue != f.mb_email.value)) {
            var msg = reg_mb_email_check();
            if (msg) {
                alert(msg);
                f.reg_mb_email.select();
                return false;
            }
        }

        
        if (typeof f.mb_icon != "undefined") {
            if (f.mb_icon.value) {
                if (!f.mb_icon.value.toLowerCase().match(/.(gif|jpe?g|png)$/i)) {
                    alert("회원아이콘이 이미지 파일이 아닙니다.");
                    f.mb_icon.focus();
                    return false;
                }
            }
        }

        if (typeof f.mb_img != "undefined") {
            if (f.mb_img.value) {
                if (!f.mb_img.value.toLowerCase().match(/.(gif|jpe?g|png)$/i)) {
                    alert("회원이미지가 이미지 파일이 아닙니다.");
                    f.mb_img.focus();
                    return false;
                }
            }
        }

        if (typeof(f.mb_recommend) != "undefined" && f.mb_recommend.value) {
            if (f.mb_id.value == f.mb_recommend.value) {
                alert("본인을 추천할 수 없습니다.");
                f.mb_recommend.focus();
                return false;
            }

            var msg = reg_mb_recommend_check();
            if (msg) {
                alert(msg);
                f.mb_recommend.select();
                return false;
            }
        }

        if (!chk_captcha()) return false;

        document.getElementById("btn_submit").disabled = "disabled";

        return true;
    }
    </script>

	<!-- } 회원정보 입력/수정 끝 -->
</div>


<%@include file="../tail.jsp" %>