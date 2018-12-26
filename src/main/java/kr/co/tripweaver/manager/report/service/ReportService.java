package kr.co.tripweaver.manager.report.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.tripweaver.manager.report.dao.IReportDao;
import kr.co.tripweaver.manager.report.model.ReportVO;

@Service
public class ReportService implements IReportService {

	@Autowired
	IReportDao reportDao;

	@Override
	public List<ReportVO> selectReportreason() {
		List<ReportVO>  reportVOs = reportDao.selectReportreason();
		return reportVOs;
	}

	@Override
	public int insertReport(ReportVO reportVo) {
		 int insertReportCnt = reportDao.insertReport(reportVo);
		return insertReportCnt;
	}
	
	
	
}
