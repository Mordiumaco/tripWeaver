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

import kr.co.tripweaver.common.attachment.service.IAttachmentService;
import kr.co.tripweaver.manager.report.model.ReportVO;
import kr.co.tripweaver.manager.report.service.IReportService;
import kr.co.tripweaver.postcard.model.PostCardVO;
import kr.co.tripweaver.postcard.service.IPostCardService;
import kr.co.tripweaver.util.model.PageVO;

@RequestMapping("/report")
@Controller
public class ReportController {
	
	@Autowired
	IReportService reportService;
	
	@Autowired
	IPostCardService postCardService;
	
	@Autowired
	IAttachmentService attachmentService;
	
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
	
	@RequestMapping(value = "/insertReportEssay", method=RequestMethod.POST)
	public String insertReportEssay(ReportVO reportVo) {
		int insertReportCntEssay = reportService.insertReport(reportVo);
		
		return "redirect:/essay/essayView?essay_id=" + reportVo.getReport_rel_art_id(); 
	}
	
	@RequestMapping(value ="/updatePostReport", method=RequestMethod.POST )
	public String updatePostReport(@RequestParam("pc_id")String pc_id) {
		int updatePostReportCnt = reportService.updatePostReport(pc_id);
		int updateReportCnt = reportService.updateReport(pc_id);
		
		
		
		return "redirect:/report/declaration?filter_id=&rep_rea_id=&report_proc_sta=&page=1&pageSize=10";
	}
	
	@RequestMapping(value ="/updateEssayReport", method=RequestMethod.POST )
	public String updateEssayReport(@RequestParam("essay_id")String essay_id) {
		int updateEssayReportCnt = reportService.updateEssayReport(essay_id);
		int updateReportCnt = reportService.updateReport(essay_id);
		
		return "redirect:/report/declaration?filter_id=&rep_rea_id=&report_proc_sta=&page=1&pageSize=10";
	}
	
	
	@RequestMapping("/reportPostClickAjax")
	public String reportPostClickAjax(@RequestParam("pc_id")String pc_id, Model model) {
		model.addAttribute("postcardVo", postCardService.selectSinglePost(pc_id));
		model.addAttribute("attVo", attachmentService.selectPostcardFile(pc_id));
		
		return "admin/setting/reportPostClickAjax";
	}
	
	
	
}
