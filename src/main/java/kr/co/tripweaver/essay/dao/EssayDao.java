package kr.co.tripweaver.essay.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import kr.co.tripweaver.essay.model.EssayVO;

@Repository
public class EssayDao implements IEssayDao{
	
	
	Logger logger = LoggerFactory.getLogger(EssayDao.class);
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate template;
	

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
	@Override
	public String essayInsert(EssayVO essayVo) {
		
		String essay_id = null;
		
		try {
			
			int result = template.insert("essaySQL.essayInsert", essayVo);
			
			if(result != 0) {
				essay_id = essayVo.getEssay_id();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return essay_id;
		}
		
		return essay_id;
	}
}
