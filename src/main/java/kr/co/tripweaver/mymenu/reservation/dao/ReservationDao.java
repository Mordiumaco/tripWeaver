package kr.co.tripweaver.mymenu.reservation.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.tripweaver.mymenu.reservation.model.ReservationVO;

@Repository
public class ReservationDao implements IReservationDao {
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate template;
	
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
		
		int result = 0; 
		
		try {
			
			result = template.insert("reservationSQL.insertReser", reservationVo);
			
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}
		
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
	public List<ReservationVO> selectReserByMemId(String mem_id) {
		
		List<ReservationVO> reservationVo = null;
		
		try {
			
			reservationVo = template.selectList("reservationSQL.selectReserByMemId", mem_id);
			
		} catch (Exception e) {
			e.printStackTrace();
			return reservationVo;
		}
		
		return reservationVo;
	}
	
	
	/**
	* Method : reserTotalPeopleCountByGuidePlanId
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 24.
	* 변경이력 :
	* @return
	* Method 설명 : 해당 가이드 예약일자에 대한 총 예약 인원 수
	*/
	public Integer reserTotalPeopleCountByGuidePlanId(String guideplan_id) {
		
		Integer total_people_count = null;
		
		try {
			
			total_people_count = template.selectOne("reservationSQL.reserTotalPeopleCountByGuidePlanId", guideplan_id);
			
		} catch (Exception e) {
			e.printStackTrace();
			return total_people_count;
		}
		
		return total_people_count;
		
		
	}
}
