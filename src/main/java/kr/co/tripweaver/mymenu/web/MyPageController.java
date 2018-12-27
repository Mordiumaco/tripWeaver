package kr.co.tripweaver.mymenu.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.tripweaver.essay.model.EssayVO;
import kr.co.tripweaver.essay.service.IEssayService;
import kr.co.tripweaver.member.model.MemberVO;

/**
* MyPageController.java
*
* @author Jae Hyeon Choi
* @version 1.0
* @since 2018. 12. 26.
* @see
* 
* << 클래스 생성 목적 >>
* 
* MyPage Section
*
* << 개정이력(Modification Information) >>
*
* 수정자 수정내용
* ------ ------------------------
* Jae Hyeon Choi 최초 생성
*
* 
*/

@RequestMapping("mypage")
@Controller
public class MyPageController {
	
	@Autowired
	IEssayService essayService;
	
	/**
	* Method : myPostView
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 27.
	* 변경이력 :
	* @return
	* Method 설명 : MYpage 게시글 관리 섹션 뷰
	*/
	@RequestMapping("/myPost")
	public String myPostView(HttpSession session, Model model) {
		
		MemberVO memberVo = (MemberVO)session.getAttribute("loginInfo");
		
		if(memberVo == null) {
			return "loginCheckError";
		}
		
		Map<String, String> essayParam = new HashMap<>();
		
		essayParam.put("mem_id", memberVo.getMem_id());
		essayParam.put("page", "1");
		
		//에세이 초기 리스트 출력 
		List<EssayVO> essayList = essayService.selectEssayByMemIdForBoard(essayParam);
		
		
		
		model.addAttribute("essayList", essayList);
		
		return "mypage/myPost";
	}
	
}
