package kr.co.tripweaver.common.attachment.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.tripweaver.common.attachment.dao.IAttachmentDao;

@Service
public class AttachmentService implements IAttachmentService {
	
	@Autowired
	IAttachmentDao attachmentDao;
	
}
