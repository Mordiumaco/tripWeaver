package kr.co.tripweaver.mymenu.mypage.tripplan.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.tripweaver.mymenu.mypage.tripplan.model.MapMarkerVO;

@Repository
public class MapMarkerDao implements IMapMarkerDao {
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate template;
	
	
	/**
	* Method : insertMapmarker
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 13.
	* 변경이력 :
	* @return
	* Method 설명 : 맵마커 테이블에 mapMarkerVo 객체의 내용을 저장한다.
	*/
	public int insertMapmarker(MapMarkerVO mapMarkerVo) {
		
		int result = 0;
		
		try {
			result = template.insert("mapMarkerSQL.insertMapmarker", mapMarkerVo);
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}
		
		return result;
	}
}
