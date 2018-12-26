package kr.co.tripweaver.manager.report.service;

import java.util.List;

import kr.co.tripweaver.manager.report.model.ReportVO;

public interface IReportService {
	
	public List<ReportVO> selectReportreason();
	
	public int insertReport(ReportVO reportVo);
}
