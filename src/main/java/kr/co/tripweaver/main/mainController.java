package kr.co.tripweaver.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@RequestMapping("/main")
@Controller
public class mainController {
	
	@RequestMapping("/main")
	public String mainView() {
		return "index";
	}
	
}
