package kr.co.tripweaver.postcard.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.tripweaver.postcard.model.PostCardVO;

@Repository
public class PostCardDao implements IPostCardDao{
	
	@Resource(name = "sqlSessionTemplate")
	SqlSessionTemplate template;

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
	@Override
	public List<PostCardVO> selectPostCardAll(Map<String, Object> params){
		List<PostCardVO> postcardVo = template.selectList("postcardSQL.selectPostCardAll", params);
		
		return postcardVo;
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
		* Method 설명 : 포스트 카드 삭제 하기
		*
	 */
	@Override
	public int deletePostcard(PostCardVO postcardVo) {
		int postcardCnt = template.delete("postcardSQL.deletePostcard", postcardVo);
		return postcardCnt;
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
		* Method 설명 : 포스트 카드 글 쓰기
		*
	 */
	@Override
	public String insertPostcard(PostCardVO postcardVo) {
		template.insert("postcardSQL.insertPostcard", postcardVo);
		
		String insertPostcardCnt = postcardVo.getPc_id();
		
		return insertPostcardCnt;
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
		* Method 설명 : 포스카드 업데이트
		*
	 */
	@Override
	public int updatePostcard(PostCardVO postcardVo) {
		int updatePostcard = template.update("postcardSQL.updatePostcard", postcardVo);
		return updatePostcard;
	}

	
	@Override
	public PostCardVO selectPostcard(String pc_id) {
		PostCardVO selectPostcardVo = template.selectOne("postcardSQL.selectPostcard", pc_id);
		return selectPostcardVo;
	}
	
	
	/**
	 * 
		* 
		* Method : 
		* 작성자 :  박찬배
		* 생성날짜 : 
		* 변경이력 :
		* @param 
		* @return
		* Method 설명 : 마이페이지 클립보드 포스트카드 리스트 뿌리기
		*
	 */
	
	@Override
	public List<PostCardVO> selectPostcardClip(Map<String, Object> params) {
			List<PostCardVO> cardVOs = template.selectList("postcardSQL.selectPostcardClip", params);
		return cardVOs;
	}

	
	/**
	 * 
		* 
		* Method : 
		* 작성자 : 박찬배
		* 생성날짜 : 
		* 변경이력 :
		* @param 
		* @return
		* Method 설명 : 마이페이지 클립보드 포스트카드 총 갯수 가져오기
		*
	 */
	@Override
	public int selectAllPostClip(Map<String, Object> params) {
		int cardVOs = template.selectOne("postcardSQL.selectAllPostClip", params);
		return cardVOs;
	} 
	
	/**
	* Method : recentPostCardList
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 26.
	* 변경이력 :
	* @return
	* Method 설명 : 메인에 사용할 포스트 카드 리스트를 받아오기 위한 메서드
	*/
	@Override
	public List<PostCardVO> recentPostCardList(){
		
		List<PostCardVO> postCardList = null;
		
		try {
			
			postCardList = template.selectList("postcardSQL.recentPostCardList");
			
		} catch (Exception e) {
			e.printStackTrace();
			return postCardList;
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
		
		List<PostCardVO> postCardList = null;
		
		try {
			
			postCardList = template.selectList("postcardSQL.selectPostCardByMemIdForBoard", param);
			
		} catch (Exception e) {
			e.printStackTrace();
			return postCardList;
		}
		
		return postCardList;
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
	public Integer postCardTotalCount(String mem_id) {
		
		Integer totalEssayCnt = null;
		
		try {
			
			totalEssayCnt = template.selectOne("postcardSQL.epostCardTotalCount", mem_id);
			
		} catch (Exception e) {
			e.printStackTrace();
			return totalEssayCnt;
		}
		
		return totalEssayCnt;
	}
	
	
}
