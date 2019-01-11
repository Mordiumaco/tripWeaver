package kr.co.tripweaver.manager.report.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.tripweaver.manager.report.dao.IReportDao;
import kr.co.tripweaver.manager.report.model.ReportVO;
import kr.co.tripweaver.util.model.PageVO;
import kr.co.tripweaver.util.page.PageUtil;

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

	@Override
	public int selectRepostAll() {
		int selectRepostAllCnt = reportDao.selectRepostAll();
		return selectRepostAllCnt;
	}

	@Override
	public int selectRepostN() {
		int selectRepostNCnt = reportDao.selectRepostN(); 
		return selectRepostNCnt;
	}

	@Override
	public int selectRepostY() {
		int selectRepostYCnt = reportDao.selectRepostY();
		return selectRepostYCnt;
	}

	@Override
	public Map<String, Object> selectRepost(Map<String, Object> params) {
		
		List<ReportVO> reportVOs = reportDao.selectRepost(params);
		//int selectRepostAllCnt = reportDao.selectRepostAll();
		int selectRepostConditionCnt = reportDao.selectRepostCondition(params);
		 
		PageVO pageVo = (PageVO) params.get("pageVo");
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("reportVo", reportVOs);
		resultMap.put("page", pageVo.getPage());
		resultMap.put("pageSize", PageUtil.pageCnt(selectRepostConditionCnt, 10));
		resultMap.put("filter_id", params.get("filter_id"));
		resultMap.put("rep_rea_id", params.get("rep_rea_id"));
		resultMap.put("report_proc_sta", params.get("report_proc_sta"));
		
		return resultMap;
	}

	@Override
	public int updatePostReport(String pc_id) {
		int updatePostReportCnt = reportDao.updatePostReport(pc_id);
		return updatePostReportCnt;
	}

	@Override
	public int updateEssayReport(String essay_id) {
		int updateEssayReportCnt = reportDao.updateEssayReport(essay_id);
		return updateEssayReportCnt;
	}

	@Override
	public int updateReport(String report_rel_art_id) {
		int updateReportCnt = reportDao.updateReport(report_rel_art_id);
		return updateReportCnt;
	}

	
}
