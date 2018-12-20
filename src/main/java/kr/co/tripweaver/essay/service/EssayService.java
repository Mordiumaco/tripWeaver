package kr.co.tripweaver.essay.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.tripweaver.essay.dao.IEssayDao;
import kr.co.tripweaver.essay.model.EssayVO;

@Service
public class EssayService implements IEssayService{
	
	@Autowired
	IEssayDao essayDao;
	
	/**
	* Method : essayInsert
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 20.
	* 변경이력 :
	* @param essayVo
	* @return
	* Method 설명 : DB에 있는 essay Table에 해당 essayVo 데이터를 주입해준다. 
	* 그리고 성공적으로 만들어 지면 해당 essay의 essay_id를 반환한다. 
	* 
	*/
	public String essayInsert(EssayVO essayVo) {
		return essayDao.essayInsert(essayVo);
	}
}
