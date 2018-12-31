package kr.co.tripweaver.manager.report.service;

import java.util.List;
import java.util.Map;

import kr.co.tripweaver.manager.report.model.ReportVO;

public interface IReportService {
	
	public List<ReportVO> selectReportreason();
	
	public int insertReport(ReportVO reportVo);
	
	public Map<String, Object> selectRepost(Map<String, Object> params);
	
	public int selectRepostAll();
	
	public  int selectRepostN();
	
	public  int selectRepostY();
	
}
