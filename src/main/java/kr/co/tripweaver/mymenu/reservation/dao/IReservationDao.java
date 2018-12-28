package kr.co.tripweaver.mymenu.reservation.dao;

import java.util.List;

import kr.co.tripweaver.mymenu.reservation.model.ReservationVO;

public interface IReservationDao {
	
	
	/**
	 * Method : insertReser
	 * 작성자 : Jae Hyeon Choi
	 * 생성날짜 : 2018. 12. 22.
	 * 변경이력 : 
	 * @param reservationVo
	 * @return
	 */
	public int insertReser(ReservationVO reservationVo);
	
	
	/**
	* Method : selectReserByMemId
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 24.
	* 변경이력 :
	* @param mem_id
	* @return
	* Method 설명 : 로그인한 회원의 아이디로 해당 회원의 예약정보를 받아온다. 
	*/
	public List<ReservationVO> selectReserByMemId(String mem_id);
	
	/**
	* Method : reserTotalPeopleCountByGuidePlanId
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 24.
	* 변경이력 :
	* @return
	* Method 설명 : 해당 가이드 예약일자에 대한 총 예약 인원 수
	*/
	public Integer reserTotalPeopleCountByGuidePlanId(String guideplan_id);
	
	
}