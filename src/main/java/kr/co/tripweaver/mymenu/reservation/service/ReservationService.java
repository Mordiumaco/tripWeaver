package kr.co.tripweaver.mymenu.reservation.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.tripweaver.mymenu.reservation.dao.IReservationDao;
import kr.co.tripweaver.mymenu.reservation.model.ReservationForMyPageVO;
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
	@Override
	public int insertReser(ReservationVO reservationVo){
		
		int result =  reservationDao.insertReser(reservationVo);
		
		return result;
	}
	
	
	/**
	* Method : selectReserByMemId
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 24.
	* 변경이력 :
	* @param mem_id
	* @return
	* Method 설명 : 로그인한 회원의 아이디로 해당 회원의 예약정보를 받아온다. 
	*/
	@Override
	public List<ReservationVO> selectReserByMemId(String mem_id){
		return reservationDao.selectReserByMemId(mem_id);
	}
	
	
	
	/**
	* Method : reserTotalPeopleCountByGuidePlanId
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 24.
	* 변경이력 :
	* @return
	* Method 설명 : 해당 가이드 예약일자에 대한 총 예약 인원 수
	*/
	@Override
	public Integer reserTotalPeopleCountByGuidePlanId(String guideplan_id) {
		return reservationDao.reserTotalPeopleCountByGuidePlanId(guideplan_id);
	}
	
	/**
	* Method : selectReserForGuide
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 28.
	* 변경이력 :
	* @param param
	* @return
	* Method 설명 : 가이드의 예약건을 가져오기 위한 리스트
	*/
	@Override
	public List<ReservationForMyPageVO> selectReserForGuide(Map<String, String> param){
		return reservationDao.selectReserForGuide(param);
	}
	
	/**
	* Method : reserPeoTotalCntByMemId
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 28.
	* 변경이력 :
	* @param mem_id
	* @return
	* Method 설명 : 해당 가이드 회원의 받은 총 예약 인원수를 알수 있음
	*/
	@Override
	public int reserPeoTotalCntByMemId(String mem_id) {
		return reservationDao.reserPeoTotalCntByMemId(mem_id);
	}
	
	
	/**
	* Method : reserTotalByMemId
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 28.
	* 변경이력 :
	* @param mem_id
	* @return
	* Method 설명 : 해당 가이드 회원의 예약 건수를 받아온다.
	*/
	public int reserTotalByMemId(String mem_id) {
		return reservationDao.reserTotalByMemId(mem_id);
	}
	
}
