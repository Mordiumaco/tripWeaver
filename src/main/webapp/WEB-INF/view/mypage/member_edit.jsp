<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../head.jsp" %>
<script>

	function deleteProfile(){
		confirm('기존 프로필 이미지를 변경하실껀가요?');
		$('.fileSection').html('<img id="profileSection" alt="profile" src="/img/no_profile.png" style="width:10em;"><br/><input type="file" name="mem_profile_file" id="mem_profile" onchange="loadFile(event)">');
		
	}
	
 	 var loadFile = function(event) {
	    var output = document.getElementById('profileSection');
	    output.src = URL.createObjectURL(event.target.files[0]);
	 };
	

	$(function(){
	
		$("#mem_age").val("${loginInfo.mem_age}");
		
	})
	
</script>
<div class="sub_container">
<%@include file="myPageLeftMenu.jsp" %>
	<div class="mypage_right">
		<h1 class="mypage_title">개인 정보 변경</h1>
	<!-- 회원정보 입력/수정 시작 { -->
	<script src="https://demo.sir.kr/gnuboard5/js/jquery.register_form.js"></script>
	<form id="fregisterform" name="fregisterform" action="/mypage/memberEditForm" onsubmit="return fregisterform_submit(this);" method="post" enctype="multipart/form-data" autocomplete="off">
		<c:choose>
			<c:when test="${loginInfo.mem_profile == ''}">
				<div class="fileSection">
					<input type="file" name="mem_profile_file" id="mem_profile">
				</div>
			</c:when>
			<c:when test="${fn:substring(loginInfo.mem_profile,0,8) != '/profile'}">
				<div class="fileSection">
					<input type="file" name="mem_profile_file" id="mem_profile">
				</div>
			</c:when>
			<c:otherwise>
				<div class="fileSection">
					<img alt="profile" src="/file/read?file=${loginInfo.mem_profile}" style="width:10em;" onerror="src='/img/no_profile.png';"><br/>
					파일명 : ${loginInfo.mem_profile} <a href="javascript: deleteProfile()" class="btn btn_02">프로필 변경</a> 
				</div>
			</c:otherwise>
		</c:choose>
		
		<div id="register_form" class="form_01">
			<c:if test="${loginInfo.mem_pass != null}">
				<div>
					<ul>
						<li>
							<label for="reg_mb_id" class="sound_only">아이디<strong>필수</strong></label>
							<span><b>아이디 : </b> </span> <input type="text" name="mem_id" value="${loginInfo.mem_id}" id="reg_mb_id" readonly="readonly" class="frm_input half_input required ">
						</li>
						<br/>
						<li>
							<label for="reg_mb_password" class="sound_only">비밀번호<strong class="sound_only">필수</strong></label> 
							<span><b>비밀번호 : </b> </span> <input autocomplete="name" type="password" name="mem_pass" value="${loginInfo.mem_pass}" id="reg_mb_password" required="" class="frm_input half_input required" minlength="3" maxlength="20" placeholder="비밀번호"> 
						</li>
						<br/>
						<li>
							<label for="reg_mb_password_re" class="sound_only">비밀번호 확인<strong>필수</strong></label> 
							<span><b>비밀번호 재확인 : </b> </span> <input autocomplete="name" type="password" name="mem_pass_re" value="${loginInfo.mem_pass}" id="reg_mb_password_re" required="" class="frm_input half_input right_input required" minlength="3" maxlength="20" placeholder="비밀번호 확인">
						</li>
						<br/>
					</ul>
				</div>
			</c:if>
			<c:if test="${loginInfo.mem_pass == null}">
				<input type="hidden" name="mem_id" value="${loginInfo.mem_id}" id="reg_mb_id" readonly="readonly" class="frm_input half_input required " >
			</c:if>
			<div class="tbl_frm01 tbl_wrap">
				<ul>
					<li>
						<label for="reg_mb_gender" class="sound_only">성별<strong>필수</strong></label>
						<span><b>성별 : <c:if test="${loginInfo.mem_gender == 'M'}">남성</c:if><c:if test="${loginInfo.mem_gender == 'F'}">여성</c:if></b>
					</li>
					<br/>
					<li>
						<label for="reg_mb_name" class="sound_only">이름<strong>필수</strong></label>
						<span><b>이름 : </b> </span><input type="text" id="reg_mb_name" name="mem_name" value="${loginInfo.mem_name}" required="" class="frm_input half_input required " size="10" placeholder="이름">
					</li>
					<br/>
					<li>
						<label for="reg_mb_nick" class="sound_only">닉네임<strong>필수</strong></label>
						<input type="hidden" name="mb_nick_default" value=""> 
						<span><b>닉네임 : </b> </span><input type="text" name="mem_nick" value="${loginInfo.mem_nick}" id="reg_mb_nick" required="" class="frm_input required nospace  half_input" size="10" maxlength="20" placeholder="닉네임"> 
					</li>
					<br/>
					<li>
						<span id="msg_mb_nick"></span>
						<span><b>전화번호 : </b> </span><input type="text" name="mem_tel" value="${loginInfo.mem_tel}" id="reg_mb_tel" required="" class="frm_input required nospace  half_input" size="10" maxlength="20" placeholder="휴대폰 번호 ex)01033334444"> 
					</li>
					<br/>
					<c:if test="${loginInfo.mem_pass != ''}">
					<li>
						<label for="reg_mb_email" class="sound_only">E-mail<strong>필수</strong></label>
						<span><b>이메일 : </b> </span><input type="text" name="mem_email" value="${loginInfo.mem_email}" id="reg_mb_email" required="" class="frm_input email half_input required" size="70" maxlength="100" placeholder="E-mail">
					</li>
					</c:if>
					<br/>
					<li>
						<b class="dusfudeo">연령대 :</b>
						<label for="reg_mb_age" class="sound_only">연령대<strong>필수</strong></label>
						<select name="mem_age" id="mem_age">
							<option value="0-9">0-9</option>
							<option value="10-19">10-19</option>
							<option value="20-29">20-29</option>
							<option value="30-39">30-39</option>
							<option value="40-49">40-49</option>
							<option value="50-59">50-59</option>
							<option value="60-">60-</option>
						</select>
					</li>
					<br/>
				</ul>
			</div>
			
		</div>
		<div class="btn_confirm">
			<a href="javascript: history.back()" class="btn_cancel">취소</a> 
			<input type="submit" value="수정" id="btn_submit" class="btn_submit" accesskey="s">
		</div>
	</form>
	<script>
	    $(function() {
	        $("#reg_zip_find").css("display", "inline-block");
		});
	    // submit 최종 폼체크
	    function fregisterform_submit(f){
	       
	        if (f.mem_pass.value !== f.mem_pass_re.value) {
	            alert("비밀번호가 같지 않습니다.");
	            f.mem_pass.focus();
	            return false;
	        }
	        
	        if (f.mem_pass.value.length > 0) {
	            if (f.mem_pass_re.value.length < 3) {
	                alert("비밀번호를 3글자 이상 입력하십시오.");
	                f.mem_pass.focus();
	                return false;
	            }
	        }
	        
	        // 이름 검사
            if (f.mem_name.value.length < 2) {
                alert("이름을 2자 이상 입력하십시오.");
                f.mem_name.focus();
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
	        // 닉네임 검사
	        if (f.mem_nick.value.length < 2) {
	           		 //var msg = reg_mb_nick_check();
	                alert("닉네임을 2자 이상 입력해 주세요");
	                f.mem_nick.focus();
	                return false;
	        }
	            
	        //전화번호 검사
	        if(f.mem_tel.value.length > 5){
	        	var regNumber = /^[0-9]*$/;
	            var temp = $("#reg_mb_tel").val();
	            if(!regNumber.test(temp))
	            {
	                alert('전화번호에는 숫자만 입력하세요');
	                $("#reg_mb_tel").focus();
	                return false;
	            }
	        }else{
	        	alert('제대로 된 전화번호를 적어주세요');
	        	return false;
	        }
	       
	        
	        //이메일 검사
	        if(f.mem_email.value.length > 5){
	        	var regNumber =  /^[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[@]{1}[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[.]{1}[A-Za-z]{1,5}$/g;
	            var temp = $("#reg_mb_email").val();
	            if(!regNumber.test(temp))
	            {
	                alert('이메일 형식에 맞는 이메일을 입력하세요');
	                $("#reg_mb_email").focus();
	                return false;
	            }
	        }else{
	        	alert('제대로 된 이메일을 적어주세요');
	        	return false;
	        }
	        
	        
	        document.getElementById("btn_submit").disabled = "disabled";
	        return true; 
	        
	    }
    </script>
	<!--  회원정보 입력/수정 끝 -->
	</div>
</div>
<%@include file="../tail.jsp" %>