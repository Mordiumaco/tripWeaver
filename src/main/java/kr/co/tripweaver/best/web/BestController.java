package kr.co.tripweaver.best.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.tripweaver.essay.model.EssayVO;
import kr.co.tripweaver.essay.service.IEssayService;
import kr.co.tripweaver.mymenu.mypage.tripplan.model.ClusterVO;

@Controller
public class BestController {
	
	@Autowired
	IEssayService essayService;
	
	/**
	* Method : moneyBest
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2019. 1. 3.
	* 변경이력 :
	* @param model
	* @return
	* Method 설명 : 짠내 베스트를 위한 뷰 컨트롤러
	*/
	@RequestMapping("/moneyBest")
	public String moneyBest(Model model) {
		
		List<ClusterVO> essayList = essayService.bestMoneyEssayList();
		
		model.addAttribute("essayList", essayList);
		
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
