package kr.co.tripweaver.db.member;

import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Test;

import kr.co.tripweaver.member.model.MemberVO;
import kr.co.tripweaver.member.service.IMemberService;
import kr.co.tripweaver.test.ServiceDaoTestConfig;
import kr.co.tripweaver.util.model.PageVO;

public class MemberServiceTest extends ServiceDaoTestConfig{

	@Resource(name="memberService")
	IMemberService memberService;
	
	@Test
	public void selectMemberPageListTest() {
		/***Given***/
		Map<String, Object> params = new HashMap<String, Object>();
		PageVO pageVO = new PageVO(2, 10);
		params.put("pageVO", pageVO);
		
		/***When***/
		Map<String, Object> resultMap = memberService.selectMemberPageList(params);
		List<MemberVO> memberVOs = (List<MemberVO>) resultMap.get("memberVOs");
		int memberCnt = (int) resultMap.get("memberCnt");
		
		/***Then***/
		assertEquals(10, memberVOs.size());
		assertEquals(133, memberCnt);
	}

	@Test
	public void manageUpdateMemberAuthor() {
		/***Given***/
		Map<String, Object> params = new HashMap<String, Object>();
		PageVO pageVO = new PageVO(2, 10);
		MemberVO memberVO = new MemberVO();
		memberVO.setMem_id("test68");
		memberVO.setMem_author(2);
		params.put("pageVO", pageVO);
		params.put("memberVO", memberVO);
		
		/***When***/
		Map<String, Object> resultMap = memberService.manageUpdateMemberAuthor(params);
		List<MemberVO> memberVOs = (List<MemberVO>) resultMap.get("memberVOs");
		int memberCnt = (int) resultMap.get("memberCnt");
		int updateCnt = (int) resultMap.get("updateCnt");
		
		/***Then***/
		assertEquals(1, updateCnt);
		assertEquals(10, memberVOs.size());
		assertEquals(133, memberCnt);
	}
	
	@Test
	public void manageDeleteMemberDel() {
		/***Given***/
		Map<String, Object> params = new HashMap<String, Object>();
		PageVO pageVO = new PageVO(2, 10);
		MemberVO memberVO = new MemberVO();
		memberVO.setMem_id("test68");
		params.put("pageVO", pageVO);
		params.put("memberVO", memberVO);
		
		/***When***/
		Map<String, Object> resultMap = memberService.manageDeleteMemberDel(params);
		List<MemberVO> memberVOs = (List<MemberVO>) resultMap.get("memberVOs");
		int memberCnt = (int) resultMap.get("memberCnt");
		int deleteCnt = (int) resultMap.get("deleteCnt");
		
		/***Then***/
		assertEquals(1, deleteCnt);
		assertEquals(10, memberVOs.size());
		assertEquals(133, memberCnt);
	}
}
