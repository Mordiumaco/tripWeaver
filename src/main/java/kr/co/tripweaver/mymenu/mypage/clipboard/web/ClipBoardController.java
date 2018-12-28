package kr.co.tripweaver.mymenu.mypage.clipboard.web;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.tripweaver.mymenu.mypage.clipboard.service.IClipBoardService;
import kr.co.tripweaver.util.model.PageVO;

@Controller
public class ClipBoardController {
	
	@Autowired
	IClipBoardService clipBoardService;
	
	@RequestMapping("/allPostClip")
	public String selectAllPostClip(Model model, PageVO pageVo, @RequestParam("mem_id")String mem_id, @RequestParam("tag_search")String tag_search, @RequestParam("search_title")String search_title) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("pageVo", pageVo );
		params.put("mem_id", mem_id);
		params.put("tag_search", tag_search);
		params.put("search_title", search_title);
		
		Map<String, Object> selectAllPostClipMap = clipBoardService.selectPostcardClip(params);
		Map<String, Object> selectEssayClip = clipBoardService.selectEssayClip(params);
		
		model.addAllAttributes(selectAllPostClipMap);
		model.addAllAttributes(selectEssayClip);
	 
		return "mypage/clipBoard";
	}
	
	
	@RequestMapping("/clipPostAjaxList")
	public String clipPostAjaxList(Model model, PageVO pageVo, @RequestParam("mem_id")String mem_id, @RequestParam("tag_search")String tag_search, @RequestParam("search_title")String search_title) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("pageVo", pageVo );
		params.put("mem_id", mem_id);
		params.put("tag_search", tag_search);
		params.put("search_title", search_title);
		
		Map<String, Object> selectAllPostClipMap = clipBoardService.selectPostcardClip(params);
		
		model.addAllAttributes(selectAllPostClipMap);
		
		return "mypage/clipBoardPostAjax";
	}
	
	@RequestMapping("/clipEssayAjaxList")
	public String clipEssayAjaxList(Model model, PageVO pageVo, @RequestParam("mem_id")String mem_id, @RequestParam("tag_search")String tag_search, @RequestParam("search_title")String search_title) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("pageVo", pageVo );
		params.put("mem_id", mem_id);
		params.put("tag_search", tag_search);
		params.put("search_title", search_title);
		
		Map<String, Object> selectEssayClip = clipBoardService.selectEssayClip(params);
		
		model.addAllAttributes(selectEssayClip);
		
		return "mypage/clipBoardEssayAjax";
	}
	
}
