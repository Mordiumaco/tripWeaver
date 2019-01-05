<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../head.jsp" %>
<script>
	function idDuplicateCheck(){
		
		let mem_id = $("#reg_mb_id").val();	
		
		if(mem_id.length < 3){
			alert("3자 이상의 아이디를 입력해주세요")
			return;
		}
		
		if(mem_id.length > 3){
         	var regNumber =  /^[-A-Za-z0-9_]/;
             var temp = mem_id;
             if(!regNumber.test(temp))
             {
                 alert('영문 및 숫자만 적어주세요');
                 $("#mem_id").focus();
                 return false;
             }
         }
		
	  $.ajax({
			type: "GET",
			url:"/main/idDuplicateCheck",
			data : "mem_id="+mem_id,
			success : function(data){
		            
				if(data == 1){
					
					alert("해당 회원은 중복 회원이 존재합니다.");
					
				}else{
					
					alert("사용 가능한 아이디 입니다.");
					$("#btn_submit").attr('disabled', false);
					$("#btn_submit").removeClass("btn_cancel");
					$("#btn_submit").addClass("btn_submit");
				}
		        	
			}
		});
		
	}
	
	//중복 체크 검사한 후에 다시 아이디를 변경하면 회원가입 버튼이 비활성화 된다.
	$(function(){
	
		$("#reg_mb_id").change(function(){
			
			$("#btn_submit").attr('disabled', true);
			$("#btn_submit").removeClass("btn_submit");
			$("#btn_submit").addClass("btn_cancel");
			
		})
		
	})
	
