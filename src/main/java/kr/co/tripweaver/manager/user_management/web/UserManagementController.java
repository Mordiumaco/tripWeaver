package kr.co.tripweaver.manager.user_management.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
		params.put("sfl", "mem_nick");
		params.put("stx", "");
		params.put("pageVO", pageVO);
		
		Map<String, Object> resultMap = memberService.selectMemberPageList(params);
		model.addAllAttributes(resultMap);
		model.addAttribute("gnb", 1);
		model.addAttribute("title", "회원관리");
		model.addAttribute("pageVO", pageVO);
		model.addAttribute("stx", "");
		model.addAttribute("sfl", "mem_nick");
		
		return "admin/membership/member";
	}

	@RequestMapping("memberViewAjax")
	public String memberViewAjax(@RequestParam("sfl") String sfl, @RequestParam("stx") String stx, PageVO pageVO, Model model) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("pageVO", pageVO);
		stx = stx.isEmpty() ? "" : stx;			
		params.put("sfl", sfl);
		params.put("stx", stx);
		
		Map<String, Object> resultMap = memberService.selectMemberPageList(params);
		model.addAllAttributes(resultMap);
		model.addAttribute("gnb", 1);
		model.addAttribute("title", "회원관리");
		model.addAttribute("pageVO", pageVO);
		model.addAttribute("stx", stx);
		model.addAttribute("sfl", sfl);
		//블랙리스트, 탈퇴회원수 조회
		
		return "admin/membership/member_ajax";
	}
	
	@RequestMapping(value="memberUpdateAjax", method=RequestMethod.POST)
	public String memberUpdateAjax(@RequestParam("sfl") String sfl, @RequestParam("stx") String stx, MemberVO memberVO, PageVO pageVO, Model model) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("pageVO", pageVO);
		params.put("memberVO", memberVO);
		stx = stx.isEmpty() ? "" : stx;			
		params.put("sfl", sfl);
		params.put("stx", stx);
		
		Map<String, Object> resultMap = memberService.manageUpdateMemberAuthor(params);
		model.addAllAttributes(resultMap);
		model.addAttribute("gnb", 1);
		model.addAttribute("title", "회원관리");
		model.addAttribute("pageVO", pageVO);
		model.addAttribute("stx", stx);
		model.addAttribute("sfl", sfl);
		
		return "admin/membership/member_ajax";
	}
	
	@RequestMapping(value="memberDeleteAjax", method=RequestMethod.POST)
	public String memberDeleteAjax(@RequestParam("sfl") String sfl, @RequestParam("stx") String stx, MemberVO memberVO, PageVO pageVO, Model model) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("pageVO", pageVO);
		params.put("memberVO", memberVO);
		stx = stx.isEmpty() ? "" : stx;			
		params.put("sfl", sfl);
		params.put("stx", stx);
		
		Map<String, Object> resultMap = memberService.manageDeleteMemberDel(params);
		model.addAllAttributes(resultMap);
		model.addAttribute("gnb", 1);
		model.addAttribute("title", "회원관리");
		model.addAttribute("pageVO", pageVO);
		model.addAttribute("stx", stx);
		model.addAttribute("sfl", sfl);
		
		return "admin/membership/member_ajax";
	}
	
	@RequestMapping(value="memberChkUpdateAjax", method=RequestMethod.POST)
	public String memberChkUpdateAjax(@RequestParam("sfl") String sfl, @RequestParam("stx") String stx, @RequestParam("upArr") String upArr, @RequestParam("auArr") String auArr, PageVO pageVO, Model model) {
		
		System.out.println("memberChkUpdateAjax : " + sfl + " " + stx + " " + upArr + " " + auArr);
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("pageVO", pageVO);
		params.put("upArr", upArr);
		params.put("auArr", auArr);
		stx = stx.isEmpty() ? "" : stx;			
		params.put("sfl", sfl);
		params.put("stx", stx);
		
		Map<String, Object> resultMap = memberService.manageChkUpdateMemberAuthor(params);
		model.addAllAttributes(resultMap);
		model.addAttribute("gnb", 1);
		model.addAttribute("title", "회원관리");
		model.addAttribute("pageVO", pageVO);
		model.addAttribute("stx", stx);
		model.addAttribute("sfl", sfl);
		
		return "admin/membership/member_ajax";
	}
	
	@RequestMapping(value="memberChkDeleteAjax", method=RequestMethod.POST)
	public String memberChkDeleteAjax(@RequestParam("sfl") String sfl, @RequestParam("stx") String stx, @RequestParam("delArr") String delArr, PageVO pageVO, Model model) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("pageVO", pageVO);
		params.put("delArr", delArr);
		stx = stx.isEmpty() ? "" : stx;			
		params.put("sfl", sfl);
		params.put("stx", stx);
		
		Map<String, Object> resultMap = memberService.manageChkDeleteMemberDel(params);
		model.addAllAttributes(resultMap);
		model.addAttribute("gnb", 1);
		model.addAttribute("title", "회원관리");
		model.addAttribute("pageVO", pageVO);
		model.addAttribute("stx", stx);
		model.addAttribute("sfl", sfl);
		
		return "admin/membership/member_ajax";
	}
	
}
