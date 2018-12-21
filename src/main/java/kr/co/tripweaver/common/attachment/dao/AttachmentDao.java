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

}
