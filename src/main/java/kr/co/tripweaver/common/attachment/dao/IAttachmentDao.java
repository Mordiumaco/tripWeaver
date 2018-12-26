package kr.co.tripweaver.common.attachment.dao;

import java.util.List;
import java.util.Map;

import kr.co.tripweaver.common.attachment.model.AttachmentVO;

public interface IAttachmentDao {

	/**
	* Method : attachmentInsert
	* 작성자 : pc23
	* 변경이력 :
	* @param param
	* @return
	* Method 설명 : 파일 insert
	*/
	public int attachmentInsert(Map<String, Object> param);
	
	/**
	* Method : getAttachmemt
	* 작성자 : pc23
	* 변경이력 :
	* @param art_id
	* @return
	* Method 설명 : 파일 가져오기(찾기)
	*/
	public List<AttachmentVO> getAttachmemt(String art_id);
	
	/**
	* Method : attachmentDelete
	* 작성자 : pc23
	* 변경이력 :
	* @param param
	* @return
	* Method 설명 : 파일 삭제(수정)
	*/
	public int attachmentDelete(Map<String, Object> param);
	
	/*********************************************************************/
	/*********************************************************************/
	/**
	 * 
		* 
		* Method : 
		* 작성자 : 박찬배
		* 생성날짜 : 
		* 변경이력 :
		* @param 
		* @return
		* Method 설명 : 포스트카드 파일 찾기
		*
	 */
	public List<AttachmentVO> selectPostcardFile(String att_rel_art_id);
	
}
