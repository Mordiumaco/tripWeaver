package kr.co.tripweaver.mymenu.reservation.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.tripweaver.mymenu.reservation.model.ReservationForMyPageVO;
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
	@Override
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
		
		List<ReservationForMyPageVO> reservationList = null;
		
		try {
			
			reservationList = template.selectList("reservationSQL.selectReserForGuide", param);
			
		} catch (Exception e) {
			
			e.printStackTrace();
			return reservationList;
		}
		
		return reservationList;
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
		
		int totalPeoCnt = 0;
		
		try {
			totalPeoCnt = template.selectOne("reservationSQL.reserPeoTotalCntByMemId", mem_id);
		} catch (Exception e) {
			e.printStackTrace();
			return totalPeoCnt;
		}
		
		return totalPeoCnt;
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
		int totalResCnt = 0;
		
		try {
			totalResCnt = template.selectOne("reservationSQL.reserTotalByMemId", mem_id);
		} catch (Exception e) {
			e.printStackTrace();
			return totalResCnt;
		}
		
		return totalResCnt;
	}
}
