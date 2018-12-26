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
		return attachmentDao.attachmentDelete(param);
	}
	
}
