package kr.co.tripweaver.essay.dao;

import java.util.List;

import kr.co.tripweaver.essay.model.EssayVO;

/**
* IEssayDao.java
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
public interface IEssayDao {
	
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
	public String essayInsert(EssayVO essayVo);
	
	
	/**
	* Method : selectEssayByEssayId
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 20.
	* 변경이력 :
	* @param essay_id
	* @return
	* Method 설명 :
	*/
	public EssayVO selectEssayByEssayId(String essay_id);
	
	/**
	* Method : essayUpdate
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 26.
	* 변경이력 :
	* @param essayVo
	* @return
	* Method 설명 : essay update form 에서 받은 정보로 조건에 만족하는 essay_id row를 수정한다. 
	* 조건에 만족시 1 반환 정상적으로 데이터 업데이트가 이루어지지 않았을 시 0을 반환한다. 
	*/
	public int essayUpdate(EssayVO essayVo);
	
	
	
	/**
	* Method : recentEssayList
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 26.
	* 변경이력 :
	* @return
	* Method 설명 : 최신 에세이 글을 반환한다. 반환하는 에세이 게시글 겟수는 쿼리에서 설정할 수 있다. 
	*/
	public List<EssayVO> recentEssayList();
}
