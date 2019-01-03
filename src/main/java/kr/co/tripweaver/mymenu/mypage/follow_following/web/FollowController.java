package kr.co.tripweaver.mymenu.mypage.follow_following.web;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.tripweaver.mymenu.mypage.follow_following.model.FollowVO;
import kr.co.tripweaver.mymenu.mypage.follow_following.service.IFollowService;

@RequestMapping("/follow")
@Controller
public class FollowController {
	
	@Autowired
	private IFollowService followService;
	
	private Logger logger = LoggerFactory.getLogger(FollowController.class);
	
	@RequestMapping(value="/following", method= RequestMethod.POST)
	@ResponseBody
	public void following(FollowVO followVO) {
		logger.debug("following followVO : {}", followVO);
		int cnt = followService.insertFollowing(followVO);
	}
	
	@RequestMapping(value="/unfollow", method= RequestMethod.POST)
	@ResponseBody
	public void unfollow(FollowVO followVO) {
		logger.debug("unfollow followVO : {}", followVO);
		int cnt = followService.deleteFollowing(followVO);
	}
	
	@RequestMapping(value="/followCountAjax", method= {RequestMethod.POST, RequestMethod.GET})
	public String followCount(@RequestParam("mem_id") String mem_id, Model model) {
		Map<String, Object> resultMap = followService.followCount(mem_id);
		model.addAllAttributes(resultMap);
		return "/mypage/message/message_follow_count_ajax";
	}
	
	/**
	* Method : selectFollow
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2019. 1. 3.
	* 변경이력 :
	* @param followVo
	* @return
	* Method 설명 : 해당 팔로우 상태를 확인한다. 해당회원과 팔로우 상태일경우 1 아닐경우 0
	*/
	@ResponseBody
	@RequestMapping("/followState")
	public int selectFollowAjax(FollowVO followVo) {
		
		int resultCnt = followService.selectFolState(followVo);
		
		return resultCnt;
	}
}
