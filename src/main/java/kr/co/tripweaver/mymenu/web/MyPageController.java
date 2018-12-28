package kr.co.tripweaver.mymenu.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.tripweaver.essay.dao.EssayDao;
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
	
	Logger logger = LoggerFactory.getLogger(MyPageController.class);
	
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
		
		logger.debug("Mypage 게시판 관리 섹션 essayList : {}", essayList);
		
		//해당 회원이 가지고 있는 에세이 수 출력
		Integer essayTotalCnt = essayService.essayTotalCount(memberVo.getMem_id());
		int essayTotalPage = ((int)(essayTotalCnt/10))+((essayTotalCnt%10) == 0 ? 0: 1);
		
		model.addAttribute("essayList", essayList); //에세이 리스트
		model.addAttribute("essayTotalCnt", essayTotalCnt); //총 에세이 수 
		model.addAttribute("essayTotalPage", essayTotalPage); //총 에세이 페이지
		
		return "mypage/myPost";
	}
	
	/**
	* Method : essayPageAjaxView
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 28.
	* 변경이력 :
	* @param session
	* @param page
	* @param model
	* @return
	* Method 설명 : 페이지에 해당하는 에세이 객체 목록을 받아옴 
	*/
	@RequestMapping("/essayPageAjax")
	public String essayPageAjaxView(HttpSession session, String page, Model model) {
		
		MemberVO memberVo = (MemberVO)session.getAttribute("loginInfo");
		
		if(memberVo == null) {
			return "loginCheckError";
		}
		
		Map<String, String> param = new HashMap<>();
		
		param.put("page", page);
		param.put("mem_id", memberVo.getMem_id());
		
		List<EssayVO> essayList = essayService.selectEssayByMemIdForBoard(param);
		
		model.addAttribute("essayList", essayList);
		
		return "jsonView";
	}
}
