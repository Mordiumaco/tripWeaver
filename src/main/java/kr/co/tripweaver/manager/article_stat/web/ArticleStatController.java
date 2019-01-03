package kr.co.tripweaver.manager.article_stat.web;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.tripweaver.manager.article_stat.service.IArticleStatService;

@RequestMapping("/artstat")
@Controller
public class ArticleStatController {

	@Autowired
	private IArticleStatService articleStatService;
	
	@RequestMapping("/artstatEssay")
	public String artstatEssay(@RequestParam(value="dateType", required=false) String dateType, @RequestParam(value="datepicker", required=false) String datepicker, Model model) {
	
		dateType = dateType == null || dateType.equals("") ? "month" : dateType;
		datepicker = datepicker == null || datepicker.equals("") ? "" : datepicker;
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("dateType", dateType);
		params.put("datepicker", datepicker);
		
		Map<String, Object> resultMap = articleStatService.selectEssayStat(params);
		resultMap.put("datepicker", datepicker);
		
		model.addAttribute("gnb", 3);
		model.addAllAttributes(resultMap);
		
		return "admin/statistics/articleStatEssay";
	}
	
	@RequestMapping("/artstatPostcard")
	public String artstatPostcard(@RequestParam(value="dateType", required=false) String dateType, @RequestParam(value="datepicker", required=false) String datepicker, Model model) {
		
		dateType = dateType == null || dateType.equals("") ? "month" : dateType;
		datepicker = datepicker == null || datepicker.equals("") ? "" : datepicker;
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("dateType", dateType);
		params.put("datepicker", datepicker);
		
		Map<String, Object> resultMap = articleStatService.selectPostCardStat(params);
		resultMap.put("datepicker", datepicker);

		model.addAttribute("gnb", 3);
		model.addAllAttributes(resultMap);
		
		return "admin/statistics/articleStatPostcard";
	}
}
