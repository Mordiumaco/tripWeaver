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
import kr.co.tripweaver.common.attachment.model.AttachmentVO;
import kr.co.tripweaver.common.attachment.service.IAttachmentService;
import kr.co.tripweaver.common.comment.model.CommentVO;
import kr.co.tripweaver.common.comment.service.ICommentService;
import kr.co.tripweaver.member.model.MemberVO;
import kr.co.tripweaver.util.file.FileUtil;
import kr.co.tripweaver.util.model.PageVO;

@RequestMapping("/article")
@Controller
public class ArticleController {

	Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Resource(name = "articleService")
	private IArticleService articleService;

	@Resource(name = "attachmentService")
	private IAttachmentService attachmentService;

	@Resource(name = "commentService")
	private ICommentService commentService;
	
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
	@RequestMapping("/articlePageList")
	public String articleListView(PageVO pageVo, @RequestParam("board_id")String board_id, Model model,
			@RequestParam(value = "search", required=false, defaultValue="art_title") String search, 
			@RequestParam(value = "searchWord", required=false, defaultValue="") String searchWord) {
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("pageVo", pageVo);
		param.put("board_id", board_id);
		param.put("search", search);
		param.put("searchWord", searchWord);
		
		List<ArticleVO> articleList = articleService.articlePagingList(param);

//		int pageCnt = (int) articleList.get("pageCnt");

		int totalArticleCnt = articleService.getArticleCnt(param);
		int pageCnt = (int) Math.ceil(totalArticleCnt/pageVo.getPageSize()); 
		
		model.addAttribute("articleList", articleList);
		logger.debug("articleList[loginInfo] : {} ", articleList);
		model.addAttribute("totalArticleCnt", totalArticleCnt);
		model.addAttribute("board_id", board_id);
		model.addAttribute("pageCnt", pageCnt);

		return "article/articlePageList";
		
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
	public String articleView(HttpSession session, @RequestParam("board_id") String board_id,
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
	* Method : ArticleInsert
	* 작성자 : pc23
	* 변경이력 :
	* @param session
	* @param board_id
	* @param art_cnt
	* @param art_title
	* @param art_secret
	* @param attachments
	* @param request
	* @return
	* @throws IllegalStateException
	* @throws IOException
	* Method 설명 : 게시판 insert
	*/
	@RequestMapping(value = "/insertArticle", method = RequestMethod.POST)
	public String articleInsert(HttpSession session,@RequestParam("board_id")String board_id, @RequestParam("art_cnt") String art_cnt,
			@RequestParam("art_title") String art_title, @RequestParam(value="art_secret", required=false) String art_secret,
			@RequestParam("attachments") MultipartFile[] attachments, HttpServletRequest request)
			throws IllegalStateException, IOException {

		MemberVO memberVo = (MemberVO) session.getAttribute("loginInfo");

		String mem_id = memberVo.getMem_id();
		String[] att_file_name = new String[2] ;
		String[] att_file_ori_name = new String[2];
		String att_path = "attachment/";
		
		int cnt = 0;
		String path = "C:/upload";
		
		for (MultipartFile file : attachments) {
			
			
			if (file == null || file.isEmpty()) {
				continue;
			}

			att_file_ori_name[cnt] = file.getOriginalFilename();
			logger.debug("att_file_ori_name[cnt] {}", att_file_ori_name[cnt]);

			String fileExt = FileUtil.getFileExt(att_file_ori_name[cnt]);
			if (!(att_file_ori_name[cnt].equals(""))) {
				att_file_name[cnt] = UUID.randomUUID().toString() + fileExt;
			logger.debug("att_file_name[cnt] {}", att_file_name[cnt]);
				file.transferTo(new File(path + File.separator + att_path + att_file_name[cnt]));
			}
			
			cnt++;
		}
		
		logger.debug("cnt{}", cnt);
		for (int i = 0; i < att_file_ori_name.length; i++) {
			logger.debug("서준영[]");
			logger.debug("att_file_ori_name : {}", att_file_ori_name[i]);
			logger.debug("att_path : {}", path);
			logger.debug("att_file_name : {}", att_file_name[i]);
			logger.debug("filter_id : {}", "article");
		}
		
		
		if(art_secret == null) {
			art_secret = "N";
		} else if(art_secret.equals("on")){
			art_secret = "Y";
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
			logger.debug("최재현{}");
			for (int i = 0; i < cnt; i++) {
				Map<String, Object> param2 = new HashMap<String, Object>();
				logger.debug("박동주[]");
				logger.debug("att_file_ori_name{}", att_file_ori_name[i]);
				logger.debug("att_path{}", path);
				logger.debug("att_file_name{}", att_file_name[i]);
				logger.debug("filter_id{}", "article");
				logger.debug("att_rel_art_id{}", art_id);
				
				param2.put("att_file_ori_name", att_file_ori_name[i]);
				param2.put("att_path", path);
				param2.put("att_file_name", att_file_name[i]);
				param2.put("filter_id", "article");
				param2.put("att_rel_art_id", art_id);

				int atInsert = attachmentService.attachmentInsert(param2);

				if (atInsert != 0) {

				} else {
					System.out.println("**게시글 첨부파일 오류**");
					return "dbError";
				}
			}
			return "redirect: /main/board?board_id="+board_id;
		} else {
			return "dbError";
		}
	}

	/**
	* Method : articleDetail
	* 작성자 : pc23
	* 변경이력 :
	* @param art_id
	* @param model
	* @return
	* Method 설명 : 게시글 상세 view
	*/
	@RequestMapping(value= {"/articleDetail"}, method= {RequestMethod.GET})
	public String articleDetail(@RequestParam("art_id") String art_id, Model model) {

		ArticleVO articleVo = articleService.getArticleDetail(art_id);
		logger.debug("art_id동주[] : {} ", art_id);
		logger.debug("articleVo[] : {} ", articleVo);
		List<AttachmentVO> attachmentList = attachmentService.getAttachmemt(art_id);

		model.addAttribute("articleVo", articleVo);
		model.addAttribute("attachmentList", attachmentList);
		
		logger.debug("attachmentList[loginInfo] : {} ", attachmentList);

		List<CommentVO> comtList = commentService.articleCommentList(art_id);
		model.addAttribute("comtList", comtList);
		logger.debug("comtList.size : {}", comtList.size());
		
		return "servicecenter/view";
	}
	
	/**
	* Method : commentInsert
	* 작성자 : pc23
	* 변경이력 :
	* @param request
	* @param comt_cnt
	* @param ct_content
	* @param comt_secret
	* @param session
	* @return
	* Method 설명 : 댓글 insert
	*/
	@RequestMapping(value= {"/insertComment"})
	public String commentInsert(HttpServletRequest request, @RequestParam("comt_cnt")String comt_cnt, 
			@RequestParam(value="comt_secret", required=false, defaultValue="N") String comt_secret,
			@RequestParam("art_id")String art_id,
			HttpSession session, Model model) {
		
		MemberVO memberVo = (MemberVO) session.getAttribute("loginInfo");

		String mem_id = memberVo.getMem_id();
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("mem_id", mem_id);
		param.put("comt_cnt", comt_cnt);
		logger.debug("내용[] ", comt_cnt);
		param.put("comt_secret", comt_secret);
		param.put("comt_rel_art_id", art_id);
		param.put("filter_id", "article");
		
		int commentCnt = commentService.commentInsert(param);
		
		List<CommentVO> comtList = commentService.articleCommentList(art_id);
		model.addAllAttributes(comtList);
		logger.debug("comtList[] : ", comtList);
		
		if(commentCnt != 0){
			return "redirect: /article/articleDetail?art_id="+art_id;
		} else {
			return "dbError";
		}
	}
	
	
	
	
}
