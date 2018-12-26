package kr.co.tripweaver.common.like.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.tripweaver.common.like.dao.ILikeDao;
import kr.co.tripweaver.common.like.model.LikeVO;

@Service
public class LikeService implements ILikeService {
	
	@Autowired
	ILikeDao likeDao;
	
	@Override
	public int likeCount(String LIKE_REL_ART_ID) {
		return likeDao.likeCount(LIKE_REL_ART_ID);
	}

	@Override
	public List<LikeVO> likeAll(String mem_id) {
		return likeDao.likeAll(mem_id);
	}

	@Override
	public int likeAdd(LikeVO likeVo) {
		
		int likeAddCnt = likeDao.likeAdd(likeVo);
		int likeNum = likeDao.likeCount(likeVo.getLike_rel_art_id());
		
		return likeNum;
	}

	@Override
	public int likeDelete(LikeVO likeVo) {
		
		int likeDeleteCnt = likeDao.likeDelete(likeVo);
		int likeNum = likeDao.likeCount(likeVo.getLike_rel_art_id());
		
		return likeNum;
	}
	
	
	/**
	* Method : likeCheckByMemIdAndLikeRelId
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 26.
	* 변경이력 :
	* @param likeVo
	* @return
	* Method 설명 : 해당 글에 로그인한 멤버가 좋아요를 했는지 않했는지를 체크 
	*/
	@Override
	public LikeVO likeCheckByMemIdAndLikeRelId(LikeVO likeVo) {
		return likeDao.likeCheckByMemIdAndLikeRelId(likeVo);
	}
}
