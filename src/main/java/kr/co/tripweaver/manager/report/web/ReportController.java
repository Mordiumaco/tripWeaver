package kr.co.tripweaver.manager.report.web;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.method.support.ModelAndViewContainer;

import kr.co.tripweaver.manager.report.model.ReportVO;
import kr.co.tripweaver.manager.report.service.IReportService;
import kr.co.tripweaver.util.model.PageVO;

@RequestMapping("/report")
@Controller
public class ReportController {
	
	@Autowired
	IReportService reportService;
	
	// 신고관리 페이지 이동
	@RequestMapping("/declaration")
	public String declarationView(Model model, PageVO pageVo, ReportVO repostVo) {
		model.addAttribute("gnb", 0);
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("pageVo", pageVo);
		params.put("filter_id", repostVo.getFilter_id());
		params.put("rep_rea_id", repostVo.getRep_rea_id());
		params.put("report_proc_sta", repostVo.getReport_proc_sta());
		
		model.addAttribute("pareamsMap",reportService.selectRepost(params));
		model.addAttribute("selectRepostAll", reportService.selectRepostAll());
		model.addAttribute("selectRepostN", reportService.selectRepostN());
		model.addAttribute("selectRepostY", reportService.selectRepostY());
		
		return "admin/setting/declaration";
	}
	
	// 신고관리 페이지 아작스
	@RequestMapping("/declarationAjax")
	public String declarationAjax(Model model, PageVO pageVo, ReportVO repostVo) {
		
		model.addAttribute("gnb", 0);
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("pageVo", pageVo);
		params.put("filter_id", repostVo.getFilter_id());
		params.put("rep_rea_id", repostVo.getRep_rea_id());
		params.put("report_proc_sta", repostVo.getReport_proc_sta());
		
		model.addAttribute("pareamsMap",reportService.selectRepost(params));
		model.addAttribute("selectRepostAll", reportService.selectRepostAll());
		model.addAttribute("selectRepostN", reportService.selectRepostN());
		model.addAttribute("selectRepostY", reportService.selectRepostY());
		
		
		return "admin/setting/declarationAjax";
	}
	
	@RequestMapping(value = "/insertReport", method=RequestMethod.POST)
	public String insertReport(ReportVO reportVo) {
		int insertReportCnt = reportService.insertReport(reportVo);
		
		return "redirect:/postCard/postCardList?mem_id=" + reportVo.getMem_id() + "&tag_search="; 
	}
	
	
	
}
