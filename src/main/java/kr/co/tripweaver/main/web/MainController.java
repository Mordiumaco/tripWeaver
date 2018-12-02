package kr.co.tripweaver.main.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

	@RequestMapping("/idPw_lost")
	public String idPw_lostView() {
		return "login/idPw_lost";
	}
	
	@RequestMapping("/adminMain")
	public String adminMainView(Model model) {
		model.addAttribute("gnb", 0);
		return "admin/adminMain";
	}
	
	@RequestMapping("/member")
	public String memberView(Model model) {
		model.addAttribute("gnb", 1);
		return "admin/membership/member";
	}
	
	@RequestMapping("/create_board")
	public String create_boardView(Model model) {
		model.addAttribute("gnb", 2);
		return "admin/board/create_board";
	}
	
	@RequestMapping("/declaration")
	public String declarationView(Model model) {
		model.addAttribute("gnb", 0);
		return "admin/setting/declaration";
	}
	
	@RequestMapping("/contact")
	public String contactView(Model model) {
		model.addAttribute("gnb", 3);
		return "admin/statistics/contact";
	}
	
	@RequestMapping("/contactTime")
	public String contactTimeView(Model model) {
		model.addAttribute("gnb", 3);
		return "admin/statistics/contactTime";
	}
	
	@RequestMapping("/hashTag")
	public String hashTagView(Model model) {
		model.addAttribute("gnb", 3);
		return "admin/statistics/hashTag";
	}
	
	@RequestMapping("/adminPost")
	public String adminPostView(Model model) {
		model.addAttribute("gnb", 3);
		return "admin/statistics/post";
	}
	
	@RequestMapping("/codetable")
	public String codetableView(Model model) {
		model.addAttribute("gnb", 4);
		return "admin/codetable/codetable";
	}
	
	@RequestMapping("/mypage")
	public String mypageView() {
		return "mypage/myPage";
	}
	
	@RequestMapping("/guide")
	public String guideView() {
		return "mypage/guide";
	}
	
	@RequestMapping("/reservation")
	public String reservationView() {
		return "mypage/reservation";
	}
	
	@RequestMapping("/myPost")
	public String myPostView() {
		return "mypage/myPost";
	}
	
	@RequestMapping("/board")
	public String boardView() {
		return "servicecenter/list";
	}
	
	@RequestMapping("/boardWrite")
	public String boardWriteView() {
		return "servicecenter/write";
	}
 
}