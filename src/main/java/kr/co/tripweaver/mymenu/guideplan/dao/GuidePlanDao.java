package kr.co.tripweaver.mymenu.guideplan.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import kr.co.tripweaver.essay.dao.EssayDao;
import kr.co.tripweaver.mymenu.guideplan.model.GuidePlanVO;

/**
* GuidePlanDao.java
*
* @author Jae Hyeon Choi
* @version 1.0
* @since 2018. 12. 20.
* @see
* 
* << 클래스 생성 목적 >>
* 
*
*
* << 개정이력(Modification Information) >>
*
* 수정자 수정내용
* ------ ------------------------
* Jae Hyeon Choi 최초 생성
*
* 
*/
@Repository
public class GuidePlanDao implements IGuidePlanDao {
	
	
	Logger logger = LoggerFactory.getLogger(IGuidePlanDao.class);
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate template;
	
	/**
	* Method : insertGuidePlan
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 20.
	* 변경이력 :
	* @return
	* Method 설명 : 가이드를 위한 일정 테이블을 db에 넣어주는 서비스
	*/
	@Override
	public int insertGuidePlan(GuidePlanVO guidePlanVo) {
		
		int result = 0;
		
		try {
			
			result = template.insert("guidePlanSQL.insertGuidePlan", guidePlanVo);
			
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}
		
		return result;
	}
}
