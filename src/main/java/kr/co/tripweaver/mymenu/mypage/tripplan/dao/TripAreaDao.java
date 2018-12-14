package kr.co.tripweaver.mymenu.mypage.tripplan.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import kr.co.tripweaver.mymenu.mypage.tripplan.model.TripareaVO;
import kr.co.tripweaver.mymenu.mypage.tripplan.model.TripplanVO;

@Repository
public class TripAreaDao implements ITripAreaDao {
	
	Logger logger = LoggerFactory.getLogger(TripAreaDao.class);
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate template;
	
	/**
	* Method : insertTripAreaReturnId
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 13.
	* 변경이력 :
	* @param tripareaVo
	* @return
	* Method 설명 : tripArea 정보를 삽입하고 해당 만들어진 아이디를 받아온다. 
	*/
	@Override
	public String insertTripAreaReturnId(TripareaVO tripareaVo) {
		
		try {
			int result = template.insert("tripareaSQL.insertTripAreaReturnId", tripareaVo);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
		return tripareaVo.getTriparea_id();
		
	}
	
	/**
	* Method : selectTripAreaByTripplanId
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 14.
	* 변경이력 :
	* @param tripplan_id
	* @return
	* Method 설명 : tripplan_id 로 해당 tripareaVo 객체를 받아온다.
	*/
	@Override
	public List<TripareaVO> selectTripAreaByTripplanId(String tripplan_id){
		
		List<TripareaVO> tripareaList =  null;
		
		try {
			
			tripareaList = template.selectList("tripareaSQL.selectTripAreaByTripplanId", tripplan_id);
			
		} catch (Exception e) {
			e.printStackTrace();
			return tripareaList;
		}
		
		return tripareaList;
	}
}
