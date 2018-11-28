package kr.co.tripweaver.main.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/main")
@Controller
public class MainController {


	@RequestMapping("/main")
	public String mainView() {
		return "index";
	}

	@RequestMapping("/login")
	public String loginView() {
		return "login/login";
	}

	@RequestMapping("/register")
	public String registerView() {
		return "login/register";
	}

	@RequestMapping("/register_form")
	public String register_formView() {
		return "login/register_form";
	}
	
	@RequestMapping("/adminMain")
	public String adminMainView() {
		return "admin/adminMain";
	}
	
	@RequestMapping("/member")
	public String memberView() {
		return "admin/membership/member";
	}
	
	@RequestMapping("/create_board")
	public String create_boardView() {
		return "admin/board/create_board";
	}
	
	@RequestMapping("/declaration")
	public String declarationView() {
		return "admin/setting/declaration";
	}
	
	@RequestMapping("/contact")
	public String contactView() {
		return "admin/statistics/contact";
	}
	
	@RequestMapping("/contactTime")
	public String contactTimeView() {
		return "admin/statistics/contactTime";
	}
	
	@RequestMapping("/hashTag")
	public String hashTagView() {
		return "admin/statistics/hashTag";
	}
	
	@RequestMapping("/adminPost")
	public String adminPostView() {
		return "admin/statistics/post";
	}
	
	@RequestMapping("/codetable")
	public String codetableView() {
		return "admin/codetable/codetable";
	}
	

}
