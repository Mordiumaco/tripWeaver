package kr.co.tripweaver.manager.report.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.tripweaver.manager.report.model.ReportVO;

@Repository
public class ReportDao implements IReportDao {
	
	@Resource(name = "sqlSessionTemplate")
	SqlSessionTemplate template;
	/**
	 * 
		* 
		* Method : 
		* 작성자 : 
		* 생성날짜 : 
		* 변경이력 :
		* @param 
		* @return
		* Method 설명 : 신고사유 리스트 
		*
	 */
	@Override
	public List<ReportVO> selectReportreason() {
		List<ReportVO> reportVOs =  template.selectList("reportSQL.selectReportreason");
		return reportVOs;
	}
	
	/**
	 * 
		* 
		* Method : 
		* 작성자 : 
		* 생성날짜 : 
		* 변경이력 :
		* @param 
		* @return
		* Method 설명 : 신고하기 
		*
	 */
	@Override
	public int insertReport(ReportVO reportVo) {
		int insertReportCnt = template.insert("reportSQL.insertReport",reportVo);
		return insertReportCnt;
	}

}
