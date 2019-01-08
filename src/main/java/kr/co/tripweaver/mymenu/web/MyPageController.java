package kr.co.tripweaver.mymenu.web;

import java.io.File;
import java.io.IOException;
import java.net.URISyntaxException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.co.tripweaver.article.model.ArticleVO;
import kr.co.tripweaver.article.service.IArticleService;
import kr.co.tripweaver.essay.model.EssayVO;
import kr.co.tripweaver.essay.service.IEssayService;
import kr.co.tripweaver.member.model.MemberVO;
import kr.co.tripweaver.member.service.IMemberService;
import kr.co.tripweaver.mymenu.reservation.model.ReservationForMyPageVO;
import kr.co.tripweaver.mymenu.reservation.service.IReservationService;
import kr.co.tripweaver.postcard.model.PostCardVO;
import kr.co.tripweaver.postcard.service.IPostCardService;
import kr.co.tripweaver.util.file.FilePath;
import kr.co.tripweaver.util.file.FileUtil;

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
	
	@Autowired
	IPostCardService postCardService;
	
	@Autowired
	IArticleService articleSerivce;
	
	@Autowired
	IReservationService reservationService;
	
	@Autowired
	IMemberService memberService;
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
		
		int essayTotalPage = 1;
		
		if(essayTotalCnt != null) {
			essayTotalPage = ((int)(essayTotalCnt/10))+((essayTotalCnt%10) == 0 ? 0: 1);
		}
		
		//해당 회원이 가지고 있는 포스트 카드 수 출력 
		Integer postCardTotalCnt = postCardService.postCardTotalCount(memberVo.getMem_id());
		
		int postCardTotalPage = 1;
		
		if(postCardTotalCnt != null) {
			postCardTotalPage = ((int)(postCardTotalCnt/10))+((postCardTotalCnt%10) == 0 ? 0: 1);
		}
		
		//해당 회원이 가지고 있는 자유게시판 게시물 수 출력 
		Map<String, String> freeBoardParam = new HashMap<>();
		freeBoardParam.put("mem_id", memberVo.getMem_id());
		freeBoardParam.put("board_id", "bd00002");
		
		int freeBoardTotalCnt = articleSerivce.articleTotalCount(freeBoardParam);
		
		int freeBoardTotalPage = 1;
		
		if(freeBoardTotalCnt != 0) {
			freeBoardTotalPage = ((int)(freeBoardTotalCnt/10))+((freeBoardTotalCnt%10) == 0 ? 0: 1);
		}
		
		//해당 회원이 가지고 있는 가이드신청 게시물 수 출력 
		Map<String, String> guideRequestBoardParam = new HashMap<>();
		guideRequestBoardParam.put("mem_id", memberVo.getMem_id());
		guideRequestBoardParam.put("board_id", "bd00003");
		
		int guideRequestBoardTotalCnt = articleSerivce.articleTotalCount(guideRequestBoardParam);
		
		int guideRequestBoardTotalPage = 1;
		
		if(guideRequestBoardTotalCnt != 0) {
			guideRequestBoardTotalPage = ((int)(guideRequestBoardTotalCnt/10))+((guideRequestBoardTotalCnt%10) == 0 ? 0: 1);
		}
		
		//해당 회원이 가지고 있는 QnA 게시물 수 출력 
		Map<String, String> qnaBoardParam = new HashMap<>();
		qnaBoardParam.put("mem_id", memberVo.getMem_id());
		qnaBoardParam.put("board_id", "bd00004");
		
		int qnaBoardTotalCnt = articleSerivce.articleTotalCount(qnaBoardParam);
		
		int qnaBoardTotalPage = 1;
		
		if(qnaBoardTotalCnt != 0) {
			qnaBoardTotalPage = ((int)(qnaBoardTotalCnt/10))+((qnaBoardTotalCnt%10) == 0 ? 0: 1);
		}
		
		//해당 회원이 가지고 있는 가이드 찾기 게시물 수 출력 
		Map<String, String> guideSearchingBoardParam = new HashMap<>();
		guideSearchingBoardParam.put("mem_id", memberVo.getMem_id());
		guideSearchingBoardParam.put("board_id", "bd00006");
		
		int guideSearchingBoardTotalCnt = articleSerivce.articleTotalCount(guideSearchingBoardParam);
		
		int guideSearchingBoardTotalPage = 1;
		
		if(guideSearchingBoardTotalCnt != 0) {
			guideSearchingBoardTotalPage = ((int)(guideSearchingBoardTotalCnt/10))+((guideSearchingBoardTotalCnt%10) == 0 ? 0: 1);
		}
		
		//해당 회원이 가지고 있는 파트너 찾기 게시물 수 출력 
		Map<String, String> partnerSearchingBoardParam = new HashMap<>();
		partnerSearchingBoardParam.put("mem_id", memberVo.getMem_id());
		partnerSearchingBoardParam.put("board_id", "bd00007");
		
		int partnerSearchingBoardTotalCnt = articleSerivce.articleTotalCount(partnerSearchingBoardParam);
		
		int partnerSearchingBoardTotalPage = 1;
		
		if(partnerSearchingBoardTotalCnt != 0) {
			partnerSearchingBoardTotalPage = ((int)(partnerSearchingBoardTotalCnt/10))+((partnerSearchingBoardTotalCnt%10) == 0 ? 0: 1);
		}
				
		model.addAttribute("essayList", essayList); //에세이 리스트
		model.addAttribute("essayTotalCnt", essayTotalCnt); //총 에세이 수 
		model.addAttribute("essayTotalPage", essayTotalPage); //총 에세이 페이지
		
		model.addAttribute("postCardTotalCnt", postCardTotalCnt); //총 포스트카드 수 
		model.addAttribute("postCardTotalPage", postCardTotalPage); //총 포스트카드 페이지
		
		model.addAttribute("freeBoardTotalCnt", freeBoardTotalCnt); //총 자유게시판 게시물 수 
		model.addAttribute("freeBoardTotalPage", freeBoardTotalPage); //총 자유게시판 페이지
		
		model.addAttribute("guideRequestBoardTotalCnt", guideRequestBoardTotalCnt); //총 가이드 신청 게시물 수 
		model.addAttribute("guideRequestBoardTotalPage", guideRequestBoardTotalPage); //총 가이드 신청 페이지
		
		model.addAttribute("qnaBoardTotalCnt", qnaBoardTotalCnt); //총 Q n A 게시물 수 
		model.addAttribute("qnaBoardTotalPage", qnaBoardTotalPage); //총 Q n A 페이지
		
		model.addAttribute("guideSearchingBoardTotalCnt", guideSearchingBoardTotalCnt); //총 가이드 찾기 게시물 수 
		model.addAttribute("guideSearchingBoardTotalPage", guideSearchingBoardTotalPage); //총 가이드 찾기 페이지
		
		model.addAttribute("partnerSearchingBoardTotalCnt", partnerSearchingBoardTotalCnt); //총 파트너 찾기 게시물 수 
		model.addAttribute("partnerSearchingBoardTotalPage", partnerSearchingBoardTotalPage); //총 파트너 찾기 페이지
		
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
	public String essayPageAjaxView(HttpSession session, String page, Model model
			,@RequestParam(name="sfl", defaultValue="title", required=false) String category
			,@RequestParam(name="stx", defaultValue="", required=false) String searchValue) {
		
		MemberVO memberVo = (MemberVO)session.getAttribute("loginInfo");
		
		if(memberVo == null) {
			return "loginCheckError";
		}
		
		logger.debug("category : {}", category);
		logger.debug("searchValue : {}", searchValue);
		logger.debug("page essayPageAjax : {}", page);
		
		Map<String, String> param = new HashMap<>();
		
		param.put("page", page);
		param.put("mem_id", memberVo.getMem_id());
		param.put(category, searchValue);
		
		List<EssayVO> essayList = essayService.selectEssayByMemIdForBoard(param);
		
		model.addAttribute("essayList", essayList);
		
		return "jsonView";
	}
	
	
	
	/**
	* Method : postCardPageAjaxView
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 28.
	* 변경이력 :
	* @param session
	* @param page
	* @param model
	* @return
	* Method 설명 : 해당하는 포스트카드 목록을 불러옴
	*/
	@RequestMapping("/postCardPageAjax")
	public String postCardPageAjaxView(HttpSession session, String page, Model model) {
		
		MemberVO memberVo = (MemberVO)session.getAttribute("loginInfo");
		
		if(memberVo == null) {
			return "loginCheckError";
		}
		
		Map<String, String> param = new HashMap<>();
		
		param.put("page", page);
		param.put("mem_id", memberVo.getMem_id());
		
		List<PostCardVO> postCardList = postCardService.selectPostCardByMemIdForBoard(param);
		
		model.addAttribute("postCardList", postCardList);
		
		return "jsonView";
	}
	
	/**
	* Method : boardPageAjaxView
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 28.
	* 변경이력 :
	* @param session
	* @param page
	* @param model
	* @return
	* Method 설명 : 해당하는 게시판 목록을 불러옴
	*/
	@RequestMapping("/boardPageAjax")
	public String boardPageAjaxView(HttpSession session, String page, Model model, String board_id
			,@RequestParam(name="sfl", defaultValue="title", required=false) String category
			,@RequestParam(name="stx", defaultValue="", required=false) String searchValue) {
		
		MemberVO memberVo = (MemberVO)session.getAttribute("loginInfo");
		
		if(memberVo == null) {
			return "loginCheckError";
		}
		
		Map<String, String> param = new HashMap<>();
		
		param.put("page", page);
		param.put("mem_id", memberVo.getMem_id());
		param.put("board_id", board_id);
		param.put(category, searchValue);
		
		List<ArticleVO> articleList = articleSerivce.selectEssayByMemIdAndBoardIdForBoard(param);
		
		model.addAttribute("articleList", articleList);
		
		return "jsonView";
	}
	
	/**
	* Method : reservationView
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 28.
	* 변경이력 :
	* @return
	* Method 설명 : 가이드 예약 관련 뷰 
	*/
	@RequestMapping("reservation")
	public String reservationView(Model model, HttpSession session, @RequestParam(value="page", defaultValue="1", required=false) String page
			, @RequestParam(value="sc", defaultValue="mem_nick", required=false) String sc
			, @RequestParam(value="searchText", defaultValue="", required=false) String searchText) {
		
		MemberVO memberVo = (MemberVO)session.getAttribute("loginInfo");
		
		if(memberVo == null) {
			return "loginCheckError";
		}
		
		//해당 가이드 회원에 대한 모든 예약에 대한 인원 수 
		int reserTotalCnt = reservationService.reserPeoTotalCntByMemId(memberVo.getMem_id());
		
		//해당 가이드 회원의 총 예약 건수 
		int reserCnt = reservationService.reserTotalByMemId(memberVo.getMem_id());
		
		int reserPage = 1;
		
		if(reserCnt != 0) {
			reserPage = ((int)(reserCnt/10))+((reserCnt%10) == 0 ? 0: 1);
		}
		
		//가이드가 받은 예약 리스트 
		Map<String, String> param = new HashMap<>();
		param.put("page", page);
		param.put("mem_id", memberVo.getMem_id());
		param.put(sc, searchText);
		
		
		List<ReservationForMyPageVO> reservationList = reservationService.selectReserForGuide(param);
		
		model.addAttribute("reserCnt", reserCnt);
		model.addAttribute("reserTotalCnt", reserTotalCnt);
		model.addAttribute("reservationList", reservationList);
		model.addAttribute("page", reserPage);
		model.addAttribute("currentPage", page);
		return "mypage/reservation";
	}
	
	
	/**
	* Method : reservationView
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 28.
	* 변경이력 :
	* @return
	* Method 설명 : 예약자 예약 관련 뷰 
	*/
	@RequestMapping("guide")
	public String guideView(Model model, HttpSession session, @RequestParam(value="page", defaultValue="1", required=false) String page
			, @RequestParam(value="sc", defaultValue="mem_nick", required=false) String sc
			, @RequestParam(value="searchText", defaultValue="", required=false) String searchText) {
		
		MemberVO memberVo = (MemberVO)session.getAttribute("loginInfo");
		
		if(memberVo == null) {
			return "loginCheckError";
		}
		
		
		//해당 예약자 회원의 총 예약 건수 
		int reserCnt = reservationService.reserTotalForMember(memberVo.getMem_id());
		
		int reserPage = 1;
		
		if(reserCnt != 0) {
			reserPage = ((int)(reserCnt/10))+((reserCnt%10) == 0 ? 0: 1);
		}
		
		//가이드가 받은 예약 리스트 
		Map<String, String> param = new HashMap<>();
		param.put("page", page);
		param.put("mem_id", memberVo.getMem_id());
		param.put(sc, searchText);
		
		
		List<ReservationForMyPageVO> reservationList = reservationService.selectReserForMember(param);
		
		model.addAttribute("reserCnt", reserCnt);
		model.addAttribute("reservationList", reservationList);
		model.addAttribute("page", reserPage);
		model.addAttribute("currentPage", page);
		return "mypage/guide";
	}
	
	/**
	* Method : memberEditView
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2019. 1. 2.
	* 변경이력 :
	* @param mem_id
	* @return
	* Method 설명 : 해당 회원의 정보를 받아온다.  
	*/
	@RequestMapping("/memberEdit")
	public String memberEditView(Model model) {
		
		return "mypage/member_edit";
	}
	
	/**
	* Method : memberEditForm
	* 작성자 : Jae Hyeon Choi/ jin
	* 생성날짜 : 2019. 1. 2. / 2019. 1. 7.(수정)
	* 변경이력 :
	* @param model
	* @return
	* Method 설명 : 해당 회원의 받은 정보로 정보를 수정한다. 
	 * @throws IOException 
	 * @throws IllegalStateException 
	*/
	@RequestMapping("/memberEditForm")
	public String memberEditForm(MemberVO memberVo, MultipartFile mem_profile_file, HttpSession session) throws IllegalStateException, IOException {
		
		logger.debug("memberVO : {}", memberVo);
		logger.debug("mem_profile_file : {}", mem_profile_file);
		

		MemberVO InfoMemberVo = (MemberVO)session.getAttribute("loginInfo");
		
		//멤버에 대한 정보가 없을경우
		if(InfoMemberVo == null) {
			return "loginCheckError";
		}
		
		//처음에 대표 이미지 파일이 있는지 먼저 확인해본다.
		if(!(mem_profile_file==null)) {
			//이미지 파일이 존재한다면 이부분이 실행된다.
			
			byte[] bytes = mem_profile_file.getBytes();
			String path = FilePath.PATH;
			String att_path = "/profile";
			String att_file_ori_name = mem_profile_file.getOriginalFilename();
			String fileExt = FileUtil.getFileExt(att_file_ori_name);
			String att_file_name = UUID.randomUUID().toString() + fileExt;
			
			//각자 java프로젝트 upload폴더에 저장
			File fileTest = new File(path + att_path + File.separator + att_file_name);
			
			
			if(!att_file_name.endsWith(".jpg")&&!att_file_name.endsWith(".gif")&&!att_file_name.endsWith(".png")){
				fileTest.delete();
			}else{
				//수정전 이미지가 존재한다면 삭제한다.
				File prev_file = new File(path + InfoMemberVo.getMem_profile());
				if(prev_file.exists()) {
					if(prev_file.delete()) {
						logger.debug("기존 파일 삭제 성공");
					} else {
						logger.debug("기존 파일 삭제 실패");
					}
				}
				mem_profile_file.transferTo(fileTest);
				memberVo.setMem_profile(att_path + "/" + att_file_name);
			}
		}else {
			//이미지 파일이 존재하지 않는다면 이부분이 실행된다.
			memberVo.setMem_profile("");
		}
		
		int resultCnt = memberService.updateMember(memberVo);
		
		if(resultCnt == 0) {
			return "dbError";
		}
		
		MemberVO updateMemberVo = memberService.selectMemberById(memberVo.getMem_id());
		
		session.setAttribute("loginInfo", updateMemberVo);
		
		return "redirect: /main/mypage";
	}
}
