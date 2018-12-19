package kr.co.tripweaver.common.attachment.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.tripweaver.common.attachment.dao.IAttachmentDao;

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
	
}
