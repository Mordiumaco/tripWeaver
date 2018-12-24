package kr.co.tripweaver.mymenu.guideplan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.tripweaver.mymenu.guideplan.dao.IGuidePlanDao;
import kr.co.tripweaver.mymenu.guideplan.model.GuidePlanVO;

@Service
public class GuidePlanService implements IGuidePlanService {

	@Autowired
	IGuidePlanDao guidePlanDao;
	
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
		return guidePlanDao.insertGuidePlan(guidePlanVo);
	}

	/**
	* Method : selectGuidePlanByEssayId
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 21.
	* 변경이력 :
	* @param essay_id
	* @return
	* Method 설명 : essay_id로 GuidePlanVO를 받아온다. 
	*/
	public List<GuidePlanVO> selectGuidePlanByEssayId(String essay_id){
		return guidePlanDao.selectGuidePlanByEssayId(essay_id);
	}
	
}
