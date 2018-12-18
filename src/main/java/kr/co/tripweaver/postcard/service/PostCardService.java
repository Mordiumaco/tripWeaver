package kr.co.tripweaver.postcard.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.tripweaver.common.like.service.ILikeService;
import kr.co.tripweaver.hashtag.service.IHashTagService;
import kr.co.tripweaver.postcard.dao.IPostCardDao;
import kr.co.tripweaver.postcard.model.PostCardVO;

@Service
public class PostCardService implements IPostCardService{

	@Autowired
	IPostCardDao postCardDao;
	
	@Autowired
	IHashTagService hashTagService;
	
	@Autowired
	ILikeService likeService;
	
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
			
			postCardVO.setPc_like_count(likeService.likeCount(postCardVO.getPc_id()));
		}
		
		
		
		Map<String, Object> postCardResult = new HashMap<String, Object>();
		
		postCardResult.put("postCardList", cardVOs);
		postCardResult.put("hashTagCount", hashTagService.hashtagColumnConunt());
		
		return postCardResult;
	}

	/**
	 * 
		* 
		* Method : 
		* 작성자 : 
		* 생성날짜 : 
		* 변경이력 :
		* @param 
		* @return
		* Method 설명 : 포스트 삭제
		*
	 */
	@Override
	public int deletePostcard(PostCardVO postcardVo) {
		return postCardDao.deletePostcard(postcardVo);
	}
	
}
