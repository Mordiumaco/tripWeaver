package kr.co.tripweaver.best.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BestController {
	
	@RequestMapping("/moneyBest")
	public String moneyBest() {
		
		return "best/moneyBest";
	}
	
	@RequestMapping("/postBest")
	public String postBest() {
		
		return "best/postBest";
	}
	
	@RequestMapping("/essayBest")
	public String essayBest() {
		
		return "best/essayBest";
	}
	
	@RequestMapping("/areaBest")
	public String areaBest() {
		
		return "best/areaBest";
	}
	
}
