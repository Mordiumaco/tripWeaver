package kr.co.tripweaver.manager.report.dao;

import java.util.List;
import java.util.Map;

import kr.co.tripweaver.manager.report.model.ReportVO;
import kr.co.tripweaver.mymenu.reservation.model.ReservationForMyPageVO;

public interface IReportDao {
	
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
	List<ReportVO> selectReportreason();
	
	/**
	 * 
		* 
		* Method : 
		* 작성자 : 
		* 생성날짜 : 
		* 변경이력 :
		* @param 
		* @return
		* Method 설명 : 신고 하기
		*
	 */
	int insertReport (ReportVO reportVo);
	
	
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
	public List<ReportVO> selectRepost(Map<String, Object> params);
	
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
	int selectRepostAll();
	
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
	int selectRepostN();
	
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
	int selectRepostY();
	
	
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
	int updatePostReport(String pc_id);
	
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
	int updateEssayReport(String essay_id);
	
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
	int updateReport(String report_rel_art_id);
	
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
	int selectRepostCondition(Map<String, Object> params);
}
