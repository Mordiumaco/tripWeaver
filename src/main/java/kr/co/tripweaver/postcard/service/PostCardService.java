package kr.co.tripweaver.postcard.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.tripweaver.common.comment.model.CommentVO;
import kr.co.tripweaver.common.comment.service.ICommentService;
import kr.co.tripweaver.common.like.service.ILikeService;
import kr.co.tripweaver.hashtag.model.HashTagVO;
import kr.co.tripweaver.hashtag.service.IHashTagService;
import kr.co.tripweaver.postcard.dao.IPostCardDao;
import kr.co.tripweaver.postcard.model.PostCardVO;
import kr.co.tripweaver.util.hashtag_cut.HashTag_Cut;

@Service
public class PostCardService implements IPostCardService{

	@Autowired
	IPostCardDao postCardDao;
	
	@Autowired
	IHashTagService hashTagService;
	
	@Autowired
	ILikeService likeService;
	
	@Autowired
	ICommentService commentService;
	
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

			// 해당 게시글 댓글 가져오기
			postCardVO.setCommentList(commentService.selectComment(postCardVO.getPc_id()));
			
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

	/**
	 * 
		* 
		* Method : 
		* 작성자 : 
		* 생성날짜 : 
		* 변경이력 :
		* @param 
		* @return
		* Method 설명 : 포스트 글쓰기
		*
	 */
	@Override
	public int insertPostcard(PostCardVO postcardVo) {
		String pc_id = postCardDao.insertPostcard(postcardVo);
		
		// 해시태그 내용을 변수에 담기
		String hashtagCnt = postcardVo.getPc_cnt();
		
		// 해시태그를 찾는 패턴에 다녀오기
		List<String> hashTagList = HashTag_Cut.extractHashTagTest(hashtagCnt);
		
		// 해시태그 리스트를 리스트에 담아서 해시태그 서비스로 보내기
		List<HashTagVO> hashList = new ArrayList<HashTagVO>(); 
		for(String hash : hashTagList) {
			HashTagVO hashTagVO = new HashTagVO();
			hashTagVO.setTag_word(hash);
			hashTagVO.setPc_id(pc_id);
			
			hashList.add(hashTagVO);
		}
		
		// 해시태그 서비스에 인서트
		hashTagService.insertHashtag(hashList);
		
		
		return 0;
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
		* Method 설명 : 포스트 업데이트
		*
	 */
	@Override
	public int updatePostcard(PostCardVO postcardVo) {
		// 해시태그 삭제 진행
		int deleteHasgtagCnt = hashTagService.deleteHasgtag(postcardVo.getPc_id());
		
		// 포스트카드 수정 진행
		int updatePostcardCnt = postCardDao.updatePostcard(postcardVo);
		
		/* 기존 해시 태그 삭제 후 포스트카드 업데이트하고 다시 해시태그를 인서트 */
		
		// 해시태그 내용을 변수에 담기
		String hashtagCnt = postcardVo.getPc_cnt();
		
		// 해시태그를 찾는 패턴에 다녀오기
		List<String> hashTagList = HashTag_Cut.extractHashTagTest(hashtagCnt);
		
		// 해시태그 리스트를 리스트에 담아서 해시태그 서비스로 보내기
		List<HashTagVO> hashList = new ArrayList<HashTagVO>(); 
		for(String hash : hashTagList) {
			HashTagVO hashTagVO = new HashTagVO();
			hashTagVO.setTag_word(hash);
			hashTagVO.setPc_id(postcardVo.getPc_id());
			
			hashList.add(hashTagVO);
		}
		
		// 해시태그 서비스에 인서트
		hashTagService.insertHashtag(hashList);
		
		return updatePostcardCnt;
	}

	@Override
	public PostCardVO selectPostcard(String pc_id) {
		
		PostCardVO selectPostcardVo = postCardDao.selectPostcard(pc_id);
		
		return selectPostcardVo;
	}
	
}
