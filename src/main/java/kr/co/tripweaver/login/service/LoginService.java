package kr.co.tripweaver.login.service;

import java.io.UnsupportedEncodingException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.tripweaver.member.model.MemberVO;
import kr.co.tripweaver.member.service.IMemberService;
import kr.co.tripweaver.util.naver_login.NaverLoginService;

@Service
public class LoginService implements ILoginService {
	
	@Autowired
	IMemberService memberService;
	
	@Autowired
	NaverLoginService naverLoginService;
	
	/**
	* Method : selectMemberByIdAndPass
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 5.
	* 변경이력 :
	* @param memberVo
	* @return
	* Method 설명 : 아이디와 비밀번호가 일치하면 해당 회원을 리턴 
	*/
	@Override
	public MemberVO selectMemberByIdAndPass(MemberVO memberVo) {
		return memberService.selectMemberByIdAndPass(memberVo);
	}
	
	/**
	* Method : selectMemberById
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 6.
	* 변경이력 :
	* @param mem_id
	* @return
	* Method 설명 : 해당 아이디에 해당하는 회원이 존재할시 해당 회원에 대한 정보를 가져온다.
	* 없을경우에는 null을 반환한다. 
	*/
	@Override
	public MemberVO selectMemberById(String mem_id) {
		return memberService.selectMemberById(mem_id);
	}
	
	/**
	* Method : insertNaverMember
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 6.
	* 변경이력 :
	* @param memberVo
	* @return
	* Method 설명 : Naver Member에 해당하는 회원을 TRIP WEAVER MEMBER DB에 주입시켜 준다. 
	* 정상적으로 완료가 되면 result는 1을 반환한다. 
	*/
	@Override
	public int insertNaverMember(MemberVO memberVo) {
		return memberService.insertNaverMember(memberVo);
	}
	
	/**
	* Method : naverLoginAccessToken
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 6.
	* 변경이력 :
	* @param request
	* @return
	* @throws UnsupportedEncodingException
	* Method 설명 : 네이버 토큰을 받아오는 서비스 (네이버 로그인 서비스를 이용한다) 
	*/
	@Override
	public String naverLoginAccessToken(HttpServletRequest request) throws UnsupportedEncodingException {
		return naverLoginService.NaverLoginAccessToken(request);
	}
	
	/**
	* Method : getNaverUserInfo
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 6.
	* 변경이력 :
	* @param access_token
	* @return
	* Method 설명 : 토큰을 통하여 네이버에게 유저에 대한 정보를 가진 맵을 받아온다
	*/
	@Override
	public Map<String, String> getNaverUserInfo(String access_token){
		return naverLoginService.getNaverUserInfo(access_token);
	}
	
	
	/**
	* Method : naverUserLogOut
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 6.
	* 변경이력 :
	* @param access_token
	* Method 설명 : 네이버 유저 로그아웃 처리
	 * @throws UnsupportedEncodingException 
	*/
	public void naverUserLogOut(String access_token) throws UnsupportedEncodingException {
		naverLoginService.naverUserLogOut(access_token);
	}
}
