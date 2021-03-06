package kr.co.tripweaver.common.attachment.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.tripweaver.common.attachment.model.AttachmentVO;

@Repository
public class AttachmentDao implements IAttachmentDao {
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate template;

	/**
	* Method : attachmentInsert
	* 작성자 : pc23
	* 변경이력 :
	* @param param
	* @return
	* Method 설명 : 파일 insert
	*/
	@Override
	public int attachmentInsert(Map<String, Object> param) {
		return template.insert("attachmentSQL.insertAttachment", param);
	}

	/**
	* Method : getAttachmemt
	* 작성자 : pc23
	* 변경이력 :
	* @param art_id
	* @return
	* Method 설명 : 파일 가져오기(찾기)
	*/
	@Override
	public List<AttachmentVO> getAttachmemt(String art_id) {
		return template.selectList("attachmentSQL.fileFind", art_id);
	}

	/**
	* Method : attachmentDelete
	* 작성자 : pc23
	* 변경이력 :
	* @param param
	* @return
	* Method 설명 : 파일 삭제(수정)
	*/
	@Override
	public int attachmentDelete(Map<String, Object> param) {
		return template.delete("attachmentSQL.fileDelete", param);
	}

	/*******************************************************************/
	
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
	@Override
	public List<AttachmentVO> selectPostcardFile(String att_rel_art_id) {
		List<AttachmentVO> attachmentList = template.selectList("attachmentSQL.selectPostcardFile", att_rel_art_id);
		return attachmentList;
	}

}
