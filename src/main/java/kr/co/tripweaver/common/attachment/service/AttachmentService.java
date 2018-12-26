package kr.co.tripweaver.common.attachment.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.tripweaver.common.attachment.dao.IAttachmentDao;
import kr.co.tripweaver.common.attachment.model.AttachmentVO;

@Service
public class AttachmentService implements IAttachmentService {
	
	@Autowired
	IAttachmentDao attachmentDao;

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
		return attachmentDao.attachmentInsert(param);
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
		return attachmentDao.getAttachmemt(art_id);
	}
	
	
	
	
	
	
	
	/****************************************************************************/
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
		return attachmentDao.selectPostcardFile(att_rel_art_id);
	}
	
}
