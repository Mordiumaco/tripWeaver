package kr.co.tripweaver.login.web;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.tripweaver.login.service.ILoginService;
import kr.co.tripweaver.member.model.MemberVO;

/**
* LoginController.java
*
* @author Jae Hyeon Choi
* @version 1.0
* @since 2018. 12. 5.
* @see
* 
* << 클래스 생성 목적 >>
* 
* 로그인 기능 관련 컨트롤러
*
* << 개정이력(Modification Information) >>
*
* 수정자 수정내용
* ------ ------------------------
* Jae Hyeon Choi 최초 생성
*
* 
*/
@RequestMapping("login")
@Controller
public class LoginController {
	
	Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	ILoginService loginService;
	
	/**
	* Method : memberLoginCheckView
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 5.
	* 변경이력 :
	* @param request
	* @param memberVo
	* @return
	* Method 설명 : 해당 회원의 로그인 여부를 체크해주는 컨트롤 뷰 
	*/
	@RequestMapping(value="memberLoginCheck" , method= RequestMethod.POST)
	public String memberLoginCheckView(HttpServletRequest request, MemberVO memberVo) {
		
		logger.debug("해당 회원의 정보 memberVo : {}", memberVo);
		
		//해당 회원이 존재할경우 MemberVO 객체를 받아오고 아니면 Null이 뜬다. 
		MemberVO existedMember = loginService.selectMemberByIdAndPass(memberVo);
		
		//해당 아이디와 비밀번호가 일치하지 않거나 없을경우
		if(existedMember == null) {
			
			//다시 로그인 하도록 로그인 페이지 뷰로 리턴
			return "/login/login";
			
		//해당 아이디와 비밀번호가 일치하는 경우 
		}else {
			
			//로그인 세션에 해당 멤버 정보를 넣어준다.
			request.getSession().setAttribute("loginInfo", existedMember);
			
			//로그인 정보를 세션에 넣어줬으니 메인으로 이동시킨다. 
			return "index";
		}
		
	}
}
