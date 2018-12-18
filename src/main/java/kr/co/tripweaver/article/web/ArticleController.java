package kr.co.tripweaver.article.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.co.tripweaver.article.model.ArticleVO;
import kr.co.tripweaver.article.service.IArticleService;
import kr.co.tripweaver.board.web.BoardController;
import kr.co.tripweaver.member.model.MemberVO;

@RequestMapping("/article")
@Controller
public class ArticleController {
	
	Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Resource(name="articleService")
	private IArticleService articleService;

	/**
	* Method : ArticleView
	* 작성자 : pc23
	* 변경이력 :
	* @param session
	* @param art_cnt
	* @param atr_title
	* @param request
	* @return
	* Method 설명 : 글쓰기 화면 view
	*/
	@RequestMapping(value="/articleView", method=RequestMethod.GET)
	public String ArticleView(HttpSession session, @RequestParam("board_id")String board_id, HttpServletRequest request) {
		
		MemberVO memberVo = (MemberVO)session.getAttribute("loginInfo");
		
		logger.debug("memberVo[loginInfo] : {} ", memberVo);
		
		String mem_id = memberVo.getMem_id();
		
		return "servicecenter/write/create_board";
	}
	
	/**
	* Method : ArticleInsert
	* 작성자 : pc23
	* 변경이력 :
	* @param session
	* @param art_cnt
	* @param atr_title
	* @param art_secret
	* @param attachments
	* @param request
	* @return
	* Method 설명 : 게시글 insert
	*/
	@RequestMapping(value="/articleInsert", method=RequestMethod.POST)
	public String ArticleInsert(HttpSession session, @RequestParam("art_cnt")String art_cnt, @RequestParam("atr_title")String atr_title, @RequestParam("art_secret")String art_secret, @RequestParam("attachment") MultipartFile[] attachments, HttpServletRequest request) {
		
		MemberVO memberVo = (MemberVO)session.getAttribute("loginInfo");
		
		logger.debug("memberVo[loginInfo] : {} ", memberVo);
		
		String mem_id = memberVo.getMem_id();
		
		ArticleVO articleVo = new ArticleVO();
		articleVo.setArt_cnt(art_cnt);
		articleVo.setAtr_title(atr_title);
		articleVo.setMem_id(mem_id);
		
		int insertCnt = articleService.insertArticle(articleVo);
		
//		List<ArticleVO> boardList = articleService.selectArticleAllList();
//		request.setAttribute("gnb", 2);
//		request.setAttribute("articleList", articleList);
		
		return "admin/board/create_board";
	}
	
}
