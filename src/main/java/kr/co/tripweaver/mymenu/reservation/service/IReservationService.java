package kr.co.tripweaver.mymenu.reservation.service;

import kr.co.tripweaver.mymenu.reservation.model.ReservationVO;

public interface IReservationService {
	
	
	/**
	 * Method : insertReser
	 * 작성자 : Jae Hyeon Choi
	 * 생성날짜 : 2018. 12. 22.
	 * 변경이력 : 
	 * @param reservationVo
	 * @return
	 */
	public int insertReser(ReservationVO reservationVo);
	
	
}
