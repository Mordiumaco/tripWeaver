package kr.co.tripweaver.postcard.web;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.tripweaver.common.like.model.LikeVO;
import kr.co.tripweaver.common.like.service.ILikeService;
import kr.co.tripweaver.postcard.service.IPostCardService;

@RequestMapping("/postCard")
@Controller
public class PostCardController {
	
	@Autowired
	IPostCardService postCardService;
	
	@Autowired
	ILikeService likeService;
	
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
	
	
	@RequestMapping(value="/likeAdd", method=RequestMethod.POST)
	public String likeAdd(LikeVO likeVo) {
		
		int likeAddCnt = likeService.likeAdd(likeVo);
		
		Model model = null;
		String normal1 = "normal1";
		return postCardListView(model, normal1);
	}
	
	@RequestMapping(value="/likeDelete", method=RequestMethod.POST)
	public String likelikeDelete(LikeVO likeVo) {
		
		int likeDeleteCnt = likeService.likeDelete(likeVo);
		
		Model model = null;
		String normal1 = "normal1";
		return postCardListView(model, normal1);
	}
	
	
}
