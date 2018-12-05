package kr.co.tripweaver.join.web;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.tripweaver.join.service.IJoinService;
import kr.co.tripweaver.member.model.MemberVO;


@RequestMapping("join")
@Controller
public class JoinController {
	
	Logger logger = LoggerFactory.getLogger(JoinController.class);
	
	@Resource(name="joinService")
	IJoinService joinService;
	
	/**
	* Method : memberJoinCheckView
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 5.
	* 변경이력 :
	* @param mem_id 회원 아이디
	* @param mem_pass 회원 패스워드
	* @param mem_nick 회원 닉네임
	* @param mem_name 회원 이름
	* @param mem_gender 회원 성별
	* @param mem_email 회원 이메일
	* @param mem_age 회원 연령대
	* @param mem_tel 회원 전화번호
	* @return
	* Method 설명 : 해당 회원을 가입 시킬수 있는지 체크하는 뷰 
	 * @throws IOException 
	*/
	@RequestMapping(method={RequestMethod.POST}, value="memberJoinCheck")
	public String memberJoinCheckView(
			MemberVO memberVo,
			@RequestParam("mem_id") String mem_id, @RequestParam("mem_pass") String mem_pass,
			@RequestParam("mem_nick") String mem_nick, @RequestParam("mem_name") String mem_name,
			@RequestParam("mem_gender") String mem_gender, @RequestParam("mem_email") String mem_email,
			@RequestParam("mem_age") String mem_age, @RequestParam("mem_tel") String mem_tel,
			HttpServletResponse response) throws IOException {
		
		logger.debug("---------------------------");
		logger.debug("mem_id : {}",mem_id);
		logger.debug("mem_pass : {}",mem_pass);
		logger.debug("mem_nick : {}",mem_nick);
		logger.debug("mem_name : {}",mem_name);
		logger.debug("mem_gender : {}",mem_gender);
		logger.debug("mem_email : {}",mem_email);
		logger.debug("mem_age : {}",mem_age);
		logger.debug("mem_tel : {}",mem_tel);
		logger.debug("MemberVo : {}", memberVo);
		logger.debug("---------------------------");
		
		//기존에 회원이 존재하는지 확인 
		MemberVO existedMemberVo = joinService.selectMemberById(mem_id);
		
		//기존에 없을경우 회원가입 로직 진행
		if(existedMemberVo == null) {
			
			//
			MemberVO joinMemberVo = memberVo;
			
			//회원 가입 로직 진행
			int result = joinService.insertMember(joinMemberVo);
			
			if(result ==1 ) {
				
				//가입 성공했을때
				return "joinCheckSuccess";
				
			}else {
				
				//가입 실패했을 경우
				return "dbError";
				
			}
			
			
		//기존에 회원이 있으면 에러 표시
		}else {
			return "joinCheckError";
		}
		
	}
	
}
