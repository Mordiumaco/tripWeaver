package kr.co.tripweaver.common.attachment.service;

import java.util.List;
import java.util.Map;

import kr.co.tripweaver.common.attachment.model.AttachmentVO;

public interface IAttachmentService {

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
	
}
