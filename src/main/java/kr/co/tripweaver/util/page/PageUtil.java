package kr.co.tripweaver.util.page;

import kr.co.tripweaver.util.model.PageVO;

public class PageUtil {
	
	public static int pageCnt(int memberCnt, int pageSize) {
		
		int pageCnt = (int) (Math.ceil((double)memberCnt / pageSize));
		
		return pageCnt;
	}
	
}
