package kr.co.tripweaver.manager.user_management.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.tripweaver.member.model.MemberVO;
import kr.co.tripweaver.member.service.IMemberService;
import kr.co.tripweaver.util.model.PageVO;

@RequestMapping("manage")
@Controller
public class UserManagementController {
	
	@Resource(name="memberService")
	private IMemberService memberService;
	
	@RequestMapping("memberView")
	public String memberView(PageVO pageVO,Model model) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("pageVO", pageVO);
		
		Map<String, Object> resultMap = memberService.selectMemberPageList(params);
		model.addAllAttributes(resultMap);
		model.addAttribute("gnb", 1);
		model.addAttribute("title", "회원관리");
		model.addAttribute("pageVO", pageVO);
		
		return "admin/membership/member";
	}

	@RequestMapping("memberViewAjax")
	public String memberViewAjax(PageVO pageVO,Model model) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("pageVO", pageVO);
		
		Map<String, Object> resultMap = memberService.selectMemberPageList(params);
		model.addAllAttributes(resultMap);
		model.addAttribute("gnb", 1);
		model.addAttribute("title", "회원관리");
		model.addAttribute("pageVO", pageVO);
		
		return "admin/membership/member_ajax";
	}
	
	@RequestMapping("memberUpdateAjax")
	public String memberUpdateAjax(MemberVO memberVO, PageVO pageVO,Model model) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("pageVO", pageVO);
		params.put("memberVO", memberVO);
		Map<String, Object> resultMap = memberService.manageUpdateMemberAuthor(params);
		model.addAllAttributes(resultMap);
		model.addAttribute("gnb", 1);
		model.addAttribute("title", "회원관리");
		model.addAttribute("pageVO", pageVO);
		
		return "admin/membership/member_ajax";
	}
	
	@RequestMapping("memberDeleteAjax")
	public String memberDeleteAjax(MemberVO memberVO, PageVO pageVO,Model model) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("pageVO", pageVO);
		params.put("memberVO", memberVO);
		Map<String, Object> resultMap = memberService.manageDeleteMemberDel(params);
		model.addAllAttributes(resultMap);
		model.addAttribute("gnb", 1);
		model.addAttribute("title", "회원관리");
		model.addAttribute("pageVO", pageVO);
		
		return "admin/membership/member_ajax";
	}
}
