package kr.co.tripweaver.manager.report.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.tripweaver.manager.report.model.ReportVO;
import kr.co.tripweaver.manager.report.service.IReportService;

@RequestMapping("/report")
@Controller
public class ReportController {
	
	@Autowired
	IReportService reportService;
	
	
	@RequestMapping(value = "/insertReport", method=RequestMethod.POST)
	public String insertReport(ReportVO reportVo) {
		int insertReportCnt = reportService.insertReport(reportVo);
		
		return "redirect:/postCard/postCardList?mem_id=" + reportVo.getMem_id() + "&tag_search="; 
	}
	
}
