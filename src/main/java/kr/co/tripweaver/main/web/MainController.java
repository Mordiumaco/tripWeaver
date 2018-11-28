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
		return "admin/member";
	}
	
	@RequestMapping("/create_board")
	public String create_boardView() {
		return "admin/create_board";
	}

}
