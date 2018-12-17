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
		return likeDao.likeAdd(likeVo);
	}

	@Override
	public int likeDelete(LikeVO likeVo) {
		return likeDao.likeDelete(likeVo);
	}
	

}
