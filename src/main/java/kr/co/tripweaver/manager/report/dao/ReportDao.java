package kr.co.tripweaver.manager.report.dao;

import java.util.List;
import java.util.Map;

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
	
	
	/**
	 * 
		* 
		* Method : 
		* 작성자 : 
		* 생성날짜 : 
		* 변경이력 :
		* @param 
		* @return
		* Method 설명 : 신고글 전체글수 구해오는 쿼리
		*
	 */
	@Override
	public int selectRepostAll() {
		int selectRepostAllCnt = template.selectOne("reportSQL.selectRepostAll");
		return selectRepostAllCnt;
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
		* Method 설명 : 신고글 전체 상태 중 N만 카운팅 
		*
	 */
	@Override
	public int selectRepostN() {
		int selectRepostNCnt = template.selectOne("reportSQL.selectRepostN");
		return selectRepostNCnt;
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
		* Method 설명 : 신고글 전체 상태 중 Y만 카운팅 
		*
	 */
	@Override
	public int selectRepostY() {
		int selectRepostYCnt = template.selectOne("reportSQL.selectRepostY");
		return selectRepostYCnt;
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
		* Method 설명 : 관리자 신고관리 리스트 및 검색 결과 페이징
		*
	 */
	@Override
	public List<ReportVO> selectRepost(Map<String, Object> params) {
			List<ReportVO> reportVOs = template.selectList("reportSQL.selectRepost", params);
		return reportVOs;
	}

}
