package kr.co.tripweaver.hashtag.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.tripweaver.hashtag.dao.IHashTagDao;
import kr.co.tripweaver.hashtag.model.HashTagVO;

@Service
public class HashTagService implements IHashTagService {

	@Autowired
	IHashTagDao hashTagDao;
	
	@Override
	public List<HashTagVO> hashtagColumnConunt(){
		return hashTagDao.hashtagColumnConunt();
	}


	@Override
	public List<String> hashtagPostCard(String pc_id) {
		return hashTagDao.hashtagPostCard(pc_id);
	}


	@Override
	public int insertHashtag(List<HashTagVO> hashtagList) {
		
		int insertHashtagCnt = 0;
		
		for(HashTagVO hash :hashtagList) {
			insertHashtagCnt += hashTagDao.insertHashtag(hash);
		}
		return insertHashtagCnt;
	}

	
	
}
