package kr.co.tripweaver.mymenu.reservation.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.tripweaver.mymenu.reservation.dao.IReservationDao;
import kr.co.tripweaver.mymenu.reservation.model.ReservationVO;

@Service
public class ReservationService implements IReservationService{

	@Autowired
	IReservationDao reservationDao;
	
	/**
	 * Method : insertReser
	 * 작성자 : Jae Hyeon Choi
	 * 생성날짜 : 2018. 12. 22.
	 * 변경이력 : 
	 * @param reservationVo
	 * @return
	 */
	public int insertReser(ReservationVO reservationVo){
		return reservationDao.insertReser(reservationVo);
	}
	
	
}
