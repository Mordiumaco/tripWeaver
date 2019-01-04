package kr.co.tripweaver.essay.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.tripweaver.essay.dao.IEssayDao;
import kr.co.tripweaver.essay.model.EssayVO;
import kr.co.tripweaver.mymenu.mypage.tripplan.model.ClusterVO;

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
	@Override
	public String essayInsert(EssayVO essayVo) {
		return essayDao.essayInsert(essayVo);
	}
	
	/**
	* Method : selectEssayByEssayId
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 20.
	* 변경이력 :
	* @param essay_id
	* @return
	* Method 설명 :
	*/
	@Override
	public EssayVO selectEssayByEssayId(String essay_id) {
		return essayDao.selectEssayByEssayId(essay_id);
	}
	
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
	@Override
	public int essayUpdate(EssayVO essayVo) {
		return essayDao.essayUpdate(essayVo);
	}
	
	/**
	* Method : recentEssayList
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 26.
	* 변경이력 :
	* @return
	* Method 설명 : 최신 에세이 글을 반환한다. 반환하는 에세이 게시글 겟수는 쿼리에서 설정할 수 있다. 
	*/
	@Override
	public List<EssayVO> recentEssayList(){
		return essayDao.recentEssayList();
	}
	
	/**
	* Method : deleteEssayByEssayId
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 26.
	* 변경이력 :
	* @param essay_id
	* @return
	* Method 설명 : essay_id 에 해당하는 해당 에세이 db 내용에 삭제 쿼리를 Y 로 바꿔 처리한다. 
	*/
	@Override
	public int deleteEssayByEssayId(String essay_id) {
		return essayDao.deleteEssayByEssayId(essay_id);
	}
	
	/**
	* Method : selectEssayByMemIdForBoard
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 27.
	* 변경이력 :
	* @param param
	* @return
	* Method 설명 : 게시판 관리를 위한 에세이 관리 정보를 얻기 위해서 page 번호와 해당 회원의 아이디를 맵으로 받아서 
	* EssayVO 객체 리스트를 반환하는 메서드
	*/
	@Override
	public List<EssayVO> selectEssayByMemIdForBoard(Map<String, String> param){
		return essayDao.selectEssayByMemIdForBoard(param);
	}
	
	/**
	* Method : essayTotalCount
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 27.
	* 변경이력 :
	* @param mem_id
	* @return
	* Method 설명 : 해당 회원이 쓴 에세이 목록을 조회하여 해당 회원이 가지고 있는 게시물 수를 반환한다. 
	*/
	@Override
	public Integer essayTotalCount(String mem_id) {
		return essayDao.essayTotalCount(mem_id);
	}
	
	/**
	* Method : addViewCountByEssayId
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 28.
	* 변경이력 :
	* @param essay_id
	* @return
	* Method 설명 : 에세이 글을 클릭할 시 해당 에세이의 조회수를 올려준다. 
	*/
	public int addViewCountByEssayId(String essay_id) {
		return essayDao.addViewCountByEssayId(essay_id);
	}
	
	
	/**
	* Method : bestMoneyEssayList
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2019. 1. 3.
	* 변경이력 :
	* @return
	* Method 설명 : 해당 짠내 베스트 랭킹을 위한 에세이 리스트 
	*/
	public List<ClusterVO> bestMoneyEssayList(Map<String, Object> params){
		return essayDao.bestMoneyEssayList(params);
	}
	
	/**
	* Method : bestEssayList
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2019. 1. 4.
	* 변경이력 :
	* @return
	* Method 설명 : 해당 에세이 베스트 랭킹을 위한 에세이 리스트 
	*/
	public List<ClusterVO> bestEssayList(Map<String, Object> params){
		return essayDao.bestEssayList(params);
	}
}