</script>
<div id="container">
	<h2 id="container_title">
		<span title="회원 가입">회원 가입</span>
	</h2>
	<!-- 회원정보 입력/수정 시작 { -->
	<script src="https://demo.sir.kr/gnuboard5/js/jquery.register_form.js"></script>
	<form id="fregisterform" name="fregisterform" action="/join/memberJoinCheck" onsubmit="return fregisterform_submit(this);" method="post" enctype="multipart/form-data" autocomplete="off">
		<input type="hidden" name="w" value=""> 
		<input type="hidden" name="url" value=""> 
		<input type="hidden" name="agree" value="1"> 
		<input type="hidden" name="agree2" value="1"> 
		<input type="hidden" name="cert_type" value=""> 
		<input type="hidden" name="cert_no" value=""> 
		<input type="hidden" name="mb_sex" value="">
		<div id="register_form" class="form_01">
			<div>
				<h2>사이트 이용정보 입력</h2>
				<ul>
					<li>
						<label for="reg_mb_id" class="sound_only">아이디<strong>필수</strong></label>
						<input type="text" name="mem_id" value="" id="reg_mb_id"	required="" class="frm_input half_input required " minlength="3" maxlength="20" placeholder="아이디"> <span id="msg_mb_id"></span>
						<a href="javascript:idDuplicateCheck()" class="btn btn_02">아이디 중복체크</a> 
						<span class="frm_info">영문자, 숫자, _ 만 입력 가능. 최소 3자이상 입력하세요.</span>
					</li>
					<br/>
					<li>
						<label for="reg_mb_password" class="sound_only">비밀번호<strong class="sound_only">필수</strong></label> 
						<input type="password" name="mem_pass" id="reg_mb_password" required="" class="frm_input half_input required" minlength="3" maxlength="20" placeholder="비밀번호"> 
						<label for="reg_mb_password_re" class="sound_only">비밀번호 확인<strong>필수</strong></label> 
						<input type="password" name="mem_pass_re" id="reg_mb_password_re" required="" class="frm_input half_input right_input required" minlength="3" maxlength="20" placeholder="비밀번호 확인">
					</li>
					<br/>
				</ul>
			</div>
			<div class="tbl_frm01 tbl_wrap">
				<h2>개인정보 입력</h2>
				<ul>
					<li>
						<label for="reg_mb_gender" class="sound_only">성별<strong>필수</strong></label>
						<input type="radio" id="reg_mb_gender" name="mem_gender" value="M" class="frm_input required " size="10">남자 
						<input type="radio" id="reg_mb_gender" name="mem_gender" value="F" class="frm_input required " size="10">여자
						
					</li>
					<li>
						<label for="reg_mb_name" class="sound_only">이름<strong>필수</strong></label>
						<input type="text" id="reg_mb_name" name="mem_name" value=""	required="" class="frm_input half_input required " size="10" placeholder="이름">
					</li>
					<br/>
					<li>
						<label for="reg_mb_nick" class="sound_only">닉네임<strong>필수</strong></label>
						<input type="hidden" name="mb_nick_default" value=""> 
						<input type="text" name="mem_nick" value="" id="reg_mb_nick" required="" class="frm_input required nospace  half_input" size="10" maxlength="20" placeholder="닉네임"> 
						<span id="msg_mb_nick"></span>
						<span class="frm_info"> 
							공백없이 한글,영문,숫자만 입력 가능 (한글2자, 영문4자이상)
							<br>
							닉네임을 바꾸시면 앞으로 60일 이내에는 변경 할 수 없습니다.
						</span>
						<input type="text" name="mem_tel" value="" id="reg_mb_tel" required="" class="frm_input required nospace  half_input" size="10" maxlength="20" placeholder="휴대폰 번호 ex)01033334444"> 
						<span class="frm_info"> 
							'-' 없이 숫자만 입력해 주세요
						</span>
					</li>
					<br/>
					<li>
						<label for="reg_mb_email" class="sound_only">E-mail<strong>필수</strong></label>
						<input type="text" name="mem_email" value="" id="reg_mb_email" required="" class="frm_input email half_input required" size="70" maxlength="100" placeholder="E-mail">
					</li>
					<br/>
					<li>
						<h2>연령대</h2>
						<label for="reg_mb_age" class="sound_only">연령대<strong>필수</strong></label>
						<select name="mem_age">
							<option value="0-9">0-9</option>
							<option value="10-19">10-19</option>
							<option value="20-29" selected="selected">20-29</option>
							<option value="30-39">30-39</option>
							<option value="40-49">40-49</option>
							<option value="50-59">50-59</option>
							<option value="60-">60-</option>
						</select>
					</li>
					<br/>
				</ul>
			</div>
			<div class="tbl_frm01 tbl_wrap">
				<h2>기타 개인설정</h2>
				<ul>
					<li>
						<label for="reg_mb_mailling" class="frm_label">메일링서비스</label>
						<input type="checkbox" name="mem_mailling" value="1" id="reg_mb_mailling" checked=""> 정보 메일을 받겠습니다.
					</li>
					<li>
						<label for="reg_mb_open" class="frm_label">정보공개</label> 
						<input type="hidden" name="mb_open_default" value=""> 
						<input type="checkbox" name="mem_open" value="1" checked="" id="reg_mb_open"> 다른분들이 나의 정보를 볼 수 있도록 합니다. 
						<span class="frm_info"> 정보공개를 바꾸시면 앞으로 0일 이내에는 변경이 안됩니다. </span>
					</li>
					
				</ul>
			</div>
		</div>
		<div class="btn_confirm">
			<a href="/main/main" class="btn_cancel">취소</a> 
			<input type="submit" value="회원가입" id="btn_submit" class="btn_cancel" accesskey="s" disabled="disabled">
		</div>
	</form>
	<script>
	    $(function() {
	        $("#reg_zip_find").css("display", "inline-block");
		});
	    // submit 최종 폼체크
	    function fregisterform_submit(f){
	       
	    	if(f.mem_id.value.length > 3){
	         	var regNumber =  /^[-A-Za-z0-9_]/;
	             var temp = f.mem_id.value;
	             if(!regNumber.test(temp))
	             {
	                 alert('영문 및 숫자만 적어주세요');
	                 $("#mem_id").focus();
	                 return false;
	             }
	         }
	    	
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
	        
            if (f.mem_name.value.length > 4) {
                alert("이름을 4자 이하 입력하십시오.");
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
	            
            if (f.mem_nick.value.length > 4) {
           		 //var msg = reg_mb_nick_check();
                alert("닉네임을 4자 이하 입력해 주세요");
                f.mem_nick.focus();
                return false;
	        }
	            
	        //전화번호 검사
	        if(f.mem_tel.value.length > 5){
	        	
	        	if(f.mem_tel.value.length > 20){
	        		alert('전화번호가 너무 깁니다');
	        		return false;
	        	}
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
<%@include file="../tail.jsp" %>