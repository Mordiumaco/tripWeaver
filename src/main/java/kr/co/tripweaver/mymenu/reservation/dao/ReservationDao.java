package kr.co.tripweaver.mymenu.reservation.dao;

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
	
	
}
