package kr.co.tripweaver.postcard.web;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.tripweaver.common.attachment.model.AttachmentVO;
import kr.co.tripweaver.common.attachment.service.IAttachmentService;
import kr.co.tripweaver.common.comment.model.CommentVO;
import kr.co.tripweaver.common.comment.service.ICommentService;
import kr.co.tripweaver.common.like.model.LikeVO;
import kr.co.tripweaver.common.like.service.ILikeService;
import kr.co.tripweaver.manager.report.model.ReportVO;
import kr.co.tripweaver.manager.report.service.IReportService;
import kr.co.tripweaver.postcard.model.PostCardVO;
import kr.co.tripweaver.postcard.service.IPostCardService;
import kr.co.tripweaver.util.file.FilePath;
import kr.co.tripweaver.util.model.PageVO;

@RequestMapping("/postCard")
@Controller
public class PostCardController {
	
	@Autowired
	IPostCardService postCardService;
	
	@Autowired
	ILikeService likeService;
	
	@Autowired
	ICommentService commentService;
	
	@Autowired
	IAttachmentService attachmentService;
	
	@Autowired
	IReportService reportService;
	
	
	// 최초 메뉴 포스트 카드로 이동
	@RequestMapping("/postCardList")
	public String postCardListView(Model model, @RequestParam("mem_id")String mem_id, @RequestParam("tag_search")String tag_search) {
		
		PageVO pageVo = new PageVO(1, 1);
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("tag_search", tag_search);
		params.put("pageVo", pageVo);
		
		Map<String, Object> postCardPage =  postCardService.selectPostCardAll(params);
		model.addAllAttributes(postCardPage);
		
		//신고사유 
		List<ReportVO> reportVOs = reportService.selectReportreason();
		model.addAttribute("reportVOs", reportVOs);
		
		if(!(mem_id.equals(""))) {
			List<LikeVO> likeVo = likeService.likeAll(mem_id);
			model.addAttribute("likeVo",likeVo);
		}
		
		return "postcard/postList";
	}
	
	// 포스트 카드로 이동
	@RequestMapping("/postCardListAjax")
	public String postCardListViewAjax(Model model, @RequestParam("mem_id")String mem_id, @RequestParam("tag_search")String tag_search, PageVO pageVo) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("tag_search", tag_search);
		params.put("pageVo", pageVo);
		
		Map<String, Object> postCardPage =  postCardService.selectPostCardAll(params);
		model.addAllAttributes(postCardPage);
		
		//신고사유 
		List<ReportVO> reportVOs = reportService.selectReportreason();
		model.addAttribute("reportVOs", reportVOs);

		if(!(mem_id.equals(""))) {
			List<LikeVO> likeVo = likeService.likeAll(mem_id);
			model.addAttribute("likeVo",likeVo);
		}
		
