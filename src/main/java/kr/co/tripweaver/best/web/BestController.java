package kr.co.tripweaver.best.web;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.tripweaver.essay.service.IEssayService;
import kr.co.tripweaver.mymenu.mypage.tripplan.model.ClusterVO;
import kr.co.tripweaver.postcard.service.IPostCardService;

@Controller
public class BestController {
	
	@Autowired
	IEssayService essayService;
	
	@Autowired
	IPostCardService postCardService;
	
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
	public String postBest(Model model, @RequestParam(value="datepicker" , required = false) String date ) throws ParseException {
		String endDate = null;
		String startDate = null;
		
		if(date == null) {
			Date dateNew = new Date();
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(dateNew);
			SimpleDateFormat simpleDate = new SimpleDateFormat("yyyyMM");
			String ym = simpleDate.format(dateNew);
			endDate = ym + calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
			startDate = ym + "01";
		}else {
			Calendar calendar = Calendar.getInstance();
			SimpleDateFormat simpleDate = new SimpleDateFormat("yyyyMM");
			Date date2 = simpleDate.parse(date);
			calendar.setTime(date2);
			
			endDate = date + calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
			startDate = date + "01";
		}
		
		Map<String, Object> params = new HashMap<String, Object>();
		
			params.put("startDate", startDate);
	
			params.put("endDate", endDate);
		
		
		
		Map<String, Object> returnMap = postCardService.bestPostSelect(params);
		
		model.addAllAttributes(returnMap);
		
		return "best/postBest";
	}
	
	/**
	 * Method : essayBest
	 * 작성자 : Jae Hyeon Choi
	 * 생성날짜 : 2019. 1. 4.
	 * 변경이력 : 
	 * @param model
	 * @return
	 * Method 설명 : 에세이 베스트를 위한 뷰 컨트롤러
	 */
	@RequestMapping("/essayBest")
	public String essayBest(Model model) {
		
		List<ClusterVO> essayList = essayService.bestEssayList();
		
		model.addAttribute("essayList", essayList);
		
		return "best/essayBest";
	}
	
	@RequestMapping("/areaBest")
	public String areaBest() {
		
		return "best/areaBest";
	}
	
	
	
}
