package kr.co.tripweaver.postcard.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/postCard")
@Controller
public class PostCardController {

	@RequestMapping("/postCardList")
	public String postCardListView() {
		return "postcard/postList";
	}
}
