package kr.co.tripweaver.hashtag.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.tripweaver.hashtag.model.HashTagVO;
import kr.co.tripweaver.hashtag.service.IHashTagService;

@RequestMapping("hashTag")
@Controller
public class HashTagController {
	
	@Autowired
	IHashTagService hashTagService;
	
//	@RequestMapping()
//	public List<HashTagVO> hashtagColumnConunt(){
//		
//	}
	
	
}
