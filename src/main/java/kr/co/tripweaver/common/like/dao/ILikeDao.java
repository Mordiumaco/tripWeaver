package kr.co.tripweaver.common.like.dao;

import java.util.List;

import kr.co.tripweaver.common.like.model.LikeVO;


public interface ILikeDao {
	
	int likeCount(String LIKE_REL_ART_ID);
	
	List<LikeVO> likeAll(String mem_id);
	
	int likeAdd (LikeVO likeVo);
	
	int likeDelete (LikeVO likeVo);
	
	
	/**
	* Method : likeCheckByMemIdAndLikeRelId
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 26.
	* 변경이력 :
	* @param likeVo
	* @return
	* Method 설명 : 해당 글에 로그인한 멤버가 좋아요를 했는지 않했는지를 체크
	*/
	public LikeVO likeCheckByMemIdAndLikeRelId(LikeVO likeVo);
	
	
}
