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
	
	
}
