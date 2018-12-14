package kr.co.tripweaver.postcard.web;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.tripweaver.hashtag.model.HashTagVO;
import kr.co.tripweaver.hashtag.service.IHashTagService;
import kr.co.tripweaver.postcard.model.PostCardVO;
import kr.co.tripweaver.postcard.service.IPostCardService;

@RequestMapping("/postCard")
@Controller
public class PostCardController {
	
	@Autowired
	IPostCardService postCardService;
	
	@RequestMapping("/postCardList")
	public String postCardListView(Model model) {
		
		Map<String, Object> postCardPage =  postCardService.selectPostCardAll();
		model.addAllAttributes(postCardPage);
				
		return "postcard/postList";
	}
	
	
	
}
