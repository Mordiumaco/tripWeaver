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
		* 작성자 : 박찬배
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
		* 작성자 : 박찬배
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
		* 작성자 : 박찬배
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
		* 작성자 : 박찬배
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
		* 작성자 : 박찬배
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
		* 작성자 : 박찬배
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
	
	/**
	 * 
		* 
		* Method : 
		* 작성자 : 
		* 생성날짜 : 
		* 변경이력 :
		* @param 
		* @return
		* Method 설명 : 관리자 신고하기 처리 업데이트
		*
	 */
	
	@Override
	public int updatePostReport(String pc_id) {
		int updatePostReportCnt = template.update("reportSQL.updatePostReport", pc_id);
		return updatePostReportCnt;
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
		* Method 설명 : 관리자 신고하기 처리 업데이트
		*
	 */
	@Override
	public int updateEssayReport(String essay_id) {
		int updateEssayReportCnt = template.update("reportSQL.updateEssayReport", essay_id);
		return updateEssayReportCnt;
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
		* Method 설명 : 신고처리 상태 변경하기
		*
	 */
	@Override
	public int updateReport(String report_rel_art_id) {
		int updateReportCnt = template.update("reportSQL.updateReport", report_rel_art_id);
		return updateReportCnt;
	}
	
	
	/**
	 * 
		* 
		* Method : 
		* 작성자 :  박찬배
		* 생성날짜 : 2019. 01. 11
		* 변경이력 :
		* @param 
		* @return
		* Method 설명 : 검색결과 게시물수 알아오기
		*
	 */
	@Override
	public int selectRepostCondition(Map<String, Object> params) {
		int selectRepostConditionCnt = template.selectOne("reportSQL.selectRepostCondition", params);
		return selectRepostConditionCnt;
	}
	
	
	

}
