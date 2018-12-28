package kr.co.tripweaver.mymenu.mypage.clipboard.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.tripweaver.common.attachment.service.IAttachmentService;
import kr.co.tripweaver.essay.dao.IEssayDao;
import kr.co.tripweaver.essay.model.EssayVO;
import kr.co.tripweaver.postcard.dao.IPostCardDao;
import kr.co.tripweaver.postcard.model.PostCardVO;
import kr.co.tripweaver.util.model.PageVO;
import kr.co.tripweaver.util.page.PageUtil;

@Service
public class ClipBoardService implements IClipBoardService {
	
	@Autowired
	IPostCardDao postCardDao;
	
	@Autowired
	IAttachmentService attachmentService;
	
	@Autowired
	IEssayDao essayDao;

	@Override
	public Map<String, Object> selectPostcardClip(Map<String, Object> params) {
		
		List<PostCardVO> cardVOs = postCardDao.selectPostcardClip(params);
		int selectAllPostClipCnt = postCardDao.selectAllPostClip(params);
		
		
		PageVO pageVO = (PageVO) params.get("pageVo");
				
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("clipVo", cardVOs);
		resultMap.put("page", pageVO.getPage());
		resultMap.put("tag_search", params.get("tag_search"));
		resultMap.put("search_title", params.get("search_title"));
		resultMap.put("pageSize", PageUtil.pageCnt(selectAllPostClipCnt, 9) );
		
		return resultMap;
	}

	@Override
	public Map<String, Object> selectEssayClip(Map<String, Object> params) {
		
		List<EssayVO> essayVOs = essayDao.selectEssayClip(params);
		int selectEssayClipAllNum = essayDao.selectEssayClipAllNum(params);
		
		PageVO pageVO = (PageVO) params.get("pageVo");
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("essayVOs", essayVOs);
		resultMap.put("page", pageVO.getPage());
		resultMap.put("tag_search", params.get("tag_search"));
		resultMap.put("search_title", params.get("search_title"));
		resultMap.put("pageSize", PageUtil.pageCnt(selectEssayClipAllNum, 9) );
		
		return resultMap;
	}
	
}
