package kr.co.tripweaver.common.attachment.dao;

import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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

}
