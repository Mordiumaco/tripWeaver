package kr.co.tripweaver.recommendation.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/recommendation")
@Controller
public class RecommendationController {
	
	@RequestMapping("/lodgment")
	public String lodgmentView() {
		return "contents/lodgment";
	}
	
	@RequestMapping("/festival")
	public String festivalView() {
		return "contents/festival";
	}
	
	@RequestMapping("/travelDestination")
	public String travelDestinationView() {
		return "contents/travelDestination";
	}
	
	@RequestMapping("/books")
	public String booksView() {
		return "contents/books";
	}

}
