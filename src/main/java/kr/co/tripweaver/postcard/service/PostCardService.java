package kr.co.tripweaver.postcard.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.tripweaver.common.attachment.model.AttachmentVO;
import kr.co.tripweaver.common.attachment.service.IAttachmentService;
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
	
	@Autowired
	IAttachmentService attachmentService;
	
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
	public Map<String, Object> selectPostCardAll(Map<String, Object> params){

		List<PostCardVO> cardVOs = postCardDao.selectPostCardAll(params);
		
		for(PostCardVO postCardVO : cardVOs){
			List<String> strings = hashTagService.hashtagPostCard(postCardVO.getPc_id());
			postCardVO.setHashTagList(strings);
			
			postCardVO.setPc_like_count(likeService.likeCount(postCardVO.getPc_id()));

			// 해당 게시글 댓글 가져오기
			postCardVO.setCommentList(commentService.selectComment(postCardVO.getPc_id()));
			
			// 해당 게시글 첨부파일 가져오기 
			postCardVO.setAttachmentList(attachmentService.selectPostcardFile(postCardVO.getPc_id()));
			
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
	public int insertPostcard(Map<String, Object> resultMap) {
		
		PostCardVO postcardVo = (PostCardVO)resultMap.get("postcardVo");
		
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
		
		
		//파일 첨부 작업
		
		String art_rel_art_id = pc_id;
		
		int attachmentInsertCnt = 0;
		
		List<AttachmentVO> attachmentVoList = (List<AttachmentVO>)resultMap.get("attachmentVo");
		
		Map<String, Object> param = new HashMap<String, Object>();
		
		for(AttachmentVO attachment: attachmentVoList) {
			param.put("att_path", attachment.getAtt_path());
			param.put("att_file_name", attachment.getAtt_file_name());
			param.put("att_file_ori_name", attachment.getAtt_file_ori_name());
			param.put("att_rel_art_id", art_rel_art_id);
			param.put("filter_id", attachment.getFilter_id());
			
			attachmentInsertCnt = attachmentService.attachmentInsert(param);
		}
		
		return attachmentInsertCnt;
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
	public int updatePostcard(Map<String, Object> resultMap) {
		
		PostCardVO postcardVo = (PostCardVO)resultMap.get("postcardVo");
		String pc_id = postcardVo.getPc_id();
		
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
		
		//파일 첨부 작업
		
		String art_rel_art_id = pc_id;
		
		int attachmentInsertCnt = 0;
		
		List<AttachmentVO> attachmentVoList = (List<AttachmentVO>)resultMap.get("attachmentVo");
		
		Map<String, Object> param = new HashMap<String, Object>();
		
		for(AttachmentVO attachment: attachmentVoList) {
			param.put("att_path", attachment.getAtt_path());
			param.put("att_file_name", attachment.getAtt_file_name());
			param.put("att_file_ori_name", attachment.getAtt_file_ori_name());
			param.put("att_rel_art_id", art_rel_art_id);
			param.put("filter_id", attachment.getFilter_id());
			
			System.out.println("attachment.getAtt_path()"+attachment.getAtt_path());
			System.out.println("attachment.getAtt_file_name()"+attachment.getAtt_file_name());
			System.out.println("attachment.getAtt_file_ori_name()"+attachment.getAtt_file_ori_name());
			System.out.println("art_rel_art_id"+art_rel_art_id);
			System.out.println("attachment.getFilter_id()"+attachment.getFilter_id());
			
			attachmentInsertCnt = attachmentService.attachmentInsert(param);
		}

		return updatePostcardCnt;
	}
	
	
	
	@Override
	public PostCardVO selectPostcard(String pc_id) {
		
		PostCardVO selectPostcardVo = postCardDao.selectPostcard(pc_id);
		
		return selectPostcardVo;
	}
	
	
	/**
	* Method : recentPostCardList
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 26.
	* 변경이력 :
	* @return
	* Method 설명 : 메인에 사용할 포스트 카드 리스트를 받아오기 위한 메서드
	*/
	public List<PostCardVO> recentPostCardList(){
		
		List<PostCardVO> postCardList = postCardDao.recentPostCardList();
		
		for(PostCardVO postCardVO : postCardList){
			
			List<String> hashTagList = hashTagService.hashtagPostCard(postCardVO.getPc_id());
			
			postCardVO.setHashTagList(hashTagList);
		}
		
		return postCardList;
	}
	
	/**
	* Method : selectPostCardByMemIdForBoard
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 28.
	* 변경이력 :
	* @param param
	* @return
	* Method 설명 : 게시판 관리를 위한 포스트카드 관리 정보를 얻기 위해서 page 번호와 해당 회원의 아이디를 맵으로 받아서 
	* POSTCARDVO 객체 리스트를 반환하는 메서드
	*/
	@Override
	public List<PostCardVO> selectPostCardByMemIdForBoard(Map<String,String> param){
		return postCardDao.selectPostCardByMemIdForBoard(param);
	}
	
	/**
	* Method : postCardTotalCount
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 28.
	* 변경이력 :
	* @param mem_id
	* @return
	* Method 설명 : 해당 회원이 가지고 있는 총 포스트 카드 게시물 수를 반환
	*/
	@Override
	public Integer postCardTotalCount(String mem_id) {
		return postCardDao.postCardTotalCount(mem_id);
	}
}
