package kr.co.tripweaver.mymenu.mypage.clipboard.service;

import java.util.List;
import java.util.Map;

import kr.co.tripweaver.essay.model.EssayVO;
import kr.co.tripweaver.postcard.model.PostCardVO;

public interface IClipBoardService {
	
	public Map<String, Object> selectPostcardClip(Map<String, Object> params);
	
	public Map<String, Object> selectEssayClip(Map<String, Object> params);
	
}
