package kr.co.tripweaver.db.member;

import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Test;

import kr.co.tripweaver.member.dao.IMemberDao;
import kr.co.tripweaver.member.model.MemberVO;
import kr.co.tripweaver.test.ServiceDaoTestConfig;
import kr.co.tripweaver.util.model.PageVO;

public class MemberDaoTest extends ServiceDaoTestConfig{

	@Resource(name="memberDao")
	private IMemberDao memberDao;
	
	@Test
	public void selectMemberAllTest() {
		/***Given***/
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("sfl", "mem_nick");
		params.put("stx", "");
		
		/***When***/
		int memberCnt = memberDao.selectMemberAllCount(params );

		/***Then***/
		assertEquals(133, memberCnt);
	}
	
	@Test
	public void selectMemberPageListTest() {
		/***Given***/
		Map<String, Object> params = new HashMap<String, Object>();
		PageVO pageVO = new PageVO(2, 10);
		params.put("pageVO", pageVO);
		params.put("sfl", "mem_nick");
		params.put("stx", "");
		
		/***When***/
		List<MemberVO> memberVOs = memberDao.selectMemberPageList(params);
		
		/***Then***/
		assertEquals(10, memberVOs.size());
	}

	@Test
	public void manageUpdateMemberAuthorTest() {
		/***Given***/
		Map<String, Object> params = new HashMap<String, Object>();
		MemberVO memberVO = new MemberVO();
		memberVO.setMem_id("test68");
		memberVO.setMem_author(2);
		PageVO pageVO = new PageVO(2, 10);
		params.put("memberVO", memberVO);
		params.put("pageVO", pageVO);

		/***When***/
		int updateCnt = memberDao.manageUpdateMemberAuthor(params);

		/***Then***/
		assertEquals(1, updateCnt);
	}
	
	@Test
	public void manageDeleteMemberDel() {
		/***Given***/
		Map<String, Object> params = new HashMap<String, Object>();
		MemberVO memberVO = new MemberVO();
		memberVO.setMem_id("test68");
		params.put("memberVO", memberVO);

		/***When***/
		int deleteCnt = memberDao.manageDeleteMemberDel(params);

		/***Then***/
		assertEquals(1, deleteCnt);
	}
}





























