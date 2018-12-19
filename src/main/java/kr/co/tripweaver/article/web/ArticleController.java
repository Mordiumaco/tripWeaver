package kr.co.tripweaver.article.web;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.co.tripweaver.article.model.ArticleVO;
import kr.co.tripweaver.article.service.IArticleService;
import kr.co.tripweaver.board.model.BoardVO;
import kr.co.tripweaver.board.service.IBoardService;
import kr.co.tripweaver.board.web.BoardController;
import kr.co.tripweaver.common.attachment.service.IAttachmentService;
import kr.co.tripweaver.member.model.MemberVO;
import kr.co.tripweaver.util.model.PageVO;

@RequestMapping("/article")
@Controller
public class ArticleController {

	Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Resource(name = "articleService")
	private IArticleService articleService;

	@Resource(name = "attachmentService")
	private IAttachmentService attachmentService;

	@Autowired
	private IBoardService boardService;
	
	/**
	* Method : articleListView
	* 작성자 : pc23
	* 변경이력 :
	* @param pageVo
	* @param board_id
	* @param model
	* @return
	* Method 설명 : 게시글 페이지 리스트
	*/
	@RequestMapping("/articleFree")
	public String articleListView(PageVO pageVo, @RequestParam("board_id")String board_id, Model model) {
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("pageVo", pageVo);
		param.put("board_id", board_id);

		Map<String, Object> resultMap = articleService.articlePagingList(param);

		List<ArticleVO> articleList = (List<ArticleVO>) resultMap.get("articleList");
		int pageCnt = (int) resultMap.get("pageCnt");

		model.addAttribute("articleList", articleList);
		model.addAttribute("pageCnt", pageCnt);
		model.addAttribute("board_id", board_id);
		model.addAttribute("page", pageVo.getPage());

		return "article/articleFree";
		
	}

	/**
	 * Method : ArticleView 작성자 : pc23 변경이력 :
	 * 
	 * @param session
	 * @param art_cnt
	 * @param atr_title
	 * @param request
	 * @return Method 설명 : 글쓰기 화면 view
	 */
	@RequestMapping(value = "/articleView", method = RequestMethod.GET)
	public String ArticleView(HttpSession session, @RequestParam("board_id") String board_id,
			HttpServletRequest request, Model model) {

		List<BoardVO> boardList = boardService.selectBoardAllList();

		MemberVO memberVo = (MemberVO) session.getAttribute("loginInfo");

		if (memberVo == null) {
			return "loginCheckError";
		}
		logger.debug("memberVo[loginInfo] : {} ", memberVo);

		model.addAttribute("boardList", boardList);

		return "servicecenter/write";
	}

	/**
	 * Method : ArticleInsert 작성자 : pc23 변경이력 :
	 * 
	 * @param session
	 * @param art_cnt
	 * @param atr_title
	 * @param art_secret
	 * @param attachments
	 * @param request
	 * @return Method 설명 : 게시글 insert
	 * @throws IOException
	 * @throws IllegalStateException
	 */
	@RequestMapping(value = "/insertArticle", method = RequestMethod.POST)
	public String ArticleInsert(HttpSession session,@RequestParam("board_id")String board_id, @RequestParam("art_cnt") String art_cnt,
			@RequestParam("art_title") String art_title, @RequestParam("art_secret") String art_secret,
			@RequestParam("attachments") MultipartFile[] attachments, HttpServletRequest request)
			throws IllegalStateException, IOException {

		MemberVO memberVo = (MemberVO) session.getAttribute("loginInfo");

		String mem_id = memberVo.getMem_id();
		String[] article_file = new String[] { "", "" };
		String[] fileName = new String[] { "", "" };

		int cnt = 0;
		String path = "C:/upload/";
		for (int i = 0; i < attachments.length; i++) {

			if (attachments[i] == null || attachments[i].isEmpty()) {
				cnt = i;
				break;
			}

			fileName[i] = attachments[i].getOriginalFilename();

			if (!fileName[i].equals("")) {
				article_file[i] = "attachment/" + UUID.randomUUID().toString();
				attachments[i].transferTo(new File(path + File.separator + article_file[i]));
			}
			
		}
		if(art_secret.equals("on")) {
			art_secret = "Y";
		} else {
			art_secret = "N";
		}
		
		ArticleVO articleVo = new ArticleVO();
		articleVo.setArt_cnt(art_cnt);
		articleVo.setArt_title(art_title);
		articleVo.setArt_secret(art_secret);
		articleVo.setBoard_id(board_id);
		
		logger.debug("art_secret[art_secret] : {} ", art_secret);
		articleVo.setMem_id(mem_id);

		String art_id = articleService.insertArticle(articleVo);

		if (art_id != null) {

			for (int i = 0; i < cnt; i++) {
				
				Map<String, Object> param2 = new HashMap<String, Object>();
				
				param2.put("att_file_ori_name", fileName[i]);
				param2.put("att_path", path);
				param2.put("att_file_name", article_file[i]);
				param2.put("filter_id", "article");
				param2.put("att_rel_art_id", art_id);

				int atInsert = attachmentService.attachmentInsert(param2);

				if (atInsert != 0) {

				} else {
					System.out.println("**게시글 첨부파일 오류**");
					return "dbError";
				}
			}
			return "servicecenter/list";
			
		} else {
			
			return "dbError";
		}

	}

	
}