		return "postcard/postListAjax";
	}
	
	
	// 좋아요 추가 
	@RequestMapping(value="/likeAdd", method=RequestMethod.POST)
	@ResponseBody
	public int likeAdd(LikeVO likeVo) {
		
		int likeAddCnt = likeService.likeAdd(likeVo);
		
		return likeAddCnt;
	}
	
	// 좋아요 삭제
	@RequestMapping(value="/likeDelete", method=RequestMethod.POST)
	@ResponseBody
	public int likelikeDelete(LikeVO likeVo) {
		
		int likeDeleteCnt = likeService.likeDelete(likeVo);

		return likeDeleteCnt;
	}
	
	// 포스트 카드 삭제
	@RequestMapping(value="/postcardDelete", method=RequestMethod.POST)
	@ResponseBody
	public int postcardDelete(PostCardVO postcardVo) {
		
		int posetcardDeleteCnt =  postCardService.deletePostcard(postcardVo);
		
		return posetcardDeleteCnt;
	}
	
	// 포스트 카드 글쓰기 페이지 이동
	@RequestMapping("/postWrite")
	public String postWriteView() {
		return "postcard/postWrite" ;
	}
	
	// 포스트카드 인서트
	@RequestMapping(value="/insertPostcard", method=RequestMethod.POST)
	public String insertPostcard(PostCardVO postcardVo, @RequestPart("att_file_ori_name")MultipartFile[] part, HttpServletRequest request) {
		
		// 파일 첨부 
		List<AttachmentVO> listFileVo = new ArrayList<AttachmentVO>();
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		if(part != null) {
			for(MultipartFile mufi : part) {
				try {
					if(mufi.getSize() > 0) {
						AttachmentVO attachmentVo = new AttachmentVO();
						String att_path = "/postcard";
						String att_file_name = UUID.randomUUID().toString() + mufi.getOriginalFilename();
						attachmentVo.setAtt_path(att_path);
						attachmentVo.setAtt_file_name(att_file_name);
						attachmentVo.setAtt_file_ori_name(mufi.getOriginalFilename());
						attachmentVo.setFilter_id("postcard");
						
						mufi.transferTo(new File(FilePath.PATH+ att_path + File.separator + att_file_name));
						listFileVo.add(attachmentVo);
					}
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			}
			resultMap.put("attachmentVo", listFileVo);
		}
		resultMap.put("postcardVo", postcardVo);
		
		int insertPostcardCnt = postCardService.insertPostcard(resultMap);
		
		return "redirect:/postCard/postCardList?mem_id=" + postcardVo.getMem_id() + "&tag_search=";
	}
	
	// 포스트카드 수정 페이지 이동
	@RequestMapping(value="/postUpdate", method=RequestMethod.POST)
	public String postUpdateView(Model model, PostCardVO postCardVo) {
		
		PostCardVO selectpostcardVo = postCardService.selectPostcard(postCardVo.getPc_id());
		List<AttachmentVO> AttVo = attachmentService.selectPostcardFile(postCardVo.getPc_id());
		
		model.addAttribute("pc_cnt", selectpostcardVo.getPc_cnt());
		model.addAttribute("mem_id", postCardVo.getMem_id());
		model.addAttribute("attVo", AttVo);	
		model.addAttribute("pc_id", postCardVo.getPc_id());
		
		return "postcard/postUpdate";
	}
	
	// 포스트카드 업데이트
	@RequestMapping(value="/updatePostcard", method=RequestMethod.POST)
	public String updatePostcard(Model model, PostCardVO postcardVo, @RequestPart("att_file_ori_name")MultipartFile[] part, HttpServletRequest request) {
		
		// 파일 첨부 
		List<AttachmentVO> listFileVo = new ArrayList<AttachmentVO>();
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		if(part != null) {
			for(MultipartFile mufi : part) {
				try {
					if(mufi.getSize() > 0) {
						AttachmentVO attachmentVo = new AttachmentVO();
						String att_path = "/postcard";
						String att_file_name = UUID.randomUUID().toString() + mufi.getOriginalFilename();
						attachmentVo.setAtt_path(att_path);
						attachmentVo.setAtt_file_name(att_file_name);
						attachmentVo.setAtt_file_ori_name(mufi.getOriginalFilename());
						attachmentVo.setFilter_id("postcard");
						
						mufi.transferTo(new File(FilePath.PATH+ att_path + File.separator + att_file_name));
						listFileVo.add(attachmentVo);
					}
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			}
			resultMap.put("attachmentVo", listFileVo);
		}
		resultMap.put("postcardVo", postcardVo);
		
		int updatePostcardCnt = postCardService.updatePostcard(resultMap);
		
		return "redirect:/postCard/postCardList?mem_id=" + postcardVo.getMem_id() + "&tag_search=";
	}
	
	// 댓글 쓰기
	@RequestMapping(value="/insertComment", method=RequestMethod.POST)
	@ResponseBody
	public CommentVO insertComment(PostCardVO postcardVo, CommentVO commentVo){
		   String comt_id = commentService.insertComment(commentVo);
		   commentVo.setComt_id(comt_id);
		return commentVo;
	};
	
	// 댓글 삭제
	@RequestMapping(value="/deleteComment", method=RequestMethod.POST)
	@ResponseBody
	public String deleteComment(@RequestParam("comt_id")String comt_id) {
			int deleteCommentCnt = commentService.deleteComment(comt_id);
		return "test";
	}
	
	// 댓글 수정
	@RequestMapping(value="/updateComment", method=RequestMethod.POST)
	@ResponseBody
	public CommentVO updateComment(CommentVO commentVo) {
			commentService.updateComment(commentVo);
		return commentVo;
	}
	
}
