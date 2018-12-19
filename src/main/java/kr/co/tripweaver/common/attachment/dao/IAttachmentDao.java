package kr.co.tripweaver.common.attachment.dao;

import java.util.Map;

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
	
}
