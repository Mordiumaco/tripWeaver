package kr.co.tripweaver.postcard.web;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.tripweaver.common.comment.model.CommentVO;
import kr.co.tripweaver.common.comment.service.ICommentService;
import kr.co.tripweaver.common.like.model.LikeVO;
import kr.co.tripweaver.common.like.service.ILikeService;
import kr.co.tripweaver.postcard.model.PostCardVO;
import kr.co.tripweaver.postcard.service.IPostCardService;

@RequestMapping("/postCard")
@Controller
public class PostCardController {
	
	@Autowired
	IPostCardService postCardService;
	
	@Autowired
	ILikeService likeService;
	
	@Autowired
	ICommentService commentService;

	// 포스트 카드로 이동
	@RequestMapping("/postCardList")
	public String postCardListView(Model model, @RequestParam("mem_id")String mem_id) {
		
		Map<String, Object> postCardPage =  postCardService.selectPostCardAll();
		model.addAllAttributes(postCardPage);
		
		if(!(mem_id.equals(""))) {
			List<LikeVO> likeVo = likeService.likeAll(mem_id);
			model.addAttribute("likeVo",likeVo);
		}
		
		return "postcard/postList";
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
	public String insertPostcard(PostCardVO postcardVo, @RequestParam("att_file_ori_name")String att_file_ori_name) {
		
		int insertPostcardCnt = postCardService.insertPostcard(postcardVo);
		
		return "redirect:/postCard/postCardList?mem_id=" + postcardVo.getMem_id();
	}
	
	// 포스트카드 수정 페이지 이동
	@RequestMapping(value="/postUpdate", method=RequestMethod.POST)
	public String postUpdateView(Model model, PostCardVO postCardVo) {
		
		PostCardVO selectpostcardVo = postCardService.selectPostcard(postCardVo.getPc_id());
		
		model.addAttribute("pc_cnt", selectpostcardVo.getPc_cnt());
		model.addAttribute("mem_id", postCardVo.getMem_id());
		model.addAttribute("pc_id", postCardVo.getPc_id());
		
		return "postcard/postUpdate";
	}
	
	// 포스트카드 업데이트
	@RequestMapping(value="/updatePostcard", method=RequestMethod.POST)
	public String updatePostcard(Model model, PostCardVO postcardVo, @RequestParam("att_file_ori_name")String att_file_ori_name) {
		
		int updatePostcardCnt = postCardService.updatePostcard(postcardVo);
		
		return "redirect:/postCard/postCardList?mem_id=" + postcardVo.getMem_id();
	}
	
	// 댓글 쓰기
	@RequestMapping(value="/insertComment", method=RequestMethod.POST)
	@ResponseBody
	public CommentVO insertComment(PostCardVO postcardVo, CommentVO commentVo){
		   commentService.insertComment(commentVo);
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
