package kr.co.tripweaver.postcard.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.tripweaver.hashtag.service.IHashTagService;
import kr.co.tripweaver.postcard.dao.IPostCardDao;
import kr.co.tripweaver.postcard.model.PostCardVO;

@Service
public class PostCardService implements IPostCardService{

	@Autowired
	IPostCardDao postCardDao;
	
	@Autowired
	IHashTagService hashTagService;
	
	/**
	 * 
	* Method : selectPostCardAll
	* 작성자 : 박찬배
	* 생성날짜 : 2018. 12. 13.
	* 변경이력 :
	* @param 
	* @return
	* Method 설명 : postcard 리스트 가져오기
	* 
	*/
	public Map<String, Object> selectPostCardAll(){
		
		List<PostCardVO> cardVOs = postCardDao.selectPostCardAll();
		
		for(PostCardVO postCardVO : cardVOs){
			List<String> strings = hashTagService.hashtagPostCard(postCardVO.getPc_id());
			postCardVO.setHashTagList(strings);
		}
		
		Map<String, Object> postCardResult = new HashMap<String, Object>();
		
		postCardResult.put("postCardList", cardVOs);
		postCardResult.put("hashTagCount", hashTagService.hashtagColumnConunt());
		
		return postCardResult;
	}
	
}
