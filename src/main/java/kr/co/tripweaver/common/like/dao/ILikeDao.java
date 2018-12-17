package kr.co.tripweaver.common.like.dao;

import java.util.List;

import kr.co.tripweaver.common.like.model.LikeVO;


public interface ILikeDao {
	
	int likeCount(String LIKE_REL_ART_ID);
	
	List<LikeVO> likeAll(String mem_id);
	
	int likeAdd (LikeVO likeVo);
	
	int likeDelete (LikeVO likeVo);
}
